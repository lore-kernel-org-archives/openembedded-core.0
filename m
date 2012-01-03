Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr9-0004O6-Vs
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752157"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:10 -0800
Message-Id: <0b206b4458aa04562d52e8cd089e06fc65e999b3.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 024/113] telepathy-glib: upgrade to 0.17.4
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:20 -0000

From: Shane Wang <shane.wang@intel.com>

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
1.7.6.4



