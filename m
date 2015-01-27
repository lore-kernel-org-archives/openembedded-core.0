Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C815E72C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 23:26:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2015 15:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,477,1418112000"; d="scan'208";a="668662977"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.43])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 15:26:48 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 17:26:31 -0600
Message-Id: <9f0a61cbb1acb23cf34980e86822331715ce5131.1422400915.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422400915.git.alejandro.hernandez@linux.intel.com>
References: <cover.1422400915.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] xmlto-native: fixes slow creation of yocto docs
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
X-List-Received-Date: Tue, 27 Jan 2015 23:26:55 -0000

Forces native RDEPENDS of xmlto-native to be built and installed

since those files are required when creating yocto-docs

if not found, they are downloaded from upstream everytime

significant time difference is achieved.

[YOCTO #7148]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
index 2698b1c..bd57b28 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
@@ -36,3 +36,4 @@ do_install_append() {
     create_wrapper ${D}/${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
 }

+do_populate_sysroot[rdeptask] = "do_populate_sysroot"
-- 
1.9.1


