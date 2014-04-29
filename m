Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CAEDA65D2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596676"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:09 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:45 +0300
Message-Id: <a2e46c0068330b9d66160132365f02f55d530a76.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/12] xserver-xorg: upgrade to 1.15.1
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:13 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...erver-xorg_1.15.0.bb => xserver-xorg_1.15.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.0.bb => xserver-xorg_1.15.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
index 1f9fa04..6a4168e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
@@ -8,8 +8,8 @@ SRC_URI += "file://crosscompile.patch \
             file://xorg-CVE-2013-6424.patch \
            "
 
-SRC_URI[md5sum] = "c2ace3697b32414094cf8c597c39d7d9"
-SRC_URI[sha256sum] = "613b2f2e7ee2a06d2f8e862c836dc70d319c52f1537749e027398f40086aabb8"
+SRC_URI[md5sum] = "e4c70262ed89764be8f8f5d699ed9227"
+SRC_URI[sha256sum] = "626db6882602ebe1ff81f7a4231c7ccc6ceb5032f2b5b3954bf749e1567221e2"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.7.9.5


