Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tv8Mf-0007Ou-5k
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 16:23:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2013 07:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="277141048"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2013 07:08:16 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 17:08:48 +0200
Message-Id: <87737902312b2d7f67b799d6da95e15ceca9cb9f.1358262293.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358262293.git.constantinx.musca@intel.com>
References: <cover.1358262293.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358262293.git.constantinx.musca@intel.com>
References: <cover.1358262293.git.constantinx.musca@intel.com>
Subject: [PATCH v3 6/6] tune-ppc603e: add BASE_LIB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 15:23:54 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/conf/machine/include/tune-ppc603e.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index 6557c1d..2cfd342 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -7,6 +7,7 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-mcpu=603e", "
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
+BASE_LIB_tune-ppc603e = "lib"
 TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
-- 
1.7.11.7



