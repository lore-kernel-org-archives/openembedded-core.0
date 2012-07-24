Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyo-0007o2-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328329"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:53 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:54 +0300
Message-Id: <1343108218-7108-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/5] telepathy-glib: upgrade to ver. 0.19.4
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
X-List-Received-Date: Tue, 24 Jul 2012 05:48:23 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...thy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.4.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.4.bb
index deba3bb..29c3e9b 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.2.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.4.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "af2b33c1215f189e637bd59cc9139255"
-SRC_URI[sha256sum] = "7e3c313ed08e26339deb603a615cec62a370131075514439f79f473f92ab84c3"
+SRC_URI[md5sum] = "a7e8b8b5b29280cb257f2a9c0fe566ee"
+SRC_URI[sha256sum] = "c191b1c51638c921bd8da4875df7123e3a0bc98bf2c93e6a9365c451d21d11f7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



