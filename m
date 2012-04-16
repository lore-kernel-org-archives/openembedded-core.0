Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SJsK3-0004af-Lp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:14:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2012 13:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="130306130"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 16 Apr 2012 13:05:26 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 13:10:32 -0700
Message-Id: <f21050583e1ff9e045767afab27bef48028a3d6c.1334606582.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334606582.git.elizabeth.flanagan@intel.com>
References: <cover.1334606582.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1334606582.git.elizabeth.flanagan@intel.com>
References: <cover.1334606582.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/2] core-image-sato-sdk: typo in DESCRIPTION
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
X-List-Received-Date: Mon, 16 Apr 2012 20:14:51 -0000

Fix for a minor type in DESCRIPTION

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 6dfd470..eed1698 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -3,7 +3,7 @@
 #
 DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
-form a standalone SD."
+form a standalone SDK."
 
 IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
 EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
-- 
1.7.1



