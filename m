Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79085C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 11:17:11 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.40368.1669893422369762641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 03:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SqnoFvI2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3FC7824000C;
	Thu,  1 Dec 2022 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669893419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upPkaIefe8FoFEViup5oyAExyeNAf0sSPtI2y/9sPfE=;
	b=SqnoFvI2al322eZaRQqeykjFo4ClysMwKyzSOHRidnSxlI90qCouNw5/+1vUKn2CNvQ7er
	uPI8OC7k9yNJ/k5zTduiLkZjUaMXeG7+Zn0FjjU9JHY6MjDlGbeZT66lDUQxQgdC04g/kO
	1eidm4BdouIyGcHMpQ0Ti4FOCPnsgM8JyRWv5WsSKb4OBQ6L7TQ8SqF/lOJe6L/IDIxUyn
	vVLmRwO+Pc5V4/8h40NSA/e8gFZgbBF7U5DFUoi1D8Xedx5iFs/jwOlnhxcSJkQ6m6qJne
	Z1yqmUDtWeEO0pGQMggjG6B2U0FkToZs+nXT51XVwQnojhMlfc0BwVFF4JaKVg==
Date: Thu, 1 Dec 2022 12:16:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv9 2/4] gtk4: import recipe from meta-gnome
Message-ID: <Y4iNKi5QtUlRdzrW@mail.local>
References: <20221201075324.353632-1-f_l_k@t-online.de>
 <20221201075324.353632-2-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201075324.353632-2-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174050

This is still building but I already have:
stdio: WARNING: Nothing PROVIDES 'iso-codes-native' (but virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing PROVIDES 'libxkbcommon-native' (but virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb DEPENDS on or otherwise requires it). Close matches:

On 01/12/2022 08:53:22+0100, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/gtk4_4.8.2.bb | 130 ++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> new file mode 100644
> index 0000000000..dc552c5c91
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> @@ -0,0 +1,130 @@
> +SUMMARY = "Multi-platform toolkit for creating GUIs"
> +DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
> +set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
> +HOMEPAGE = "http://www.gtk.org"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +SECTION = "libs"
> +
> +DEPENDS = " \
> +    atk \
> +    cairo \
> +    fribidi \
> +    gdk-pixbuf \
> +    gdk-pixbuf-native \
> +    gi-docgen \
> +    glib-2.0 \
> +    graphene \
> +    harfbuzz \
> +    iso-codes \
> +    jpeg \
> +    libepoxy \
> +    libpng \
> +    librsvg \
> +    libxkbcommon \
> +    pango \
> +    tiff \
> +"
> +
> +LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> +    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
> +    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
> +    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
> +"
> +
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c864333a983a692a9"
> +
> +S = "${WORKDIR}/gtk-${PV}"
> +
> +inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings features_check gobject-introspection
> +
> +# TBD: nativesdk
> +# gobject-introspection.bbclass pins introspection off for nativesk. As long as
> +# we do not remove this wisdom or hack gtk4, it is not possible to build
> +# nativesdk-gtk4
> +BBCLASSEXTEND = "native"
> +
> +GSETTINGS_PACKAGE:class-native = ""
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +
> +EXTRA_OEMESON = " -Dbuild-tests=false -Ddemos=false"
> +
> +PACKAGECONFIG ??= "gstreamer ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 vulkan', d)}"
> +PACKAGECONFIG:class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +
> +PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
> +PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
> +PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
> +PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
> +PACKAGECONFIG[ffmpeg] = "-Dmedia-ffmpeg=enabled,-Dmedia-ffmpeg=disabled,ffmpeg"
> +# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
> +PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled, vulkan-loader vulkan-headers shaderc-native"
> +
> +PACKAGES =+ "${PN}-demo"
> +LIBV = "4.0.0"
> +
> +FILES:${PN}:append = " \
> +    ${datadir}/glib-2.0/schemas/ \
> +    ${datadir}/gtk-4.0/emoji/ \
> +    ${datadir}/metainfo/ \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
> +    ${libdir}/gtk-4.0/${LIBV}/media \
> +    ${bindir}/gtk4-update-icon-cache \
> +    ${bindir}/gtk4-launch \
> +"
> +
> +FILES:${PN}-dev += " \
> +    ${datadir}/gtk-4.0/gtk4builder.rng \
> +    ${datadir}/gtk-4.0/include \
> +    ${datadir}/gtk-4.0/valgrind \
> +    ${datadir}/gettext/its \
> +    ${bindir}/gtk4-builder-tool \
> +    ${bindir}/gtk4-encode-symbolic-svg \
> +    ${bindir}/gtk4-query-settings \
> +"
> +
> +GTKBASE_RRECOMMENDS ?= " \
> +    liberation-fonts \
> +    gdk-pixbuf-loader-png \
> +    gdk-pixbuf-loader-jpeg \
> +    gdk-pixbuf-loader-gif \
> +    gdk-pixbuf-loader-xpm \
> +    shared-mime-info \
> +    adwaita-icon-theme-symbolic \
> +"
> +
> +
> +GTKBASE_RRECOMMENDS:class-native ?= ""
> +
> +GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> +
> +RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
> +RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
> +RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG", "wayland", "wayland-protocols", "", d)}"
> +
> +PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
> +python populate_packages:prepend () {
> +    import os.path
> +
> +    gtk_libdir = d.expand('${libdir}/gtk-4.0/${LIBV}')
> +    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
> +
> +    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
> +
> +    if (d.getVar('DEBIAN_NAMES')):
> +        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
> +}
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174041): https://lists.openembedded.org/g/openembedded-core/message/174041
> Mute This Topic: https://lists.openembedded.org/mt/95377615/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

