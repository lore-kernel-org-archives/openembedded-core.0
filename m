Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholE-0008H3-KB
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:37 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039318"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:07 -0800
Message-Id: <100e6d0c80513c629823d70c0a5ade974cdd4297.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 11/15] avahi-ui: fix build with automake-1.11.2
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

With automake 1.11.2 /usr/lib/<pkgname> files are moved to
/usr/share/<pkgname>
Fix the rmdir in do_install which expect /usr/lib/avahi to exist.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
index c903087..bcc1f41 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "avahi gtk+ libglade"
 
@@ -50,7 +50,6 @@ do_install_append () {
 	rm ${D}${libdir}/libavahi-g*
 	rm ${D}${libdir}/pkgconfig/avahi-c*
 	rm ${D}${libdir}/pkgconfig/avahi-g*
-	rmdir ${D}${libdir}/avahi
 	rm ${D}${sbindir} -rf
 	rm ${D}${datadir}/avahi/a*
 	rm ${D}${datadir}/avahi/s*
-- 
1.7.6.4



