Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R9Rxz-00027X-7o
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 03:32:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,464,1312182000"; d="scan'208";a="57186167"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 18:27:10 -0700
Message-Id: <f180653f855ba4b67d6966cf979d17dcf2f9e3bf.1317344910.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <4320d5ae4fbe881a4a4a761c899069225f6c78ca.1317344910.git.nitin.a.kamble@intel.com>
References: <4320d5ae4fbe881a4a4a761c899069225f6c78ca.1317344910.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1317344910.git.nitin.a.kamble@intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/4] python-dbus: upgrade from 0.83.2 to 0.84.0
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
X-List-Received-Date: Fri, 30 Sep 2011 01:32:43 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb => python-dbus_0.84.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python-dbus_0.83.2.bb b/meta/recipes-devtools/python/python-dbus_0.84.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python-dbus_0.83.2.bb
rename to meta/recipes-devtools/python/python-dbus_0.84.0.bb
index 323dae5..fff8649 100644
--- a/meta/recipes-devtools/python/python-dbus_0.83.2.bb
+++ b/meta/recipes-devtools/python/python-dbus_0.84.0.bb
@@ -8,8 +8,8 @@ PR = "r0"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4ebcaa905bdcb4132b915196b0a3691b"
-SRC_URI[sha256sum] = "883729c98f40790021e3be0f7028ae863ee1c4a7b922a5578c1342592adfff64"
+SRC_URI[md5sum] = "fe69a2613e824463e74f10913708c88a"
+SRC_URI[sha256sum] = "b85bc7aaf1a976627ca461b1ca7b0c4ddddff709f52fe44c9b2d1d7d8fac5906"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
1.7.4.4



