Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx7F-00036R-DW
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:41 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118374008"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:40 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:27 +0300
Message-Id: <1341298228-4412-11-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 10/10] lighttpd: upgrade to 1.4.31
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:41 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb} (92%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
similarity index 92%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
index 161c0d9..ea41d82 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
         file://index.html.lighttpd \
@@ -25,8 +25,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd_fix_for_automake-1.12.patch \
         "
 
-SRC_URI[md5sum] = "63f9df52dcae0ab5689a95c99c54e48a"
-SRC_URI[sha256sum] = "0d795597e4666dbf6ffe44b4a42f388ddb44736ddfab0b1ac091e5bb35212c2d"
+SRC_URI[md5sum] = "c718cc27658240d307b8a1d1c7c4bb54"
+SRC_URI[sha256sum] = "5209e7a25d3044cb21b34d6a2bb3a6f6c216ba903ea486a803d070582e5e26ac"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.7.9.5



