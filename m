Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UF5py-0004UR-Rm
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 17:44:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 09:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,824,1355126400"; d="scan'208";a="300091451"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2013 09:27:50 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 18:27:40 +0200
Message-Id: <d58a806e9dd892c6f2a3b501bf814a38d7f6880e.1363018567.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1363018567.git.laurentiu.palcu@intel.com>
References: <cover.1363018567.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] inputproto: upgrade to 2.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 16:44:36 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{inputproto_2.2.bb => inputproto_2.3.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.2.bb => inputproto_2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.2.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.2.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
index 3b3ae36..f983ef5 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.2.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.3.bb
@@ -17,6 +17,6 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "13c8aedaf98a92e282b7e456c0a5bed9"
-SRC_URI[sha256sum] = "de7516ab25c299740da46c0f1af02f1831c5aa93b7283f512c0f35edaac2bcb0"
+SRC_URI[md5sum] = "94db391e60044e140c9854203d080654"
+SRC_URI[sha256sum] = "7d26b193f6699f8e9c1e28bf026844b7ecea33dd644402523471be109152c32f"
 
-- 
1.7.9.5



