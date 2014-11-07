Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7DE65DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2014 16:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989768"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:31 -0800
Message-Id: <85b7d0aabc4dbee6c16adb808857ba8d64cae944.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 06/19] libksba: Ugrade to 1.3.1
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libksba/{libksba_1.3.0.bb => libksba_1.3.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.0.bb => libksba_1.3.1.bb} (85%)

diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.1.bb
similarity index 85%
rename from meta/recipes-support/libksba/libksba_1.3.0.bb
rename to meta/recipes-support/libksba/libksba_1.3.1.bb
index 13ad437..6950dbb 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
                     file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
-PR = "r1"
 
 DEPENDS = "libgpg-error"
 
@@ -17,8 +16,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "cd86fad9c9d360b2cf80449f8a4a4075"
-SRC_URI[sha256sum] = "5a61eed50550d4d0dcb47457ce7b6a90f8e719d42a3b25f7e79333e8cd721971"
+SRC_URI[md5sum] = "9be95245fcfa9d56f56853078ef2650b"
+SRC_URI[sha256sum] = "bc96b95516bd2b67f413bc8b5cc5a75a2583c6e666d24dfd0d5bcc6b1aab46f9"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
1.8.3.1


