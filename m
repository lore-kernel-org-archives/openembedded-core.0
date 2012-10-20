Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1TPcAm-0005Pp-5r
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 18:45:16 +0200
Received: from gnutoo-laptop.local ([192.168.1.118] helo=localhost.localdomain)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.76) (envelope-from <GNUtoo@no-log.org>)
	id 1TPbIj-0004mS-HM; Sat, 20 Oct 2012 17:49:25 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2012 17:50:13 +0200
Message-Id: <1350748213-6436-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] boost: Activate zlib and bzip2 because they now work.
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
X-List-Received-Date: Sat, 20 Oct 2012 16:45:16 -0000

This patch is needed for making wesnoth(will be sumbited
  in meta-games) work.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 meta/recipes-support/boost/boost.inc |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index ec602a6..f836243 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
@@ -109,16 +109,11 @@ EQD = '\"'
 #boost.bb:   "...  '-sGCC=... '${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}config${EQD}'${SQD} ..."
 BJAM_CONF = "${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}boost/config/platform/${TARGET_OS}.hpp${EQD}'${SQD}"
 
-# bzip2 and zip are disabled because... they're broken - the compilation simply
-# isn't working with bjam.  I guess they will fix it, but who needs it?  This
-# only affects the (new in 33) iostream library.
 BJAM_TOOLS   = "-sTOOLS=gcc \
 		'-sGCC=${CC} '${BJAM_CONF} \
 		'-sGXX=${CXX} '${BJAM_CONF} \
 		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
 		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
-		'-sNO_BZIP2=1' \
-		'-sNO_ZLIB=1' \
 		'-sBUILD=release <optimization>space <threading>multi <inlining>on <debug-symbols>off' \
 		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
 		'-sPYTHON_ROOT=${PYTHON_ROOT}' \
-- 
1.7.5.4



