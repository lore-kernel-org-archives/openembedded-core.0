Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 190AF6B878
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010167"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:29 +0000
Message-Id: <3753aec417720a3a09ce6c7a6e2a19d23c19bcaf.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 33/38] opkg-utils: tidy up recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:30:32 -0000

* Update HOMEPAGE
* Rearrange statements in logical order

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 10063e8..714fc51 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -1,25 +1,27 @@
 SUMMARY = "Additional utilities for the opkg package manager"
 SECTION = "base"
-HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
+HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
-RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
-RDEPENDS_${PN}_class-native = ""
+
 SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils \
-           "
+SRC_URI = "git://git.yoctoproject.org/opkg-utils"
 
 S = "${WORKDIR}/git"
 
-# Avoid circular dependencies from package_ipk.bbclass
-PACKAGES_class-native = ""
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
 
+# Avoid circular dependencies from package_ipk.bbclass
+PACKAGES_class-native = ""
+
+RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
+RDEPENDS_${PN}_class-native = ""
+
 BBCLASSEXTEND = "native"
-TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.8.1.2


