Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8712971997
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:28:18 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 0324AA261895D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 15:28:16 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 23 Sep 2016 15:28:19 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 15:28:08 +0100
Message-ID: <1474640888-55539-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] arch-mips: Add mips64-o32 tunes
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
X-List-Received-Date: Fri, 23 Sep 2016 14:28:22 -0000
Content-Type: text/plain

Add mips64 + o32 rootfs abi tune configurations

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index d3e83d1..28d3b51 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -103,3 +103,29 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
+
+# MIPS 64 + o32
+AVAILTUNES += "mips64-o32 mips64el-o32"
+
+TUNE_FEATURES_tune-mips64-o32 = "o32 bigendian fpu-hard"
+BASE_LIB_tune-mips64-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips mips64-o32 mips64-o32"
+
+TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
+BASE_LIB_tune-mips64el-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64el-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-o32 = "mipsel mips64el-o32 mips64el-o32"
+
+# MIPS 64 o32 and Soft Float
+AVAILTUNES += "mips64-nf-o32 mips64el-nf-o32"
+
+TUNE_FEATURES_tune-mips64-nf-o32 = "o32 bigendian"
+BASE_LIB_tune-mips64-nf-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64-nf-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64-nf-o32 = "mips-nf mips64-nf-o32"
+
+TUNE_FEATURES_tune-mips64el-nf-o32 = "o32"
+BASE_LIB_tune-mips64el-nf-o32 = "lib"
+MIPSPKGSFX_VARIANT_tune-mips64el-nf-o32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-o32 = "mipsel-nf mips64el-nf-o32"
-- 
1.9.1


