Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77C8C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 09:45:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.23162.1638611137388263110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 01:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZiEj4fLo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id d24so11206911wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gTkE5TkEZ7Pn2Yx4CUE0kQvXuoEJjRII7uLmFXEvRxE=;
        b=ZiEj4fLoE2TkaccWvSKVWp+448x6wQs0KQydBbd1I6TsMys9aH5RbSqk4eN6qLDu5I
         D/iLAD9J2fIMvg82cYY8r84OuDB1vJYtqGFZY9bTP5F90p0N6aSQNWx1VYlq7t91im3H
         98ZrTd3IjP4BhkihwtVFIBbUkXfDT8v+Af+II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gTkE5TkEZ7Pn2Yx4CUE0kQvXuoEJjRII7uLmFXEvRxE=;
        b=6uxZ7a/WLf/5P0stUKNv6qmx/r6fTUXdKenhutUQG1JPL0sTl2H7v7960823VT0bBs
         jEvbWfJ1O0hsvuWXQNOljw/lqe7PJ/nZxY54Q1UB9ItbQ8805/mjnbxH7egXU5ayKUzN
         BtsyeDOFgYYTn0ZcINJSri55F87t2QQHCF2TptIFwtMOQFkc5S0DslivAQ3Pr/J0Pny9
         qXV59kk1BaY6xM2TkUEDw20rM91crR+keJ1zvFXkR7cLLWC1OAbN95tW5PoX8WS4gW/n
         2ErtAvdhkDYdkm2KxfoQjo+Dh6frUskJD6oRHGR+1iwdujXFIIbpfaWLUtxeegSYrmgb
         Ihgw==
X-Gm-Message-State: AOAM533xkCvCkYJR9zWBCK0gaJ6rfNSSHzwXeLpihU4RVpWzUuSKzFd4
	2IBtQBQkzr69EtfHL3MQj5IJfQ==
X-Google-Smtp-Source: 
 ABdhPJzLsjgUBMs8ZtAxrKEEhLVf3gyn6rYY3rNzh6UobeCAzZybEXCOmIGcionrkB4+KaqUB7W4vQ==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr28368392wrr.450.1638611135566;
        Sat, 04 Dec 2021 01:45:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:59e5:4be6:2d2c:be9e?
 ([2001:8b0:aba:5f3c:59e5:4be6:2d2c:be9e])
        by smtp.gmail.com with ESMTPSA id
 w22sm4834887wmi.27.2021.12.04.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 01:45:35 -0800 (PST)
Message-ID: 
 <1f8dedc9f09fd759048c6af7158e1fd2badc7af8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] libxkbcommon: split libraries into
 separate packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 04 Dec 2021 09:45:32 +0000
In-Reply-To: <20211203164340.2963235-5-ross.burton@arm.com>
References: <20211203164340.2963235-1-ross.burton@arm.com>
	 <20211203164340.2963235-5-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 09:45:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159176

On Fri, 2021-12-03 at 16:43 +0000, Ross Burton wrote:
> The sublibraries, such as libxkbcommon-x11, have specific linkage, so to
> avoid link creep they can be put into separate packages.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> index b4541cc698..425c1f386d 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.1.bb
> @@ -25,8 +25,14 @@ PACKAGECONFIG[wayland] = "-Denable-wayland=true,-Denable-wayland=false,wayland-n
>  PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb xkeyboard-config,"
>  
>  PACKAGE_BEFORE_PN += "xkbcli"
> +FILES:${PN} = ""
>  FILES:xkbcli = "${bindir}/xkbcli ${libexecdir}/xkbcommon/xkbcli-*"
>  
> +python populate_packages:prepend () {
> +    # Put the libraries into separate packages to avoid dependency creep
> +    do_split_packages(d, d.expand('${libdir}'), r'^(lib.*)\.so\.*', '%s', '%s library', extra_depends='', allow_links=True)
> +}
> +
>  # Fix a following runtime error:
>  # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
>  RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"

Something isn't quite right in a weston build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/1044/steps/12/logs/stdio

Cheers,

Richard


