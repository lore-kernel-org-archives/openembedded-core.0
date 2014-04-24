Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2C9C65D26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:16:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2014 02:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518695452"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 02:15:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:19:03 +0300
Message-Id: <c9b5fedaba47443b52f2869df79750e0daaef0a9.1398331032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] connman: upgrade to 1.23
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
X-List-Received-Date: Thu, 24 Apr 2014 09:16:03 -0000

- License file copyright years updated;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc                         | 2 +-
 .../recipes-connectivity/connman/{connman_1.22.bb => connman_1.23.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.22.bb => connman_1.23.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b3147c9..4bd94f3 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -11,7 +11,7 @@ HOMEPAGE = "http://connman.net/"
 BUGTRACKER = "https://01.org/jira/browse/CM"
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
+                    file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
 
 DEPENDS  = "dbus glib-2.0 ppp iptables"
 
diff --git a/meta/recipes-connectivity/connman/connman_1.22.bb b/meta/recipes-connectivity/connman/connman_1.23.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.22.bb
rename to meta/recipes-connectivity/connman/connman_1.23.bb
index 4bd986f..43501af 100644
--- a/meta/recipes-connectivity/connman/connman_1.22.bb
+++ b/meta/recipes-connectivity/connman/connman_1.23.bb
@@ -5,7 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-SRC_URI[md5sum] = "4f45ab2035d1028a287d14427ce61774"
-SRC_URI[sha256sum] = "64d9a8ab83c99943514bb64984142fef409177a93c64e1aace84eaf13c7bddde"
+SRC_URI[md5sum] = "f835b8137ab198e0af5deab043e2890a"
+SRC_URI[sha256sum] = "1dcac1d059d5303343e544fca0d0e76837cfb32f36e4a607a71c1b65ccf007c5"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.9.1


