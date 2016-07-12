Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 741BD606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:15:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2016 04:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="1005225704"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 04:15:00 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:14:54 +0300
Message-Id: <98375727e9b723d9b97eaac48b62b8494fe4ab96.1468310468.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
References: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 4/5] python3-native: Add "io" to rprovides
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
X-List-Received-Date: Tue, 12 Jul 2016 11:15:00 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
index fbe04c6..81ea087 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
@@ -41,7 +41,7 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
-RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native python3-importlib-native"
+RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native python3-importlib-native python3-io-native"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
-- 
2.1.4


