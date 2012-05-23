Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWK-0002y6-Jg
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:22:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416687"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:10:53 +0300
Message-Id: <3d3ee51001c4718c0553a783adf34a830f685108.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/19] mdadm: upgrade to 3.2.5
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
X-List-Received-Date: Wed, 23 May 2012 13:22:32 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../mdadm/{mdadm_3.2.3.bb => mdadm_3.2.5.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.3.bb => mdadm_3.2.5.bb} (85%)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.3.bb b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
similarity index 85%
rename from meta/recipes-extended/mdadm/mdadm_3.2.3.bb
rename to meta/recipes-extended/mdadm/mdadm_3.2.5.bb
index 17cdd41..2d7e1d0 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
@@ -14,8 +14,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
 	    file://mdadm-3.2.2_fix_for_x32.patch \
 	  "
 
-SRC_URI[md5sum] = "d789d6ecb9c1d5ebcc64f0fc52bca92f"
-SRC_URI[sha256sum] = "0ff49a04c6250834ce1b5be5a1581532e70e2221a87e1eedec46d6656b37ab40"
+SRC_URI[md5sum] = "83ba4a6249ae24677e915e44c9cfcc58"
+SRC_URI[sha256sum] = "5ae2bfd241c88601c1ef9072806248491e025fa09a388c40230d72d65eabbd3c"
 
 CFLAGS += "-fno-strict-aliasing"
 
-- 
1.7.9.5



