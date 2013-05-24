Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D13E76A457
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:16:21 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 02:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246063893"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:16:22 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 12:18:08 +0300
Message-Id: <f0b5620742216d1c7edaf721b5be599fb8c1a044.1369386157.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
Subject: [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
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
X-List-Received-Date: Fri, 24 May 2013 09:16:22 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.1.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.1.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.43.1.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.43.1.bb
index ef8d439..3545abd 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.43.1.bb
@@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "aaccd590a8002b69716f885fa8589887"
-SRC_URI[sha256sum] = "20bd5365bb3e7de70fade91ac82c9dea31636318df90b8c26bc4cde2523a8c91"
+SRC_URI[md5sum] = "4df3da805e7ced25cbbf7ac39864995e"
+SRC_URI[sha256sum] = "99b186b95ca2b11fb729cae1eb458e318d9bc6bd32ad087ade2a2f54a53fa9d1"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.10.4


