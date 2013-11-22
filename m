Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B8F526CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:14:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Nov 2013 02:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,751,1378882800"; d="scan'208";a="412954837"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2013 02:14:13 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 12:15:13 +0200
Message-Id: <1385115313-30193-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] libsoup-2.4: upgrade to 2.44.2
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
X-List-Received-Date: Fri, 22 Nov 2013 10:14:21 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../libsoup/{libsoup-2.4_2.44.1.bb => libsoup-2.4_2.44.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.44.1.bb => libsoup-2.4_2.44.2.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.44.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.44.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
index 6c3c1db..5edbb09 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.44.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
@@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "c8e3b59b16e8fbad430f47adb3bbd3df"
-SRC_URI[sha256sum] = "c532c331dd5f7eb78438867302ed6897a847c82b287ed9347bea8d1937974c1d"
+SRC_URI[md5sum] = "92aa3667357157e8f3489bcca287f2fa"
+SRC_URI[sha256sum] = "e7e4b5ab74a6c00fc267c9f5963852d28759ad3154dab6388e2d6e1962d598f3"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.8.3.2


