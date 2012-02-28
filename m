Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhV-0008QI-6f
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197490"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:30 -0800
Message-Id: <74cdc4e29635ce16ecf61ffe486e0f3d9bc132cc.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/36] bitbake.conf: add default value for TUNE_PKGARCH
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

Add a default value for TUNE_PKGARCH. This let's us use
the following:

TUNE_PKGARCH_tune-ppce500

Instead of scanning over variables and using bitbake internal
functions to create a valid value here.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/bitbake.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9ed4b6c..8cbcaa6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -95,6 +95,7 @@ TUNE_CCARGS ??= ""
 TUNE_LDARGS ??= ""
 TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
+TUNE_PKGARCH ??= "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 
-- 
1.7.7.6



