Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCn-0000ne-3I
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181416"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:28 +0300
Message-Id: <49ba8eb46a86187086cf2bb67157e8af0d266ebc.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 41/64] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:41 -0000

From: Jesse Zhang <sen.zhang@windriver.com>

libxpm needs xgettext to build po files. Add explicit dependency on
gettext-native.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
index 9eaa212..6830216 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
@@ -10,7 +10,8 @@ protocol."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext libsm libxt"
-PR = "r0"
+DEPENDS_virtclass-native = "gettext-native"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXpm"
-- 
1.7.7.6



