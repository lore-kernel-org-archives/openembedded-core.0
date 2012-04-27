Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNdVj-00018r-MU
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:14:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Apr 2012 22:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134301055"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 26 Apr 2012 22:04:48 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 13:04:03 +0800
Message-Id: <3fca1aaf30b950086be363622508904fd58fbb1b.1335498445.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1335498445.git.lianhao.lu@intel.com>
References: <cover.1335498445.git.lianhao.lu@intel.com>
Subject: [PATCH 3/7] avahi: not using hard coded libdir.
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
X-List-Received-Date: Fri, 27 Apr 2012 05:14:27 -0000

Used ${libdir} instead of the hard docoded libdir.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 61ca25f..c064e03 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -112,7 +112,7 @@ do_install() {
 	# if /var/run become non-empty in the future, need to install it via volatile
 	rm -rf ${D}/var/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
-	rm -rf ${D}/usr/lib/avahi
+	rm -rf ${D}${libdir}/avahi
 }
 
 do_install_avahi-autoipd() {
-- 
1.7.0.4



