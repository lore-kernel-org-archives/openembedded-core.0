Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <olivier.guiter@linux.intel.com>) id 1UDcuQ-000195-H0
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 16:39:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Mar 2013 07:21:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,803,1355126400"; d="scan'208";a="266098815"
Received: from oguiternx64.mp.intel.com ([10.237.24.27])
	by azsmga001.ch.intel.com with ESMTP; 07 Mar 2013 07:21:25 -0800
From: Olivier Guiter <olivier.guiter@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2013 16:22:08 +0100
Message-Id: <1362669728-4132-1-git-send-email-olivier.guiter@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nfc: Update neard commit sha1 and start path.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 15:39:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

---
 meta/recipes-connectivity/neard/neard/neard  |    2 +-
 meta/recipes-connectivity/neard/neard_0.9.bb |    8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard/neard b/meta/recipes-connectivity/neard/neard/neard
index 5f36174..34f47f1 100644
--- a/meta/recipes-connectivity/neard/neard/neard
+++ b/meta/recipes-connectivity/neard/neard/neard
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-DAEMON=/usr/sbin/neard
+DAEMON=/usr/lib/neard/nfc/neard
 PIDFILE=/var/run/neard.pid
 DESC="Linux NFC daemon"
 
diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
index 61ea58c..6dc346a 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -13,9 +13,11 @@ INITSCRIPT_PARAMS = "defaults 64"
 
 # This would copy neard start-stop shell and test scripts
 do_install_append() {
+  # start/stop
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/neard ${D}${sysconfdir}/init.d/neard
 
+  #test files
   install -d ${D}${libdir}/neard
   install -m 0755 ${S}/test/* ${D}${libdir}/neard/
   install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/neard/
@@ -33,9 +35,9 @@ RRECOMMENDS_${PN} = "\
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/neard/*-test"
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
+FILES_${PN}-dbg += "${libdir}/neard/*/.debug"
 
-FILES_${PN}-dbg += "${bindir}/neard/*/.debug"
+RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
 
 ##=============================
 # This is valid for 0.9+
@@ -43,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 S	= "${WORKDIR}/git"
-SRCREV	= "7abdb13d106d496e1115fab49e6448a249dfb3c8"
+SRCREV	= "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
 PV	= "0.9-git${SRCPV}"
 PR	= "r1"
 
-- 
1.7.9.5



