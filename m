Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0644F6D04E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:28 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506408"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:11 -0700
Message-Id: <473e9295d9cf8d42940fa97da73bfba1fe31ad67.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 05/18] desktop-file-utils-native: upgrade to 0.22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 15:27:29 -0000

(From OE-Core rev: 816569257f3ede87a875311c827bb74c2ed90226)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...op-file-utils-native_0.21.bb => desktop-file-utils-native_0.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.21.bb => desktop-file-utils-native_0.22.bb} (76%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
similarity index 76%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
index 13f1db6..2a77642 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.21.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
@@ -8,8 +8,8 @@ DEPENDS = "glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "fda5c312c9fb3b8d818fb54f2c34db82"
-SRC_URI[sha256sum] = "b6c9b860538ef1cffbcdfbc9cb578f85a080ad8c1207c8b3a39e9fd183f9782b"
+SRC_URI[md5sum] = "c6b9f9aac1ea143091178c23437e6cd0"
+SRC_URI[sha256sum] = "843532672692f98e9b2d6ae6cc8658da562dfde1606c7f33d9d227a344de56c5"
 
 inherit autotools native
 
-- 
1.8.3.1


