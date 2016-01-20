Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5C165CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 16:32:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 20 Jan 2016 08:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="897440878"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2016 08:32:37 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 16:33:27 +0000
Message-Id: <8a9e3e9cbe3a314c2ad9a2d5f7bfde4752cf2cfa.1453307585.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453307585.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453307585.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python-nose: Fixes python-unittest-native RPROVIDES error after upgrade
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
X-List-Received-Date: Wed, 20 Jan 2016 16:32:39 -0000

The python-nose upgrade to 1.3.7 required a new unittest runtime dependency
after this, bitbake cant find a runtime provider for it when trying to build
python-nose-native, this patch makes python-native RPROVIDES python-unittest-native
to fix the issue.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index 34f5c29..4c204a4 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -25,7 +25,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:"
 
 inherit native
 
-RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native"
+RPROVIDES += "python-distutils-native python-compression-native python-textutils-native python-codecs-native python-core-native python-unittest-native"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
 
-- 
1.8.4.5


