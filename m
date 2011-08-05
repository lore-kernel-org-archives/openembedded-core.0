Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHok-0001bH-H4
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 03:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="35679516"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 03:35:27 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:15 +0800
Message-Id: <a6ffbc82edee2699f74d9d49676ab8f37acd8658.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 5/6] ghostscript: Fixed the incorrect DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 10:39:50 -0000

[YOCTO #1337]
Using ghostscript-native instead of ${PN}-native in DEPENDS to correct
the invalid DEPENDS in multilib cases.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../ghostscript/ghostscript_9.02.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
index 28c6c9e..2e46734 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.02.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
 PR = "r4"
 
-DEPENDS = "${PN}-native tiff jpeg fontconfig cups"
+DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""
 
 SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.bz2"
-- 
1.7.0.4



