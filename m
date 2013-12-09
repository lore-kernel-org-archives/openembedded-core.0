Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 81D756DB5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 15:49:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2013 07:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,858,1378882800"; d="scan'208";a="441060285"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2013 07:49:38 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 17:51:59 +0200
Message-Id: <aec10e426b13cd7a5dae0c1eab7d285ddc08b373.1386604276.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386604276.git.cristian.iorga@intel.com>
References: <cover.1386604276.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386604276.git.cristian.iorga@intel.com>
References: <cover.1386604276.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] connman: upgrade to 1.20
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
X-List-Received-Date: Mon, 09 Dec 2013 15:49:39 -0000

Fix issue with fallback nameservers not being used!
Fix various other issues.
Add support for NTP v3 protocol.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc                         | 2 ++
 .../recipes-connectivity/connman/{connman_1.19.bb => connman_1.20.bb} | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.19.bb => connman_1.20.bb} (68%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 12f3edd..f2c42fc 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -66,6 +66,8 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-gtk-doc-pdf --disable-gtk-doc-html"
+
 inherit autotools gtk-doc pkgconfig systemd update-rc.d
 
 do_configure_append () {
diff --git a/meta/recipes-connectivity/connman/connman_1.19.bb b/meta/recipes-connectivity/connman/connman_1.20.bb
similarity index 68%
rename from meta/recipes-connectivity/connman/connman_1.19.bb
rename to meta/recipes-connectivity/connman/connman_1.20.bb
index c63dfe4..4af71e2 100644
--- a/meta/recipes-connectivity/connman/connman_1.19.bb
+++ b/meta/recipes-connectivity/connman/connman_1.20.bb
@@ -6,7 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://connman \
             "
 
-SRC_URI[md5sum] = "47cce1d17a693dc307e6796c81991bd0"
-SRC_URI[sha256sum] = "7e4e624cadf42feed18e783351b10f81ef23d7e298bddc7ffe26fe5e69f25b8b"
+SRC_URI[md5sum] = "15f5e0d89e01b81c79306f54a2014efd"
+SRC_URI[sha256sum] = "4e638443be959913a5ce0d51df10018448ed08d06e4f8a47ce4b3c705bc78ac1"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.8.3.2


