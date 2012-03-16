Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LYc-0003AI-Al
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:02:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121481399"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:52:25 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:52 +0800
Message-Id: <9b0d3ce0556b0bac7c8b290d0e559a2c480617fb.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 55/60] inputproto: upgrade to 2.2
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
X-List-Received-Date: Fri, 16 Mar 2012 01:02:14 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{inputproto_2.0.2.bb => inputproto_2.2.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.2.bb => inputproto_2.2.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.2.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.2.bb
index 26f1e2d..3b3ae36 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.2.bb
@@ -17,6 +17,6 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "07d54ae098ed4e6dce472f6ef3de05ce"
-SRC_URI[sha256sum] = "64222a590ad4a62a3c8d57805379451769e3329cc5c8c5c1f1fc0d1529ebf005"
+SRC_URI[md5sum] = "13c8aedaf98a92e282b7e456c0a5bed9"
+SRC_URI[sha256sum] = "de7516ab25c299740da46c0f1af02f1831c5aa93b7283f512c0f35edaac2bcb0"
 
-- 
1.7.6



