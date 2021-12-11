Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A737BC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 11:02:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.20368.1639220544356376254
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 03:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AwoBjo+x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id p18so8596776wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6J1XAlT0UGpvty0S9eYH5IfOXEskpTiZv8fz4nkIjbI=;
        b=AwoBjo+xNwCleDji7KsHEkTtGYbecyQTi6vooNVBxMJ0t1O5ELA0uaSbFV69GMYZuP
         NQSjR9Su0t2QeVm0g+zE4mm5zN0yr4XXrokYhi9w2ZkotQ1wg78JLfd4hQuUlCI7rks4
         a2xiYdehi7KFwGumqJelxrn5xiX4m/2sKQr34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6J1XAlT0UGpvty0S9eYH5IfOXEskpTiZv8fz4nkIjbI=;
        b=Khh1qSgvALs75moA17qsV5kARRLl1Xopti6S5a76baLVZI947gU+1sH0bArcw6f/kZ
         vQ+83MaCFeUraYdNgUcCFQ1T/iTxdB8KWP7uRQ9zFfphhIGlVFJm727r5kLstfy5eqgA
         RjiWSbksCXW/g1GyFrnK77xiPiVG8vF536y5MmWa0OYJM8vv5dyMKqTdUszroqiDqIj5
         SdkJTEGpU7yCWLSOQzRP7onLU6FtJ6Iuy4zW5oqqdfSBbDzBDCe4wV0Vdg2FmfCQaM5d
         9SIU5+83knR2u//qzR/xlc/5Og20MFue5z6SkSHbHK5VmnGdR6lAwQu/G9PjdeJDbiso
         zvXA==
X-Gm-Message-State: AOAM531SCOYxccDr4qhyES+5lDLpFJ5F8adQPeoF69AFRa9RQvoTW1Vv
	KzRZlP4uxTLqQrCsAkOVat5A5w==
X-Google-Smtp-Source: 
 ABdhPJyoJn642ExOpUtWcQm8fU1V7CPFl4scq/8wg1B9ZyYKCRxZfWQ9NiU8k4SKD2OHDCV5CGE6Ag==
X-Received: by 2002:a1c:104:: with SMTP id 4mr23566640wmb.31.1639220542525;
        Sat, 11 Dec 2021 03:02:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f405:6ac4:2af3:f8d3?
 ([2001:8b0:aba:5f3c:f405:6ac4:2af3:f8d3])
        by smtp.gmail.com with ESMTPSA id
 a9sm4861715wrt.66.2021.12.11.03.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 03:02:22 -0800 (PST)
Message-ID: 
 <bae1f9ce84ed0faf353586f1b80399cf0b6ecce3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wayland: upgrade 1.19.0 -> 1.20.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Dec 2021 11:02:18 +0000
In-Reply-To: <1639089018-30078-1-git-send-email-denis@denix.org>
References: <1639089018-30078-1-git-send-email-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 11:02:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159562

On Thu, 2021-12-09 at 17:30 -0500, Denys Dmytriyenko wrote:
> Wayland 1.20.0 is released!
> 
> This release contains the following major changes:
> 
> - FreeBSD support has been entirely upstreamed and has been added to
>   our continuous integration system.
> - The autotools build system has been dropped. Meson has replaced it.
> - A few protocol additions: wl_surface.offset allows clients to update
>   a surface's buffer offset independently from the buffer,
>   wl_output.name and description allow clients to identify outputs
>   without depending on xdg-output-unstable-v1.
> - In protocol definitions, events have a new "type" attribute and can
>   now be marked as destructors.
> - A number of bug fixes, including a race condition when destroying
>   proxies in multi-threaded clients.
> 
> Drop patch to fix strndup detection on MinGW that no longer applies, as
> meson claims to had that fixed since version 0.54.2
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  ...0001-build-Fix-strndup-detection-on-MinGW.patch | 37 ----------------------
>  .../{wayland_1.19.0.bb => wayland_1.20.0.bb}       |  3 +-
>  2 files changed, 1 insertion(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
>  rename meta/recipes-graphics/wayland/{wayland_1.19.0.bb => wayland_1.20.0.bb} (93%)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
> deleted file mode 100644
> index ad1063b..0000000
> --- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 6a6223a8e217664a348835e92d5a602f50e18b2c Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> -Date: Thu, 20 Feb 2020 15:20:45 -0600
> -Subject: [PATCH] build: Fix strndup detection on MinGW
> -
> -GCC and meson conspire together to incorrectly detect that strndup()
> -exists on MinGW as __builtin_strndup, when no such function exists. As a
> -work around, meson will skip looking for __builtin functions if an
> -'#include' is in the prefix, so add '#include <string.h>' when looking
> -for strndup().
> -
> -See: https://github.com/mesonbuild/meson/issues/3672
> -
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge_requests/63]
> -
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 11c35fa..80729d0 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -36,11 +36,11 @@ have_funcs = [
> - 	'posix_fallocate',
> - 	'prctl',
> - 	'memfd_create',
> --	'strndup',
> - ]
> - foreach f: have_funcs
> - 	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f))
> - endforeach
> -+config_h.set('HAVE_STRNDUP', cc.has_function('strndup') and cc.has_header_symbol('string.h', 'strndup'))
> - 
> - if get_option('libraries')
> - 	ffi_dep = dependency('libffi')
> diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/wayland/wayland_1.19.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.20.0.bb
> index 4c9ae0f..e984414 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
> @@ -15,9 +15,8 @@ DEPENDS = "expat libffi wayland-native"
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://run-ptest \
>             file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
> -           file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>             "
> -SRC_URI[sha256sum] = "baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15"
> +SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
> 

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2640/steps/11/logs/stdio

and there may be more to follow :(

Cheers,

Richard



