Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.11370.1602839121328996588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GP8646DP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id b8so1903197wrn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ss8M7PuZglE9KYa/3OtpQcp7YhnjqJaNI+3/35DmfH4=;
        b=GP8646DPWy1UMhiJtHF7HtNWGpkhyCdCVwSICQDxDM5vqCpSbYl01etMUVSsTnuJQH
         csfn4E9lCPVwB8jbY7lGiLyQo0i9BrHU8WNUKhqTygkLYv7Se2uLE1SbGF1ixUdxuAHy
         e+YAU4FdpveMgjCIBy6Imw3W+tK23heCteQFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ss8M7PuZglE9KYa/3OtpQcp7YhnjqJaNI+3/35DmfH4=;
        b=aLgawzTr6PQIVJK0FwilufQKyEvmjCjLaD9v3x+s4X01hA4NqT3w/AWV1Ak58nJ9jC
         cPHBg+ZPDojpjnhLPUo4ylS6tapmIRlvHAIkHPr15sBTawI3BNObkLizfpMHjm2CSbr9
         MZeLPFKv5N76qAeBifJTzX3NQyfJ9RJ9NhSqmSzrB+Iq7PAqla0gGhl/ipJZyilbEPXZ
         iFzIGo+VHkG9OmzFwqmo7xDVJoR4hCKW1ic2H1rxdH+7dtEttsur8BwlsY3ZKvrVpCs9
         MM6fLFu6TOVs9pd7JaGlvQrr0Pj/hRUF84KW+nddzZ2UGACbOthPFpL5I9qyOshtB9jl
         3Gjw==
X-Gm-Message-State: AOAM533JkVbyX7fHjEg1b1mkscoknroaEIaZO6z73EjHaFHFLP98rUxY
	WUAoP1DCNjVqwVocZ/6XojRGpg==
X-Google-Smtp-Source: ABdhPJxloGF3j2XFzC3vg/7kroKRMIVjsXzZD0vvOWlzJ/UjSi6vR2SOlAAx3+NbV/EZIKQQkgtmiA==
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr2740962wrr.20.1602839119724;
        Fri, 16 Oct 2020 02:05:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id p9sm2000998wma.12.2020.10.16.02.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 02:05:19 -0700 (PDT)
Message-ID: <c671f8ca6bdeb7d7475dbfea8ec440d103045395.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] recipes: Use GPL-2.0-only instead of GPL-2.0 for LIC_FILES_CHKSUM
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Date: Fri, 16 Oct 2020 10:05:18 +0100
In-Reply-To: <20201016043341.635385-1-raj.khem@gmail.com>
References: <20201016043341.635385-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

This patch fixes issues introduced by a patch I tested in -next from
Meh Mbeh Ida Delphine <idadelm@gmail.com> (cc'd). I have removed it
from the queue as it failed testing. This patch may be useful so they
can fix their patch though.

Note the fixes Khem found for glibc-collateral and devicetree.bbclass
in addition to the recipes.

Cheers,

Richard

On Thu, 2020-10-15 at 21:33 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Add devicetree.bbclass and glibc-collateral.inc
> 
>  meta/classes/devicetree.bbclass                              | 2 +-
>  meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
>  meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
>  meta/recipes-core/glibc/glibc-collateral.inc                 | 4 ++-
> -
>  meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
>  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/devicetree.bbclass
> b/meta/classes/devicetree.bbclass
> index c772ab2ab9..ece883accf 100644
> --- a/meta/classes/devicetree.bbclass
> +++ b/meta/classes/devicetree.bbclass
> @@ -18,7 +18,7 @@ SECTION ?= "bsp"
>  # device trees built with them are at least GPLv2 (and in some cases
> dual
>  # licensed). Default to GPLv2 if the recipe does not specify a
> license.
>  LICENSE ?= "GPLv2"
> -LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-
> 2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "dtc-native"
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
> b/meta/recipes-connectivity/connman/connman-conf.bb
> index 9a519ec866..85fee09258 100644
> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Connman config to setup wired interface on
> qemu machines"
>  DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
>  network interface for a qemu machine."
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  inherit systemd
>  
> diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> index 61fb8cbad1..2129acd8d3 100644
> --- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> +++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "inittab configuration for BusyBox"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  SRC_URI = "file://inittab"
>  
> diff --git a/meta/recipes-core/glibc/glibc-collateral.inc
> b/meta/recipes-core/glibc/glibc-collateral.inc
> index 52880791a7..4f81f07da7 100644
> --- a/meta/recipes-core/glibc/glibc-collateral.inc
> +++ b/meta/recipes-core/glibc/glibc-collateral.inc
> @@ -1,7 +1,7 @@
>  require glibc-common.inc
>  
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-
> 2.0;md5=801f80980d171dd6425610833a22dbe6 \
> -                     file://${COMMON_LICENSE_DIR}/LGPL-
> 2.1;md5=1a6d268fd218675ffea8be556788b780"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> only;md5=801f80980d171dd6425610833a22dbe6 \
> +                     file://${COMMON_LICENSE_DIR}/LGPL-2.1-
> only;md5=1a6d268fd218675ffea8be556788b780"
>  
>  deltask do_fetch
>  deltask do_unpack
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index 0cc0dc8c79..9a63c9f0a8 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Serial terminal support for systemd"
>  HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  PR = "r5"
>  
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 8781492d47..d95d1a63f5 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Inittab configuration for SysVinit"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  PR = "r10"
>  
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
> scripts_1.0.bb
> index 1ab248fed5..8a02bc7f48 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Build tools needed by external modules"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>  
>  inherit kernel-arch
>  inherit pkgconfig
> 
> 

