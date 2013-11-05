Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2748A6D6F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 10:15:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 02:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422445339"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.90])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 02:15:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 10:15:19 +0000
Message-Id: <bcc7a64f3fa8d0de87abdec591d42ef1a45d13e5.1383646398.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383646398.git.paul.eggleton@linux.intel.com>
References: <cover.1383646398.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383646398.git.paul.eggleton@linux.intel.com>
References: <cover.1383646398.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] zisofs-tools-native: add missing DEPENDS on zlib-native
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
X-List-Received-Date: Tue, 05 Nov 2013 10:15:30 -0000

zisofs-tools links against zlib.

Fixes [YOCTO #5420].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
index 1501307..02accf6 100644
--- a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
+++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
@@ -7,6 +7,8 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+DEPENDS = "zlib-native"
+
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${PV}.tar.bz2/2d0ed8c9a1f60b45f949b136f9be1f6c/zisofs-tools-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
-- 
1.8.1.2


