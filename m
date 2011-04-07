Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wva-0008MB-AD
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Apr 2011 14:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="730527426"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2011 14:37:36 -0700
Message-Id: <995c632b963af7fb78de25fcba13e5db28de724c.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 17:56:08 -0700
Date: Thu, 07 Apr 2011 14:37:36 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 04/11] mc: update to version 4.7.5.1
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:46 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mc/{mc_4.7.5.bb => mc_4.7.5.1.bb}              |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.7.5.bb => mc_4.7.5.1.bb} (76%)

diff --git a/meta/recipes-extended/mc/mc_4.7.5.bb b/meta/recipes-extended/mc/mc_4.7.5.1.bb
similarity index 76%
rename from meta/recipes-extended/mc/mc_4.7.5.bb
rename to meta/recipes-extended/mc/mc_4.7.5.1.bb
index ec84b01..9e790df 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.1.bb
@@ -6,14 +6,12 @@ SECTION = "console/utils"
 DEPENDS = "ncurses glib-2.0"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PR = "r1"
-
 PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "4eb2438b168fb0f93b748889a9294f54"
-SRC_URI[sha256sum] = "0d2b4e87b8a4158edf54380df9402b4a1a19f7494ef06dd0a0a3e3ff6a2b50f1"
+SRC_URI[md5sum] = "2ffe4771e94569d497010eea298b13cd"
+SRC_URI[sha256sum] = "4d60a9fcd186b70f52d4e730ae3d43408a73e3f0647968e9f4af8005f13369e9"
 
 inherit autotools gettext
 
-- 
1.7.1



