Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4806B037
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:22 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059471"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:23 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:22 +0300
Message-Id: <320805d249fc97b23828981e8606c2ed0745a66e.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 05/10] libsoup-2.4: Updated from 2.42.1 to 2.43.2
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:22 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.2.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.2.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.43.2.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.43.2.bb
index ef8d439..9063076 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.43.2.bb
@@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "aaccd590a8002b69716f885fa8589887"
-SRC_URI[sha256sum] = "20bd5365bb3e7de70fade91ac82c9dea31636318df90b8c26bc4cde2523a8c91"
+SRC_URI[md5sum] = "40e977be8d0ff5f1b89ff31232f7713f"
+SRC_URI[sha256sum] = "332acd3d2a205605446b8f5e78dc5517a42a99ad1deaa7b81ef1de2402a51990"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.10.4


