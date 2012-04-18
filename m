Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jonas.danielsson@lundinova.se>) id 1SKY5h-00060B-Ln
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 18:50:49 +0200
Received: from jkd-desktop.lundinova.se (unknown [10.240.22.76])
	by mailhost.lundinova.se (Postfix) with ESMTP id A9B51E826A;
	Wed, 18 Apr 2012 18:12:43 +0200 (CEST)
From: Jonas Danielsson <jonas.danielsson@lundinova.se>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 18:12:42 +0200
Message-Id: <1334765562-27101-1-git-send-email-jonas.danielsson@lundinova.se>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] opkg-utils: extend to nativesdk
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
X-List-Received-Date: Wed, 18 Apr 2012 16:50:49 -0000


Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 4fe4038..eb42eae 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
+RDEPENDS_${PN}_virtclass-nativesdk = "python-nativesdk"
 SRCREV = "16665959c330b5958c0f0f4624a9ca7f823f98de"
 PV = "0.1.8+git${SRCPV}"
 PR = "r1"
@@ -27,5 +28,5 @@ do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.5.4



