Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C55F46BBCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:31:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Aug 2013 23:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,974,1367996400"; d="scan'208";a="369572056"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.210])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2013 23:31:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 23:31:41 -0700
Message-Id: <1377671501-19842-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] mirdori: use BPN instead of PN
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
X-List-Received-Date: Wed, 28 Aug 2013 06:31:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
index e545753..32bfcb6 100644
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
 
-SRC_URI = "http://www.midori-browser.org/downloads/${PN}_${PV}_all_.tar.bz2 \
+SRC_URI = "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
 "
 
 SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
-- 
1.8.3.1


