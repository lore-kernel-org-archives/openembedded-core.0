Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisU-00087L-Fn
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:23 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLP1E028226 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:25 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLPvB028225
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:18 -0700
Message-Id: <9b8f35e2f0d9087f47e61d71445a0185b67bfe3b.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] gnutls: use lib_package bbclass
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:23 -0000

This is a clean-up following the recent addition of PN-bin
to bitbake.conf and lib_package

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc |   14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index b16dd21..d6c187f 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/gnutls/gnutls-${PV}.tar.bz2"
 
-inherit autotools binconfig pkgconfig gettext
+inherit autotools binconfig pkgconfig gettext lib_package
 
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
@@ -35,15 +35,7 @@ do_configure_prepend() {
 	done
 }
 
-PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-bin ${PN}-xx"
-
-FILES_${PN}-bin = "${bindir}/gnutls-serv \
-                   ${bindir}/gnutls-cli \
-                   ${bindir}/srptool \
-                   ${bindir}/psktool \
-                   ${bindir}/p11tool \
-                   ${bindir}/certtool \
-                   ${bindir}/gnutls-srpcrypt"
+PACKAGES =+ "${PN}-openssl ${PN}-extra ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES_${PN}-extra = "${libdir}/libgnutls-extra.so.*"
-- 
1.7.10.4



