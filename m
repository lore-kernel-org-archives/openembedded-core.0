Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 322F071A21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:08:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9EA8dQ2013960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 03:08:39 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Oct 2016 03:08:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2016 03:08:36 -0700
Message-ID: <fc39e759f11507fa80ed2274f7ed9a6e66de6e39.1476439242.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1476439242.git.liezhi.yang@windriver.com>
References: <cover.1476439242.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] arch-mips.inc: remove duplicates from PACKAGE_ARCHS
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
X-List-Received-Date: Fri, 14 Oct 2016 10:08:38 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemumips64"
DEFAULTTUNE = "mips64-o32"

$ bitbake linux-yocto
ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: mips64-o32

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 50c4c82..6069ca1 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -118,7 +118,7 @@ AVAILTUNES += "mips64-o32 mips64el-o32"
 TUNE_FEATURES_tune-mips64-o32 = "o32 bigendian fpu-hard"
 BASE_LIB_tune-mips64-o32 = "lib"
 MIPSPKGSFX_VARIANT_tune-mips64-o32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips mips64-o32 mips64-o32"
+PACKAGE_EXTRA_ARCHS_tune-mips64-o32 = "mips mips64-o32"
 
 TUNE_FEATURES_tune-mips64el-o32 = "o32 fpu-hard"
 BASE_LIB_tune-mips64el-o32 = "lib"
-- 
2.9.0


