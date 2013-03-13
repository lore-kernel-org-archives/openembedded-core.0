Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UFi8f-0005pQ-Ey
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:38:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2013 02:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,834,1355126400"; d="scan'208";a="269815262"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 13 Mar 2013 02:21:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 11:21:27 +0200
Message-Id: <c4081a15a819bf1bd997b200bdbb6bb98ca22be9.1363166040.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363166040.git.laurentiu.palcu@intel.com>
References: <cover.1363166040.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1363166040.git.laurentiu.palcu@intel.com>
References: <cover.1363166040.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/4] inputproto: upgrade to 2.3
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
X-List-Received-Date: Wed, 13 Mar 2013 09:38:31 -0000
X-List-Received-Date: Wed, 13 Mar 2013 09:38:31 -0000

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



