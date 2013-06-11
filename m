Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34AEA6A9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680073"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:42 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:31 +0300
Message-Id: <86a459ca2b6cebdfa0fa70460200d419af95ba58.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/7] xf86-video-intel: upgrade to 2.21.9
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:42 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
index 7e65f9f..6112089 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.6.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
@@ -21,5 +21,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "a4f002f50b370fe550231c9b33e12399"
-SRC_URI[sha256sum] = "c3ef371e72544350c878d5373b2e7f49b8a0e253f9b63cb1ce2881180b45f8d9"
+SRC_URI[md5sum] = "fd96651b0d90dc7e977b23fd54f2c3e8"
+SRC_URI[sha256sum] = "1359cbc9e494a284faa52d1db83e7388cb8ab590b660e29e78e6e7f5ee7ff189"
-- 
1.7.9.5


