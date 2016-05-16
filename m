Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 823B073243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:23:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873499"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:23:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:45 +0300
Message-Id: <002c776958a18db17984609731970f46861e471c.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/13] libsoup-2.4: Upgrade 2.52.2 -> 2.54.1
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
X-List-Received-Date: Mon, 16 May 2016 13:23:01 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libsoup/{libsoup-2.4_2.52.2.bb => libsoup-2.4_2.54.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.52.2.bb => libsoup-2.4_2.54.1.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
index f6e3db2..ad8202c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e4757d09012ed93822b1ee41435fec24"
-SRC_URI[sha256sum] = "db55628b5c7d952945bb71b236469057c8dfb8dea0c271513579c6273c2093dc"
+SRC_URI[md5sum] = "73b1fb774de16c29b380f87016f9f9dd"
+SRC_URI[sha256sum] = "47b42c232034734d66e5f093025843a5d8cc4b2357c011085a2fd04ef02dd633"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.1.4


