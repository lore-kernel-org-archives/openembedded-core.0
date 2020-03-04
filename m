Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 00B816059C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 22:35:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so1682363plp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 14:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=OxxQqQDL5Y8OZ2l/GQjHyy0CVWKqRQCXPQjUPRl6bmw=;
	b=sYDJzBpOYnUsTQjdDOBTxA1lb/HpKJv7Uii6Nsc4aewjkwZ+yevkyQQpuokFGC8oWT
	nWlpqndcFGhviz5dQ390YG7Bs6ENuaXZPa3GFbQ8r/MU3SesxHmwI8IosWBXaIGr56X8
	dgd7vcMtTsv0OfKkhZmVoPUVJbzm2bs1LaQEf3vQXgooJ1JuV9C4taKVVUan1ixEJRdI
	D4Jcym93S9zRSXuZpeeo1bczb3WuNEPIySxKVHA1J8T5BZiPh0asZvvYEKVSKKE5/zE5
	Z8nwotTTmyHw375evpwKh8c/bZBTkz/fhWMwUt6TsFnYac/w0v5XiFSZe7PrmWsNCl9G
	AYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OxxQqQDL5Y8OZ2l/GQjHyy0CVWKqRQCXPQjUPRl6bmw=;
	b=UA6YrO8iXT8w994W69/TAFJuOkuVfULJ0khdcvohhbT0OpbI4SFvBSv2ydUdvbrvLm
	DDWU06SGfzAwKw+tl6tUVryS9yhm8xSlq8Nol4bu3Tg4im1RqSDGIQ/SsdObxZ2sbf3M
	H7d5TRVkE9RXhsw9O8ZRTVGDOVSjFu49lbSKIdfn1290SkSVZnayk1Ys1Q4k21/FZlYM
	lHBd0fI8mJ7P9Dh0xJmOM/ezb37WVeQEtb7Dv0nQ6KCwqOFVa6fTcwELfOSuvnbJL/oq
	03fwX/Y9YGkWLbIXN1uoSzVlKjbBkKFAkM2EKRuSiFuE0zfcciwK4MEX9jPNwrs+FG4C
	sSDw==
X-Gm-Message-State: ANhLgQ1JiS7kDWunS2gRRUczFK2cvxWMtuoupYpC3T9VcHL3ctbKCw2T
	XQX0pi2V01vUYF53hhrrA1Mii32Z
X-Google-Smtp-Source: ADFU+vsX3E0ica1Vz1o8pYEjkUGok1TBE7n3vw2FI8o+N5gwBw9fOFNFvOEF/a5htVwEJKySfitp/w==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
	l15mr5046339pjt.102.1583361319456; 
	Wed, 04 Mar 2020 14:35:19 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3055:bf8b:bc3b:3d57?
	([2601:202:4180:a5c0:3055:bf8b:bc3b:3d57])
	by smtp.gmail.com with ESMTPSA id
	k70sm3783128pje.38.2020.03.04.14.35.18
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 14:35:18 -0800 (PST)
To: Nathan Hartman <hnathan918@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200304220555.30563-1-hnathan918@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8798738b-8c20-d265-c217-3150d77a44be@gmail.com>
Date: Wed, 4 Mar 2020 14:35:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304220555.30563-1-hnathan918@gmail.com>
Subject: Re: [PATCH] mesa: updated to 20.0 release
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
X-List-Received-Date: Wed, 04 Mar 2020 22:35:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/4/20 2:05 PM, Nathan Hartman wrote:
> Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
>
> Uprev'd mesa and mesa-gl recipes to 20.0 release.
>
> As glx-tls was updated to elf-tls in the 20.0 release, the mesa.inc file
> was updated to reflect this change.

Why did the LIC_FILES_CHKSUM change? please include that in the commit
message

Do the mesa-demos still work?

- armin
>
>
> ---
>  .../mesa/{mesa-gl_19.1.6.bb => mesa-gl_20.0.0.bb}   |  0
>  meta/recipes-graphics/mesa/mesa.inc                 | 12 ++++++------
>  .../mesa/{mesa_19.1.6.bb => mesa_20.0.0.bb}         | 13 +++++++------
>  3 files changed, 13 insertions(+), 12 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_20.0.0.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_20.0.0.bb} (54%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_20.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9e5808ee27..a678ceae00 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> +LIC_FILES_CHKSUM = "file://docs/license.html;md5=c1843d93c460bbf778d6037ce324f9f7"
>  
>  PE = "2"
>  
> @@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
> -                   glx-tls \
> +                   elf-tls \
>  		   "
> -PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
> -PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
> +PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls"
> +PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls"
>  
> -PACKAGECONFIG_remove_libc-musl = "glx-tls"
> +PACKAGECONFIG_remove_libc-musl = "elf-tls"
>  
>  # "gbm" requires "dri", "opengl"
>  PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
> @@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
>  X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
> -PACKAGECONFIG[glx-tls] = "-Dglx-tls=true, -Dglx-tls=false"
> +PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
>  PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
>  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
>  
> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
> similarity index 54%
> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
> rename to meta/recipes-graphics/mesa/mesa_20.0.0.bb
> index 19221e9e25..d38754e852 100644
> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> +++ b/meta/recipes-graphics/mesa/mesa_20.0.0.bb
> @@ -1,13 +1,14 @@
>  require ${BPN}.inc
>  
>  SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> -           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> -           file://0002-meson.build-make-TLS-GLX-optional-again.patch \
> -           file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
> +	   file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
> +	   file://0002-meson.build-make-TLS-ELF-optional.patch \
> +	   file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
> +	   file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
> +	   file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
>             "
> -
> -SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
> -SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
> +SRC_URI[md5sum] = "681229d992bbd6250a5be4f308708795"
> +SRC_URI[sha256sum] = "bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  


