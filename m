Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 22D89712A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 10:02:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2014 00:53:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="418556690"
Received: from gcwannia-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.103])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2014 00:44:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 08:53:22 +0000
Message-Id: <0f477b3fac153834a928582d01b47c87f4e481b4.1416386960.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] xmodmap: drop already applied patch
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
X-List-Received-Date: Wed, 19 Nov 2014 10:02:56 -0000

This patch was part of the 1.0.8 release.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../xorg-app/xmodmap/gnu-source.patch              | 60 ----------------------
 meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb    |  2 -
 2 files changed, 62 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch

diff --git a/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch b/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
deleted file mode 100644
index 40f81f0..0000000
--- a/meta/recipes-graphics/xorg-app/xmodmap/gnu-source.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 42f99a7a7b836f6f9704a7b1747eb722c93446ec Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Mon, 23 Apr 2012 14:28:39 +0000
-Subject: include config.h before stdio.h & other system headers
-
-Ensures definitions like _GNU_SOURCE are visible when needed.
-
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
----
-diff --git a/exec.c b/exec.c
-index dbcb669..419b10e 100644
---- a/exec.c
-+++ b/exec.c
-@@ -54,6 +54,10 @@ from The Open Group.
-  * original xmodmap, written by David Rosenthal, of Sun Microsystems.
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
-diff --git a/pf.c b/pf.c
-index 0eb0f55..3f0c3f4 100644
---- a/pf.c
-+++ b/pf.c
-@@ -26,6 +26,10 @@ from The Open Group.
- 
- */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
-diff --git a/xmodmap.c b/xmodmap.c
-index 58a8e70..0f89629 100644
---- a/xmodmap.c
-+++ b/xmodmap.c
-@@ -26,6 +26,10 @@ from The Open Group.
- 
- */
- 
-+#ifdef HAVE_CONFIG_H
-+# include "config.h"
-+#endif
-+
- #include <X11/Xos.h>
- #include <X11/Xlib.h>
- #include <stdio.h>
---
-cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
index 65a55e3..87efb76 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.8.bb
@@ -13,7 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
 
-SRC_URI += "file://gnu-source.patch"
-
 SRC_URI[md5sum] = "5511da3361eea4eaa21427652c559e1c"
 SRC_URI[sha256sum] = "efe2e3c89858a2db3bdcf969f55f55d0af4f5007789198344de0595249a99fc3"
-- 
1.9.3


