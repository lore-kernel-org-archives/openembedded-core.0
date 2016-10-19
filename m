Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ACA6971A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266898"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:39 +0300
Message-Id: <5c392036756786b62d12d0e319a356656d4ab30e.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/19] pigz: fix upstream version check
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/pigz/pigz.inc      | 2 --
 meta/recipes-extended/pigz/pigz_2.3.3.bb | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 86f434c..978f905 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -7,8 +7,6 @@ HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 
-SRC_URI = "http://zlib.net/${BPN}/${BP}.tar.gz"
-
 PROVIDES_class-native += "gzip-native"
 
 DEPENDS = "zlib"
diff --git a/meta/recipes-extended/pigz/pigz_2.3.3.bb b/meta/recipes-extended/pigz/pigz_2.3.3.bb
index 9e97273..b4fe831 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.3.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.3.bb
@@ -1,7 +1,7 @@
 require pigz.inc
 LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
 
-UPSTREAM_CHECK_URI := "${SRC_URI}"
+UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
 SRC_URI += "file://link-order.patch"
 
-- 
2.9.3


