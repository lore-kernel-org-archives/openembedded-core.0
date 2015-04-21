Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D8BAF605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:50:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Apr 2015 06:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="483689914"
Received: from heimdall.fi.intel.com ([10.237.72.110])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 06:49:53 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 16:49:44 +0300
Message-Id: <b23f8a25680ee06e0f9bcac5505cf5ebc9ade5de.1429623703.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
References: <08a1499aec1bd4c246bd5dbb91b683b83d61b394.1429623703.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1429623703.git.jussi.kukkonen@intel.com>
References: <cover.1429623703.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] libsoup-2.4: Upgrade 2.46.0 -> 2.50.0
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
X-List-Received-Date: Tue, 21 Apr 2015 13:50:06 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libsoup/{libsoup-2.4_2.46.0.bb => libsoup-2.4_2.50.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.46.0.bb => libsoup-2.4_2.50.0.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
index 81da911..044db31 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb
@@ -17,9 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-
-SRC_URI[md5sum] = "86765c0093efaf3006fa2960d170d097"
-SRC_URI[sha256sum] = "fa3d5574c1a2df521242e2ca624a2b3057121798cab9f8f40525aa186a7b15a3"
+SRC_URI[md5sum] = "9a84d66e1b7ccd3bd340574b11eccc15"
+SRC_URI[sha256sum] = "1e01365ac4af3817187ea847f9d3588c27eee01fc519a5a7cb212bb78b0f667b"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.1.4


