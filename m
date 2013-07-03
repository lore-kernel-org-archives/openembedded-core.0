Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 383036AFF4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:34:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 07:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364215829"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 07:34:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 17:34:23 +0300
Message-Id: <efc52b46587261c3385a0aa389b06fd45ee27d66.1372861799.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/4] xserver-nodm-init: make xuser a member of 'shutdown' group
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
X-List-Received-Date: Wed, 03 Jul 2013 14:34:29 -0000

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../x11-common/xserver-nodm-init.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index d2797a9..f4b622d 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -34,6 +34,6 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 # USERADD_PARAM is in sync with the one in connman.inc
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio,input \
+                       --groups video,tty,audio,input,shutdown \
                        --user-group xuser"
 
-- 
1.7.9.5


