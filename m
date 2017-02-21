Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ABFC872FC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:55:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so21331556wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cDg0+WTfblOK7BQH3zP9o51nTZtLv2FO/XM4g1HlVIo=;
	b=tB7QlRmePcGtnFtTnz30dHPP7XdgtHYFtgIAgUIwwjO0r7pQw+qh4Wep/dceB1XI3u
	7p4hd1+h1MfzJ3/Cat1mm9Akag7QUv+Yr9NUAzFfXrfP7iHjRYRP+Jsq7imIMwUiTCoW
	F+WV6ZWKi2TNgTHfpwKAxRxm+sK/pxGeY6AuaF7QN8jD/KiaYS7rdNGctrX1n1tAfSMK
	HrmUrBslg6ADUusHYSJH8qjHBGdo2Q4sH+7Gc70wO4rV0yWVJL1RyIvrOOK9Od0RAU5Q
	yXue/Nl4Zd2jV1zDg61HVpdkkURKnUmvXzbvWZJKwOVCAzqVE7vCaNk05bwzeVS7+MDb
	LWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cDg0+WTfblOK7BQH3zP9o51nTZtLv2FO/XM4g1HlVIo=;
	b=W7+GBccD9hWHlPaMxxoodv+ansBut5OmwQUuiOtOpeVc3Lsj4tnW+6i6AfYQ3JDske
	zPniAp+nJxsx0CmQKiq8m/feaHqw3b8B6TWm/dFSKjLcouLseBWIU8bSidhgBUZsyGVK
	kCr4YHFLN1bdzKQE0F/rmL6xBJzZYr/Uc/3ojXP3gp68uOi/u8GUxq7X1SPs8gSWTJm8
	QuI4tg+gbEMc+Jqrmvz1qVkYlOBzVXtKMDAzorxFtCCNHbIwCUqHpSpxSa3c6BVufgoC
	Hwx9r2OuwiEv6zZddOdgRvnX/IlPnix8/FC9sYya26HWeNLydvno8XK1BRXHBLUKISgy
	0YwQ==
X-Gm-Message-State: AMke39nFGokdE1ZddX6TRJZmM3DSm21WulZBMtmU/w3xgJ4ChGUURDpnlrxkK0GfKJezDQ==
X-Received: by 10.28.52.19 with SMTP id b19mr16067247wma.134.1487703332371;
	Tue, 21 Feb 2017 10:55:32 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o2sm18494217wmb.28.2017.02.21.10.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 10:55:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 19:55:27 +0100
Message-Id: <20170221185527.23988-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170221185527.23988-1-Martin.Jansa@gmail.com>
References: <20170221185527.23988-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] e2fsprogs: Fix build with glibc-2.25
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
X-List-Received-Date: Tue, 21 Feb 2017 18:55:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e2fsprogs/e2fsprogs-1.43-sysmacros.patch       | 130 +++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
new file mode 100644
index 0000000000..abbf2bad26
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
@@ -0,0 +1,130 @@
+From 30ef41f68703b6a16027cc8787118b87f1462dff Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 28 Mar 2016 20:31:33 -0400
+Subject: [PATCH e2fsprogs] include sys/sysmacros.h as needed
+
+The minor/major/makedev macros are not entirely standard.  glibc has had
+the definitions in sys/sysmacros.h since the start, and wants to move away
+from always defining them implicitly via sys/types.h (as this pollutes the
+namespace in violation of POSIX).  Other C libraries have already dropped
+them.  Since the configure script already checks for this header, use that
+to pull in the header in files that use these macros.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+
+Taken from gentoo portage.
+
+Upstream-Status: Pending
+
+---
+ debugfs/debugfs.c      | 3 +++
+ lib/blkid/devname.c    | 3 +++
+ lib/blkid/devno.c      | 3 +++
+ lib/ext2fs/finddev.c   | 3 +++
+ lib/ext2fs/ismounted.c | 3 +++
+ misc/create_inode.c    | 4 ++++
+ misc/mk_hugefiles.c    | 3 +++
+ 7 files changed, 22 insertions(+)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index ba8be40..7d481bc 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -26,6 +26,9 @@ extern char *optarg;
+ #include <errno.h>
+ #endif
+ #include <fcntl.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "debugfs.h"
+ #include "uuid/uuid.h"
+diff --git a/lib/blkid/devname.c b/lib/blkid/devname.c
+index 3e2efa9..671e781 100644
+--- a/lib/blkid/devname.c
++++ b/lib/blkid/devname.c
+@@ -36,6 +36,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ #include <time.h>
+ 
+ #include "blkidP.h"
+diff --git a/lib/blkid/devno.c b/lib/blkid/devno.c
+index 479d977..61e6fc7 100644
+--- a/lib/blkid/devno.c
++++ b/lib/blkid/devno.c
+@@ -31,6 +31,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "blkidP.h"
+ 
+diff --git a/lib/ext2fs/finddev.c b/lib/ext2fs/finddev.c
+index 311608d..62fa0db 100644
+--- a/lib/ext2fs/finddev.c
++++ b/lib/ext2fs/finddev.c
+@@ -31,6 +31,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
+diff --git a/lib/ext2fs/ismounted.c b/lib/ext2fs/ismounted.c
+index e0f69dd..7404996 100644
+--- a/lib/ext2fs/ismounted.c
++++ b/lib/ext2fs/ismounted.c
+@@ -49,6 +49,9 @@
+ #if HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 4dbd8e5..98aeb41 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -22,6 +22,10 @@
+ #include <attr/xattr.h>
+ #endif
+ #include <sys/ioctl.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
++
+ #include <ext2fs/ext2fs.h>
+ #include <ext2fs/ext2_types.h>
+ #include <ext2fs/fiemap.h>
+diff --git a/misc/mk_hugefiles.c b/misc/mk_hugefiles.c
+index 71a15c5..00e95cd 100644
+--- a/misc/mk_hugefiles.c
++++ b/misc/mk_hugefiles.c
+@@ -35,6 +35,9 @@ extern int optind;
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ #include <libgen.h>
+ #include <limits.h>
+ #include <blkid/blkid.h>
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index 1e659d7bbd..6d653fbf56 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://acinclude.m4 \
             file://ptest.patch \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
+            file://e2fsprogs-1.43-sysmacros.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
2.11.1


