Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VU-0002Yh-Qj
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486058"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:49 -0800
Message-Id: <ef2dcae84fe3a91f781ce906ea283d9f8d698af8.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 10/14] libidn: Update to 1.24
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:01 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libidn/{libidn_1.23.bb => libidn_1.24.bb}      |   23 +++++++++++++-------
 1 files changed, 15 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.23.bb => libidn_1.24.bb} (40%)

diff --git a/meta/recipes-extended/libidn/libidn_1.23.bb b/meta/recipes-extended/libidn/libidn_1.24.bb
similarity index 40%
rename from meta/recipes-extended/libidn/libidn_1.23.bb
rename to meta/recipes-extended/libidn/libidn_1.24.bb
index 851b5fc..018f118 100644
--- a/meta/recipes-extended/libidn/libidn_1.23.bb
+++ b/meta/recipes-extended/libidn/libidn_1.24.bb
@@ -2,23 +2,30 @@ SUMMARY = "Internationalized Domain Name support library"
 DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1+ & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://lib/idna.h;endline=21;md5=dbd4426bbc38846d5a6b94c3570fd756 \
-                    file://src/idn.c;endline=20;md5=e7bc77cab53f7367b7e381aaa546e76c"
+LICENSE = "(LGPLv2.1+ | LGPLv3) & GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
+                    file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
+                    file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
 PR = "r0"
 
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f9a417270cc9b6bf763ae1f88e60191c"
-SRC_URI[sha256sum] = "25b42d75851ebae52e1c969353b74eefd3d6817f41c8d2a6db258f5ec60c5e6a"
+SRC_URI[md5sum] = "764d7258eeb273941680499fab2c7367"
+SRC_URI[sha256sum] = "da1708c6063ecb7951a0908e67df3eacdfe128b18edaa6cf6867d7b73b5f35ff"
 
-# command tool is under GPLv3+, while libidn itself is under LGPLv2.1+
+# command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
 PACKAGES =+ "idn"
 FILES_idn = "${bindir}/*"
 
 EXTRA_OECONF = " --disable-tld"
+
+do_install_append() {
+	rm -rf ${D}${datadir}/emacs
+}
-- 
1.7.6.5



