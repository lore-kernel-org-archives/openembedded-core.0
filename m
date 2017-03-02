Return-Path: <Zubair.Kakakhel@imgtec.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Mar 2017 13:51:19 UTC
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9D072F87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:51:19 +0000 (UTC)
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id E69D2A05AD701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:36:15 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Mar 2017 13:36:18 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 13:36:14 +0000
Message-ID: <20170302133614.2898-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] arch-mips: Fix tune configuration for mipsisa64r6el-n32-nf
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
X-List-Received-Date: Thu, 02 Mar 2017 13:51:22 -0000
Content-Type: text/plain

Big endian flag marked in a little endian configuration by mistake.
Remove it.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/conf/machine/include/tune-mips64r6.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/tune-mips64r6.inc
index 2289fb4..4fe3eed 100644
--- a/meta/conf/machine/include/tune-mips64r6.inc
+++ b/meta/conf/machine/include/tune-mips64r6.inc
@@ -52,7 +52,7 @@ BASE_LIB_tune-mipsisa64r6-nf-n32 = "lib32"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6-nf-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf-n32 = "mipsisa64r6-nf-n32"
 
-TUNE_FEATURES_tune-mipsisa64r6el-nf-n32 = "bigendian r6 n32 mipsisa64r6"
+TUNE_FEATURES_tune-mipsisa64r6el-nf-n32 = "r6 n32 mipsisa64r6"
 BASE_LIB_tune-mipsisa64r6el-nf-n32 = "lib32"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el-nf-n32 = "mipsisa64r6el-nf-n32"
-- 
2.10.2


