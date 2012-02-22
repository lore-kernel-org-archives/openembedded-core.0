Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S04zS-0004uy-5E
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 06:43:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 21:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109294427"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 21:34:18 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 13:33:43 +0800
Message-Id: <8c0ff469780d2c36f02e18569055dcd75bbe7733.1329888524.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1329888524.git.edwin.zhai@intel.com>
References: <cover.1329888524.git.edwin.zhai@intel.com>
Subject: [PATCH 2/3] texi2html: Fix for multilib
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
X-List-Received-Date: Wed, 22 Feb 2012 05:43:46 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-extended/texi2html/texi2html_5.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index 068f8bc..02f3fe1 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r0"
 
-SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2 \
+SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2 \
                file://fix_gettext_version.patch"
 
 SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
-- 
1.7.1



