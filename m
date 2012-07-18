Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrQYa-0006Gh-EL
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:28:32 +0200
Received: by bkcik5 with SMTP id ik5so961249bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vNzx6lI14ba9R51JDNdOW1y+jnaS0Xg4a9rdh41AoTY=;
	b=uVJjL8YQEqwdoA0eZ/5pibOJh5GSlbgyLcNtlWJHa2WLeWTb8ELO4LUr2MSVc4LCi0
	jljMbvqQ4klxnPBe/VOnPiN5Qyt9iAHpzjkvuZnsk4vhG5z1Cgp4VZrbFOsN7UbUPsF+
	Q11RcG9FEhQqjSVpWHukX2VQsloBYjEmLvC7XgyRLufZQXsEVEYOFmxJ5y1btkkBWwQQ
	+0jOJI0mERAl7Mp2jOpwb2vQHA1A/im3eNGFfxGGpNl6sRUx9dFAjJwCJnxBTgNfoB0r
	7My2nMHlcsl9+horpcrGlwm+LHrdJEeV8KazYZ6iMY9Ce+zOs8isdK9u0rU9/JQcBkSN
	pKhg==
Received: by 10.205.118.14 with SMTP id fo14mr945570bkc.130.1342603032049;
	Wed, 18 Jul 2012 02:17:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm6661024bkv.14.2012.07.18.02.17.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 02:17:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 11:17:19 +0200
Message-Id: <1342603039-6608-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120718010511.GH22569@jama.jama.net>
References: <20120718010511.GH22569@jama.jama.net>
Subject: [PATCH] glib-2.0: revert one commit in target recipe
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
X-List-Received-Date: Wed, 18 Jul 2012 09:28:32 -0000

* it was causing staged python to be used as shebang

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-the-same-Python-as-we-found-in-configure.patch |   39 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch
new file mode 100644
index 0000000..e472680
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch
@@ -0,0 +1,39 @@
+From cfafe51d344a9889e9ba041572fe20b582187a86 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 18 Jul 2012 09:49:07 +0200
+Subject: [PATCH] Revert "Use the same Python as we found in configure"
+
+Upstream-Status: Pending
+
+This reverts commit c147bd5b1a0462fc9b107d1718826c6cad2a8ba5.
+---
+ gio/gdbus-2.0/codegen/Makefile.am      |    2 +-
+ gio/gdbus-2.0/codegen/gdbus-codegen.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gdbus-2.0/codegen/Makefile.am b/gio/gdbus-2.0/codegen/Makefile.am
+index 9974005..cd9983e 100644
+--- a/gio/gdbus-2.0/codegen/Makefile.am
++++ b/gio/gdbus-2.0/codegen/Makefile.am
+@@ -23,7 +23,7 @@ CLEANFILES += gdbus-codegen
+ EXTRA_DIST += gdbus-codegen.in
+ 
+ gdbus-codegen: gdbus-codegen.in Makefile $(codegen_PYTHON)
+-	$(AM_V_GEN) sed -e 's,@libdir\@,$(libdir),' -e 's,@PYTHON\@,$(PYTHON),' $< > $@.tmp && mv $@.tmp $@
++	$(AM_V_GEN) sed -e 's,@libdir\@,$(libdir),' $< > $@.tmp && mv $@.tmp $@
+ 	@chmod a+x $@
+ 
+ clean-local:
+diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+index 217c755..ae900bb 100644
+--- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
++++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
+@@ -1,4 +1,4 @@
+-#!@PYTHON@
++#!/usr/bin/env python
+ 
+ # GDBus - GLib D-Bus Library
+ #
+-- 
+1.7.8.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 85352ed..58eaa23 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -19,7 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
 SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
 
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
+SRC_URI_append_class-target = " file://0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch"
 BBCLASSEXTEND = "native nativesdk"
 
 PERLPATH = "${bindir}/env perl"
-- 
1.7.8.6



