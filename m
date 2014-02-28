Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 285E16F281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064796"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:19 +0000
Message-Id: <0a64c32d9d12ea5e190a10143afbc23ba3375c59.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] ethtool: upgrade to 3.13
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:29 -0000

LIC_FILES_CHKSUM changed due to updating the COPYING license text
(still GPLv2, but new FSF address, some minor formatting changes,
reference to "GNU Library General Public License" -> "GNU Lesser
General Public License".

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/ethtool/{ethtool-3.12.1 => ethtool}/run-ptest | 0
 .../recipes-extended/ethtool/{ethtool_3.12.1.bb => ethtool_3.13.bb} | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool-3.12.1 => ethtool}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.12.1.bb => ethtool_3.13.bb} (81%)

diff --git a/meta/recipes-extended/ethtool/ethtool-3.12.1/run-ptest b/meta/recipes-extended/ethtool/ethtool/run-ptest
similarity index 100%
rename from meta/recipes-extended/ethtool/ethtool-3.12.1/run-ptest
rename to meta/recipes-extended/ethtool/ethtool/run-ptest
diff --git a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb b/meta/recipes-extended/ethtool/ethtool_3.13.bb
similarity index 81%
rename from meta/recipes-extended/ethtool/ethtool_3.12.1.bb
rename to meta/recipes-extended/ethtool/ethtool_3.13.bb
index 6615009..adcb6db 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.13.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "A small utility for examining and tuning the settings of your eth
 HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest"
 
-SRC_URI[md5sum] = "5a1058efe8eb4f3473f5028967729078"
-SRC_URI[sha256sum] = "45190d70e5ce1b4d87def4f71fb5bf04f8a4f4dc5f9e0f38c49c16c462fb59d9"
+SRC_URI[md5sum] = "0c0c0558a403b478cd3f65dadc00470d"
+SRC_URI[sha256sum] = "68f6b6c9417e8ff3d3b5a8bc22fc4fe8846176ee7d7636e365ce6a2e7b1e44e9"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.8.5.3


