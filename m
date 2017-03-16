Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BFD6A771DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655750; x=1521191750;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=rLZw1KbGCFUKNAAp2sy36BKDzYA7z7L0UsHTTBPEXeI=;
	b=OPdGYML+ftigc2FH8f4SGkxcLMnQkWyPhr3ksd+1GQ9ZNBEPFJE7GWJ+
	0o/BOVEVc4tqkenMxbWxUvgYdHIJFw==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="835269615"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2017 02:15:47 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DC7802C8001;
	Thu, 16 Mar 2017 02:15:42 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:31 +0200
Message-Id: <ecf050866e8e202f5c9376943cd9fcf5a16e8d20.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/11] xf86-input-mouse: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:48 -0000

The patch has not been used since the ancient git version was removed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-driver/xf86-input-mouse/unbreak.patch      | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch b/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
deleted file mode 100644
index 6930864..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse/unbreak.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Unbreak the linux mouse driver by using config.h
-
-RP - 4/11/07
-
-Upstream-Status: Pending
-
-Index: git/src/lnx_mouse.c
-===================================================================
---- git.orig/src/lnx_mouse.c	2008-11-04 23:46:05.000000000 +0000
-+++ git/src/lnx_mouse.c	2008-11-04 23:46:15.000000000 +0000
-@@ -3,8 +3,8 @@
-  * Copyright 1999 by The XFree86 Project, Inc.
-  */
- 
--#ifdef HAVE_XORG_CONFIG_H
--#include <xorg-config.h>
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
- #endif
- 
- #include <X11/X.h>
-- 
2.1.4


