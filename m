Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAij5-0005Ww-Jc
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:38:35 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VX95dhXUH8p5qJcjjlPRqWbBMe2GGmbRj8/p8xvItxc=;
	b=f4FhsMisI7WUqxCouSuhgQovcNIbKZBIbGi8mdm9VT9b+AqP8IiomOz3dYu04msAlq
	Q/dye0CyXkx9rumWu3PUm0SG9t9oRNO6x/URzyHDUqU2HWhi3v/ZWI9qKRd7RkvVKmXw
	tc8Dn3/+i1rsI+omIG7QAtlrNCdZMgCyPxzbk=
Received: by 10.204.138.130 with SMTP id a2mr5701721bku.367.1317648785534;
	Mon, 03 Oct 2011 06:33:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b17sm13233501bkd.8.2011.10.03.06.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:33:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:29:01 +0200
Message-Id: <cd9a658d3fded6cdadb34f2e1bc251844e225c67.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 30/30] mesa: drop older 7.10.2 and 7.7+git recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 13:47:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |   46 ------
 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch |   18 ---
 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h |  162 --------------------
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |   40 -----
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |   57 -------
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |   22 ---
 6 files changed, 0 insertions(+), 345 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/cross2.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_git.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb

diff --git a/meta/recipes-graphics/mesa/mesa-dri/cross2.patch b/meta/recipes-graphics/mesa/mesa-dri/cross2.patch
deleted file mode 100644
index 264c153..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri/cross2.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2009-09-01 16:38:26.000000000 +0100
-+++ git/configure.ac	2009-09-01 16:38:47.000000000 +0100
-@@ -269,15 +269,6 @@
- GLAPI_ASM_SOURCES=""
- AC_MSG_CHECKING([whether to enable assembly])
- test "x$enable_asm" = xno && AC_MSG_RESULT([no])
--# disable if cross compiling on x86/x86_64 since we must run gen_matypes
--if test "x$enable_asm" = xyes && test "x$cross_compiling" = xyes; then
--    case "$host_cpu" in
--    i?86 | x86_64)
--        enable_asm=no
--        AC_MSG_RESULT([no, cross compiling])
--        ;;
--    esac
--fi
- # check for supported arches
- if test "x$enable_asm" = xyes; then
-     case "$host_cpu" in
-Index: git/src/mesa/x86/Makefile
-===================================================================
---- git.orig/src/mesa/x86/Makefile	2009-09-01 16:40:02.000000000 +0100
-+++ git/src/mesa/x86/Makefile	2009-09-01 16:40:13.000000000 +0100
-@@ -14,19 +14,6 @@
- 	-I../tnl
- 
- 
--default: gen_matypes matypes.h
--
--clean:
--	-rm -f matypes.h gen_matypes
--
--
--gen_matypes: gen_matypes.c
--	$(HOST_CC) $(ARCH_FLAGS) $(INCLUDE_DIRS) $(HOST_CFLAGS) gen_matypes.c -o gen_matypes
--
--# need some special rules here, unfortunately
--matypes.h: ../main/mtypes.h ../tnl/t_context.h gen_matypes
--	./gen_matypes > matypes.h
--
- common_x86_asm.o: matypes.h
- 3dnow_normal.o: matypes.h
- 3dnow_xform1.o: matypes.h
diff --git a/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch b/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
deleted file mode 100644
index d300e2f..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
-Index: Mesa-7.5/bin/mklib
-===================================================================
---- Mesa-7.5.orig/bin/mklib	2009-08-12 13:01:34.000000000 +0100
-+++ Mesa-7.5/bin/mklib	2009-08-12 13:04:19.000000000 +0100
-@@ -234,9 +234,9 @@
- 	if [ "x$LINK" = "x" ] ; then
- 	    # -linker was not specified so set default link command now
-             if [ $CPLUSPLUS = 1 ] ; then
--                LINK=g++
-+                LINK=$CXX
-             else
--                LINK=gcc
-+                LINK=$CC
-             fi
- 	fi
- 
diff --git a/meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h b/meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
deleted file mode 100644
index 98d2188..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
+++ /dev/null
@@ -1,162 +0,0 @@
-/*
- * This file is automatically generated from the Mesa internal type
- * definitions.  Do not edit directly.
- */
-
-#ifndef __ASM_TYPES_H__
-#define __ASM_TYPES_H__
-
-
-
-/* =============================================================
- * Offsets for GLcontext
- */
-
-#define CTX_DRIVER_CTX              	996
-
-#define CTX_LIGHT_ENABLED           	39404
-#define CTX_LIGHT_SHADE_MODEL       	39408
-#define CTX_LIGHT_COLOR_MAT_FACE    	39412
-#define CTX_LIGHT_COLOR_MAT_MODE    	39416
-#define CTX_LIGHT_COLOR_MAT_MASK    	39420
-#define CTX_LIGHT_COLOR_MAT_ENABLED 	39424
-#define CTX_LIGHT_ENABLED_LIST      	39432
-#define CTX_LIGHT_NEED_VERTS        	43793
-#define CTX_LIGHT_FLAGS             	43796
-#define CTX_LIGHT_BASE_COLOR        	43800
-
-
-/* =============================================================
- * Offsets for struct vertex_buffer
- */
-
-#define VB_SIZE                	0
-#define VB_COUNT               	4
-
-#define VB_ELTS                	8
-#define VB_OBJ_PTR             	12
-#define VB_EYE_PTR             	16
-#define VB_CLIP_PTR            	20
-#define VB_PROJ_CLIP_PTR       	24
-#define VB_CLIP_OR_MASK        	28
-#define VB_CLIP_MASK           	32
-#define VB_NORMAL_PTR          	36
-#define VB_EDGE_FLAG           	44
-#define VB_TEX0_COORD_PTR      	48
-#define VB_TEX1_COORD_PTR      	52
-#define VB_TEX2_COORD_PTR      	56
-#define VB_TEX3_COORD_PTR      	60
-#define VB_INDEX_PTR           	80
-#define VB_COLOR_PTR           	88
-#define VB_SECONDARY_COLOR_PTR 	96
-#define VB_FOG_COORD_PTR       	104
-#define VB_PRIMITIVE           	108
-
-
-/*
- * Flags for struct vertex_buffer
- */
-
-#define VERT_BIT_OBJ           	0x1
-#define VERT_BIT_NORM          	0x4
-#define VERT_BIT_RGBA          	0x8
-#define VERT_BIT_SPEC_RGB      	0x10
-#define VERT_BIT_FOG_COORD     	0x20
-#define VERT_BIT_TEX0          	0x100
-#define VERT_BIT_TEX1          	0x200
-#define VERT_BIT_TEX2          	0x400
-#define VERT_BIT_TEX3          	0x800
-
-
-/* =============================================================
- * Offsets for GLvector4f
- */
-
-#define V4F_DATA          	0
-#define V4F_START         	4
-#define V4F_COUNT         	8
-#define V4F_STRIDE        	12
-#define V4F_SIZE          	16
-#define V4F_FLAGS         	20
-
-/*
- * Flags for GLvector4f
- */
-
-#define VEC_MALLOC        	0x10
-#define VEC_NOT_WRITEABLE 	0x40
-#define VEC_BAD_STRIDE    	0x100
-
-#define VEC_SIZE_1        	0x1
-#define VEC_SIZE_2        	0x3
-#define VEC_SIZE_3        	0x7
-#define VEC_SIZE_4        	0xf
-
-
-/* =============================================================
- * Offsets for GLmatrix
- */
-
-#define MATRIX_DATA   	0
-#define MATRIX_INV    	4
-#define MATRIX_FLAGS  	8
-#define MATRIX_TYPE   	12
-
-
-/* =============================================================
- * Offsets for struct gl_light
- */
-
-#define LIGHT_NEXT              	0
-#define LIGHT_PREV              	4
-
-#define LIGHT_AMBIENT           	8
-#define LIGHT_DIFFUSE           	24
-#define LIGHT_SPECULAR          	40
-#define LIGHT_EYE_POSITION      	56
-#define LIGHT_SPOT_DIRECTION    	72
-#define LIGHT_SPOT_EXPONENT     	88
-#define LIGHT_SPOT_CUTOFF       	92
-#define LIGHT_COS_CUTOFF        	100
-#define LIGHT_CONST_ATTEN       	104
-#define LIGHT_LINEAR_ATTEN      	108
-#define LIGHT_QUADRATIC_ATTEN   	112
-#define LIGHT_ENABLED           	116
-
-#define LIGHT_FLAGS             	120
-
-#define LIGHT_POSITION          	124
-#define LIGHT_VP_INF_NORM       	140
-#define LIGHT_H_INF_NORM        	152
-#define LIGHT_NORM_DIRECTION    	164
-#define LIGHT_VP_INF_SPOT_ATTEN 	180
-
-#define LIGHT_SPOT_EXP_TABLE    	184
-#define LIGHT_MAT_AMBIENT       	4280
-#define LIGHT_MAT_DIFFUSE       	4304
-#define LIGHT_MAT_SPECULAR      	4328
-
-#define SIZEOF_GL_LIGHT         	4360
-
-/*
- * Flags for struct gl_light
- */
-
-#define LIGHT_SPOT              	0x1
-#define LIGHT_LOCAL_VIEWER      	0x2
-#define LIGHT_POSITIONAL        	0x4
-
-#define LIGHT_NEED_VERTICES     	0x6
-
-
-/* =============================================================
- * Offsets for struct gl_lightmodel
- */
-
-#define LIGHT_MODEL_AMBIENT       	0
-#define LIGHT_MODEL_LOCAL_VIEWER  	16
-#define LIGHT_MODEL_TWO_SIDE      	17
-#define LIGHT_MODEL_COLOR_CONTROL 	20
-
-
-#endif /* __ASM_TYPES_H__ */
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
deleted file mode 100644
index 68f89a2..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-include mesa-common.inc
-
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
-
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat \
-            libxml2-native"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
-
-PR = "r2"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://crossfix.patch \
-           file://uclibc.patch \
-          "
-
-SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
-SRC_URI[sha256sum] = "8ced2678ce11cf30804694a92ea3ca6b82f158ae8995bdc626c7e85aac71c7c1"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-LEAD_SONAME = "libGL.so.1"
-
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
deleted file mode 100644
index 9e32d0a..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-include mesa-common.inc
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://cross2.patch \
-           file://matypes.h"
-#           file://mesa-DRI2Swapbuffer.patch "
-S = "${WORKDIR}/git"
-
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
-
-SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
-PV = "7.7+git${SRCPV}"
-PR = "r2"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-PACKAGES =+ "${PN}-xprogs"
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-LEAD_SONAME = "libGL.so.1"
-
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
-do_configure_prepend () {
-    cp ${WORKDIR}/matypes.h ${S}/src/mesa/x86
-    touch ${S}/src/mesa/x86/matypes.h
-}
-
-do_compile () {
-	oe_runmake clean
-	oe_runmake -C src/glsl CC='${BUILD_CC}' CFLAGS=""
-	mv ${S}/src/glsl/apps/compile ${S}/host_compile
-	oe_runmake clean
-	oe_runmake GLSL_CL="${S}/host_compile"
-}
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
deleted file mode 100644
index 511103d..0000000
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-include mesa-common.inc
-
-FILESPATH =. "${FILE_DIRNAME}/mesa-dri:"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
-           file://uclibc.patch \
-           "
-
-SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
-SRC_URI[sha256sum] = "8ced2678ce11cf30804694a92ea3ca6b82f158ae8995bdc626c7e85aac71c7c1"
-
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
-
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
-
-PE = "1"
-PR = "r1"
-
-EXTRA_OECONF += "--with-driver=xlib"
-- 
1.7.7



