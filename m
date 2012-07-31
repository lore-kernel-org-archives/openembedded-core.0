Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwC60-0004mu-2K
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:02:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2012 05:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175259586"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2012 05:51:04 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 15:52:47 +0300
Message-Id: <1343739167-13835-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3] atk: package update 2.2 -> 2.4
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
X-List-Received-Date: Tue, 31 Jul 2012 13:02:44 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../atk/{atk_2.2.0.bb => atk_2.4.0.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{atk_2.2.0.bb => atk_2.4.0.bb} (72%)

diff --git a/meta/recipes-support/atk/atk_2.2.0.bb b/meta/recipes-support/atk/atk_2.4.0.bb
similarity index 72%
rename from meta/recipes-support/atk/atk_2.2.0.bb
rename to meta/recipes-support/atk/atk_2.4.0.bb
index d8706ff..e2de5d6 100644
--- a/meta/recipes-support/atk/atk_2.2.0.bb
+++ b/meta/recipes-support/atk/atk_2.4.0.bb
@@ -7,15 +7,15 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-PR = "r3"
+PR = "r0"
 
 DEPENDS = "glib-2.0"
 
 inherit autotools gtk-doc pkgconfig
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "4894e9b04f0a9f1c37a624a1e8d6d73f"
-SRC_URI[sha256sum] = "d201e3f5808aef0b1aec2277bfa61074f68863e405428adb57a73aab5c838450"
+SRC_URI = "http://download.gnome.org/sources/atk/2.4/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2184a140f71d50276669d6eda5cce5db"
+SRC_URI[sha256sum] = "091e9ce975a9fbbc7cd8fa64c9c389ffb7fa6cdde58b6d5c01b2c267093d888d"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.9.5



