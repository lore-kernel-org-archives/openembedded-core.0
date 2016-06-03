Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 386A177444
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440146"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:42 +0300
Message-Id: <ed9d70c5c97dfe2d6ad7224927e393979f7da674.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/25] tzcode, tzdata: fix upstream version check
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2016d.bb | 1 +
 meta/recipes-extended/tzdata/tzdata_2016d.bb        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
index 647ce2d..4b5ab86 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
 SRC_URI[tzcode.md5sum] = "06fc6fc111cd8dd681abdc5326529afd"
 SRC_URI[tzcode.sha256sum] = "a8f33d6f87aef7e109e4769fc7f6e63637d52d07ddf6440a1a50df3d9a34e0ca"
diff --git a/meta/recipes-extended/tzdata/tzdata_2016d.bb b/meta/recipes-extended/tzdata/tzdata_2016d.bb
index 627a31a..a525c8c 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016d.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
 DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
 SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
 SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
-- 
2.8.1


