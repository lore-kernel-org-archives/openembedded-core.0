Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8C47A6D092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:22:45 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Oct 2013 08:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314791946"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 08:22:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 17:24:52 +0200
Message-Id: <f8f0f13a22cc19311b67a9229da242a37e60e809.1383146648.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
Subject: [PATCH 4/4] telepathy-glib: upgrade to 0.23.0
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
X-List-Received-Date: Wed, 30 Oct 2013 15:22:45 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../telepathy/{telepathy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb
index 7d529b6..14787ea 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.20.4.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb
@@ -5,8 +5,9 @@ DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-nat
 LICENSE = "LGPLv2.1+"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "78be56307d2da7c580cf6df33a225ba0"
-SRC_URI[sha256sum] = "c9a307c85d412c58bc68265c4c4128a8e3ffb283bc784143f1f086faaafcb16c"
+
+SRC_URI[md5sum] = "e4fff5885d4840c965b71c1c113d731e"
+SRC_URI[sha256sum] = "d9e08f3af867846c3f81e8ab85bbb71f30ea914f004065419ea65a14bb30d809"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.8.1.2


