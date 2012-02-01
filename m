Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjvC-0003f2-S3
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:49:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62271870"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 15:40:59 -0800
Message-Id: <d3e8109da47cb533897a380dd2b5ec0e31e58562.1328139407.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328139407.git.nitin.a.kamble@intel.com>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
Subject: [patch-v2 5/7] python-dbus: upgrade from 0.84.0 to 1.0.0
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
X-List-Received-Date: Wed, 01 Feb 2012 23:49:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...{python-dbus_0.84.0.bb => python-dbus_1.0.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-dbus_0.84.0.bb => python-dbus_1.0.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python-dbus_0.84.0.bb b/meta/recipes-devtools/python/python-dbus_1.0.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python-dbus_0.84.0.bb
rename to meta/recipes-devtools/python/python-dbus_1.0.0.bb
index db2d7de..a977e8d 100644
--- a/meta/recipes-devtools/python/python-dbus_0.84.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.0.0.bb
@@ -8,8 +8,8 @@ PR = "r1"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fe69a2613e824463e74f10913708c88a"
-SRC_URI[sha256sum] = "b85bc7aaf1a976627ca461b1ca7b0c4ddddff709f52fe44c9b2d1d7d8fac5906"
+SRC_URI[md5sum] = "775a8235736bf760cdd96e2d76546469"
+SRC_URI[sha256sum] = "9e46f97d739dde8a5ab33ec6b11da58794c4c20804aacdad2880b7d3bc05187a"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
1.7.6.4



