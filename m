Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E1F5671A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 14:47:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 07:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="97069101"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.140.209])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 07:47:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  8 May 2017 22:47:23 +0800
Message-Id: <1494254846-9382-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
References: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 1/4] man-pages: upgrade from 4.09 to 4.10
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
X-List-Received-Date: Mon, 08 May 2017 14:47:33 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_4.09.bb => man-pages_4.10.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.09.bb => man-pages_4.10.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.09.bb b/meta/recipes-extended/man-pages/man-pages_4.10.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.09.bb
rename to meta/recipes-extended/man-pages/man-pages_4.10.bb
index 55fc21e..de8d3b9 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.09.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.10.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "9e3c7b12a5fecda9a717a4bcc0ae3a67"
-SRC_URI[sha256sum] = "5fac324cefce0fbfae0df6c06ef3f6d6ab5227b9aad2a94f8657a0e3901f9185"
+SRC_URI[md5sum] = "fa03cff75c7cee5a0fd5db3456aea43a"
+SRC_URI[sha256sum] = "5995444d589a1ab83ae1220a4446ee09b3dadb6ce7037162ea75874ebcb2c040"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.7.4


