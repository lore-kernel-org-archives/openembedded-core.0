Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 37B946B00C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:58:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 03:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,994,1363158000"; d="scan'208";a="364727522"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2013 03:58:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 13:58:01 +0300
Message-Id: <4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
References: <9b803f18c25bc5b0bcab26f6bea6caacb6784d47.1372933905.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 2/5] xuser-account: create separate recipe for xuser creation
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
X-List-Received-Date: Thu, 04 Jul 2013 10:58:12 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../user-creation/xuser-account_0.1.bb             |   27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
new file mode 100644
index 0000000..7430d2a
--- /dev/null
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Creates an 'xuser' account"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = ""
+
+inherit useradd
+
+do_configure() {
+    :
+}
+
+do_compile() {
+    :
+}
+
+do_install() {
+    :
+}
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system shutdown"
+USERADD_PARAM_${PN} = "--create-home \
+                       --groups video,tty,audio,input,shutdown \
+                       --user-group xuser"
+
+ALLOW_EMPTY_${PN} = "1"
-- 
1.7.9.5


