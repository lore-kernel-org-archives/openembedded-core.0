Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK8FH-00022D-43
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 15:14:59 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:05:21 +0200
Message-Id: <1334667923-13908-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/5] python: use PKGSUFFIX for libpython2
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
X-List-Received-Date: Tue, 17 Apr 2012 13:14:59 -0000

* python-nativesdk shouldn't provide libpython2, but
  libpython2-nativesdk.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 95e17a8..1fcfa71 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -133,8 +133,8 @@ RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 
 # package libpython2
-PACKAGES =+ "lib${BPN}2"
-FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${BPN}2${PKGSUFFIX}"
+FILES_lib${BPN}2${PKGSUFFIX} = "${libdir}/libpython*.so.*"
 
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
@@ -148,3 +148,6 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.5.4



