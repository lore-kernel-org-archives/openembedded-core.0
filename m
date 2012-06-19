Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sh5bZ-0002sr-99
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 23:04:53 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:56874 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sh5RD-0002YG-0K for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 16:54:11 -0400
Date: Tue, 19 Jun 2012 16:54:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1206191652560.3440@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Simplify "SRC_URI_append +=" to "SRC_URI_append ="
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
X-List-Received-Date: Tue, 19 Jun 2012 21:04:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index 54ff3d4..2c4b325 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \

 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
-SRC_URI_append_qemumips += " file://32bitBE-support.patch"
-SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
+SRC_URI_append_qemumips = " file://32bitBE-support.patch"
+SRC_URI_append_qemuppc = " file://32bitBE-support.patch"


 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index 3d1bc43..273cc72 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
 SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
 PR = "r2"

-SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
+SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "

 inherit autotools pkgconfig

diff --git a/meta/recipes-support/gmp/gmp_5.0.4.bb b/meta/recipes-support/gmp/gmp_5.0.4.bb
index cb2ca5b..0f72742 100644
--- a/meta/recipes-support/gmp/gmp_5.0.4.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
 PR = "r1"

-SRC_URI_append += "file://use-includedir.patch \
+SRC_URI_append = "file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
                    file://gmp_fix_for_automake-1.12.patch \
                    "

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


