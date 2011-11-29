Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnF-0001hN-Qu
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720793"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:11 -0800
Message-Id: <e86094eb904995d258bf25f1e54670ef7bdd497f.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 11/26] xwininfo: Update to 1.1.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{xwininfo_1.1.1.bb => xwininfo_1.1.2.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.1.bb => xwininfo_1.1.2.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.1.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.1.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
index cabd466..cbc4587 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb
@@ -12,5 +12,5 @@ DEPENDS += "libxext libxmu"
 PR = "r0"
 PE = "0"
 
-SRC_URI[md5sum] = "7a7f44b826d877ba39c19cf5913978d7"
-SRC_URI[sha256sum] = "645a57be4870fb6aba459e7dc96f4d8eaafa3b31bbcd42c997ac4cb021a2343d"
+SRC_URI[md5sum] = "9e8b58c8aa6172e87ab4f9cf3612fedd"
+SRC_URI[sha256sum] = "8fa66c9ce02da257613fa428137ab9efc89c8f9939c074513dbc0f407dc9ac3a"
-- 
1.7.6.4



