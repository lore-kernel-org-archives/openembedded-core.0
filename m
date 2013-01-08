Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfE-0000qc-Le
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so99657lab.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1pUe8S5BA/HeWtWX1hDagmE8l+82nb9vehZ6cX3HC2k=;
	b=J2jKjtx1Bb1/DnrNm6yXBnhyq7PZecZAfAEe0cmeZ0NfgaO/UCnWEa2lV5ffDmcC7Z
	qLaZ35ux+JGqYjrdh3FlvbHlRPSDdbBPbzOwxIIEYXlRj0eF+OjIpXL0Q/hIs3Xa6BfX
	Tm7l+z1c2msZZnggHKZAceTx+riYKVpLYDO67DTN/G/aYoneruQztJhApl6XyyW32AD6
	jRvuEl+pFNwNl4povKjn4RTs6RRPtXVThF7DCNQ+6xmtt9VVICt7oqkCKk39SqR8RZQR
	8AHXXhj8Zyg4CDHWxB+ChBrX+QsOsmBYz53iESvivLzE06FjA5UhIx1MQ798DgbVTUfi
	mNSQ==
X-Received: by 10.152.109.139 with SMTP id hs11mr61250059lab.13.1357629410474; 
	Mon, 07 Jan 2013 23:16:50 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id
	fv12sm23979211lab.12.2013.01.07.23.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:49 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kc-S1; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:39 +0200
Message-Id: <1357629404-22020-8-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-7-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-6-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-7-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 07/12] libusb: replace obsolete automake macros with working ones
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

Add obsolete_automake_macros.patch that replaces automake macros
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
index 0000000..bc29de2
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-status: Submitted [https://libusb.org/ticket/161]
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
index 0000000..b1dd66c
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted [https://libusb.org/ticket/159]
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



