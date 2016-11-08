Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17BE671A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:42 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 443477AC1D871
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:38 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:42 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:22 +0000
Message-ID: <20161108171235.41837-2-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 01/14] arch-mips: Add o32 in TUNE_FEATURES for MIPS32R6
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
X-List-Received-Date: Tue, 08 Nov 2016 17:12:43 -0000
Content-Type: text/plain

mips32r6 tunings should have o32 ABI flag in TUNE_FEATURES

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---

Applies to Morty as well
---
 meta/conf/machine/include/tune-mips32r6.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32r6.inc b/meta/conf/machine/include/tune-mips32r6.inc
index 4721319..dea33ea 100644
--- a/meta/conf/machine/include/tune-mips32r6.inc
+++ b/meta/conf/machine/include/tune-mips32r6.inc
@@ -9,21 +9,21 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', ' -march=mi
 # Base Tunes
 AVAILTUNES += "mipsisa32r6 mipsisa32r6el"
 
-TUNE_FEATURES_tune-mipsisa32r6 = "bigendian mipsisa32r6 fpu-hard r6"
+TUNE_FEATURES_tune-mipsisa32r6 = "o32 bigendian mipsisa32r6 fpu-hard r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa32r6 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6 = "mipsisa32r6"
 
-TUNE_FEATURES_tune-mipsisa32r6el = "fpu-hard mipsisa32r6 r6"
+TUNE_FEATURES_tune-mipsisa32r6el = "o32 fpu-hard mipsisa32r6 r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa32r6el = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6el = "mipsisa32r6el"
 
 # Soft Float
 AVAILTUNES += "mipsisa32r6-nf mipsisa32r6el-nf"
 
-TUNE_FEATURES_tune-mipsisa32r6-nf = "bigendian mipsisa32r6 r6"
+TUNE_FEATURES_tune-mipsisa32r6-nf = "o32 bigendian mipsisa32r6 r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa32r6-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6-nf = "mipsisa32r6-nf"
 
-TUNE_FEATURES_tune-mipsisa32r6el-nf = "mipsisa32r6 r6"
+TUNE_FEATURES_tune-mipsisa32r6el-nf = "o32 mipsisa32r6 r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa32r6el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa32r6el-nf = "mipsisa32r6el-nf"
-- 
2.10.2


