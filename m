Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E62C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 14:59:30 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.10882.1647961169917940070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 07:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KO2z0fpE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id pv16so36855299ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4YRHBi1qQd49zuZhDHLTkJdZ89Ov895zA/SAhlPnqg=;
        b=KO2z0fpEHsMf6wcZSMtdwunAkMFOufiPkvXe00We4cRC8q15eAC5trtH8Q0YKxi9tN
         OWBGRcisrgj1xgecKUFPUbhwD/iwU9VR0xoQC1VCAJ6SjoV/6su3NJunOfDo4g9IpOQr
         r9PRWLuxcbXK9MhwGnoawdQVm6ht2Id4y5ZamNppaxql5M3AengJXZ44BwdS11JaVejz
         pRejVyxM+FiUxLrLx5eYgpsNVHTLel4KosxxEfTOsYNSDCZuXOw+AY2t0y/t/JTp9AIe
         FnUwEssRi+Yng4O+Gb47ekkkQlwADunYdnGu7t6jVCY9O+reeqPj4CJxF3n8DwrV1N8m
         iC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4YRHBi1qQd49zuZhDHLTkJdZ89Ov895zA/SAhlPnqg=;
        b=afirMviGwVJjQ/8VpfNVHdyMruosjr/H1Ll+rHFcKkAy4iPfzLHw0IT+PlMsOF39qQ
         mzVg90cz8Yy9rn+T8ePNvp/s1a+9Y5Ezb/Fxmn1d1Jxv5jpRYpNajM6Y1d4gi6MVziVQ
         BKOZFFj2kWkiEKcOmAJIf2LiM7ghqViyUtGIMG+c8lsA37nlShsVTjwm8E/7INJ+HDcn
         uKQF4OKV0g59PWuz96GYxlWkb69wn0Aj3I4w6czBvmwKNJzlDkoT0FKUrfACZbqL7Lij
         hql8uVlSET/LT8f05d+vBWzOLmxWLK8MF6sN+7SAvK5TAKlfh3f6HFJKQSGafCFgIImT
         1fEw==
X-Gm-Message-State: AOAM532liEjNLflKxCariXlrAGgaswqU4/Y3cX/rFZ683+oqSHAXIwyi
	vbxg9ru+oaI/MkI/Sc73u61nnM6wQ7kQ9Zxs7dSuZA==
X-Google-Smtp-Source: 
 ABdhPJx0S/uMzslwobrZI0DjQ1rEhfulGhVlVtWfRdYk28dGigMGNWg2JJbQB229iIEv6C4GJw7YmLFR7ZCe1j9JEtM=
X-Received: by 2002:a17:907:9506:b0:6da:b4cd:515b with SMTP id
 ew6-20020a170907950600b006dab4cd515bmr26184211ejc.602.1647961167685; Tue, 22
 Mar 2022 07:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220322111402.21283-1-sanakazisk19@gmail.com>
In-Reply-To: <20220322111402.21283-1-sanakazisk19@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Mar 2022 04:59:16 -1000
Message-ID: 
 <CAOSpxdZDru1bTxU4_3W9gA7ie_E3=fzWyi1XfGM32ZO-6g1Xiw@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] binutils: Whitelist CVEs
To: sana kazi <sanakazisk19@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 14:59:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163553

On Tue, Mar 22, 2022 at 1:14 AM sana kazi <sanakazisk19@gmail.com> wrote:
>
> CVE-2020-16590 CVE-2020-16591 CVE-2020-16599 CVE-2021-20294 does
> not affect binutils_2.34 and the contents of the patch are not
> present in the source code. Therefore, whitelist it.

In this case there are errors in the upstream cve database, so the
proper way to deal with this is to contact the database admin and
request fixes.  We only whitelist if they don't make the change for
some reason and we are 100% sure our usage is not affected.

Fortunately I've already contacted them on these issues, so hopefully
database corrections will be made soon!

Thanks for helping out on CVEs!

Steve

>
> Links:
> https://nvd.nist.gov/vuln/detail/CVE-2020-16590
> https://nvd.nist.gov/vuln/detail/CVE-2020-16591
> https://nvd.nist.gov/vuln/detail/CVE-2020-16599
> https://nvd.nist.gov/vuln/detail/CVE-2021-20294
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.34.inc | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
> index 6a55de2d45..990c5fa8f1 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.34.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
> @@ -54,3 +54,18 @@ SRC_URI = "\
>       file://0001-CVE-2021-45078.patch \
>  "
>  S  = "${WORKDIR}/git"
> +
> +# CVE-2020-16590 CVE-2020-16591 CVE-2020-16599 CVE-2021-20294 does not affect
> +# binutils_2.34 and the contents of the patch are not
> +# present in the source code. Therefore, whitelist it.
> +# https://nvd.nist.gov/vuln/detail/CVE-2020-16590
> +# https://nvd.nist.gov/vuln/detail/CVE-2020-16591
> +# https://nvd.nist.gov/vuln/detail/CVE-2020-16599
> +# https://nvd.nist.gov/vuln/detail/CVE-2021-20294
> +
> +CVE_CHECK_WHITELIST += " \
> +    CVE-2020-16590 \
> +    CVE-2020-16591 \
> +    CVE-2020-16599 \
> +    CVE-2021-20294 \
> +"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163545): https://lists.openembedded.org/g/openembedded-core/message/163545
> Mute This Topic: https://lists.openembedded.org/mt/89949489/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

