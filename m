Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B580EC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:09:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8939.1654096158027200590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8N0ljoVN;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id fd25so2626826edb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BibOgsW3Bl7o+fh/uOhIc4vt2P8TjXyBMQMmCn/W0Ks=;
        b=8N0ljoVNQFIsbKg+RdW0UudG07zTTIFWupOn8g1vUSXzF2oZYUJY8R2lBojyuDOAP+
         pA6c6iOvbp51PVivEOPxW9gosL3ETVnFLa4dO9uixe0VybV4rHhoe7I07wEeo/v74tpm
         xL7qI6a/levDYGEebkKAhUWeqRjgB7NUqes9abCU6U7ympCMbY4caC6y8m1FkayvqtHc
         TfgA0VLfpQrVxNWcCHFS8mBojl1gGeIaqr3xPcaU6F3ARjweDvq8s59yXC7VnUhUz2E6
         9BheQp5ecFXfOdY68GGFEHn1bZTqfqkEi5ZlLfi6z+LTCHeaq8YEFmuMHSdlQai2+QkY
         plnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BibOgsW3Bl7o+fh/uOhIc4vt2P8TjXyBMQMmCn/W0Ks=;
        b=wbsIEyTcM9pCKYRqxPqgCr2zwPRTQwEYVTr1aB+Oym6HohiD2qr1b9Nac5NKuUPCWu
         MHNFvf7GUEVrFDlLeZR/dtP10wY4UT1UOBrYmUAR8pYGMzg1RmYzRAU2nkrTHvolXjo3
         3Mcqur0xDwHRsFGkWMImasF5qF6pnu0dFf9Wmx+oiQKBX1ZeZzLwnQ+/eraaytCqQWUM
         ELHAuBQScJuw1+ZZ/SN5nuyVoOthmbq43RgqERTcyqTSWFxkKyc0MErGNM+s+djp5NTi
         x/OuAVNd01ChH93km76AKEL+eFWNUefpBu5yJ1lPKUtwRLP63K0uyGmqUFjR4WTGt+2P
         ZF4w==
X-Gm-Message-State: AOAM533Cnsap0/yjcdQCDr8A0jndlnzDifWSjZbQplQ3yo3/VUoDVbEK
	W/t07v5rpndefNqvSGj6immAWuZA7cKdZTUKz/HKBA==
X-Google-Smtp-Source: 
 ABdhPJz6ETzG5FVcPP/n9GLhspanHgxFvBb2IsBAN7Me2/Q1KcDbb3el8JHffXHfzwEYgIi54tRbTVI0AEiCTQLzvAA=
X-Received: by 2002:aa7:dd4e:0:b0:42b:7dbb:3a5b with SMTP id
 o14-20020aa7dd4e000000b0042b7dbb3a5bmr128484edw.203.1654096156275; Wed, 01
 Jun 2022 08:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
 <20220601105312.29861-2-omkarpatil10.93@gmail.com>
In-Reply-To: <20220601105312.29861-2-omkarpatil10.93@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 05:09:05 -1000
Message-ID: 
 <CAOSpxdZMDK=Vp=sR_no8nFRAwAdwjx5C0pv1WuSDz3zP_CYC6A@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] libxslt: Mark CVE-2022-29824 as not
 applying
To: omkar <omkarpatil10.93@gmail.com>
Cc: openembedded-core@lists.openembedded.org, omkar.patil@kpit.com,
	ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:09:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166383

On Wed, Jun 1, 2022 at 12:53 AM omkar <omkarpatil10.93@gmail.com> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> We have libxml2 2.9.14 and we don't link statically against libxml2 anyway
> so the CVE doesn't apply to libxslt.

dunfell libxml2 is version 2.9.10!

Steve

> (From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
> Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
> ---
>  meta/recipes-support/libxslt/libxslt_1.1.35.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> index 0f25043743..47a38deb13 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> @@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f
>
>  UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
>
> +# We have libxml2 2.9.14 and we don't link statically with it anyway
> +# so this isn't an issue.
> +CVE_CHECK_WHITELIST += "CVE-2022-29824"
> +
>  S = "${WORKDIR}/libxslt-${PV}"
>
>  BINCONFIG = "${bindir}/xslt-config"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166373): https://lists.openembedded.org/g/openembedded-core/message/166373
> Mute This Topic: https://lists.openembedded.org/mt/91472462/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

