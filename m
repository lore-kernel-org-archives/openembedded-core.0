Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QojjX-0004Tu-UY
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912921"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:49 -0700
Message-Id: <5f22d81911039d24d36454e4ec6d4efbca184486.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 05/33] aspell: upgrade from 0.60.6 to 0.60.6.1
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:12 -0000

From: Mei Lei <lei.mei@intel.com>

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../{aspell_0.60.6.bb => aspell_0.60.6.1.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/aspell/{aspell_0.60.6.bb => aspell_0.60.6.1.bb} (82%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
similarity index 82%
rename from meta/recipes-support/aspell/aspell_0.60.6.bb
rename to meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 455ea35..d773ee3 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -1,12 +1,12 @@
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bc80f0198773d5c05086522be67334eb"
-SRC_URI[sha256sum] = "4f5b1520e26cf6bbb1b5ca8a2f9f22948c3ca38ac4c2dd9e02df042fee7c0e36"
+SRC_URI[md5sum] = "e66a9c9af6a60dc46134fdacf6ce97d7"
+SRC_URI[sha256sum] = "f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1"
 DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
+PR = "r0"
 PACKAGES += "libaspell libpspell libpspell-dev aspell-utils"
 
 FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
-- 
1.7.3.4



