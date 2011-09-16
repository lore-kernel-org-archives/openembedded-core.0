Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R4NVa-0001WR-1N
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 03:46:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Sep 2011 18:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,391,1312182000"; d="scan'208";a="17685110"
Received: from unknown (HELO [10.255.14.162]) ([10.255.14.162])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Sep 2011 18:41:10 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 20:40:58 -0500
Message-ID: <1316137258.2384.72.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 3/5] liberation-fonts_1.06: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 01:46:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

RDEPENDS is package-specific, so add ${PN} to it.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
index e1f9ffb..e8239c1 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
@@ -9,7 +9,7 @@ SECTION = "x11/fonts"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "all"
-RDEPENDS = "fontconfig-utils"
+RDEPENDS_${PN} = "fontconfig-utils"
 PE = "1"
 PR = "r0"
 
-- 
1.7.0.4





