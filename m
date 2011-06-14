Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd9-0001K8-K2
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283984"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:42 -0700
Message-Id: <ad9c7921181fb2689dc11fa9dcd8e907bbbb3c16.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 33/51] inputproto: upgrade from 2.0.1 to the latest version 2.0.2
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
X-List-Received-Date: Tue, 14 Jun 2011 08:07:03 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{inputproto_2.0.1.bb => inputproto_2.0.2.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.1.bb => inputproto_2.0.2.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.0.1.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-proto/inputproto_2.0.1.bb
rename to meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
index 7103d0d..26f1e2d 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.0.1.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_2.0.2.bb
@@ -17,6 +17,6 @@ inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "da9bf9e5d174163f597d2d72757d9038"
-SRC_URI[sha256sum] = "63663dd88df812738e0efdc52a18868c0756128f09748cbe89c8ec6d17124a44"
+SRC_URI[md5sum] = "07d54ae098ed4e6dce472f6ef3de05ce"
+SRC_URI[sha256sum] = "64222a590ad4a62a3c8d57805379451769e3329cc5c8c5c1f1fc0d1529ebf005"
 
-- 
1.7.3.4



