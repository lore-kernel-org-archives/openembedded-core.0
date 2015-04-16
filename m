Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A08A073D51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:41 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so71315045pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wJbJP7+mxaqiJfQDml0csBs2c9wL2GxodHlDZm5IMaM=;
	b=tY2AnOG4c/kpIgoYefHA1KmWCbP+qzGO7qm2aN5p1neKc0ytrxXjjyzvRZsOg49PqG
	jXo5dKGjFk0TtkPXy7u0ytwmxDL8nbFFXXjDW9u08PswpvWo92ReA0kbS9dSxX0dNEWs
	x8ltyrTU0TYEYHhV3/7gtXaTaSHxPdvufgaCEyC/cTLYPYmF80GdByCsRDY35vrSvNff
	5bmeSBS5S7SoCyuq99fdmHNHYqXfjjFYNls/9j5hiER6s1XrMZK0wI9CB/Hn1Qy4zITz
	aurkn5K/1NMLOwxYpBgv3b3ugL3nYO8SHDmJ2fXIAR4iDgrnnw0VE2DNONDFgcQNHDXi
	vr/A==
X-Received: by 10.66.224.109 with SMTP id rb13mr50750768pac.133.1429149642712; 
	Wed, 15 Apr 2015 19:00:42 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:25 -0700
Message-Id: <3e5b8b4a56f5b5e24781f0656a057311c8d25bf8.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] recipes: Fix charset.alias for musl
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:43 -0000

This is same gnulib fix replicated across needed recipes

Change-Id: I756713407111a726eae98e26c9c1ff64981371c0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/bison/bison_2.7.1.bb         |  1 +
 meta/recipes-devtools/m4/m4-1.4.17.inc             |  3 ++
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.5.bb         |  4 ++-
 meta/recipes-extended/augeas/augeas.inc            |  1 +
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |  3 +-
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/diffutils/diffutils_3.3.bb   |  1 +
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 .../recipes-extended/findutils/findutils_4.5.14.bb |  2 ++
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/grep/grep_2.21.bb            |  4 ++-
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb        |  8 ++++--
 ...need_charset_alias-when-building-for-musl.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/sed/sed_4.2.2.bb             |  1 +
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |  3 +-
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.16.3.bb          |  1 +
 ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.4.bb             |  1 +
 28 files changed, 465 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
 create mode 100644 meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..3706e6b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: grub-2.00/grub-core/gnulib/Makefile.am
+===================================================================
+--- grub-2.00.orig/grub-core/gnulib/Makefile.am
++++ grub-2.00/grub-core/gnulib/Makefile.am
+@@ -410,7 +410,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4d9e3c7..08c0b6b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-no-unused-result.patch \
            file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
            file://grub-efi-fix-with-glibc-2.20.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             "
 
 DEPENDS = "flex-native bison-native xz"
diff --git a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/bison/bison_2.7.1.bb b/meta/recipes-devtools/bison/bison_2.7.1.bb
index 4a3ad15..025fc97 100644
--- a/meta/recipes-devtools/bison/bison_2.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.1.bb
@@ -19,6 +19,7 @@ EXTRA_OECONF += "M4=m4"
 
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
+	   file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
 SRC_URI[md5sum] = "7be02eb973eccf388f1ae750fc09eed0"
diff --git a/meta/recipes-devtools/m4/m4-1.4.17.inc b/meta/recipes-devtools/m4/m4-1.4.17.inc
index 3133e99..8ea4e04 100644
--- a/meta/recipes-devtools/m4/m4-1.4.17.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.17.inc
@@ -11,5 +11,8 @@ SRC_URI += "file://ac_config_links.patch \
             file://remove-gets.patch \
            "
 
+SRC_URI_append_class-target = "\
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+	   "
 SRC_URI[md5sum] = "a5e9954b1dae036762f7b13673a2cf76"
 SRC_URI[sha256sum] = "3ce725133ee552b8b4baca7837fb772940b25e81b2a9dc92537aeaf733538c9e"
diff --git a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.5.bb b/meta/recipes-devtools/patch/patch_2.7.5.bb
index 20ed6c8..f3fcf5e 100644
--- a/meta/recipes-devtools/patch/patch_2.7.5.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.5.bb
@@ -1,6 +1,8 @@
 require patch.inc
 LICENSE = "GPLv3"
 
+SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+
 SRC_URI[md5sum] = "ed4d5674ef4543b4eb463db168886dc7"
 SRC_URI[sha256sum] = "7436f5a19f93c3ca83153ce9c5cbe4847e97c5d956e57a220121e741f6e7968f"
 
@@ -9,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 acpaths = "-I ${S}/m4 "
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)}"
-PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr," 
+PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 004c998..23d12ca 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
            file://add-missing-argz-conditional.patch \
            file://sepbuildfix.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
 DEPENDS = "readline libxml2"
diff --git a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..b85a6a6
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: augeas-1.2.0/gnulib/lib/Makefile.am
+===================================================================
+--- augeas-1.2.0.orig/gnulib/lib/Makefile.am
++++ augeas-1.2.0/gnulib/lib/Makefile.am
+@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..4979415
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: cpio-2.11/gnu/Makefile.am
+===================================================================
+--- cpio-2.11.orig/gnu/Makefile.am
++++ cpio-2.11/gnu/Makefile.am
+@@ -734,7 +734,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 053888f..c5d92bf 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -8,7 +8,8 @@ PR = "r5"
 SRC_URI += "file://remove-gets.patch \
         file://fix-memory-overrun.patch \
         file://cpio-CVE-2015-1197.patch \
-           "
+        file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+        "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
 SRC_URI[sha256sum] = "601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978"
diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/diffutils/diffutils_3.3.bb b/meta/recipes-extended/diffutils/diffutils_3.3.bb
index b708962..5008690 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.3.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.3.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 require diffutils.inc
 
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://run-ptest \
 "
 
diff --git a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..85d243b
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: findutils-4.5.14/gl/lib/Makefile.am
+===================================================================
+--- findutils-4.5.14.orig/gl/lib/Makefile.am
++++ findutils-4.5.14/gl/lib/Makefile.am
+@@ -1220,7 +1220,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/findutils/findutils_4.5.14.bb b/meta/recipes-extended/findutils/findutils_4.5.14.bb
index 9253637..a58a82f 100644
--- a/meta/recipes-extended/findutils/findutils_4.5.14.bb
+++ b/meta/recipes-extended/findutils/findutils_4.5.14.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
  
 DEPENDS = "bison-native"
 
+SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+
 SRC_URI[md5sum] = "a8a8176282fd28e8d1234c84d847fa66"
 SRC_URI[sha256sum] = "0de3cf625a5c9f154eee3171e072515ffdde405244dd00502af617ac57b73ae2"
 
diff --git a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/grep/grep_2.21.bb b/meta/recipes-extended/grep/grep_2.21.bb
index 2c378d8..1c5f778 100644
--- a/meta/recipes-extended/grep/grep_2.21.bb
+++ b/meta/recipes-extended/grep/grep_2.21.bb
@@ -5,7 +5,9 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
-SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+	   "
 
 SRC_URI[md5sum] = "43c48064d6409862b8a850db83c8038a"
 SRC_URI[sha256sum] = "5244a11c00dee8e7e5e714b9aaa053ac6cbfa27e104abee20d3c778e4bb0e5de"
diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..0aaf701
--- /dev/null
+++ b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: groff-1.22.3/src/libs/gnulib/lib/Makefile.am
+===================================================================
+--- groff-1.22.3.orig/src/libs/gnulib/lib/Makefile.am
++++ groff-1.22.3/src/libs/gnulib/lib/Makefile.am
+@@ -113,7 +113,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index 7955a5c..e8cf524 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
+	file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
 
 SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
@@ -16,9 +17,7 @@ SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
-RDEPENDS_${PN} += "sed"
-
-RDEPENDS_${PN} = "perl"
+RDEPENDS_${PN} += "perl sed"
 
 inherit autotools texinfo
 
@@ -54,6 +53,9 @@ do_install_append() {
 			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
 		fi
 	done
+	if [ -e ${D}${libdir}/charset.alias ]; then
+		rm -rf ${D}${libdir}/charset.alias
+	fi
 }
 
 do_install_append_class-native() {
diff --git a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..abdfa2a
--- /dev/null
+++ b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,33 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index e1d74db..c0e92dd 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index bbfa238..a1e3483 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -7,6 +7,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
            file://sed-add-ptest.patch \
+	   file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://run-ptest \
 "
 
diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..6ea6380
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: texinfo-5.2/gnulib/lib/Makefile.am
+===================================================================
+--- texinfo-5.2.orig/gnulib/lib/Makefile.am
++++ texinfo-5.2/gnulib/lib/Makefile.am
+@@ -378,7 +378,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
index 8dbcaa1..aa644e1 100644
--- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://disable-native-tools.patch \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            ${TARGET_PATCH} \
           "
 
@@ -58,7 +59,7 @@ do_compile_prepend() {
 
 do_install_append() {
 	mkdir -p ${D}${datadir}/${tex_texinfo}
-	install -p -m644 ${S}/doc/texinfo.tex ${S}/doc/txi-??.tex ${D}${datadir}/${tex_texinfo} 	
+	install -p -m644 ${S}/doc/texinfo.tex ${S}/doc/txi-??.tex ${D}${datadir}/${tex_texinfo}
 	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/texi2any ${D}${bindir}/pod2texi
 }
 
diff --git a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..c1cbd14
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: wget-1.16.3/lib/Makefile.am
+===================================================================
+--- wget-1.16.3.orig/lib/Makefile.am
++++ wget-1.16.3/lib/Makefile.am
+@@ -846,7 +846,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/wget/wget_1.16.3.bb b/meta/recipes-extended/wget/wget_1.16.3.bb
index 87755b2..5c34a42 100644
--- a/meta/recipes-extended/wget/wget_1.16.3.bb
+++ b/meta/recipes-extended/wget/wget_1.16.3.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
 SRC_URI[md5sum] = "f61d9011b99f824106a5d5a05dd0f63d"
diff --git a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
new file mode 100644
index 0000000..a62194b
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -0,0 +1,30 @@
+From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Apr 2015 17:02:13 -0700
+Subject: [PATCH] Unset need_charset_alias when building for musl
+
+localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
+which actually shoudl be fixed in gnulib and then all downstream
+projects will get it eventually. For now we apply the fix to
+coreutils
+
+Upstream-Status: Not Required
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/gnulib.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libunistring-0.9.4/lib/Makefile.gnulib
+===================================================================
+--- libunistring-0.9.4.orig/lib/Makefile.gnulib
++++ libunistring-0.9.4/lib/Makefile.gnulib
+@@ -380,7 +380,7 @@ install-exec-localcharset: all-local
+ 	  case '$(host_os)' in \
+ 	    darwin[56]*) \
+ 	      need_charset_alias=true ;; \
+-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
+ 	      need_charset_alias=false ;; \
+ 	    *) \
+ 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.4.bb b/meta/recipes-support/libunistring/libunistring_0.9.4.bb
index 89b1dc2..289c813 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.4.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.4.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
+           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
 
 SRC_URI[md5sum] = "c24a6a3838d9ad4a41a62549312c4226"
-- 
2.1.4


