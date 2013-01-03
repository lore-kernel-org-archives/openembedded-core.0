Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlQ-0000dO-Bm
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so8681952lab.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KSIzcLIuumI7MteOpZQ6S2MreJyjta50Ev3/MLL8UFc=;
	b=j36wMq0rTEJsEH1j56NTV3iK08JdKs19Ud90Kr4E0Eh9RzC0+M0KkDdVw4ILCdcKYX
	tuT4DfVEStpbxkZFT0T2U2OhtoZKZ/LrkI0p8fXOrpFFgMF0DkkdBEp+MmGe5TBqMuDz
	ZwvaX7G2Jp9zRphVBM3a0GlRZsEL/tjVnms91yHQ4D4NVdJOj47bRH7gsFKVD944/Fqg
	neLNKDxC1mnWpYz/Cuv6PLHeEE0ytHTS82lTPw6o3LwT3pMCwF3erR92y8eiPAKjTZ1X
	ST4OFdbw5kWrtr88ZpQb3SB58apkZc+5+0SgSyteW+vFy6uoVzPBFK15JiBsV+tW2Q2/
	/bGw==
X-Received: by 10.112.23.34 with SMTP id j2mr20548731lbf.118.1357245400189;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fh4sm17335158lbb.7.2013.01.03.12.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002FC-Va; Thu, 03 Jan 2013 22:36:35 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:25 +0200
Message-Id: <1357245391-11055-10-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-9-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-8-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-9-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 09/15] libusb: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libusb-compat-0.1.4/obsolete_automake_macros.patch  |   15 +++++++++++++++
 meta/recipes-support/libusb/libusb-compat_0.1.4.bb      |    3 ++-
 .../libusb/libusb1-1.0.9/obsolete_automake_macros.patch |   15 +++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.9.bb            |    6 ++++--
 4 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch

diff --git a/meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch b/meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
new file mode 100644
index 0000000..2ec6fda
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Not sent
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libusb-compat-0.1.4/configure.ac libusb-compat-0.1.4/configure.ac
+--- libusb-compat-0.1.4/configure.ac	2012-04-24 08:45:46.000000000 +0300
++++ libusb-compat-0.1.4/configure.ac	2013-01-02 16:41:30.440115202 +0200
+@@ -1,7 +1,7 @@
+ AC_INIT([libusb-compat], [0.1.4])
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_SRCDIR([libusb/core.c])
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_MACRO_DIR([m4])
+
+ AC_PREREQ([2.50])
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.4.bb b/meta/recipes-support/libusb/libusb-compat_0.1.4.bb
index 24df017..d743072 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.4.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.4.bb
@@ -16,9 +16,10 @@ PROVIDES = "libusb virtual/libusb0"
 BBCLASSEXTEND = "native nativesdk"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
+           file://obsolete_automake_macros.patch \
           "
 #           file://0.1.0-beta1-gcc3.4-fix.patch"
 
diff --git a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch b/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
new file mode 100644
index 0000000..9b1d40d
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Submitted
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libusb-1.0.9/configure.ac libusb-1.0.9/configure.ac
+--- libusb-1.0.9/configure.ac	2012-04-20 09:44:27.000000000 +0300
++++ libusb-1.0.9/configure.ac	2013-01-02 16:36:44.152121483 +0200
+@@ -31,7 +31,7 @@
+
+ AC_CONFIG_SRCDIR([libusb/core.c])
+ AC_CONFIG_MACRO_DIR([m4])
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+ m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
+
+ AC_PREREQ([2.50])
diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bb b/meta/recipes-support/libusb/libusb1_1.0.9.bb
index e002374..012ac27 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.9.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
+           file://obsolete_automake_macros.patch \
+          "
 
 SRC_URI[md5sum] = "7f5a02375ad960d4e33a6dae7d63cfcb"
 SRC_URI[sha256sum] = "e920eedc2d06b09606611c99ec7304413c6784cba6e33928e78243d323195f9b"
-- 
1.7.10.4



