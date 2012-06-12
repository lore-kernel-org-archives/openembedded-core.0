Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SeOE3-00065D-RE
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 12:21:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2012 03:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164558728"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2012 03:10:52 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:10:06 +0800
Message-Id: <166f99099dcb0dc790087ec4a17faa2c91725a08.1339495723.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
References: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1339495723.git.lianhao.lu@intel.com>
References: <cover.1339495723.git.lianhao.lu@intel.com>
Subject: [PATCH V2 2/3] core-image-sato-sdk: Replace dropbear by openssh.
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
X-List-Received-Date: Tue, 12 Jun 2012 10:21:28 -0000

Use openssh in core-image-sato-sdk to provide sftp-server service.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index eed1698..7f05332 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -5,7 +5,9 @@ DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
 
-IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
+SATO_SDK_IMAGE_FEATURES = "${@oe_filter_out('ssh-server-dropbear', '${SATO_IMAGE_FEATURES}', d)} ssh-server-openssh"
+
+IMAGE_FEATURES += "apps-console-core ${SATO_SDK_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
 
 LICENSE = "MIT"
-- 
1.7.0.4



