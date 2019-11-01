Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C69707F836
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 23:09:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c17so3458175wmk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FdVIQgWlRLlmV+Pq7BVkAhmOrb/eEDfz5girYVfD4pE=;
	b=QBQ2xzR504KFNWwFwuvs6ProxthE6d6hNb5XKsL+cRpSLuY49unG6pF2XmJL+3BggX
	IYkOS2H4Hzr1ZBA1p0cYTVQDs2yqMC3XDWlZxzlM7EVKTF8N+UW5b5WUp7ad3Au7Rd2E
	AnhKb+T/SLQTvLYmlCux9iVTINFEJMdeGcL5m/sym53TtAl52YArVIvlr63EkymUvZWX
	POtWqrfa41X85Fe0koR6ljxdnffSHTSR4HoPMopaO0KXns7FvybrL5CtyKT2A0vTG2s2
	PnD9lAcPrCqMPoGa4ai2oUag9GeBcGu/XDfqVCiqzpqIlGODIWUrbzf6wUIkJOASp58/
	u7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FdVIQgWlRLlmV+Pq7BVkAhmOrb/eEDfz5girYVfD4pE=;
	b=iScBf1ObjVePuXynzNp9hljYnfS4WvxYfbNYDUa/PyKqf9Ym9sMQTD+RGg1mfUVFYS
	/qLDfQSewYMw2nSA+rnoEYzzQwgF8IMy7XQzN8YfbBR5UtqJU4+bEAA0uMMCBiq8lv4R
	NAzqWdyfwMzSyvAb+DGMrF0lNXZF6UtPuW8TB0zEQTr+MmKajNPkyEX4mAE0Mm9mdaFu
	8hDFEWQ8J/Rk61h3aukEuiz+ZvnV9lKKiVx0wsgvC6CuVvxSRmxQYuk++JAArF/C29Kh
	VhIVtjoIuf7FEizHHkpkI4y2gJXKueyw8BqeT+Km+BZT4VYujdZqP0eo9TEU1v9Hg+rP
	RroA==
X-Gm-Message-State: APjAAAU6ZLFVFje4h+u6aSFAPVSKfeZ3+IZdWF7Hf+hp7TzKHs3UUX9I
	C7JnriSz3sTFv3MgSs4wRqLzhnck
X-Google-Smtp-Source: APXvYqwIzpZE/jhYZSP5kRRrWbyGGmd16CmQWhFsTw7Rd2t99uxzvyysCY5tk5L2vi9LXYF2dRzJZA==
X-Received: by 2002:a1c:e40b:: with SMTP id b11mr12214709wmh.152.1572649749904;
	Fri, 01 Nov 2019 16:09:09 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E4B5123CFE8DCB8A4D5FC.dip0.t-ipconnect.de.
	[2003:f0:7f0e:4b51:23cf:e8dc:b8a4:d5fc])
	by smtp.gmail.com with ESMTPSA id x8sm2474247wrm.7.2019.11.01.16.09.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 16:09:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Nov 2019 00:08:59 +0100
Message-Id: <20191101230859.17245-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] vte: upgrade 0.56.3 -> 0.58.2
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
X-List-Received-Date: Fri, 01 Nov 2019 23:09:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* they moved to meson build
* all autotools specific patches must go
* although not inheriting gettext dependency on intltool-native can go
* tested with all variants of PACKAGECONFIG
* need it for gnome-terminal 3.34

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../vte/vte/0001-Add-m4-vapigen.m4.patch      | 119 ------------------
 ...t-enable-stack-protection-by-default.patch |  29 -----
 ...XITCODE-macro-for-non-glibc-systems.patch} |   0
 .../vte/{vte_0.56.3.bb => vte_0.58.2.bb}      |  25 ++--
 4 files changed, 12 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch
 delete mode 100644 meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
 rename meta/recipes-support/vte/vte/{0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch => 0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch} (100%)
 rename meta/recipes-support/vte/{vte_0.56.3.bb => vte_0.58.2.bb} (60%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch b/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch
deleted file mode 100644
index 1c5630ed9c..0000000000
--- a/meta/recipes-support/vte/vte/0001-Add-m4-vapigen.m4.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 08ca1c48b25c332b75bba2a6b5d757da006e955b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Oct 2016 16:27:57 +0300
-Subject: [PATCH] Add m4/vapigen.m4
-
-Building without vala will fail if we don't have a vapigen.m4.
-
-Upstream-Status: Pending
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- m4/vapigen.m4 | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 96 insertions(+)
- create mode 100644 m4/vapigen.m4
-
-diff --git a/m4/vapigen.m4 b/m4/vapigen.m4
-new file mode 100644
-index 0000000..f2df12f
---- /dev/null
-+++ b/m4/vapigen.m4
-@@ -0,0 +1,96 @@
-+dnl vapigen.m4
-+dnl
-+dnl Copyright 2012 Evan Nemerson
-+dnl
-+dnl This library is free software; you can redistribute it and/or
-+dnl modify it under the terms of the GNU Lesser General Public
-+dnl License as published by the Free Software Foundation; either
-+dnl version 2.1 of the License, or (at your option) any later version.
-+dnl
-+dnl This library is distributed in the hope that it will be useful,
-+dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
-+dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+dnl Lesser General Public License for more details.
-+dnl
-+dnl You should have received a copy of the GNU Lesser General Public
-+dnl License along with this library; if not, write to the Free Software
-+dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
-+
-+# VAPIGEN_CHECK([VERSION], [API_VERSION], [FOUND-INTROSPECTION], [DEFAULT])
-+# --------------------------------------
-+# Check vapigen existence and version
-+#
-+# See http://live.gnome.org/Vala/UpstreamGuide for detailed documentation
-+AC_DEFUN([VAPIGEN_CHECK],
-+[
-+  AC_BEFORE([GOBJECT_INTROSPECTION_CHECK],[$0])
-+  AC_BEFORE([GOBJECT_INTROSPECTION_REQUIRE],[$0])
-+
-+  AC_ARG_ENABLE([vala],
-+    [AS_HELP_STRING([--enable-vala[=@<:@no/auto/yes@:>@]],[build Vala bindings @<:@default=]ifelse($4,,auto,$4)[@:>@])],,[
-+      AS_IF([test "x$4" = "x"], [
-+          enable_vala=auto
-+        ], [
-+          enable_vala=$4
-+        ])
-+    ])
-+
-+  AS_CASE([$enable_vala], [no], [enable_vala=no],
-+      [yes], [
-+        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
-+            AC_MSG_ERROR([Vala bindings require GObject Introspection])
-+          ])
-+      ], [auto], [
-+        AS_IF([test "x$3" != "xyes" -a "x$found_introspection" != "xyes"], [
-+            enable_vala=no
-+          ])
-+      ], [
-+        AC_MSG_ERROR([Invalid argument passed to --enable-vala, should be one of @<:@no/auto/yes@:>@])
-+      ])
-+
-+  AS_IF([test "x$2" = "x"], [
-+      vapigen_pkg_name=vapigen
-+    ], [
-+      vapigen_pkg_name=vapigen-$2
-+    ])
-+  AS_IF([test "x$1" = "x"], [
-+      vapigen_pkg="$vapigen_pkg_name"
-+    ], [
-+      vapigen_pkg="$vapigen_pkg_name >= $1"
-+    ])
-+
-+  PKG_PROG_PKG_CONFIG
-+
-+  PKG_CHECK_EXISTS([$vapigen_pkg], [
-+      AS_IF([test "$enable_vala" = "auto"], [
-+          enable_vala=yes
-+        ])
-+    ], [
-+      AS_CASE([$enable_vala], [yes], [
-+          AC_MSG_ERROR([$vapigen_pkg not found])
-+        ], [auto], [
-+          enable_vala=no
-+        ])
-+    ])
-+
-+  AC_MSG_CHECKING([for vala])
-+
-+  AS_CASE([$enable_vala],
-+    [yes], [
-+      VAPIGEN=`$PKG_CONFIG --variable=vapigen vapigen`
-+      VAPIGEN_MAKEFILE=`$PKG_CONFIG --variable=datadir vapigen`/vala/Makefile.vapigen
-+      AS_IF([test "x$2" = "x"], [
-+          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir vapigen`
-+        ], [
-+          VAPIGEN_VAPIDIR=`$PKG_CONFIG --variable=vapidir_versioned vapigen`
-+        ])
-+    ])
-+
-+  AC_MSG_RESULT([$enable_vala])
-+
-+  AC_SUBST([VAPIGEN])
-+  AC_SUBST([VAPIGEN_VAPIDIR])
-+  AC_SUBST([VAPIGEN_MAKEFILE])
-+
-+  AM_CONDITIONAL(ENABLE_VAPIGEN, test "x$enable_vala" = "xyes")
-+])
--- 
-2.1.4
-
diff --git a/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
deleted file mode 100644
index fcfc559758..0000000000
--- a/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b0a579d83e355545b64742c997fe8b1d58bf4207 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 13 Jun 2016 11:05:00 +0300
-Subject: [PATCH] Don't enable stack-protection by default
-
-These are set by security_flags.inc.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 068d072..d580f84 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -138,8 +138,6 @@ m4_define([compiler_flags_common],[ dnl
-   -fno-common dnl
-   -fdiagnostics-show-option dnl
-   -fno-strict-aliasing dnl
--  -fstack-protector dnl
--  -fstack-protector-strong dnl
-   -fno-semantic-interposition dnl
-   -Wno-deprecated-declarations dnl
- ])
--- 
-2.1.4
-
diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
similarity index 100%
rename from meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
rename to meta/recipes-support/vte/vte/0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
diff --git a/meta/recipes-support/vte/vte_0.56.3.bb b/meta/recipes-support/vte/vte_0.58.2.bb
similarity index 60%
rename from meta/recipes-support/vte/vte_0.56.3.bb
rename to meta/recipes-support/vte/vte_0.58.2.bb
index 0deee175df..9e27f6978d 100644
--- a/meta/recipes-support/vte/vte_0.56.3.bb
+++ b/meta/recipes-support/vte/vte_0.58.2.bb
@@ -9,18 +9,19 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24 \
 "
 
-DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native"
+
+GNOMEBASEBUILDCLASS = "meson"
+GIR_MESON_OPTION = 'gir'
 
 inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
-           file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
-           file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+SRC_URI += "file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
+            file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
-SRC_URI[archive.md5sum] = "adf341807861a5dad9f98e5c701c0769"
-SRC_URI[archive.sha256sum] = "17a1d4bc8848f1d2acfa4c20aaa24b9bac49f057b8909c56d3dafec2e2332648"
+SRC_URI[archive.md5sum] = "dadbf2c1d9864d3ea185738f97ab63af"
+SRC_URI[archive.sha256sum] = "33c966d2b1f2c3b0f9416dbca883fd746159b5bd040350e3b78f8104b2a42bc0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -41,15 +42,13 @@ do_compile_prepend() {
 FILES_${PN}-dev += "${datadir}/vala/vapi/*"
 
 PACKAGECONFIG ??= "gnutls"
-PACKAGECONFIG[vala] = "--enable-vala,--disable-vala,vala-native vala"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
+PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
+# vala requires gir
+PACKAGECONFIG_remove_class-native = "vala"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-# libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
-# Use libtool-cross (which has a hack to prevent that) instead.
-EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-
 PACKAGES =+ "libvte ${PN}-prompt"
 FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES_${PN}-prompt = "${sysconfdir}/profile.d"
-- 
2.21.0


