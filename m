Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWZmP-00080V-G9
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 23:04:37 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 22:54:24 +0200
Message-Id: <1337633664-19754-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1337633664-19754-1-git-send-email-obi@opendreambox.org>
References: <1337633664-19754-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] python: bump PR of packages after update of distutils.bbclass
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
X-List-Received-Date: Mon, 21 May 2012 21:04:37 -0000

* Bump every recipe inheriting distutils or setuptools and
  not overriding do_install without calling distutils_do_install.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../python/python-argparse_1.2.1.bb                |    2 +-
 .../python/python-imaging_1.1.7.bb                 |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 meta/recipes-devtools/python/python-scons_2.1.0.bb |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
index 789cee1..7c15575 100644
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
 SRCNAME = "argparse"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index 6d9743e..a36c344 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
 DEPENDS = "freetype jpeg tiff"
 SRCNAME = "Imaging"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch"
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
index 8b849d7..122e1bd 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;endline=13;md5=fbfe545b1869617123a08c0983ef17b
 DEPENDS = "curl python"
 RDEPENDS_${PN} = "python-core curl"
 SRCNAME = "pycurl"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 568fb0d..0ae35b0 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
 SRCNAME = "Pyrex"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "\
   http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
diff --git a/meta/recipes-devtools/python/python-scons_2.1.0.bb b/meta/recipes-devtools/python/python-scons_2.1.0.bb
index f0b5b1f..8c5aa07 100644
--- a/meta/recipes-devtools/python/python-scons_2.1.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"
 SRCNAME = "scons"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 5dd5f31..a769714 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -5,7 +5,7 @@ LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=23;endline=23;md5=8a314270dd7a8dbca741775415f1716e"
 
 SRCNAME = "setuptools"
-PR = "ml3"
+PR = "ml4"
 DEPENDS += "python"
 DEPENDS_virtclass-native += "python-native"
 
-- 
1.7.9.5



