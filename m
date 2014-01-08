Return-Path: <irina.patru@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C57D6D032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:04:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 05:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,624,1384329600"; d="scan'208";a="435691479"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.140])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2014 05:04:48 -0800
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 15:08:05 +0200
Message-Id: <39f73c5ca7a3155aab7ceaa48fd486ed286c001a.1389186276.git.irina.patru@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389186276.git.irina.patru@intel.com>
References: <cover.1389186276.git.irina.patru@intel.com>
In-Reply-To: <cover.1389186276.git.irina.patru@intel.com>
References: <cover.1389186276.git.irina.patru@intel.com>
Subject: [PATCH 2/2] libsoup-2.4: upgrade to 2.45.3
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
X-List-Received-Date: Wed, 08 Jan 2014 13:04:50 -0000

Signed-off-by: Irina Patru <irina.patru@intel.com>
---
 ...libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
index a7ea106..ea062c7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
@@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "92aa3667357157e8f3489bcca287f2fa"
-SRC_URI[sha256sum] = "e7e4b5ab74a6c00fc267c9f5963852d28759ad3154dab6388e2d6e1962d598f3"
+SRC_URI[md5sum] = "fe7ec04784c6b97c5f8ea963c8542f59"
+SRC_URI[sha256sum] = "6ac317b931efd2cff9cdea7122987acb3ecb0c32564a9441ba72e5cce021aa12"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.9.5


