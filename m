Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.5278.1608356078110483061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 21:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mN/ZcY7w;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id u21so2990717qtw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 21:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3Y7/d95HlLkMdfJqkVn7Hn0Wa59Cs0gLKVXZ3zBfis=;
        b=mN/ZcY7w/DDupW6cKmhIPuacpuzC7LzaClrtJV6oDotSyBfil27d+FS2B7elcnxES/
         3rf2LgRrvA1ZfsRq5yoa2glYR//VjUW8HMQkZOPDsm18rizJYhWATW24puzuiN05QhgC
         hjUQYx4M86S8k4TPo6wz2s8Gs9J7rwJyVdZnrb2wt6zzJ4OOE4qMnL0lGimW5lp8D0xj
         Hit06SEXZw1ZCMsshc9QT91IzZ2IDNkGafTmnxXzI9rCJilSlJLgisphLkTQm55+3E1c
         Z8yBRDEGDmQaj0buyYt4SSSUJArtLQgIZsIpggyRf8R8a0KhqKH0tlfKUPUp9I4Crbe0
         I86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3Y7/d95HlLkMdfJqkVn7Hn0Wa59Cs0gLKVXZ3zBfis=;
        b=FUF5JeNjlF3sE+oY7/T9pPY04sUbE8nnUdhJc/ItnVbFfeb6fBzrXA4aD/klRrmPiw
         KjvDDG/+0sLZVPxTmBlJ3/m1CLHQqBu1c16Anq6D+J2I+mFpvbRWbFKkBeEf22HoTPeO
         qk4AYKItivq/KY/s3cwUYRN5HcG6pU5iBJ/gUE/LhQeu5xaDvV46lMdj+ngcl6oMFUXq
         qGQm2tHyaL8md/LkEmQumIcR21RsXlTe96xQak5ore6anLeNzWHCxMDOQeQTuDoD/GOY
         RQjGSdUQJNFDyzFXHLCcqTnPlCH0nO6GrJM7hmHOioNvxFsZ0cMNt4iiRxAri8RRd1A3
         0VDA==
X-Gm-Message-State: AOAM532tzl2XxMEeif8g9QL3ofDjsKIslSD1re4fJMMNjz3k7ZWSCp5w
	TKgE4gj5zVrPJfuZWv+VAF8upSBFYiQajg==
X-Google-Smtp-Source: ABdhPJz+v47+6FplLqBZ+khHy6rCfVbN59SDzyMJ9HH8uFBAMR7St/HvIZKff4hPAnqH/Vxweweskw==
X-Received: by 2002:ac8:75d4:: with SMTP id z20mr7432979qtq.267.1608356076736;
        Fri, 18 Dec 2020 21:34:36 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id r1sm6311037qta.32.2020.12.18.21.34.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 21:34:35 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?W1BBVENIXSBtZXNhLmluYzogc3dpdGNoIHRydWXihpJlbmFibGVkIGZhbHNl4oaSZGlzYWJsZWQ=?=
Date: Sat, 19 Dec 2020 00:34:21 -0500
Message-Id: <20201219053421.31388-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A number of options have been switched from true/false to enabled/disabled and
the older usage is deprecated, as is seen in the configuration logs:

	../mesa-20.3.1/meson.build:92: WARNING: gles1 option "true" deprecated, please use "enabled" instead.
	../mesa-20.3.1/meson.build:100: WARNING: gles2 option "true" deprecated, please use "enabled" instead.
	../mesa-20.3.1/meson.build:119: WARNING: shared-glapi option "true" deprecated, please use "enabled" instead.
	../mesa-20.3.1/meson.build:381: WARNING: gbm option "true" deprecated, please use "enabled" instead.
	../mesa-20.3.1/meson.build:412: WARNING: egl option "true" deprecated, please use "enabled" instead.
	../mesa-20.3.1/meson.build:493: WARNING: dri3 option "false" deprecated, please use "disabled" instead.
	../mesa-20.3.1/meson.build:516: WARNING: gallium-vdpau option "false" deprecated, please use "disabled" instead.
	../mesa-20.3.1/meson.build:570: WARNING: gallium-xvmc option "false" deprecated, please use "disabled" instead.
	../mesa-20.3.1/meson.build:691: WARNING: gallium-va option "false" deprecated, please use "disabled" instead.
	../mesa-20.3.1/meson.build:727: WARNING: gallium-xa option "false" deprecated, please use "disabled" instead.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2158c9eaf9..883c244471 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -73,7 +73,7 @@ def check_buildtype(d):
 MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
 EXTRA_OEMESON = " \
-    -Dshared-glapi=true \
+    -Dshared-glapi=enabled \
     -Dgallium-opencl=disabled \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
@@ -94,13 +94,13 @@ PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls x11"
 PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
 # "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "-Dgbm=true,-Dgbm=false"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
 PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
-PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=true,-Dgallium-xvmc=false,libxvmc"
+PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 DRIDRIVERS_class-native = "swrast"
@@ -109,7 +109,7 @@ DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "-Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}, -Ddri-drivers='', xorgproto libdrm"
-PACKAGECONFIG[dri3] = "-Ddri3=true, -Ddri3=false, xorgproto libxshmfence"
+PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
@@ -122,10 +122,10 @@ PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')},
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
 # "gles" requires "opengl"
-PACKAGECONFIG[gles] = "-Dgles1=true -Dgles2=true, -Dgles1=false -Dgles2=false"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
 
 # "egl" requires "dri", "opengl"
-PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[freedreno] = ""
@@ -155,12 +155,12 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers=''"
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
                                elfutils"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
-PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-initial"
+PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
+PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=true,-Dgallium-vdpau=false,libvdpau"
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
@@ -171,7 +171,7 @@ GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panf
 OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', 'classic', d)}"
 PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
 
-PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
-- 
2.30.0.rc0

