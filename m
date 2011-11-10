Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOE-0005b1-OE
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:38 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351194"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:48 -0800
Message-Id: <a037521a43dfe27a1c148ae7b7a9f130bbaec4be.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 06/33] libtasn1: update to 2.10
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:39 -0000

COPYING.LIB has white space formating changing
README has Copyright update to year range

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.9.bb => libtasn1_2.10.bb}   |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.9.bb => libtasn1_2.10.bb} (65%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.9.bb b/meta/recipes-support/gnutls/libtasn1_2.10.bb
similarity index 65%
rename from meta/recipes-support/gnutls/libtasn1_2.9.bb
rename to meta/recipes-support/gnutls/libtasn1_2.10.bb
index 9a80005..ef15be7 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.9.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.10.bb
@@ -5,18 +5,16 @@ LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN} = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-#RREPLACES_${PN}-bin = "libtasn1 (<< 2.7)"
+SRC_URI[md5sum] = "ef80c227d0dcdc2940fbc58faf8e0cf1"
+SRC_URI[sha256sum] = "17e4c06212e00437c13633c26ed73dad21784805008cf7550f1399adbd1006d0"
 
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f4f4035b84550100ffeb8ad4b261dea9"
-SRC_URI[sha256sum] = "fac46855fac8b08cf6f5a1b60cebad8e090bac1f06c335a044e84110d0b412c4"
-
 inherit autotools binconfig lib_package
 
 BBCLASSEXTEND = "native"
-- 
1.7.6.4



