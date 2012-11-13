Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfV-0006Sf-UQ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907464"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:26 +0200
Message-Id: <56ce06f4dd6764ec1ea486430432067949869a73.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/12] mdadm: upgrade to 3.2.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 12:32:42 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../mdadm/{mdadm_3.2.5.bb => mdadm_3.2.6.bb}       |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.5.bb => mdadm_3.2.6.bb} (86%)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb b/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
similarity index 86%
rename from meta/recipes-extended/mdadm/mdadm_3.2.5.bb
rename to meta/recipes-extended/mdadm/mdadm_3.2.6.bb
index 61846f4..7b6a6c7 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.6.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://mdadm-3.2.2_fix_for_x32.patch \
 	  "
 
-SRC_URI[md5sum] = "83ba4a6249ae24677e915e44c9cfcc58"
-SRC_URI[sha256sum] = "5ae2bfd241c88601c1ef9072806248491e025fa09a388c40230d72d65eabbd3c"
+SRC_URI[md5sum] = "3e255dc71e5144bbcb872788ca647267"
+SRC_URI[sha256sum] = "c44ed3b31238b41cffe67caffaf45067d01e095de94988889ea8a94e22dc6c38"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.7.9.5



