Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhT-0008Qi-NL
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:12 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197485"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:27 -0800
Message-Id: <46cbedeaa5a7c19e947ff2b218f4714687862277.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/36] arch-powerpc{, 64}.inc: update/add PACKAGE_EXTRA_ARCHS for powerpc/powerpc64
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:13 -0000

From: Matthew McClintock <msm@freescale.com>

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    4 +---
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 8347f86..c9b2829 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -30,6 +30,4 @@ BASE_LIB_tune-powerpc-nf = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
 TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
 BASE_LIB_tune-powerpc = "lib"
-PACKAGE_EXTRA_ARCHS_tune-powerpc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} powerpc"
-
-
+PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 7ef8ddc..48cd08e 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -10,3 +10,4 @@ TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "",
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
 BASE_LIB_tune-powerpc64 = "lib64"
+PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
-- 
1.7.7.6



