Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuSQ8-0001eX-16
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:59:48 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QuSLd-0002Mp-Eq
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:55:09 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 17:55:08 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313772909.6733.306.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] mips32: add mips32el tuning
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
X-List-Received-Date: Fri, 19 Aug 2011 16:59:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This makes building for little-endian mips32 slightly more convenient.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/conf/machine/include/tune-mips32.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index 45792d8..4a5f0fa 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -6,6 +6,9 @@ TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNE_CONFLICTS[mips32] = "n64 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
 
-AVAILTUNES += "mips32"
+AVAILTUNES += "mips32 mips32el"
 TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
 PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips"
+TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
+PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel"
+
-- 
1.7.4.1





