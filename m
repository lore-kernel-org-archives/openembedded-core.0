Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8792570383
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 15:36:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2014 08:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,618,1400050800"; d="scan'208";a="558373877"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2014 08:36:39 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 18:36:28 +0300
Message-Id: <4a54173d68bf7ba1534816aec71c592b6622ccd2.1404747336.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404747336.git.cristian.iorga@intel.com>
References: <cover.1404747336.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1404747336.git.cristian.iorga@intel.com>
References: <cover.1404747336.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] ofono: upgrade to 1.15
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
X-List-Received-Date: Mon, 07 Jul 2014 15:36:53 -0000

Bug fixes;
Add support for Handsfree subscriber number feature;
Add support for Handsfree multiple DTMF characters;
Add support for PAP authentication.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.14.bb => ofono_1.15.bb} (50%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.14.bb b/meta/recipes-connectivity/ofono/ofono_1.15.bb
similarity index 50%
rename from meta/recipes-connectivity/ofono/ofono_1.14.bb
rename to meta/recipes-connectivity/ofono/ofono_1.15.bb
index dea5d88..8462a28 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.15.bb
@@ -1,13 +1,11 @@
 require ofono.inc
 
-PR = "r1"
-
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
 
-SRC_URI[md5sum] = "8bc398d86642408cc71d039f59c61538"
-SRC_URI[sha256sum] = "84d28d37cbc47129628a78bf3e17323af1636dceb2494511dd44caa829fb277f"
+SRC_URI[md5sum] = "4d03de85239d8100dc7721bf0dad2bd2"
+SRC_URI[sha256sum] = "978807a05e8904eb4e57d6533ed71e75676a55fa3819a39fe2c878f45dbf7af6"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.9.1


