Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWr-0003Gz-TU
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416729"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:25 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:01 +0300
Message-Id: <a17420f8e3118dd0307a75e6344a634612edca24.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/19] recordproto: upgrade to 1.14.2
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
X-List-Received-Date: Wed, 23 May 2012 13:23:06 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...recordproto_1.14.1.bb => recordproto_1.14.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{recordproto_1.14.1.bb => recordproto_1.14.2.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/recordproto_1.14.1.bb b/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/recordproto_1.14.1.bb
rename to meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
index 8ee2017..24404a7 100644
--- a/meta/recipes-graphics/xorg-proto/recordproto_1.14.1.bb
+++ b/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
@@ -14,5 +14,5 @@ CONFLICTS = "recordext"
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "24541a30b399213def35f48efd926c63"
-SRC_URI[sha256sum] = "b27eb043d3e618bc1f8b704a64f8ae218ea00e7f36f9107ac41d41940773098d"
+SRC_URI[md5sum] = "1b4e5dede5ea51906f1530ca1e21d216"
+SRC_URI[sha256sum] = "a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370"
-- 
1.7.9.5



