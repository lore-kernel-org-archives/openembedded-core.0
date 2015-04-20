Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5293C73D8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384584"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:07 +0100
Message-Id: <6c4fca39dcd06ef274f40e08f2cc4ab14e63622b.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429548323.git.paul.eggleton@linux.intel.com>
References: <cover.1429548323.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] classes/populate_sdk_ext: add warning against editing configuration
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

It may be tempting to edit the configuration of the encapsulated version
of the build system, however that is not the way it is intended to be
used, so add a warning against doing this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 17a8e8c..44b926e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -91,6 +91,11 @@ python copy_buildsystem () {
     # Create bblayers.conf
     bb.utils.mkdirhier(baseoutpath + '/conf')
     with open(baseoutpath + '/conf/bblayers.conf', 'w') as f:
+        f.write('# WARNING: this configuration has been automatically generated and in\n')
+        f.write('# most cases should not be edited. If you need more flexibility than\n')
+        f.write('# this configuration provides, it is strongly suggested that you set\n')
+        f.write('# up a proper instance of the full build system and use that instead.\n\n')
+
         f.write('LCONF_VERSION = "%s"\n\n' % d.getVar('LCONF_VERSION'))
         f.write('BBPATH = "$' + '{TOPDIR}"\n')
         f.write('SDKBASEMETAPATH = "$' + '{TOPDIR}"\n')
@@ -102,6 +107,11 @@ python copy_buildsystem () {
 
     # Create local.conf
     with open(baseoutpath + '/conf/local.conf', 'w') as f:
+        f.write('# WARNING: this configuration has been automatically generated and in\n')
+        f.write('# most cases should not be edited. If you need more flexibility than\n')
+        f.write('# this configuration provides, it is strongly suggested that you set\n')
+        f.write('# up a proper instance of the full build system and use that instead.\n\n')
+
         f.write('INHERIT += "%s"\n\n' % 'uninative')
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
 
-- 
2.1.0


