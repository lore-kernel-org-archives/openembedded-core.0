Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 811116C027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:50:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2013 07:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,854,1371106800"; d="scan'208";a="397701814"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.155])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2013 07:50:23 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 17:49:01 +0300
Message-Id: <f8bc81b6558ad3b4e6c81403916ca1bfa42b236b.1378477619.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378477619.git.mihai.prica@intel.com>
References: <cover.1378477619.git.mihai.prica@intel.com>
In-Reply-To: <cover.1378477619.git.mihai.prica@intel.com>
References: <cover.1378477619.git.mihai.prica@intel.com>
Subject: [PATCH 2/2] bluez5: Rename tests package to testtools
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
X-List-Received-Date: Fri, 06 Sep 2013 14:50:44 -0000

Bluez5 ships some tools that can be used to test its
functionality.

The installation can be tested using "make check" and
this should be included in a ptest package.

[YB #5028]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e2b7169..e5cb9e8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,7 +55,7 @@ do_install_append() {
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-test ${PN}-obex"
+PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
@@ -70,7 +70,7 @@ FILES_${PN}-obex = "${libdir}/bluez5/bluetooth/obexd \
                    "
 SYSTEMD_SERVICE_${PN}-obex = "obex.service"
 
-FILES_${PN}-test = "${libdir}/bluez/test/*"
+FILES_${PN}-testtools = "${libdir}/bluez/test/*"
 
 FILES_${PN}-dbg += "\
   ${libdir}/${BPN}/bluetooth/.debug \
@@ -79,4 +79,6 @@ FILES_${PN}-dbg += "\
   */udev/.debug \
   "
 
+RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
+
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
-- 
1.7.9.5


