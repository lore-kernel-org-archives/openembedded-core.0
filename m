Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2A775047
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:43:18 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id w17-v6so9157084pll.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=86JyjpAkUICNcml7DthN7OOes2ODQRKwd7iEGlx9vk0=;
	b=g5fE35lze8ploVwbplrPY4SvcrnwlDOreWAlV7atWS/w4ISW/ppgu9OFTwdKX8O3co
	f2pLYe12PlCjpZOe3ho2m8t/yXSr0KprR02R5TjS6VUydMGgo7wYXLjABwV/ybgHCF36
	FaQNwKsEEDoadjHuzZfW7+rcpEtvN4G93CgRZZr9T1jDsYSc63//UcgMoMMkkg4PJI0n
	LW+OkvDsBvz3s0+S/+LZRdPrYVdWcKjhcpU0vfkL/5Nta2kPAHkkdZadBWV+6CO7ugZI
	amynMu/5DSBVet+qXiMU4OUxykX46i3GW2ibHplT2nKmCYTUHhCTfo/DxRcVuoqrM1WR
	97pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=86JyjpAkUICNcml7DthN7OOes2ODQRKwd7iEGlx9vk0=;
	b=OsOFkjCxC2+D2aYEMc1UzP09OE2vGf6GO6nSE6NlGfx5+cwl0M2ctQXRqFsrjb0iut
	K2SW5tbKGpS4xD4NHLj9aoanbae/GW4PRCKyLlhao7heymHqT2neqxYRTHhoAMEUl45Y
	Y/dj0kXlnAR0iTROneJBLxDzEWZt+NO3BBqZ/E+7Xdk7/8QRDUAqrcuvm3MD8Um8Usve
	fPi/PLpq7nPoq8vkU7SNndRvbCQvPV5VmwpqXJKr/C0pVYqsGLyww/Si/o0tzaYZF2VR
	l2pDQgRzrdc4wu1Rq6n30Aouw3oKEd3vqf6CCYTOd9FrqR8oBcydS8ydacs4jqac36Ou
	EgfQ==
X-Gm-Message-State: APt69E2DOkqKzhf80GqbTrDyWYkO6wpaDvaWkkJcbKHoScmIzc4yAFOQ
	IFNK+mki5BWEzWkaYFPznhPAlQ==
X-Google-Smtp-Source: ADUXVKJD01GhfguDfyLv+ClaUcw7Ag6jEkeWSAajD8zMxflI/s7BJhABlJCdBEsYhBZPxGHiowV8hQ==
X-Received: by 2002:a17:902:b217:: with SMTP id
	t23-v6mr14533568plr.312.1529332999458; 
	Mon, 18 Jun 2018 07:43:19 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:eb:1883:34e0:8f40?
	([2601:202:4000:1184:eb:1883:34e0:8f40])
	by smtp.gmail.com with ESMTPSA id
	b72-v6sm29531025pfj.56.2018.06.18.07.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 07:43:18 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180618101044.10636-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3f9b3040-3576-ce8d-4736-c664d7623491@gmail.com>
Date: Mon, 18 Jun 2018 07:43:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180618101044.10636-1-ross.burton@intel.com>
Subject: Re: [PATCH 1/3] xf86-video-intel: patch cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 14:43:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/18/2018 03:10 AM, Ross Burton wrote:
> always_include_xorg_server.h.patch is merged upstream, so drop it.
>
> disable-x11-dri3.patch was purely to solve determinism issues with the shared sysroot, which
> we don't have anymore.
>
> Also remove redundant tarball checksums as this recipe fetches from git.
cool, I will drop the changes I have queue fro this package.

thanks,
Armin
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../always_include_xorg_server.h.patch             | 24 ----------------------
>  .../xf86-video-intel/disable-x11-dri3.patch        | 17 ---------------
>  .../xorg-driver/xf86-video-intel_git.bb            |  4 ----
>  3 files changed, 45 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
>  delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
> deleted file mode 100644
> index 8a5dd39ae1e..00000000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/always_include_xorg_server.h.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Include xorg-server.h to fix build errors seen with glibc 2.20
> -
> -In file included from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/string.h:634:0,
> -                 from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/i586-oe-linux/xf86-video-intel/2_2.99.912-r0/xf86-video-intel-2.99.912/src/backlight.c:39:
> -/home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
> - strndup(const char *str, size_t n);
> - ^
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: xf86-video-intel-2.99.912/src/backlight.c
> -===================================================================
> ---- xf86-video-intel-2.99.912.orig/src/backlight.c	2014-04-09 10:41:18.000000000 -0700
> -+++ xf86-video-intel-2.99.912/src/backlight.c	2014-08-28 18:52:25.524070587 -0700
> -@@ -29,6 +29,7 @@
> - #include "config.h"
> - #endif
> - 
> -+#include <xorg-server.h>
> - #include <sys/types.h>
> - #include <sys/wait.h>
> - #include <sys/stat.h>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
> deleted file mode 100644
> index 3dddd334bf4..00000000000
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -These modules are only used for tests that don't get installed, and the
> -automatic detection without explicit dependencies means that a build can find
> -e.g. xshmfence at configure time but then it's been removed from the sysroot by
> -the time compile happens.
> -
> -As the tests don't get installed, just disable the checks.
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index bd654f3..78a0e0d 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -279 +279 @@ fi
> --PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
> -+#PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-xfixes xcb-present x11-xcb xshmfence x11 xcomposite xdamage xrender xrandr xxf86vm xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> index 893f5ce3f64..a60da70840d 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
> @@ -14,13 +14,9 @@ PV = "2.99.917+git${SRCPV}"
>  S = "${WORKDIR}/git"
>  
>  SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel \
> -           file://disable-x11-dri3.patch \
> -           file://always_include_xorg_server.h.patch \
>             file://0001-Add-Coffeelake-PCI-IDs-for-S-Skus.patch \
>             "
>  
> -SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
> -SRC_URI[sha256sum] = "00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf9667c9"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>  
>  DEPENDS += "virtual/libx11 drm libpciaccess pixman"


