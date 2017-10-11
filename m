Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6599378205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945830"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:54 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:24 +0300
Message-Id: <d71425f00f0f543e506b0568e86207585f66ae99.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/50] libsoup-2.4: update to 2.60.1
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libsoup/{libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.58.2.bb => libsoup-2.4_2.60.1.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb
index c9f95e538a2..7229a932d9e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.58.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "eb33adb459c2283efc5c7d09ccdbbcfc"
-SRC_URI[sha256sum] = "442300ca1b1bf8a3bbf2f788203287ff862542d4fc048f19a92a068a27d17b72"
+SRC_URI[md5sum] = "4b3fb98f742d81f1850c0846a40470e2"
+SRC_URI[sha256sum] = "023930032b20e6b14764feb847ea80d9e170622dee7370215d6feb9967b6aa9d"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.14.1


