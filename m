Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF547872C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 06:14:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 22:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,482,1511856000"; d="scan'208";a="18527118"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2018 22:14:14 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 14:08:57 +0800
Message-Id: <1518156537-58531-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1518150301-33101-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2] bmap-tools: change SRC_URI to use tarball instead
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
X-List-Received-Date: Fri, 09 Feb 2018 06:14:14 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Tarball sources can be checksummed and are faster to download.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 70b6e91..3f15e12 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -9,10 +9,10 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/intel/bmap-tools.git"
-SRCREV = "9dad724104df265442226972a1e310813f9ffcba"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/v${PV}/${BP}.tgz"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "883420183611aa137cbaf68a91ef0d7e"
+SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f226c0a"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools"
 
-- 
2.7.4


