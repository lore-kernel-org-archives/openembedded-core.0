Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWna-0001zq-1s
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720798"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:12 -0800
Message-Id: <d52b7ca7c363b1a5e9b7e177d11a4620a7a51440.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 12/26] xf86-input-mouse: Update to 1.7.1
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ut-mouse_1.7.0.bb => xf86-input-mouse_1.7.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.0.bb => xf86-input-mouse_1.7.1.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb
index b4918ef..e3215f9 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.1.bb
@@ -12,5 +12,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "7f31472689c15b6de62eff04d0fb57d7"
-SRC_URI[sha256sum] = "4e989542b5e9e0c5f9087288b18e70de1064dd27c83a4bc6dce58f3ea9d74994"
+SRC_URI[md5sum] = "13276d780b8ef3a82088f009185bf42b"
+SRC_URI[sha256sum] = "d2c5b4b9bf03f8f7ef7b37bab25197d3f99a4d889c61bb67a68df33ec2c2ff12"
-- 
1.7.6.4



