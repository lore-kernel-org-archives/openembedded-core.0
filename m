Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C9CF47FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:19 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g17so2566856wro.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E725ZpPxG0v4fp+N5myYpOm4AfOaJVdo/rEKVH9tlqU=;
	b=SZu1ojQLkB9QJ5fEO57iIoqw++d8pPitLyiWN+RFI7Eif4m3+mbCMntUHGK9HYi9TR
	qwptdEBeEHdkVvtp7CONp0fuJqOu+oSjTDOIshuaG0wHtNxjcezaRQ99Nh3fHBt/PIFK
	zPzKMyTTK4CHDhctYWt+sPM/bYIwlRDSWHB7wB5uZI4kmVjj7c+jqp9MJllOaKiU6jMf
	XO9BGLFKqK+7lzIrGV+XW6MM6VAAwdvhbfJZo85iBHjDSbBiNhGbFELh0AqFZ8Y16e7l
	9WvxO7XhbWuh+SFxdlE/+hraqT+MkjTZ+l9IEGDxZKiKgwVAbzdMUoGgAlgtk3jKii6+
	yV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E725ZpPxG0v4fp+N5myYpOm4AfOaJVdo/rEKVH9tlqU=;
	b=j0S5oF4DgeMjxi+8Yh6UuzpRIIxszM3sx44ZinxikQ4C+ObG0DKsIz7CqIFcuSeH2h
	hJ+gs5tiOmmkqd71QJlrBjMnKKeN9QV5LFM3JzcORjwUyGt7r5zs+Egb3b3bBbqhW9OC
	2fSEgBdS2B1jf+gVSweKXho3snV8M4Viq5mcepwwfBwiG+IkGoFEWyHQkzPQfOipR4sC
	KQLNNYOp3J85gC6zmLmDZs7NwkcdS20ec/Q1EaBRYLkeKP309jkf96so0HoVMhA4EuRK
	7mpIHRNiH3JAPuk4Dn2A/ECjsbCBZ445HJO0QAMAwA+aXrbNkW/JHPTN/QkJ/or3w3hk
	ZU3w==
X-Gm-Message-State: APjAAAX9Uv1xCEmFskU3s9gQdELclnUPejo9ksbLS/m8TqjfRZqxRruJ
	j/WwsEbyyUuObco1hRlv9KuVW4CnHhE=
X-Google-Smtp-Source: APXvYqxzGkzRr/rKDalES1MN/P2Vvj8QdFrOIg56+7JL0Xi9JtVJZd5lC1caQElSAxhAodcoisx6tQ==
X-Received: by 2002:adf:cd03:: with SMTP id w3mr3146821wrm.191.1576679900035; 
	Wed, 18 Dec 2019 06:38:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:52 +0100
Message-Id: <20191218143758.129308-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/25] cups: update to 2.3.1
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:20 -0000

License-Update: license changed to Apache 2.0

Remove no longer recognized configure options.

Refresh all patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/cups/cups.inc           | 14 ++---
 .../cups/0001-use-echo-only-in-init.patch     | 27 ++++++++++
 ...don-t-try-to-run-generated-binaries.patch} | 29 ++++++-----
 ...003-cups_1.4.6.bb-Fix-build-on-ppc64.patch | 51 +++++++++++++++++++
 ...fix-multilib-install-file-conflicts.patch} | 12 +++++
 .../cups/cups/cups_serverbin.patch            | 38 --------------
 .../cups/cups/use_echo_only_in_init.patch     | 15 ------
 meta/recipes-extended/cups/cups_2.2.12.bb     |  6 ---
 meta/recipes-extended/cups/cups_2.3.1.bb      |  6 +++
 9 files changed, 117 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
 rename meta/recipes-extended/cups/cups/{0001-don-t-try-to-run-generated-binaries.patch => 0002-don-t-try-to-run-generated-binaries.patch} (69%)
 create mode 100644 meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch
 rename meta/recipes-extended/cups/cups/{cups-avoid-install-file-conflicts.patch => 0004-cups-fix-multilib-install-file-conflicts.patch} (68%)
 delete mode 100644 meta/recipes-extended/cups/cups/cups_serverbin.patch
 delete mode 100644 meta/recipes-extended/cups/cups/use_echo_only_in_init.patch
 delete mode 100644 meta/recipes-extended/cups/cups_2.2.12.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.3.1.bb

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2149cbe4cfb..b94bc1d4123 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -5,14 +5,14 @@ Protocol (IPP), and has its own filtering driver model for handling various \
 document types."
 HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
-LICENSE = "GPLv2 & LGPLv2"
+LICENSE = "Apache-2.0"
 DEPENDS = "gnutls libpng jpeg dbus zlib libusb1"
 
 SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tar.gz \
-           file://use_echo_only_in_init.patch \
-           file://0001-don-t-try-to-run-generated-binaries.patch \
-           file://cups_serverbin.patch \
-           file://cups-avoid-install-file-conflicts.patch \
+           file://0001-use-echo-only-in-init.patch \
+           file://0002-don-t-try-to-run-generated-binaries.patch \
+           file://0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch \
+           file://0004-cups-fix-multilib-install-file-conflicts.patch\
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
@@ -45,10 +45,6 @@ EXTRA_OECONF = " \
                --enable-debug \
                --disable-relro \
                --enable-libusb \
-               --without-php \
-               --without-perl \
-               --without-python \
-               --without-java \
                DSOFLAGS='${LDFLAGS}' \
                "
 
diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
new file mode 100644
index 00000000000..80bbad0a448
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -0,0 +1,27 @@
+From a3f4d8ba97f4669a95943a7e65eb61aa44ce7999 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Thu, 13 Dec 2012 19:03:52 -0800
+Subject: [PATCH 1/4] use echo only in init
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ scheduler/cups.sh.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scheduler/cups.sh.in b/scheduler/cups.sh.in
+index 89ac36d..6618a0f 100644
+--- a/scheduler/cups.sh.in
++++ b/scheduler/cups.sh.in
+@@ -50,7 +50,7 @@ case "`uname`" in
+ 		ECHO_ERROR=:
+ 		;;
+ 
+-	Linux*)
++	DisableLinux*)
+ 		IS_ON=/bin/true
+ 		if test -f /etc/init.d/functions; then
+ 			. /etc/init.d/functions
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
similarity index 69%
rename from meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
rename to meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index d6a69f28338..ea248e4710a 100644
--- a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,7 +1,7 @@
-From 1fb07162a9ed187cccf06e34c9bf841d15c6e64e Mon Sep 17 00:00:00 2001
+From 3e9a965dcd65ab2d40b753b6f792a1a4559182aa Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
-Subject: [PATCH] don't try to run generated binaries
+Subject: [PATCH 2/4] don't try to run generated binaries
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -12,13 +12,13 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 16 insertions(+), 16 deletions(-)
 
 diff --git a/ppdc/Makefile b/ppdc/Makefile
-index e563988..973dd3f 100644
+index 32e2e0b..f1478d4 100644
 --- a/ppdc/Makefile
 +++ b/ppdc/Makefile
-@@ -189,8 +189,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
- 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
- 		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
- 		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
+@@ -186,8 +186,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) \
+ 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o genstrings genstrings.o \
+ 		libcupsppdc.a $(LINKCUPSSTATIC)
+ 	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Generating localization strings...
 -	./genstrings >sample.c
 +#	echo Generating localization strings...
@@ -26,9 +26,9 @@ index e563988..973dd3f 100644
  
  
  #
-@@ -209,9 +209,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) foo.drv foo-fr.po
- 		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
- 		$(COMMONLIBS) $(LIBZ)
+@@ -205,9 +205,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC) foo.drv foo-fr.po
+ 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
+ 		$(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Testing PPD compiler...
 -	./ppdc-static -l en,fr -I ../data foo.drv
@@ -39,9 +39,9 @@ index e563988..973dd3f 100644
  
  
  #
-@@ -240,17 +240,17 @@ ppdi-static:		ppdc-static ppdi.o libcupsppdc.a  ../cups/$(LIBCUPSSTATIC)
- 		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
- 		$(COMMONLIBS) $(LIBZ)
+@@ -235,17 +235,17 @@ ppdi-static:		ppdc-static ppdi.o libcupsppdc.a ../cups/$(LIBCUPSSTATIC)
+ 	$(LD_CXX) $(ARCHFLAGS) $(ALL_LDFLAGS) -o ppdi-static ppdi.o libcupsppdc.a \
+ 		$(LINKCUPSSTATIC)
  	$(CODE_SIGN) -s "$(CODE_SIGN_IDENTITY)" $@
 -	echo Testing PPD importer...
 -	$(RM) -r ppd ppd2 sample-import.drv
@@ -68,3 +68,6 @@ index e563988..973dd3f 100644
  
  
  #
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch b/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch
new file mode 100644
index 00000000000..b48c7a9ad2f
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0003-cups_1.4.6.bb-Fix-build-on-ppc64.patch
@@ -0,0 +1,51 @@
+From 66c2079ae91389ee0f9d704bf0d2cccd53b2c603 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 22 Jul 2012 16:54:17 -0700
+Subject: [PATCH 3/4] cups_1.4.6.bb: Fix build on ppc64
+
+Make CUPS_SERVERBIN relative to libdir otherwise on 64bit arches
+e.g. ppc64 where base libdir is lib64 this does not go well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE config specific]
+
+Update on 20190904:
+Redefine CUPS_SERVERBIN to "$libexecdir/cups" which solves file confliction
+when multilib is enabled.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ config-scripts/cups-directories.m4 | 2 +-
+ configure                          | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
+index b74083a..9a5abb2 100644
+--- a/config-scripts/cups-directories.m4
++++ b/config-scripts/cups-directories.m4
+@@ -270,7 +270,7 @@ case "$host_os_name" in
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libexecdir/cups"
+ 		;;
+ esac
+ 
+diff --git a/configure b/configure
+index d3df145..bc68a6c 100755
+--- a/configure
++++ b/configure
+@@ -6420,7 +6420,7 @@ case "$host_os_name" in
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libexecdir/cups"
+ 		;;
+ esac
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
similarity index 68%
rename from meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch
rename to meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index 68885fa4db0..bc9260307c8 100644
--- a/meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,3 +1,8 @@
+From 7dbda1887aa19ab720aff22312f4caff2d575f62 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 3 Oct 2018 00:27:11 +0800
+Subject: [PATCH 4/4] cups: fix multilib install file conflicts
+
 @CUPS_SERVERBIN@ is ${libdir} related that causes multilib install file
 conflict. Remove @CUPS_SERVERBIN@ from the comment line of cups-files.conf to
 avoid the conflict.
@@ -6,6 +11,10 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
+---
+ conf/cups-files.conf.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
 index 4a78ba6..03c6582 100644
 --- a/conf/cups-files.conf.in
@@ -19,3 +28,6 @@ index 4a78ba6..03c6582 100644
  
  # SSL/TLS keychain for the scheduler...
  #ServerKeychain @CUPS_SERVERKEYCHAIN@
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/cups/cups/cups_serverbin.patch b/meta/recipes-extended/cups/cups/cups_serverbin.patch
deleted file mode 100644
index 85c6af10719..00000000000
--- a/meta/recipes-extended/cups/cups/cups_serverbin.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Make CUPS_SERVERBIN relative to libdir otherwise on 64bit arches
-e.g. ppc64 where base libdir is lib64 this does not go well
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate [OE config specific]
-
-Update on 20190904:
-Redefine CUPS_SERVERBIN to "$libexecdir/cups" which solves file confliction
-when multilib is enabled.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Index: cups-1.4.6/config-scripts/cups-directories.m4
-===================================================================
---- cups-1.4.6.orig/config-scripts/cups-directories.m4	2009-04-12 16:04:51.000000000 -0700
-+++ cups-1.4.6/config-scripts/cups-directories.m4	2012-07-21 12:12:05.896405923 -0700
-@@ -397,7 +397,7 @@
- 	*)
- 		# All others
- 		INSTALL_SYSV="install-sysv"
--		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libexecdir/cups"
- 		;;
- esac
- 
-Index: cups-1.4.6/configure
-===================================================================
---- cups-1.4.6.orig/configure	2012-07-21 12:13:34.512405950 -0700
-+++ cups-1.4.6/configure	2012-07-21 12:14:05.724406017 -0700
-@@ -11181,7 +11181,7 @@
- 	*)
- 		# All others
- 		INSTALL_SYSV="install-sysv"
--		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libexecdir/cups"
- 		;;
- esac
- 
diff --git a/meta/recipes-extended/cups/cups/use_echo_only_in_init.patch b/meta/recipes-extended/cups/cups/use_echo_only_in_init.patch
deleted file mode 100644
index 696f1374d9c..00000000000
--- a/meta/recipes-extended/cups/cups/use_echo_only_in_init.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: cups-1.6.1/scheduler/cups.sh.in
-===================================================================
---- cups-1.6.1.orig/scheduler/cups.sh.in
-+++ cups-1.6.1/scheduler/cups.sh.in
-@@ -67,7 +67,7 @@ case "`uname`" in
- 		ECHO_ERROR=:
- 		;;
- 
--	Linux*)
-+	DisableLinux*)
- 		IS_ON=/bin/true
- 		if test -f /etc/init.d/functions; then
- 			. /etc/init.d/functions
diff --git a/meta/recipes-extended/cups/cups_2.2.12.bb b/meta/recipes-extended/cups/cups_2.2.12.bb
deleted file mode 100644
index 8e5534a979e..00000000000
--- a/meta/recipes-extended/cups/cups_2.2.12.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
-
-SRC_URI[md5sum] = "e763689f7735d3fe95a2943397189e40"
-SRC_URI[sha256sum] = "0f61ab449e4748a24c6ab355b481ff7691247a140d327b2b7526fce34b7f9aa8"
diff --git a/meta/recipes-extended/cups/cups_2.3.1.bb b/meta/recipes-extended/cups/cups_2.3.1.bb
new file mode 100644
index 00000000000..f5230faf816
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.3.1.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "8ad8897c97cf4d90f20dac4318f47421"
+SRC_URI[sha256sum] = "1bca9d89507e3f68cbc84482fe46ae8d5333af5bc2b9061347b2007182ac77ce"
-- 
2.17.1


