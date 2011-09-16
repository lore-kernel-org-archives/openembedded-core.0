Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4O7z-0002us-Vd
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:26:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2011 19:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,391,1312182000"; d="scan'208";a="54273826"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 19:20:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 19:20:48 -0700
Message-Id: <5a63d93341fdc5d71fa424a0c38201a620eb994c.1316139554.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
References: <cover.1316139554.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
References: <cover.1316139554.git.sgw@linux.intel.com>
Subject: [RC2 FIXES 4/6] liberation-fonts_1.06: add PN to RDEPENDS
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
X-List-Received-Date: Fri, 16 Sep 2011 02:26:08 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

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
1.7.6



