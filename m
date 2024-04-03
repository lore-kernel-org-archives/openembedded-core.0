Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38237CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:49:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14853.1712159341429275106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EQHXg5Rz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 516A8FF802;
	Wed,  3 Apr 2024 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712159339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vXNc7/gEBuEuo2Tx3yG+otua/ooviSyoo9l7Zw2N2EY=;
	b=EQHXg5RzVGRQ+sCXSPBMDKNJlRuAPZO82Q0hK8P9yel+9ZeNDW+dj5uvkLg9rwA6YJuf2K
	d9D1n3jD+ir2rs+wBOXmdq9MUbmKL99klcgqp06td2xf1diP4CrQRlF9IpdgVZ1MpVa6g3
	qoX1XB6V8uNaUFvxAiAI9nyKN2sLHiIql79DhOI0OfNnNEh+dGd6tv9Px88idPndtGKsA/
	ldT56G5mXBnXiU6W5w0ArUJOXbKPdbbZYppQz4QBCfvO+mO9ZElBdQzLe7yIKimfiQnl9s
	XqqRFotJHQNdNi83OJnZkVY1vFUNnK3eSwdSfT8WQ8L1EYxxGi0a0X8N1Jv5hg==
Date: Wed, 3 Apr 2024 17:48:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] vte: update 0.74.2 -> 0.76.0
Message-ID: <202404031548598f5826ee@mail.local>
References: <20240331160655.2455620-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240331160655.2455620-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197929

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/8655/steps/12/logs/stdio

| configure: error: Package requirements (glib-2.0 gtk+-3.0 vte-2.91) were not met:
| 
| No package 'vte-2.91' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables MBTERM_CFLAGS
| and MBTERM_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482, line 151
| 	#5: main, /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/matchbox-terminal/0.2+git/temp/run.do_configure.1616482, line 289
NOTE: recipe matchbox-terminal-0.2+git-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb:do_configure) failed with exit code '1'

On 31/03/2024 18:06:55+0200, Markus Volk wrote:
> - add missing lz4 dependency
> - add PACKAGECONFIG for gtk+3
> - if wayland and opengl are available, gtk4 will be used
> - for plain x11 it can be built with or without opengl depending on DISTRO_FEATURE
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-support/vte/{vte_0.74.2.bb => vte_0.76.0.bb} | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.74.2.bb => vte_0.76.0.bb} (87%)
> 
> diff --git a/meta/recipes-support/vte/vte_0.74.2.bb b/meta/recipes-support/vte/vte_0.76.0.bb
> similarity index 87%
> rename from meta/recipes-support/vte/vte_0.74.2.bb
> rename to meta/recipes-support/vte/vte_0.76.0.bb
> index d8eafde2fb..701b7417e3 100644
> --- a/meta/recipes-support/vte/vte_0.74.2.bb
> +++ b/meta/recipes-support/vte/vte_0.76.0.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
>  "
>  
> -DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
> +DEPENDS = "glib-2.0 glib-2.0-native lz4 libpcre2 libxml2-native gperf-native icu"
>  
>  GIR_MESON_OPTION = 'gir'
>  GIDOCGEN_MESON_OPTION = "docs"
> @@ -19,7 +19,7 @@ GIDOCGEN_MESON_OPTION = "docs"
>  inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
>  
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] = "a535fb2a98fea8a2449cd1a02cccf5190131dddff52e715afdace3feb536eae7"
> +SRC_URI[archive.sha256sum] = "bbce30b8f504370b12d6439c07a82993e97d7e9afe2dd367817cd58ff029ffda"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  
> @@ -29,9 +29,10 @@ EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddoc
>  PACKAGECONFIG ??= " \
>  	gnutls \
>  	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> -	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gtk4', 'gtk3', d)} \
>  "
>  PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
> +PACKAGECONFIG[gtk3] = "-Dgtk3=true,-Dgtk3=false,gtk+3"
>  PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
>  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197665): https://lists.openembedded.org/g/openembedded-core/message/197665
> Mute This Topic: https://lists.openembedded.org/mt/105249434/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

