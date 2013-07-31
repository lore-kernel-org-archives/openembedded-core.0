Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 03DA96B38D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884382"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:03 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:47 +0300
Message-Id: <a14414897749e7825bb4b1e97b0076750839c886.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/13] nasm: upgrade to 2.10.09
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:17 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb}      |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb} (80%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.10.07.bb b/meta/recipes-devtools/nasm/nasm_2.10.09.bb
similarity index 80%
rename from meta/recipes-devtools/nasm/nasm_2.10.07.bb
rename to meta/recipes-devtools/nasm/nasm_2.10.09.bb
index bcecce4..19663d6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.07.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.09.bb
@@ -4,11 +4,10 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
-PR = "r0"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "af1cd6669f5e98148cd5ec42dee90f19"
-SRC_URI[sha256sum] = "c056e2abc83816892e448f9e9e95a3d21e9e096f44341b9d4853f62a443bba82"
+SRC_URI[md5sum] = "0e45ca0d3d7ff36d503777eaa673e2ae"
+SRC_URI[sha256sum] = "7141180d3874b5967c6a60191e8d45fba9cc86bd60a4803ad80b6b6b3eac36b9"
 
 inherit autotools
 
-- 
1.7.9.5


