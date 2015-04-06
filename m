Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 73AF272A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:13 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so26646859ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gwcwyJscsgwdJPuoxX8MJCgpl9uGgW8qlLh101c6hhE=;
	b=c4tOjqH5rzl8FyMOeRui5jWiw4li7kFSScFuGnBilglkxiiyrxz09l3Dy5W1F9IUqv
	Fad3vtW+NishFnU22xZb2f4UUVGoFzLCk1IWnCzovI8P8nQVEHbUJVi5mggwSgSgoSbl
	LLXUvNDZw7N87if60kTwQmDsr6ogQddM6/nr/VCGPiQ4kxTnouw8PNLzdUJR6klY+ncI
	M77gvIN4965EPwVye037madivSwve6aZOnK36zAnHoVIxScOTFK9nQCMolJwN4MtONQs
	NO648I+lSBTUb6LAj3kVOkS9T+E++x5+rso3N0/EvQJA/TIsqylEji/FjCigLPLNmRYJ
	hFvQ==
X-Received: by 10.107.162.74 with SMTP id l71mr24167322ioe.77.1428341834518;
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:47 +0000
Message-Id: <63f8e4b9b0d5600e617ce0d57abc764d31282be7.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 19/24] at-spi2-core: Add nls.m4 from gettext
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:13 -0000

This is needed for building it with musl, since
we disable NLS, I think it will fails in same
way with glibc if NLS was disabled there too

Change-Id: I95c6858adfb33361cab466999e0bacb47c1e1fde
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    | 54 ++++++++++++++++++++++
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb    |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch b/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
new file mode 100644
index 0000000..69a51d5
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/0001-nls.m4-Take-it-from-gettext-0.15.patch
@@ -0,0 +1,54 @@
+From c320799c941d42a9b7e351805359694ea3b36d2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Apr 2015 09:08:38 -0700
+Subject: [PATCH] nls.m4: Take it from gettext-0.15
+
+It otherwise expects gettext to provide it. Lets go independent
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ m4/nls.m4 | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+ create mode 100644 m4/nls.m4
+
+diff --git a/m4/nls.m4 b/m4/nls.m4
+new file mode 100644
+index 0000000..2c8fe69
+--- /dev/null
++++ b/m4/nls.m4
+@@ -0,0 +1,30 @@
++dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
++dnl This file is free software; the Free Software Foundation
++dnl gives unlimited permission to copy and/or distribute it,
++dnl with or without modifications, as long as this notice is preserved.
++dnl
++dnl This file can can be used in projects which are not available under
++dnl the GNU General Public License or the GNU Library General Public
++dnl License but which still want to provide support for the GNU gettext
++dnl functionality.
++dnl Please note that the actual code of the GNU gettext library is covered
++dnl by the GNU Library General Public License, and the rest of the GNU
++dnl gettext package package is covered by the GNU General Public License.
++dnl They are not in the public domain.
++
++dnl Authors:
++dnl Ulrich Drepper drepper@cygnus.com, 1995-2000.
++dnl Bruno Haible haible@clisp.cons.org, 2000-2003.
++
++AC_PREREQ(2.50)
++
++AC_DEFUN([AM_NLS],
++[
++AC_MSG_CHECKING([whether NLS is requested])
++dnl Default is enabled NLS
++AC_ARG_ENABLE(nls,
++[ --disable-nls do not use Native Language Support],
++USE_NLS=$enableval, USE_NLS=yes)
++AC_MSG_RESULT($USE_NLS)
++AC_SUBST(USE_NLS)
++])
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
index 1a1ce6c..a4d2b3a 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
+          "
 
 SRC_URI[md5sum] = "a37993cc50d90465c9aeed95e2ac439a"
 SRC_URI[sha256sum] = "eef9660b14fdf0fb1f30d1be7c72d591fa7cbb87b00ca3a444425712f46ce657"
-- 
2.1.4


