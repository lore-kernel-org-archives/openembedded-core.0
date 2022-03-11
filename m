Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D3BC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 02:34:44 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1464.1646966082215540116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 18:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=12wghUpF;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id gb39so16175423ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 18:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKxAmnwGV9m4fTLWeTRagDH5pXNmnZNYU8cd4ypPOqc=;
        b=12wghUpF7bY6CsYe0/HLKvndDbuSGs+C8IstAEJrvTr0+jSqEfS2rYWJCAdA78UHw6
         wSMNoxZb7L/yjpBPkRIZy4ak340Aubm2QdJjr/mEs1rC1YycQGO/OXAUlwBh0s6TUiZF
         EfhVnPngyqY5Hz1CdUTys6/p2CzDPwgsuWjOmyL/8EbkdbKw9IqLU0/mhSJ8hyBO+MCx
         esUifI9M4L+IOrm+0R4e/zgrpcOzZpTDA08Xzstx5G21KLz/FamQGrKSdXNcDHZLBFyi
         GVCvR+MCmwl45qXdIIMW/2sGF6a29DcyhJ+BRiDAMXWyuEReP0mTu1/ti8clOwB3JJAK
         02KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKxAmnwGV9m4fTLWeTRagDH5pXNmnZNYU8cd4ypPOqc=;
        b=7TbN2XCKPbejPCyL1O16IRwzyzogV3o4/XJCtQjCLUwvm1it2dLxkIWsTwe2jrpBft
         ZqXAwsGvOajh2pzNPQHaH11HBCW51Kx64Zf2iyTJpKWuUNDldAv89AG8bjf2607X6tJj
         z8bu14XEg81jnEpzH+bdy+kMkMX/mQBQYbnVDPoDZSmBN9cHRO6IBosygzssZ+bhW91+
         BCeAWT6pssYgjoK4KuS7eYpFePqseUldDbMiF/JIXXfe1iwdBjXCxubB6wALqA58kZ6U
         5vdAYZmGP57pYO1h5mjgaEFEsPwQ54xR9seirnDG1NwfDDnriwhbs+CwoKl6iWeVmCUF
         9ypQ==
X-Gm-Message-State: AOAM5326K1O1+VKtJ8ruNtW6AL8kC6OZT/Ju9awTZO4OQ3iNhdol9diH
	dGDCY9rr7jJsLQIwT08YzDtdfbY6AdIuoEzc2GJdGKdsna41GrcfyxY=
X-Google-Smtp-Source: 
 ABdhPJyvthaR9ZIQ8IehMGNXQwMbwxQWpcAAPQ+UwyyeU7sqDb4ZCI4FAj0+RNm6AzAYnouP5k1qsOjxac0845Gicdw=
X-Received: by 2002:a17:907:2cc6:b0:6db:7e92:e36 with SMTP id
 hg6-20020a1709072cc600b006db7e920e36mr5799261ejc.329.1646966080214; Thu, 10
 Mar 2022 18:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20220310183234.608500-1-ralph.siemsen@linaro.org>
In-Reply-To: <20220310183234.608500-1-ralph.siemsen@linaro.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Mar 2022 16:34:28 -1000
Message-ID: 
 <CAOSpxdYpQn_wMjHSQjkb23yeg+5hP=LMUCUZNiWyJ6_9t7b-nw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bind: update to 9.11.36
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 02:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163044

On Thu, Mar 10, 2022 at 8:32 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Security Fixes
>
> The lame-ttl option controls how long named caches certain types of
> broken responses from authoritative servers (see the security advisory
> for details). This caching mechanism could be abused by an attacker to
> significantly degrade resolver performance. The vulnerability has been
> mitigated by changing the default value of lame-ttl to 0 and overriding
> any explicitly set value with 0, effectively disabling this mechanism
> altogether. ISC's testing has determined that doing that has a
> negligible impact on resolver performance while also preventing abuse.
> Administrators may observe more traffic towards servers issuing certain
> types of broken responses than in previous BIND 9 releases, depending on
> client query patterns. (CVE-2021-25219)
>
> ISC would like to thank Kishore Kumar Kothapalli of Infoblox for
> bringing this vulnerability to our attention. [GL #2899]
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

This passed a-full on the autobuilder:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3347

So I'll be including this in my final pull request for the 3.1.15 release..

Steve


> ---
>  .../bind/{bind_9.11.35.bb => bind_9.11.36.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind_9.11.35.bb => bind_9.11.36.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.35.bb b/meta/recipes-connectivity/bind/bind_9.11.36.bb
> similarity index 98%
> rename from meta/recipes-connectivity/bind/bind_9.11.35.bb
> rename to meta/recipes-connectivity/bind/bind_9.11.36.bb
> index 4652529623..872baf6d2f 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.35.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.36.bb
> @@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] = "1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562"
> +SRC_URI[sha256sum] = "c953fcb6703b395aaa53e65ff8b2869b69a5303dd60507cba2201305e1811681"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>  # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163036): https://lists.openembedded.org/g/openembedded-core/message/163036
> Mute This Topic: https://lists.openembedded.org/mt/89693205/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

