Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2F361485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:34:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 07:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364215820"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 07:34:28 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 17:34:22 +0300
Message-Id: <a9f674746a1cbeb8aa9dc83b40afe3dfcb4ef2bf.1372861799.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] connman: make xuser a member of 'shutdown' group
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
X-List-Received-Date: Wed, 03 Jul 2013 14:34:28 -0000

Additionaly, make it a member of 'input' group too. That's for aligning
the user creation with xserver-nodm-init.

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index e6584ff..728787f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -64,7 +64,7 @@ SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--create-home \
-                       --groups video,tty,audio \
+                       --groups video,tty,audio,input,shutdown \
                        --user-group xuser"
 
 inherit autotools gtk-doc pkgconfig systemd update-rc.d useradd
-- 
1.7.9.5


