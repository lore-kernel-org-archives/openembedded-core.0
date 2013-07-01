Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A6D566AF05
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 11:02:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 04:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,973,1363158000"; d="scan'208";a="262405576"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.225])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jul 2013 04:02:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 12:01:53 +0100
Message-Id: <1372676513-1743-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] python-native: add python-codecs-native to RPROVIDES
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
X-List-Received-Date: Mon, 01 Jul 2013 11:02:02 -0000

This is now required by python-argparse-native as of OE-Core revision
8d0e84bdfaf63ad61be7b015dd55dacccfa9132c.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 39d53bb..ef891b2 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -23,7 +23,7 @@ FILESPATH = "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
 
 inherit native
 
-RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-core-native"
+RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
 
-- 
1.8.1.2


