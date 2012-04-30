Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7N-00084L-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:30:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453908"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:20:52 -0700
Message-Id: <4ca855ea591592de515d508c9fd2b0c6fb0752e9.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/19] telepathy-glib: upgrade to version 0.18.1
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
X-List-Received-Date: Mon, 30 Apr 2012 22:30:54 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
index 10dcd8b..81da5f8 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d436c47689f2709540d849cf5af5ed03"
-SRC_URI[sha256sum] = "011ad936f1d592dbc685073244750303fe2201246b16f9a7fa495cf9f8a3fe8d"
+SRC_URI[md5sum] = "461732739e3fbf8467991bbe661fb29a"
+SRC_URI[sha256sum] = "3738256689e34c22ddf9c4eb33f44ce7505c18fb1a14c53b8e56dd9c262f4c6d"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.7.6



