Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B41896D453
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:46:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 Oct 2013 08:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,586,1378882800"; d="scan'208";a="418567057"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 08:46:42 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:46:31 +0200
Message-Id: <9cdec78a4c96333c4903b58de3c0577cf455f859.1382975017.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382975017.git.laurentiu.palcu@intel.com>
References: <cover.1382975017.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382975017.git.laurentiu.palcu@intel.com>
References: <cover.1382975017.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] meta-toolchain-qt: put QT_CONF_PATH in environment script
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
X-List-Received-Date: Mon, 28 Oct 2013 15:46:48 -0000

This will allow apps using QLibraryInfo class to find qt.conf.

[YOCTO #5339]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 14591a8..edebfe7 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -24,6 +24,7 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+    echo 'export QT_CONF_PATH=${SDKPATHNATIVE}/${sysconfdir}' >> $script
 
     # make a symbolic link to mkspecs for compatibility with Nokia's SDK
     # and QTCreator
-- 
1.7.9.5


