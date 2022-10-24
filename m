Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9450CECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:19:48 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.20473.1666624779490049387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SI/bvjHe;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id b2so17288215lfp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWE7W6hoeN6+4+GcPKuj4zm6j7NmY12IcEp01ZdEEYA=;
        b=SI/bvjHeQkVvZ8tjz7BgChLZyjJtuzLUbYCKIyUqnKz9eTdaIGG47PojCHsS09srCL
         ZCYCL0twTBW5yxn8G8wear4X5jH5sXgvcLKXaqcdGerrex/PvtmxwdXLcRgS9F9Iq4oH
         DmdWmVEdNhwhMkCR40w4E2obWq+Mcgs43jH3weWi5WqdjbLHyiJLxSa9h/DohlXHrOKj
         XX7D3UJbEdY9kTvX5dVz2rabPOHhHYDknPpFCqwwXLpRfi3Ed3czTRx6faET7lYP26hb
         RX1/+XSpBjo6RkpnqrFDGArxtWUAY5k4v+SOSDoHYGS2k7+sEf6ZkUq6bJwfZghU8oLG
         ttXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWE7W6hoeN6+4+GcPKuj4zm6j7NmY12IcEp01ZdEEYA=;
        b=N38YYMQE9PojmqKNqrn71Q9/L/Sbv39VRjYAZy+H25zQ+HsZga+4CwOGpbAY+/Vhwy
         NuNNBp0Tff2wx3nJ5RhpYqH7Uj8qOmbC/WYupuikkOxPEwn5CZdvyivYb2DpJfRHld+i
         KPYblHgH5i9i24Y3qKku5kOyS5Q6IbMaP/45Cj+GfFSBVBtDcuQY5bOb4y5x7ibM0p69
         Ml7C9Ve0wlGi90FSH4JubXmbzoHbWYEIgSdooGFIG8fY2oCMbqf7Z+dK+XFH26/iZ8ix
         rUIMhXg3U3/t+PAodRU/ibST6Cmbt8uoBtvUKEDVXk0HkA6cddz3/n1AB9H0RDL4W1qO
         zcXA==
X-Gm-Message-State: ACrzQf3+IRWZjkAtC4o2PP1O0tK7O6WlEEZI1ktMqipH6pJMrN/dY8Cx
	6VaHgwCfp8HHoRdHxDp1rJNWirv0VlKKmmc9el0=
X-Google-Smtp-Source: AMsMyM7FeqjRhoxoT6zpDBZEXRCPogGa6JssgjimxqzQEODPBpVIRoh8rJJvtRUII+GL3/RvraxZ7UM9ltLaTtD5STg=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr11691240lfl.367.1666624777523; Mon, 24
 Oct 2022 08:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221024150823.188108-1-vince@underview.tech>
In-Reply-To: <20221024150823.188108-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Oct 2022 17:19:26 +0200
Message-ID: <CANNYZj9XaBk6bhAndeTZk7UQ5N-hF3fa=oUqq4GsgiNnY-nkGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: enable glvnd support
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172106

Thanks, looks good.

Alex

On Mon, 24 Oct 2022 at 17:08, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Allows mesa to be built with glvnd support.
> Thus, creates libEGL_mesa.so* and libGLX_mesa.so*
> libraries meant to coexist with vendor neutral
> dispatch libraries from libglvnd.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../conf/distro/include/default-providers.inc |  1 +
>  meta/recipes-graphics/mesa/mesa.inc           | 20 +++++++++++++------
>  2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index 6defdca12d..3a4e989c1f 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -5,6 +5,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/egl ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> +PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
>  PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
>  PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8a74e0a80a..4eddf82644 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -29,15 +29,18 @@ UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install:append() {
> -    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> -        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> -    fi
> +  # sed can't find EGL/eglplatform.h as it doesn't get installed when glvnd enabled.
> +  # So, check if EGL/eglplatform.h exists before running sed.
> +  if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
> +      sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +  fi
>  }
>
>  DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
>  EXTRANATIVEPATH += "chrpath-native"
>  PROVIDES = " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
> @@ -116,6 +119,7 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broa
>  PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
>
>  PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
> +PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false,libglvnd"
>
>  # "gles" requires "opengl"
>  PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
> @@ -204,6 +208,7 @@ RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'lib
>  PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
>               libgl-mesa libgl-mesa-dev \
> +             libglx-mesa libglx-mesa-dev \
>               libglapi libglapi-dev \
>               libgbm libgbm-dev \
>               libgles1-mesa libgles1-mesa-dev \
> @@ -222,7 +227,7 @@ do_install:append () {
>      rm -f ${D}${libdir}/gallium-pipe/*.la
>      rm -f ${D}${libdir}/gbm/*.la
>
> -    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
> +    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
>      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
>
>      # libwayland-egl has been moved to wayland 1.15+
> @@ -240,6 +245,7 @@ python __anonymous() {
>          suffix = "-native"
>      for p in (("egl", "libegl", "libegl1"),
>                ("opengl", "libgl", "libgl1"),
> +              ("glvnd", "libglx",),
>                ("gles", "libgles1", "libglesv1-cm1"),
>                ("gles", "libgles2", "libglesv2-2"),
>                ("gles", "libgles3",),
> @@ -298,20 +304,22 @@ PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
>  FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d"
>  FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
> -FILES:libegl-mesa = "${libdir}/libEGL.so.*"
> +FILES:libegl-mesa = "${libdir}/libEGL*.so.*"
>  FILES:libgbm = "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa = "${libdir}/libGL.so.*"
> +FILES:libglx-mesa = "${libdir}/libGLX*.so.* ${datadir}/glvnd"
>  FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
>  FILES:libglapi = "${libdir}/libglapi.so.*"
>  FILES:libosmesa = "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker = "${libdir}/libxatracker.so.*"
>
>  FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
> -FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
> +FILES:libegl-mesa-dev = "${libdir}/libEGL*.so.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
>  FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
>  FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
> +FILES:libglx-mesa-dev = "${libdir}/libGLX*.*"
>  FILES:libglapi-dev = "${libdir}/libglapi.*"
>  FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>  FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172105): https://lists.openembedded.org/g/openembedded-core/message/172105
> Mute This Topic: https://lists.openembedded.org/mt/94536595/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

