Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SmO0x-0008OU-0m
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 13:44:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2012 04:33:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166822218"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2012 04:33:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 14:33:59 +0300
Message-Id: <1341401643-4395-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/5] telepathy-glib: update to ver. 0.19.2
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
X-List-Received-Date: Wed, 04 Jul 2012 11:44:59 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...thy-glib_0.19.1.bb => telepathy-glib_0.19.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.1.bb => telepathy-glib_0.19.2.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
index 082da70..22f8c07 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a2b7245057396318867af7925e927998"
-SRC_URI[sha256sum] = "d9d1e48caf36aad0863e110230f10257e8dd53879282588d5ff720ad2bff3c80"
+SRC_URI[md5sum] = "af2b33c1215f189e637bd59cc9139255"
+SRC_URI[sha256sum] = "7e3c313ed08e26339deb603a615cec62a370131075514439f79f473f92ab84c3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



