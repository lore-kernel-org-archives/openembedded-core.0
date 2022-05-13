Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6C8C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 15:54:22 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.10151.1652457250560631885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xz5LeP/K;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id d6so10488977ede.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 08:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tQsZvftI/zWDk1UofKBW4Rqk4Fe9oem6IRJKd2i/f8=;
        b=Xz5LeP/KJrD2LnCSauAQt3f0GsQ/TromdieVEQF3GftIg6c/sj1CCiiej4MQAiKFw0
         mOMEBALFbQRf1eFSXOQ5hNrmdSqD9bQGWD2nRcbeAgvdt+nSWI8zryborSQCT/w+Su5t
         LZcI7PH2DwEXN71kFZ4a6tfQQVI5HyBGgR+DHEywUuwBejP9Sm9Q195pYmAg3MvmDsjE
         ekH+xzYUBtp15nhgWcUIDFKFvJ/jw+TX7bnhhj25TwUeb4LOlQmj+vQ7ydau49qyuRu5
         cLc5JwFXZknKors3pJNsW28ACJ2ZnhMiuM7hjtN5C0MTi+q4DUeKR9BiZrdf9rxoENI6
         zMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tQsZvftI/zWDk1UofKBW4Rqk4Fe9oem6IRJKd2i/f8=;
        b=t+Xxgl/yXoJVwyMNjZ/y6sS7ssdK+QMv+Zyzjvwpw17k9HSlX8leSuJEqpkr1pxcKM
         qc/mCOzwmQvVkUi0qJRyEbF12xYPwFYLbne3lYQjMizTLymDibdtjwO9BAgzshAmmODI
         eDBLGeqGnXSbHd0pVxFd8fCOKFQ/9QqdoICf+BG7j0In9CbUl8+hk8UUHqOercPqCHSq
         e6QGLUhHFy5sjLjMR5M/MS5Im9QRz7x0ufznLic2DWjbqftsDEVMXsQsCDIuQLT+OrzX
         qpGnbScrYI9IJn7uSn6VHcsTM9M1d9NU40UBgfVWHvuQpw2nqeGkccB/7aY+UpnfE5oR
         jGCg==
X-Gm-Message-State: AOAM533qPtPSWU19g1mkhhOdR4ksuNSfDOrCK83VlwkZlynJalSs9HxT
	YMoFp7Ejr5/KlZYrWWiGgPLnAAPmQvmuVOKm7kgHvA==
X-Google-Smtp-Source: 
 ABdhPJxODLe++rv4rkbHCXzZ2M1NYGbvngRZitT/DRUhrNvqnW+x1Oxy2BuBEFEA0jIckScheOWazVqTT7OQdkeyxYU=
X-Received: by 2002:aa7:cacb:0:b0:428:b435:dc43 with SMTP id
 l11-20020aa7cacb000000b00428b435dc43mr21362403edt.123.1652457248660; Fri, 13
 May 2022 08:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220513133521.904120-1-davide.gardenal@huawei.com>
In-Reply-To: <20220513133521.904120-1-davide.gardenal@huawei.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 May 2022 05:53:57 -1000
Message-ID: 
 <CAOSpxdZ4qjcbjsvB8v8P7YtUr=0HSxHnrcbxAkYZHkRVK9PGrg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] openssl: minor security upgrade
 3.0.2 -> 3.0.3
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Davide Gardenal <davide.gardenal@huawei.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 15:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165577

On Fri, May 13, 2022 at 3:35 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> This minor version include fixes for several CVEs
>
> CVE: CVE-2022-1292
> CVE: CVE-2022-1343
> CVE: CVE-2022-1434
> CVE: CVE-2022-1473
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Updates:
>     -v2 add kirkstone tag in the title

Actually, since master is also at version 3.0.2 this patch will have
to go to master first.  I'll then backport it.

In cases like this you should probably tag [master][kirkstone] so
Richard and I both take notice.

Steve

> ---
>  .../openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
> index a809666aa7..fd88ae807d 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
> @@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] = "98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"
> +SRC_URI[sha256sum] = "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165563): https://lists.openembedded.org/g/openembedded-core/message/165563
> Mute This Topic: https://lists.openembedded.org/mt/91080703/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

