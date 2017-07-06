Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DBFB477BD9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 21:03:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 06 Jul 2017 14:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,319,1496127600"; d="scan'208";a="1169411956"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2017 14:03:11 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:03:08 -0700
Message-Id: <4dabc888e55ec24bfbcf1d031ff6cb30329ee957.1499373694.git.jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1499373694.git.jose.perez.carranza@linux.intel.com>
References: <cover.1499373694.git.jose.perez.carranza@linux.intel.com>
Subject: [PATCH 2/2] testimage: Use the renamed buildlzip
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
X-List-Received-Date: Thu, 06 Jul 2017 21:03:10 -0000

From: Khem Raj <raj.khem@gmail.com>

buildiptables has been replaced with buildlzip

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/testimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fa2d6fd9f4..0c4a84e1119 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
     connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
     connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
@@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
 
 # qemumips is quite slow and has reached the timeout limit several times on the YP build cluster,
 # mitigate this by removing build tests for qemumips machines.
-MIPSREMOVE ??= "buildcpio buildiptables buildgalculator"
+MIPSREMOVE ??= "buildcpio buildlzip buildgalculator"
 DEFAULT_TEST_SUITES_remove_qemumips = "${MIPSREMOVE}"
 DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
 
-- 
2.12.0


