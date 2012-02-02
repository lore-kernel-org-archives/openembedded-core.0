Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VX-0002Yh-Ju
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486097"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:52 -0800
Message-Id: <5960e647d18284fd42b4547dfeff3b1970b1d819.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 13/14] xf86-input-keyboard: Update to 1.6.1
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...board_1.6.0.bb => xf86-input-keyboard_1.6.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.6.0.bb => xf86-input-keyboard_1.6.1.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
index e374fbd..ac398b5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.1.bb
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "e2abe9f13e526a73cb68a7d257546eba"
-SRC_URI[sha256sum] = "c46c790fec905d696573b7a374b10ab8b4389112a8f69993fe011006c99e858e"
+SRC_URI[md5sum] = "09744e8dc9a1fe5e61927c1073cd3428"
+SRC_URI[sha256sum] = "aa9ec96e7f7f87bc086cb86b871ee6f4b9a7809fb1e7d50d0abbd7c2e50a8cc3"
-- 
1.7.6.5



