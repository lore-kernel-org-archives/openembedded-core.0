Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CB9886D1A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 20:47:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 13:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,588,1378882800"; d="scan'208";a="424168000"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2013 13:46:26 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 22:46:21 +0200
Message-Id: <37be54733b16c7a40f92ad0bd4d6734b53d5e6b7.1382992874.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382992874.git.laurentiu.palcu@intel.com>
References: <cover.1382992874.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1382992874.git.laurentiu.palcu@intel.com>
References: <cover.1382992874.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 2/2] meta-toolchain-qt: put QT_CONF_PATH in environment script
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
X-List-Received-Date: Mon, 28 Oct 2013 20:47:11 -0000

This will allow apps using QLibraryInfo class to find qt.conf.

[YOCTO #5339]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-qt/meta/meta-toolchain-qt.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-qt/meta/meta-toolchain-qt.inc
index 14591a8..c9bdeae 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
+++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
@@ -24,6 +24,7 @@ toolchain_create_sdk_env_script_append() {
     echo 'export OE_QMAKE_QDBUSXML2CPP=${QT_TOOLS_PREFIX}/qdbusxml2cpp4' >> $script
     echo 'export OE_QMAKE_QT_CONFIG=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export QMAKESPEC=${SDKTARGETSYSROOT}/${datadir}/${QT_DIR_NAME}/mkspecs/linux-g++' >> $script
+    echo 'export QT_CONF_PATH=${SDKPATHNATIVE}/${sysconfdir}/qt.conf' >> $script
 
     # make a symbolic link to mkspecs for compatibility with Nokia's SDK
     # and QTCreator
-- 
1.7.9.5


