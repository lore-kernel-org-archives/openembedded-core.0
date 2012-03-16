Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LLx-0001s2-7g
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:49:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121479010"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:39:20 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:30 +0800
Message-Id: <1106b509497bce38291b627176d12f5159745fb4.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 33/60] libsm: upgrade to 1.2.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:49:09 -0000

The license change is because:

--- libsm-1_1.2.0-r1/libSM-1.2.0/COPYING        2010-01-15 12:59:55.000000000 +0800
+++ libsm-1_1.2.1-r0/libSM-1.2.1/COPYING        2012-03-03 12:53:55.000000000 +0800
@@ -1,4 +1,4 @@
-Copyright 2002 Sun Microsystems, Inc.  All rights reserved.
+Copyright (c) 2002, Oracle and/or its affiliates. All rights reserved.

 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the "Software"),
@@ -19,6 +19,7 @@
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.

+
 Copyright 1993, 1998  The Open Group

 Permission to use, copy, modify, distribute, and sell this software and its

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libsm_1.2.0.bb => libsm_1.2.1.bb}    |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.0.bb => libsm_1.2.1.bb} (69%)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
similarity index 69%
rename from meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
index bb384aa..1613bb9 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.1.bb
@@ -9,16 +9,16 @@ has a particular state."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d98446615b962372d6a46057170043fa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0fb37f44e02bdbde80546024400728d"
 
 DEPENDS += "libice xproto xtrans e2fsprogs"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libSM"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "e78c447bf1790552b644eca81b542742"
-SRC_URI[sha256sum] = "0cd8df1b7067bfda10b05d38279777770677c6fecb5a14e804a28597da7a57cb"
+SRC_URI[md5sum] = "766de9d1e1ecf8bf74cebe2111d8e2bd"
+SRC_URI[sha256sum] = "93c11d569c64f40723b93b44af1efb474a0cfe92573b0c8c330343cabb897f1d"
-- 
1.7.6



