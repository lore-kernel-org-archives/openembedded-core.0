Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfR-0006Rw-3X
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907426"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:22 +0200
Message-Id: <edbd990ef3db5d2d3290e9bc1fb4e9018b2bdce1.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/12] xcb-proto: upgrade to 1.8
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
X-List-Received-Date: Tue, 13 Nov 2012 12:32:37 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xcb/{xcb-proto_1.7.1.bb => xcb-proto_1.8.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{xcb-proto_1.7.1.bb => xcb-proto_1.8.bb} (61%)

diff --git a/meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb b/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
similarity index 61%
rename from meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb
rename to meta/recipes-graphics/xcb/xcb-proto_1.8.bb
index 27050d2..785156a 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_1.7.1.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_1.8.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
 
 PR = "r0"
 
-SRC_URI[md5sum] = "948fec39dd42f3694edd5d9689735ec4"
-SRC_URI[sha256sum] = "ad5d99887d811c9817f1916d7b3f5dc6c21414c093256cbeffb945aacdc34437"
+SRC_URI[md5sum] = "a5de3432cc6e43cc6a27f241dbb991b1"
+SRC_URI[sha256sum] = "233d16c7a019235b3092111e7c11429119357eb13754a607b75eea04453121b0"
-- 
1.7.9.5



