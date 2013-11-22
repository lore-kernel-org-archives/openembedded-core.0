Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BA7B06D782
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:01:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2013 02:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,751,1378882800"; d="scan'208";a="432019415"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2013 02:00:44 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 12:01:46 +0200
Message-Id: <1385114506-22633-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH V2] lighttpd: upgrade to 1.4.33
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
X-List-Received-Date: Fri, 22 Nov 2013 10:01:05 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../recipes-extended/lighttpd/{files => lighttpd}/index.html.lighttpd | 0
 meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd           | 0
 meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd.conf      | 0
 meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd.service   | 0
 .../lighttpd/{lighttpd_1.4.32.bb => lighttpd_1.4.33.bb}               | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{files => lighttpd}/index.html.lighttpd (100%)
 rename meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd (100%)
 rename meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd.conf (100%)
 rename meta/recipes-extended/lighttpd/{files => lighttpd}/lighttpd.service (100%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.32.bb => lighttpd_1.4.33.bb} (93%)

diff --git a/meta/recipes-extended/lighttpd/files/index.html.lighttpd b/meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd
similarity index 100%
rename from meta/recipes-extended/lighttpd/files/index.html.lighttpd
rename to meta/recipes-extended/lighttpd/lighttpd/index.html.lighttpd
diff --git a/meta/recipes-extended/lighttpd/files/lighttpd b/meta/recipes-extended/lighttpd/lighttpd/lighttpd
similarity index 100%
rename from meta/recipes-extended/lighttpd/files/lighttpd
rename to meta/recipes-extended/lighttpd/lighttpd/lighttpd
diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.conf b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
similarity index 100%
rename from meta/recipes-extended/lighttpd/files/lighttpd.conf
rename to meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.service b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.service
similarity index 100%
rename from meta/recipes-extended/lighttpd/files/lighttpd.service
rename to meta/recipes-extended/lighttpd/lighttpd/lighttpd.service
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
similarity index 93%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
index a1f0589..e8be659 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.service \
         "
 
-SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
-SRC_URI[sha256sum] = "60691b2dcf3ad2472c06b23d75eb0c164bf48a08a630ed3f308f61319104701f"
+SRC_URI[md5sum] = "e66b8164e5fc5a6beec0823b697fbe1d"
+SRC_URI[sha256sum] = "2ff2324658c0f90e7d39afd40f08f11ca230903b9019c31a2bbecd8f087f235e"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.8.3.2


