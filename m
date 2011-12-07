Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNNE-0002IO-GC
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:41:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 11:35:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99763169"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 11:35:00 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:44 -0800
Message-Id: <ffd410364a9c13a5a042113078c9337e87c65cd2.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 5/8] gettext-minimal-native: Fix License
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
X-List-Received-Date: Wed, 07 Dec 2011 19:41:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Only .m4 macros are included in this recipe so the correct license is FSF-Unlimited
as specified in those marcros, not the main gettext license. This patch corrects
that mistake.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gettext/gettext-minimal-0.18.1.1/COPYING       |  678 +-------------------
 .../gettext/gettext-minimal-native_0.18.1.1.bb     |    4 +-
 2 files changed, 6 insertions(+), 676 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
index 71c6045..ab4acaf 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.1.1.bb
@@ -5,11 +5,11 @@ INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
 LICENSE = "FSF-Unlimited"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0854da868a929923087141d9d7aba7d5"
 
 inherit native
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}"
 
-- 
1.7.1



