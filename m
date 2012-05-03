Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQf-0006go-Pq
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772220"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:49 -0700
Message-Id: <07db2acf4d50e0d09e736f8913ab4e77c4d3d6a4.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/36] mc: Update to 4.8.3
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
X-List-Received-Date: Thu, 03 May 2012 02:06:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mc/{mc_4.8.1.bb => mc_4.8.3.bb}                |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.1.bb => mc_4.8.3.bb} (81%)

diff --git a/meta/recipes-extended/mc/mc_4.8.1.bb b/meta/recipes-extended/mc/mc_4.8.3.bb
similarity index 81%
rename from meta/recipes-extended/mc/mc_4.8.1.bb
rename to meta/recipes-extended/mc/mc_4.8.3.bb
index 7bcdcda..3b777b5 100644
--- a/meta/recipes-extended/mc/mc_4.8.1.bb
+++ b/meta/recipes-extended/mc/mc_4.8.3.bb
@@ -6,12 +6,12 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7d60c87d87b359831d976fa28034935e"
-SRC_URI[sha256sum] = "8f9bd09750c65a7786197a8f7e5a10a6dabf8c8737c564079ca393d8ecaf944d"
+SRC_URI[md5sum] = "12d38ad4969df3f8bbf66c3967a191ee"
+SRC_URI[sha256sum] = "445f286652b85c3e8e87839bad64c28ad2dc80661778571a0b59c2b920ef60ac"
 
 inherit autotools gettext
 
-- 
1.7.7.6



