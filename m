Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAFAC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 21:21:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.2386.1646947274089178650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 13:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SFbHbjb6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r6so9519009wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 13:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lFU5aa9mQGokFEAZSRmqFmGK7uTqZFBqx/T6ZlCZR7Q=;
        b=SFbHbjb6PMnqZAfEVeKkS5L281q2ESXiJR1fTuUQEMCZVT98/GOMeOqSnzafJ6YP8K
         /Apl4Hv3RezL1waopTtWrpRgi9wCc+O+rtFezaORSueE9KtviYDsav949jS5xj+zQX1T
         bI8LfDHmmCEpUTOmzQuMdgbtcMVqffLL8u63Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lFU5aa9mQGokFEAZSRmqFmGK7uTqZFBqx/T6ZlCZR7Q=;
        b=t6pcFgmX0WHjKkj1kWsbjKHhXPSMlBxECWquS9A1P0t4Xi06bwAemN7czX9lwMiPIb
         ltAuIgIoCNsP8H3lwdQ4lkwxiK2GHiSaPrWcoeLMu94VQtDU39K6dIrcyYpT/fFpcA84
         ySl4e68zZ8EL8DnTS162uSBDOjHskZoedetNDRU7QK7ksIjhDEj2eiU19IM3ppH8cuUo
         0gMLBFq1NAmcaZZBmFzB+CSN67+dbb+sPq0SI/gIUtvHG+2OaJRYCaQYxZYvzgPdgDuI
         ouLVOELb2CcTuhMot2jW0wZphNov/GWIzIF8SngEW3ds1p00vBal8GPoF/PpviO/sT4+
         YuCg==
X-Gm-Message-State: AOAM530a1Pk5mtyt1xBN9+EsD7BlpP4d4XUiKTS+Vp+6Aoj3NU3XgzGQ
	Ltg01pQJvQg8lewYS+4SbLpbqLoXvnJXL9dc
X-Google-Smtp-Source: 
 ABdhPJzyeUkR+lax+wrPRcPrzVA4U0GGWOgltkecFKXWdoUe2olNyV79PjO+G0q4JgKnL3cS+AOZJQ==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr4818082wri.401.1646947272475;
        Thu, 10 Mar 2022 13:21:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2661:a90e:1786:ea48?
 ([2001:8b0:aba:5f3c:2661:a90e:1786:ea48])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a1c7503000000b0038100e2a1adsm5509163wmc.47.2022.03.10.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:21:11 -0800 (PST)
Message-ID: 
 <d31da630c53e8ded10d95bae2d3c1149a53bf816.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2022 21:21:10 +0000
In-Reply-To: <20220310171656.3106028-1-ross.burton@arm.com>
References: <20220310171656.3106028-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 21:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163043

On Thu, 2022-03-10 at 17:16 +0000, Ross Burton wrote:
> Add a recipe for Installer, a minimal library/tool to install Python
> Wheels.  Unlike PIP, it explicitly only installs wheels and does nothing
> else.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../python/python3-installer_0.5.0.bb         | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-installer_0.5.0.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-installer_0.5.0.bb b/meta/recipes-devtools/python/python3-installer_0.5.0.bb
> new file mode 100644
> index 0000000000..bde9397569
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-installer_0.5.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "A library for installing Python wheels"
> +DESCRIPTION = "a low-level library for installing a Python package from a wheel distribution."
> +HOMEPAGE = "https://installer.readthedocs.io/"
> +BUGTRACKER = "https://github.com/pradyunsg/installer/issues"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5038641aec7a77451e31da828ebfae00"
> +
> +SRC_URI[sha256sum] = "0cd6bdab3b358cf7e8749370b99aef9e12202751271c5ddb22126599b34dc665"
> +
> +inherit pypi flit_core
> +
> +DEPENDS:remove:class-native = "python3-installer-native"
> +DEPENDS:append:class-native = " unzip-native"
> +
> +do_install:class-native () {
> +    pip_install_wheel_do_bootstrap_install
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3273/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3230/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3243/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3274/steps/14/logs/stdio

[missing maintainer entry]

Cheers,

Richard



