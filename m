Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B85117843F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 04:30:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 20:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,481,1511856000"; d="scan'208";a="16793692"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 08 Feb 2018 20:30:24 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 12:25:00 +0800
Message-Id: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] bmap-tools: change SRC_URI to use tarball instead
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
X-List-Received-Date: Fri, 09 Feb 2018 04:30:24 -0000

Tarball sources can be checksummed and are faster to download.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 70b6e91..6975acb 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -9,10 +9,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/bmap-tools.git"
-SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tgz"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
+SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools"
 
-- 
2.7.4


