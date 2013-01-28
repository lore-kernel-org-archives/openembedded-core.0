Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4U-0003oH-1K
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769985"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:53 -0800
Message-Id: <8be5dd0c97eb3d45e521a7c5a4b9e4d101e10129.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 06/13] libidn: Update to 1.26
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/libidn/{libidn_1.25.bb => libidn_1.26.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.25.bb => libidn_1.26.bb} (85%)

diff --git a/meta/recipes-extended/libidn/libidn_1.25.bb b/meta/recipes-extended/libidn/libidn_1.26.bb
similarity index 85%
rename from meta/recipes-extended/libidn/libidn_1.25.bb
rename to meta/recipes-extended/libidn/libidn_1.26.bb
index 6584edd..284e871 100644
--- a/meta/recipes-extended/libidn/libidn_1.25.bb
+++ b/meta/recipes-extended/libidn/libidn_1.26.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(LGPLv2.1+ | LGPLv3) & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
+LIC_FILES_CHKSUM = "file://COPYING;md5=91146090ae24a0572879d3b48646d404 \
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r1"
+PR = "r0"
 
 inherit pkgconfig autotools gettext
 
@@ -18,8 +18,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://libidn_fix_for_automake-1.12.patch \
            file://avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch "
 
-SRC_URI[md5sum] = "45ffabce4b8ca87fe98fe4542668d33d"
-SRC_URI[sha256sum] = "7fe625328a6a5d837d723c462c1788affb84d9c9fc0ae5cd0ce9ac7724c34716"
+SRC_URI[md5sum] = "7533d14fbbb6c026a1a9eaa2179ccb69"
+SRC_URI[sha256sum] = "0a2f4c71c80f8f389a99d5a26539a9be4a4ac42cd7f375aa41046660f63cc53c"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
1.8.0.2



