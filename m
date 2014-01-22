Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 97C286E744
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:02:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2014 00:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,698,1384329600"; d="scan'208";a="442767944"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2014 01:01:51 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 11:04:25 +0200
Message-Id: <285f2de5b05b5ff1275a017d92f1feee7da4b48b.1390381388.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
Subject: [PATCH 4/4] connman: upgrade to 1.21
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
X-List-Received-Date: Wed, 22 Jan 2014 09:02:14 -0000

This is mainly a bug fix release.

- gtk-doc infrastructure has been removed
starting with connman 1.21; as such, support
for it has been removed from the recipe;
- Updated bug tracker site;
- Cosmetic cleanup;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc                      | 7 ++-----
 .../connman/{connman_1.20.bb => connman_1.21.bb}                   | 5 ++---
 2 files changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.20.bb => connman_1.21.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f2c42fc..84d8d1d 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -8,7 +8,7 @@ to support all kinds of wired or wireless technologies. Also, \
 configuration methods, like DHCP and domain name resolving, are \
 implemented using plug-ins."
 HOMEPAGE = "http://connman.net/"
-BUGTRACKER = "http://bugs.meego.com/buglist.cgi?quicksearch=connman"
+BUGTRACKER = "https://01.org/jira/browse/CM"
 LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
@@ -66,13 +66,10 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-UNKNOWN_CONFIGURE_WHITELIST += "--disable-gtk-doc-pdf --disable-gtk-doc-html"
-
-inherit autotools gtk-doc pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d
 
 do_configure_append () {
 	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
-
 }
 
 # This allows *everyone* to access ConnMan over DBus, without any access
diff --git a/meta/recipes-connectivity/connman/connman_1.20.bb b/meta/recipes-connectivity/connman/connman_1.21.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.20.bb
rename to meta/recipes-connectivity/connman/connman_1.21.bb
index 4af71e2..48ed20e 100644
--- a/meta/recipes-connectivity/connman/connman_1.20.bb
+++ b/meta/recipes-connectivity/connman/connman_1.21.bb
@@ -5,8 +5,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             "
-
-SRC_URI[md5sum] = "15f5e0d89e01b81c79306f54a2014efd"
-SRC_URI[sha256sum] = "4e638443be959913a5ce0d51df10018448ed08d06e4f8a47ce4b3c705bc78ac1"
+SRC_URI[md5sum] = "483633162b819c8b99fec970f92e311d"
+SRC_URI[sha256sum] = "e80f4e9c639ef016e9c497c122c349dbc9e6dc78a9976f986134739ee208c08a"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.8.3.2


