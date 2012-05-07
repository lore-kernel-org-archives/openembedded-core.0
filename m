Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRUMR-0004lU-9y
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 22:16:47 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4457640wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZLzTPXtT14c96g1DDRRczJc7vB3PRO5IOaSaO0Xm0ns=;
	b=F6aDaG/16BNKG2f9JLPq17ZWDpzqnq4pzCoEBylVlkusL7dGXUqGw1V8+DVguD1tO3
	YIn+nSAv53PDEPoNXQtuHd7rlLBebjiPa3F6ke/6Q9N5nhU4PJk6hXDKmf2FqPMODgz8
	dj/eUEJT20ZLcudh0LYeiBqzP34XLDlolKPRld7PmPQg/dGzuAgAY5BCa7WXGJ7eFmGG
	ZsSMqblGMI4++MS5v9mYVHsD5CLetIMDkfSHQFeb5zl2hl6BfFPm1NzCOhba+TrAd3td
	Wok00lR2vKOl+bRDzyHwDjCO20HLclVZa0zEsmX8QJHlN3CGeRPyddIW7N4IcjZKWV3S
	q4DA==
Received: by 10.216.200.90 with SMTP id y68mr1413009wen.49.1336421218843;
	Mon, 07 May 2012 13:06:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm37461890wiw.5.2012.05.07.13.06.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:06:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 22:06:04 +0200
Message-Id: <d1e46e950169618d5c48f57fa31d43f92129fd33.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] libgdbus: delete from oe-core
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
X-List-Received-Date: Mon, 07 May 2012 20:16:47 -0000

* as suggested here:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022071.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgdbus/libgdbus/fix-for-new-glib.patch       |   20 --------------------
 meta/recipes-support/libgdbus/libgdbus_git.bb      |   20 --------------------
 2 files changed, 0 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch
 delete mode 100644 meta/recipes-support/libgdbus/libgdbus_git.bb

diff --git a/meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch b/meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch
deleted file mode 100644
index 4bd8360..0000000
--- a/meta/recipes-support/libgdbus/libgdbus/fix-for-new-glib.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix for glib-2.0 version 2.32.2
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-Index: git/src/debug.h
-===================================================================
---- git.orig/src/debug.h
-+++ git/src/debug.h
-@@ -19,7 +19,7 @@
-  *
-  */
- 
--#include <glib/gmessages.h>
-+#include <glib.h>
- 
- //#define DBG(fmt, arg...)  g_debug("%s: " fmt, __FUNCTION__ , ## arg)
- #define DBG(fmt, arg...)
diff --git a/meta/recipes-support/libgdbus/libgdbus_git.bb b/meta/recipes-support/libgdbus/libgdbus_git.bb
deleted file mode 100644
index 474ec28..0000000
--- a/meta/recipes-support/libgdbus/libgdbus_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for simple D-Bus integration with GLib"
-DESCRIPTION = "Library for simple D-Bus integration with GLib"
-HOMEPAGE = "http://www.bluez.org"
-SECTION = "libs"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09"
-
-DEPENDS = "glib-2.0 dbus"
-
-SRCREV = "aeab6e3c0185b271ca343b439470491b99cc587f"
-PV = "0.0+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.kernel.org/pub/scm/bluetooth/libgdbus.git;protocol=git \
-           file://fix-for-new-glib.patch"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-- 
1.7.8.6



