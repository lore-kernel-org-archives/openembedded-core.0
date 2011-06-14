Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd8-0001K5-QX
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283981"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:41 -0700
Message-Id: <f1791b8d2c32db0ad777781b88d4f16d7f64e398.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/51] glproto: upgrade from 1.4.12 to the latest version 1.4.13
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
X-List-Received-Date: Tue, 14 Jun 2011 08:06:49 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{glproto_1.4.12.bb => glproto_1.4.13.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.12.bb => glproto_1.4.13.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
index 7b32e70..38b17b6 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "55edc5ff2efb734215c868f72f7cf27e"
-SRC_URI[sha256sum] = "48be7a9d190b600210e5ad08b4e8862a6b08e72dc52dbdf324716a888eb457de"
+SRC_URI[md5sum] = "9542f2d36751a8ad7eae9d8e176f70d4"
+SRC_URI[sha256sum] = "fc0a94d4df003cb6b6953173e6498d9c4c3268ee24bcc46a1172a1e1dbd3d742"
-- 
1.7.3.4



