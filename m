Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6268D616F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243735"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:46 +0300
Message-Id: <fd6e252155ed3646c0e474647c214f4dc2fb7136.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378824959.git.laurentiu.palcu@intel.com>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/5] meta-environment: change package name to include MACHINE
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:52 -0000

Currently, the package name contains just the TRANSLATED_TARGET_ARCH.
When compiling the toolchain for two machines, belonging to the same
architecture (for example: qemuarm and beagleboard), this package gets
overwritten and adt-installer repo will contain just one
meta-environment package... This leads to situations like installing the
toolchain for qemuarm and end up with meta-environment package with
beagleboard cpu options.

[YOCTO #4783]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 9731300..3a71a9b 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -37,7 +37,7 @@ do_install() {
     install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
 }
 
-PN = "meta-environment-${TRANSLATED_TARGET_ARCH}"
+PN = "meta-environment-${MACHINE}"
 PACKAGES = "${PN}"
 FILES_${PN}= " \
     ${SDKPATH}/* \
-- 
1.7.9.5


