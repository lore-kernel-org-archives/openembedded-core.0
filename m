Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNUA-0004fI-F7
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 10:01:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Dec 2011 00:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89137144"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 24 Dec 2011 00:54:38 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:31 +0800
Message-Id: <50e47d14be7b754a733dd1e5c30f9d0d3740e3fb.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
References: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
Subject: [PATCH 10/13] telepathy-glib: upgrade to 0.17.4
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
X-List-Received-Date: Sat, 24 Dec 2011 09:01:46 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...thy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
index db5fd41..1ad91b2 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5ea748c581db611b097c4926f0467c1e"
-SRC_URI[sha256sum] = "06f61e9a8b12e55ac8c62cad29baa5b14f2b75118a9b01f0874f8048ec33d845"
+SRC_URI[md5sum] = "2e1d583af92e7e88bd5478eab1755696"
+SRC_URI[sha256sum] = "bd9395178d2e11e6caaf14100bbfcb8bf3ceeb574538c670dbef68750dd24b3c"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.6



