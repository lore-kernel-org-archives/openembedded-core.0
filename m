Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LSK-0002K6-Mj
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:55:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121480089"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:45:50 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:39 +0800
Message-Id: <47c54767e0e683355173ed2cc1e908995c156cb7.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 42/60] libXv: upgrade to 1.0.7
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
X-List-Received-Date: Fri, 16 Mar 2012 00:55:44 -0000

The license change is:

--- libXv-1.0.6/COPYING 2009-10-17 05:27:22.000000000 +0800
+++ libXv-1.0.7/COPYING 2012-03-08 13:25:45.000000000 +0800
@@ -3,13 +3,13 @@

                         All Rights Reserved

-Permission to use, copy, modify, and distribute this software and its
-documentation for any purpose and without fee is hereby granted,
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and that
-both that copyright notice and this permission notice appear in
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the names of Digital or MIT not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission.
+software without specific, written prior permission.

 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxv_1.0.6.bb => libxv_1.0.7.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.6.bb => libxv_1.0.7.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.6.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb
index f3d8d27..813c1e3 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.7.bb
@@ -8,7 +8,7 @@ clients, which may draw in a number of colourspaces, including YUV."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=916ffd3d79baef9fb56d2c2af28f93f2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=827da9afab1f727f2a66574629e0f39c"
 
 DEPENDS += "libxext videoproto"
 
@@ -16,5 +16,5 @@ PR = "r0"
 
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "e292445a64b63e918bbc8b6aae6391dd"
-SRC_URI[sha256sum] = "e20f8e594bb0f44f3fbd25996945730391d72acbe5eaac760429fd6579caf5ee"
+SRC_URI[md5sum] = "5e1ac203ccd3ce3e89755ed1fbe75b0b"
+SRC_URI[sha256sum] = "5d664aeb641f8c867331a0c6b4574a5e7e420f00bf5fcefd874e8d003ea59010"
-- 
1.7.6



