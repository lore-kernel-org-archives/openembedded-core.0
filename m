Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 68B676A9ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680111"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:45 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:34 +0300
Message-Id: <f1ec30369a7950a6d66749b8620961c312f646ca.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/7] libxt: upgrade to 1.1.4
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:45 -0000

The following fragment has been added at the end of the licence file:

Copyright (c) 1993, 1994  X Consortium

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
THE X CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Except as contained in this notice, the name of the X Consortium shall not
be used in advertising or otherwise to promote the sale, use or other
dealing in this Software without prior written authorization from the
X Consortium.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb}    |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
index 8249e78..c3373f4 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
@@ -13,13 +13,12 @@ independent of any particular user interface policy or style."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3239170e81427c5948287df07691f03f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6565b1e0094ea1caae0971cc4035f343"
 
 
 DEPENDS += "util-linux libxcb libsm virtual/libx11 kbproto libxdmcp"
 PROVIDES = "xt"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXt"
@@ -41,5 +40,5 @@ do_compile() {
 	oe_runmake
 }
 
-SRC_URI[md5sum] = "a6f137ae100e74ebe3b71eb4a38c40b3"
-SRC_URI[sha256sum] = "8db593c3fc5ffc4e9cd854ba50af1eac9b90d66521ba17802b8f1e0d2d7f05bd"
+SRC_URI[md5sum] = "03149823ae57bb02d0cec90d5b97d56c"
+SRC_URI[sha256sum] = "843a97a988f5654872682a4120486d987d853a71651515472f55519ffae2dd57"
-- 
1.7.9.5


