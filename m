Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SNv6P-000365-9R
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 02:01:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3RNpnYJ014379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 16:51:49 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Apr 2012 16:51:49 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 18:51:46 -0500
Message-ID: <8fd6ef92079e16fdf31fe8b6f3194df7a858ed71.1335569869.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335569869.git.peter.seebach@windriver.com>
References: <cover.1335569869.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tune-sh4.inc: Fix spelling of big-endian feature set
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
X-List-Received-Date: Sat, 28 Apr 2012 00:01:29 -0000
Content-Type: text/plain

In tune-sh3, tune-xscale, and tune-sh4, several FEATURES lines referred
to nonexistent features like "sh3eb" when they should have referred to "sh3
bigendian" or the like.  Caught by the TUNEVALID sanity check.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/conf/machine/include/tune-sh3.inc    |    2 +-
 meta/conf/machine/include/tune-sh4.inc    |    4 ++--
 meta/conf/machine/include/tune-xscale.inc |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index 816c9c4..70bb10b 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -11,7 +11,7 @@ TUNE_ARCH_tune-sh3 = "sh3"
 TUNE_PKGARCH_tune-sh3 = "sh3"
 PACKAGE_EXTRA_ARCHS_tune-sh3 = "sh sh3"
 
-TUNE_FEATURES_tune-sh3eb = "sh3eb"
+TUNE_FEATURES_tune-sh3eb = "sh3 bigendian"
 TUNE_ARCH_tune-sh3eb = "sh3eb"
 TUNE_PKGARCH_tune-sh3eb = "sh3eb"
 PACKAGE_EXTRA_ARCHS_tune-sh3eb = "sheb sh3eb"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index f971f23..00cfc3d 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -18,7 +18,7 @@ TUNE_ARCH_tune-sh4 = "sh4"
 TUNE_PKGARCH_tune-sh4 = "sh4"
 PACKAGE_EXTRA_ARCHS_tune-sh4 = "sh sh4"
 
-TUNE_FEATURES_tune-sh4eb = "sh4eb"
+TUNE_FEATURES_tune-sh4eb = "sh4 bigendian"
 TUNE_ARCH_tune-sh4eb = "sh4eb"
 TUNE_PKGARCH_tune-sh4eb = "sh4eb"
 PACKAGE_EXTRA_ARCHS_tune-sh4eb = "sheb sh4eb"
@@ -28,7 +28,7 @@ TUNE_ARCH_tune-sh4a = "sh4"
 TUNE_PKGARCH_tune-sh4a = "sh4a"
 PACKAGE_EXTRA_ARCHS_tune-sh4a = "sh sh4 sh4a"
 
-TUNE_FEATURES_tune-sh4aeb = "sh4aeb"
+TUNE_FEATURES_tune-sh4aeb = "sh4a bigendian"
 TUNE_ARCH_tune-sh4aeb = "sh4eb"
 TUNE_PKGARCH_tune-sh4aeb = "sh4aeb"
 PACKAGE_EXTRA_ARCHS_tune-sh4aeb = "sheb sh4eb sh4aeb"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 54f3727..80a3683 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -10,7 +10,7 @@ TUNE_FEATURES_tune-xscale = "${TUNE_FEATURES_tune-armv5te} xscale"
 PACKAGE_EXTRA_ARCHS_tune-xscale = "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
 
 AVAILTUNES += "xscale-be"
-TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale-be"
+TUNE_FEATURES_tune-xscale-be = "${TUNE_FEATURES_tune-armv5teb} xscale bigendian"
 PACKAGE_EXTRA_ARCHS_tune-xscale-be = "${PACKAGE_EXTRA_ARCHS_tune-armv5teb}"
 
 # webkit-gtk has alignment issues with double instructions on armv5 so
-- 
1.7.0.4



