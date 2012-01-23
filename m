Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrW-0004vP-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212264"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:22 -0800
Message-Id: <71042b0bec4387009410935b80aa04f604abfe8e.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 17/21] opkg: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:27 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/opkg/opkg.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index b03eaf7..a67066f 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -11,7 +11,7 @@ DEPENDS_virtclass-native = "curl-native"
 DEPENDS_virtclass-nativesdk = "curl-nativesdk"
 
 PE = "1"
-PR_INC = "r6"
+INC_PR = "r7"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
 
@@ -41,10 +41,11 @@ RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
 RREPLACES_${PN} = "opkg-nogpg"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
 FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
 
 # We need to create the lock directory
-- 
1.7.6.5



