Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF5D73D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 18:13:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2015 11:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,571,1422950400"; d="scan'208";a="708273657"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.80])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2015 11:13:27 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 13:13:26 -0500
Message-Id: <c596916da81059fb97047e6c43fb713c0946650a.1428948636.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428948636.git.alejandro.hernandez@linux.intel.com>
References: <cover.1428948636.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3: Change python BASEVERSION to 3.4
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
X-List-Received-Date: Mon, 13 Apr 2015 18:13:34 -0000

Changes PYTHON_BASEVERSION = 3.4 to fix errors when installing
python3-distribute and probably other libraries

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/distutils3-base.bbclass        | 2 +-
 meta/classes/distutils3-native-base.bbclass | 2 +-
 meta/classes/python3native.bbclass          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index d4d25dc..af3aa00 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,7 +1,7 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 PYTHON_ABI = "m"
 
 inherit distutils-common-base python3native
diff --git a/meta/classes/distutils3-native-base.bbclass b/meta/classes/distutils3-native-base.bbclass
index ed3fe54..1117101 100644
--- a/meta/classes/distutils3-native-base.bbclass
+++ b/meta/classes/distutils3-native-base.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 PYTHON_ABI = "m"
 
 inherit distutils-native-base
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index f86374f..cf83017 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,4 +1,4 @@
-PYTHON_BASEVERSION = "3.3"
+PYTHON_BASEVERSION = "3.4"
 
 inherit python-dir
 
-- 
1.9.1


