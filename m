Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48784795D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:57 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id u1-v6so8488398eds.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ynt9G5k3olqpGGIBNj/hJgcaWA/WQi7Sbh/E7a+zHmE=;
	b=VD6irCrMoaC3yY+X8cRcCAc1JW9bnr3Ee/Jb1ehZHsW0Qo1ciOLSlXBmO8FIMVi3oR
	BnsHkjaslpuq0QFEkdJwtE4JGl7dmRsMTLI9N23E7wUJcaZRTpIFMsXhWHYP46W0h6mz
	f9Gd2aNB7DjISb7A6K4dPDSjM1piFNeV2EHWEl5w0rJb69eAYq7hAA3YP7cnNJUp3EIV
	OEA9bYHFU7kiveUvyJImYp7l/kbH/hV8Ymc34/tOTgy+ETyFYPZPN9vS23kWVqrNowkE
	R6xssbFdSwrKAtFsHZR2LOFTAo8/ZsmgVS9kM5T9+dN6O3HCZSTbUsIR0VNl5YLvr/Ym
	YDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ynt9G5k3olqpGGIBNj/hJgcaWA/WQi7Sbh/E7a+zHmE=;
	b=nSwqXz02jq2twXUm2WY26uT70tyhP7k8vn6qVISde27FOA8OEpk7Tj0on47cM2pnZw
	10Hf3TfiOlZytBQRODx+5k5PGQ7PvJjxlqX5Wq+LvbCkS99MGzIZF99rQc6ZK5mx2tJi
	e445ptAro66N0KbrX5aGibMxSKH7GCSg6qEbZdCzDYclb99p8ilQyn3yqdDOYaJvwHiU
	i2izNjG9e0EYQXiKeamTbvGYKSCku+rDRT9oK56yjyNt1NQmHhbIndYIJBopuCGQLcIk
	aHlgPgcrej0DI/jbGq6v5EyeobXTWmsDIr8ASMpLh76FpNiB6pxEdzs3+tHaSWlmc6iP
	fEQQ==
X-Gm-Message-State: APzg51CRXEXkgQQYOZXGnm8VcPz+2w9ZV4WWZlmbqwEEQZxG13ifXRPc
	VbrB1emO4ZouVxaLuobYe2GTGb7BmcM=
X-Google-Smtp-Source: ANB0VdZIGPG7QJIMXJAnFEHUvVMG1UgYVpMhofyiBbJ4NhnQM+AX7hFPOgqkdTsiO49hxBxL3AVFOw==
X-Received: by 2002:aa7:d6da:: with SMTP id
	x26-v6mr2893430edr.209.1536229797795; 
	Thu, 06 Sep 2018 03:29:57 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:28 +0200
Message-Id: <1536229770-29600-19-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 19/21] gtk-doc: update to 1.29
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:57 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...hardocode-paths-to-perl-python-in-scripts.patch | 25 +++++------
 meta/recipes-gnome/gtk-doc/files/no-clobber.patch  | 23 +++++++---
 .../gtk-doc/files/pkg-config-native.patch          |  6 +--
 meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb         | 50 ----------------------
 meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb         | 50 ++++++++++++++++++++++
 5 files changed, 82 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
 create mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index 2fe3ab9..19e05f1 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,7 +1,7 @@
-From 928102874bc2339a1d57c6b178877e0c6002cb3a Mon Sep 17 00:00:00 2001
+From 80e6aff72affa6d92f5abd7ff6353dfc4a7bff38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
-Subject: [PATCH 1/3] Do not hardocode paths to perl/python in scripts.
+Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
 
 Doing so when the interpreters are somewhere deep in a sysroot directory
 can reach the shebang line limit, and resulting scripts wouldn't work
@@ -35,7 +35,7 @@ index 8c8e917..f6a25f6 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-depscan.in b/gtkdoc-depscan.in
-index 9bfaf30..aadc952 100644
+index 9bfaf30..aadc952 100755
 --- a/gtkdoc-depscan.in
 +++ b/gtkdoc-depscan.in
 @@ -1,4 +1,4 @@
@@ -45,7 +45,7 @@ index 9bfaf30..aadc952 100644
  from __future__ import print_function
  
 diff --git a/gtkdoc-fixxref.in b/gtkdoc-fixxref.in
-index 0ea02d4..bdd443a 100755
+index 44f6bd1..26fbd93 100755
 --- a/gtkdoc-fixxref.in
 +++ b/gtkdoc-fixxref.in
 @@ -1,4 +1,4 @@
@@ -65,7 +65,7 @@ index 42d5731..3a56d56 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkhtml.in b/gtkdoc-mkhtml.in
-index 0d0a15d..914ff55 100644
+index 0d0a15d..914ff55 100755
 --- a/gtkdoc-mkhtml.in
 +++ b/gtkdoc-mkhtml.in
 @@ -1,4 +1,4 @@
@@ -75,7 +75,7 @@ index 0d0a15d..914ff55 100644
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkman.in b/gtkdoc-mkman.in
-index c5445cd..65db71a 100644
+index c5445cd..65db71a 100755
 --- a/gtkdoc-mkman.in
 +++ b/gtkdoc-mkman.in
 @@ -1,4 +1,4 @@
@@ -115,7 +115,7 @@ index 954c811..f461504 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-scangobj.in b/gtkdoc-scangobj.in
-index 4cbe130..52c2c24 100644
+index 4cbe130..52c2c24 100755
 --- a/gtkdoc-scangobj.in
 +++ b/gtkdoc-scangobj.in
 @@ -1,4 +1,4 @@
@@ -125,18 +125,15 @@ index 4cbe130..52c2c24 100644
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/tests/tools.sh.in b/tests/tools.sh.in
-index 4d301d0..565fc1e 100644
+index 343844a..9dc6692 100644
 --- a/tests/tools.sh.in
 +++ b/tests/tools.sh.in
-@@ -31,7 +31,7 @@ done
- # TODO: test python 2 and 3 (python3 -mcompileall gtkdoc/*.py)
- for file in gtkdoc-check gtkdoc-depscan gtkdoc-fixxref gtkdoc-mkdb gtkdoc-mkhtml gtkdoc-mkman gtkdoc-mkpdf gtkdoc-rebase gtkdoc-scangobj; do
+@@ -30,7 +30,7 @@ done
+ # TODO: also test the module files
+ for file in gtkdoc-check gtkdoc-depscan gtkdoc-fixxref gtkdoc-mkdb gtkdoc-mkhtml gtkdoc-mkhtml2 gtkdoc-mkman gtkdoc-mkpdf gtkdoc-rebase gtkdoc-scangobj; do
      fullfile=`which $file`
 -    @PYTHON@ -m py_compile $fullfile
 +    python3 -m py_compile $fullfile
      if test $? != 0 ; then failed=`expr $failed + 1`; fi
      tested=`expr $tested + 1`
  done
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index 0fa22b2..d169547 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,3 +1,8 @@
+From 8bc4c1f169f89bc5531da5b7e892b8f20e0f9a18 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 21 Mar 2018 14:47:29 +0000
+Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
+
 In out-of-tree builds gtk-doc's setup-build target copies all the content from $srcdir to $builddir.
 
 However, if some of this content is regenerated at configure time this can happen:
@@ -16,12 +21,20 @@ files which don't already exist.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=794571]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/gtk-doc.make b/gtk-doc.make
-index f87eaab..246f3c0 100644
---- a/gtk-doc.make
-+++ b/gtk-doc.make
-@@ -113,3 +113,3 @@ setup-build.stamp:
+---
+ buildsystems/autotools/gtk-doc.make | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildsystems/autotools/gtk-doc.make b/buildsystems/autotools/gtk-doc.make
+index 7d9a27f..8cb336d 100644
+--- a/buildsystems/autotools/gtk-doc.make
++++ b/buildsystems/autotools/gtk-doc.make
+@@ -111,7 +111,7 @@ setup-build.stamp:
+ 	      destdir=`dirname $(abs_builddir)/$$file`; \
+ 	      test -d "$$destdir" || mkdir -p "$$destdir"; \
  	      test -f $(abs_srcdir)/$$file && \
 -	        cp -pf $(abs_srcdir)/$$file $(abs_builddir)/$$file || true; \
 +	        cp -pn $(abs_srcdir)/$$file $(abs_builddir)/$$file || true; \
  	    done; \
+ 	  fi; \
+ 	fi
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index b77b5a5..9b128e1 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From ae29d175016accd8a05ab1e52fc6435ac6291cfc Mon Sep 17 00:00:00 2001
+From 04af15322f677db42ecc2acc465334a04de9a871 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
@@ -12,8 +12,8 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/gtk-doc.m4 b/gtk-doc.m4
 index 2d12f01..e5afc3f 100644
---- a/gtk-doc.m4
-+++ b/gtk-doc.m4
+--- a/buildsystems/autotools/gtk-doc.m4
++++ b/buildsystems/autotools/gtk-doc.m4
 @@ -25,7 +25,7 @@
  # Macro appear in them. The GNU General Public License (GPL) does govern
  # all other use of the material that constitutes the Autoconf Macro.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
deleted file mode 100644
index a2ec6ac..0000000
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.28.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Documentation generator for glib-based software"
-DESCRIPTION = "Gtk-doc is a set of scripts that extract specially formatted comments \
-               from glib-based software and produce a set of html documentation files from them"
-HOMEPAGE = "http://www.gtk.org/gtk-doc/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit gnomebase
-
-# Configure the scripts correctly (and build their dependencies) only if they are actually
-# going to be used; otheriwse we need only the m4/makefile includes from the gtk-doc tarball.
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", "working-scripts", "", d)}"
-
-# This will cause target gtk-doc to hardcode paths of native dependencies
-# into its scripts. This means that target gtk-doc package is broken;
-# hopefully no one minds because its scripts are not used for anything during build
-# and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
-
-SRC_URI[archive.md5sum] = "48550c33f9b9b530f9e5f397979b613a"
-SRC_URI[archive.sha256sum] = "911e29e302252c96128965ee1f4067d5431a88e00ad1023a8bc1d6b922af5715"
-SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
-           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
-           file://conditionaltests.patch \
-           file://no-clobber.patch \
-           "
-SRC_URI_append_class-native = " file://pkg-config-native.patch"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# Do not check for XML catalogs when building because that
-# information is not used for anything during build. Recipe
-# dependencies make sure we have all the right bits.
-do_configure_prepend() {
-        sed -i -e 's,^JH_CHECK_XML_CATALOG.*,,' ${S}/configure.ac
-}
-
-FILES_${PN} += "${datadir}/sgml"
-FILES_${PN}-dev += "${libdir}/cmake"
-FILES_${PN}-doc = ""
-
-SYSROOT_PREPROCESS_FUNCS_append_class-native = " gtkdoc_makefiles_sysroot_preprocess"
-gtkdoc_makefiles_sysroot_preprocess() {
-        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
-        # instead of libtool wrapper or running them directly
-        sed -i \
-           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
-           ${SYSROOT_DESTDIR}${datadir}/gtk-doc/data/gtk-doc*make
-}
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
new file mode 100644
index 0000000..2c4ee17
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Documentation generator for glib-based software"
+DESCRIPTION = "Gtk-doc is a set of scripts that extract specially formatted comments \
+               from glib-based software and produce a set of html documentation files from them"
+HOMEPAGE = "http://www.gtk.org/gtk-doc/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit gnomebase
+
+# Configure the scripts correctly (and build their dependencies) only if they are actually
+# going to be used; otheriwse we need only the m4/makefile includes from the gtk-doc tarball.
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", "working-scripts", "", d)}"
+
+# This will cause target gtk-doc to hardcode paths of native dependencies
+# into its scripts. This means that target gtk-doc package is broken;
+# hopefully no one minds because its scripts are not used for anything during build
+# and shouldn't be used on targets.
+PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
+
+SRC_URI[archive.md5sum] = "df26a38c209b3d7358f26268fcbdb9e3"
+SRC_URI[archive.sha256sum] = "14578e002496567276d310a62c9ffd6c56ee8806ce5079ffb0b81c4111f586b1"
+SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
+           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
+           file://conditionaltests.patch \
+           file://no-clobber.patch \
+           "
+SRC_URI_append_class-native = " file://pkg-config-native.patch"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# Do not check for XML catalogs when building because that
+# information is not used for anything during build. Recipe
+# dependencies make sure we have all the right bits.
+do_configure_prepend() {
+        sed -i -e 's,^JH_CHECK_XML_CATALOG.*,,' ${S}/configure.ac
+}
+
+FILES_${PN} += "${datadir}/sgml"
+FILES_${PN}-dev += "${libdir}/cmake"
+FILES_${PN}-doc = ""
+
+SYSROOT_PREPROCESS_FUNCS_append_class-native = " gtkdoc_makefiles_sysroot_preprocess"
+gtkdoc_makefiles_sysroot_preprocess() {
+        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
+        # instead of libtool wrapper or running them directly
+        sed -i \
+           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
+           ${SYSROOT_DESTDIR}${datadir}/gtk-doc/data/gtk-doc*make
+}
-- 
2.7.4


