Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 58C4773CF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:59 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so37877557pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=MX88lZ9Ygv0FysZEcQBltg/Q9d2cKrKMI0JCAS2ac3M=;
	b=TMDaeGpEkXlHcnQuiGXHxMd+EOW0UbiVMK/OOgGvvyjX+EqNYyx4LDYp/Lnn95Nzl2
	SZyNx9b4MiT3k3t9B9Mb+Xo4yHHVsP0IjfkCMC2gsQM4ksRhFhfJRgJbXQZGe4Q324mo
	sFiAnSqBCkq4DWB/1JgK5/gMPz8Gor7IpbM8DbWipznlHd9up9tff//CcIUFPSgkdGxF
	/E6DYEfJsSqJ1F4s1CSgY9o3gEdGMXMVSPQNuMvgJEKkqAdqBiRP50JBIdzjiLNcWy6d
	uZ12k4guCoPRX1W04hO5vEKMMVZFeL5sUVgNaeDs25Ql5QTNC4f/K4gMsqlooHga8J8w
	W8Kw==
X-Received: by 10.68.91.197 with SMTP id cg5mr1228774pbb.26.1428715260854;
	Fri, 10 Apr 2015 18:21:00 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:38 -0700
Message-Id: <b7747600d7327a6f8049ecd6bde93d69025a6b0f.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 07/17] libfm-extra: Add own nls.m4
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:59 -0000

It helps to build when NLS is disabled distro-wide
otherwise it has dependency on gettext to provide it

Change-Id: Ib6920629b5ab1a1938cc5dfa447078f6fca234c7
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    | 54 ++++++++++++++++++++++
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch

diff --git a/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch b/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
new file mode 100644
index 0000000..69a51d5
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
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
diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
index 85bcc3c..46d2d62 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 intltool-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
+           file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
+          "
 
 SRC_URI[md5sum] = "3ff38200701658f7e80e25ed395d92dd"
 SRC_URI[sha256sum] = "c692f1624a4cbc8d1dd55f3b3f3369fbf5d26f63a916e2c295230b2344e1fbf9"
-- 
2.1.4


