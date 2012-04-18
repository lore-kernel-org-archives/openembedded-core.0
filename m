Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SKTQe-0008L6-BO
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 13:52:08 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 13:42:37 +0200
Message-Id: <1334749357-10162-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] tune-mips32.inc: remove non-existent archs from PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Wed, 18 Apr 2012 11:52:08 -0000

* Adding those broke opkg, because no packages for these archs get
  generated, when building only for mips32 machines.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/conf/machine/include/tune-mips32.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 93ed5ee..73871e7 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -10,16 +10,16 @@ AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips32"
 
 TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
+PACKAGE_EXTRA_ARCHS_tune-mips32el = "mips32el"
 
 TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
+PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips32-nf"
 
 TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
 MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
+PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mips32el-nf"
-- 
1.7.5.4



