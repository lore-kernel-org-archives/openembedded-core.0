Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRero-000421-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203811"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:42 -0700
Message-Id: <5f8e85c45df6c39b598b086a3338e39a4ec353f2.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/32] mailx: update to 12.5
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mailx/{mailx_12.4.bb => mailx_12.5.bb}         |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/mailx/{mailx_12.4.bb => mailx_12.5.bb} (66%)

diff --git a/meta/recipes-extended/mailx/mailx_12.4.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
similarity index 66%
rename from meta/recipes-extended/mailx/mailx_12.4.bb
rename to meta/recipes-extended/mailx/mailx_12.5.bb
index 7abce7a..171e892 100644
--- a/meta/recipes-extended/mailx/mailx_12.4.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -12,14 +12,15 @@ LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-2.diff.gz;name=patch \
+           ${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}-1.diff.gz;name=patch \
           "
-SRC_URI[archive.md5sum] = "17b8ff86795a118b199e041b66b7d1aa"
-SRC_URI[archive.sha256sum] = "946d822cbff70df2ecf5b78c8347fdd01fdc5873f7a7cf55932b3e07030fa370"
-SRC_URI[patch.md5sum] = "3233d1a85fcb4dcde689132a1bba7fc9"
-SRC_URI[patch.sha256sum] = "b15fac77973b7d787469e51bbbeae7ddbe922b02a0c23208b9779ce837eba861"
 
-S = "${WORKDIR}/mailx-${PV}"
+SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
+SRC_URI[archive.sha256sum] = "015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad"
+SRC_URI[patch.md5sum] = "f466281336183be673bf136dd7096662"
+SRC_URI[patch.sha256sum] = "aaf2a4bbf145e5ca9cdeb0843091ec8cc01df6c9568c997207a5e97b4dc5ba43"
+
+S = "${WORKDIR}/heirloom-mailx-${PV}"
 
 inherit autotools
 
-- 
1.7.3.4



