Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 963EE6F0FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:05:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Feb 2014 08:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,555,1389772800"; d="scan'208";a="463509424"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2014 08:04:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 18:07:32 +0200
Message-Id: <efb18b19540663bfd62117f8e90c1af7f9bdbd7a.1393517205.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1393517205.git.cristian.iorga@intel.com>
References: <cover.1393517205.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] telepathy-glib: upgrade to 0.23.2
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
X-List-Received-Date: Thu, 27 Feb 2014 16:05:49 -0000

- switched to {BP} variable.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{telepathy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb}         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.23.0.bb => telepathy-glib_0.23.2.bb} (76%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb
similarity index 76%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb
index 14787ea..7d849a0 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
 LICENSE = "LGPLv2.1+"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "e4fff5885d4840c965b71c1c113d731e"
-SRC_URI[sha256sum] = "d9e08f3af867846c3f81e8ab85bbb71f30ea914f004065419ea65a14bb30d809"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
+SRC_URI[md5sum] = "834ff3b4e2f0e696492a525fe1838f06"
+SRC_URI[sha256sum] = "37d5d0eb8cb801822d579182b84a9abdc24e51e5a54b663f865fd1ba2e062c83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.8.3.2


