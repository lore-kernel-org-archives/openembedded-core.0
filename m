Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmSEv-0002VG-Pg
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:11:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmSAq-0003AB-EK
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 17:06:56 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 16:06:55 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311865616.30326.450.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] tune-cortex{m1, m3, r4}: correct spelling of "cortex"
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
X-List-Received-Date: Thu, 28 Jul 2011 15:11:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise the test in TUNE_CCARGS will never match.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/machine/include/tune-cortexm1.inc |    2 +-
 meta/conf/machine/include/tune-cortexm3.inc |    2 +-
 meta/conf/machine/include/tune-cortexr4.inc |    3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 493025d..3eecd5b 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -6,6 +6,6 @@ TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", "-mtune=cortex-m1", "", d)}"
 
 AVAILTUNES += "cortexm1"
-TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} coretexm1"
+TUNE_FEATURES_tune-cortexm1 = "${TUNE_FEATURES_tune-armv7a} cortexm1"
 PACKAGE_EXTRA_ARCHS_tune-cortexm1 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at}"
 
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index f774fa6..85408eb 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -10,6 +10,6 @@ TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7m", "-march=armv7-m", "", d)}"
 
 AVAILTUNES += "cortexm3"
-TUNE_FEATURES_tune-cortexm3 = "armv7m vfp coretexm3"
+TUNE_FEATURES_tune-cortexm3 = "armv7m vfp cortexm3"
 PACKAGE_EXTRA_ARCHS_tune-cortexm3 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m"
 
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index 738f5af..8d2459f 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -10,6 +10,5 @@ TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m", "", d)}"
 
 AVAILTUNES += "cortexr4"
-TUNE_FEATURES_tune-cortexr4 = "armv7r vfp coretexr4"
+TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
 PACKAGE_EXTRA_ARCHS_tune-cortexr4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r"
-
-- 
1.7.4.1





