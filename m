Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E368865D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:28:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="712140367"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2015 16:28:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 18 May 2015 16:28:36 -0700
Message-Id: <1431991720-19892-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
References: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/5] libidn: Upgrade to 1.30
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
X-List-Received-Date: Mon, 18 May 2015 23:28:42 -0000

LIC_CHKSUM updated because year was changed in those associated files.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/libidn/{libidn_1.29.bb => libidn_1.30.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.29.bb => libidn_1.30.bb} (75%)

diff --git a/meta/recipes-extended/libidn/libidn_1.29.bb b/meta/recipes-extended/libidn/libidn_1.30.bb
similarity index 75%
rename from meta/recipes-extended/libidn/libidn_1.29.bb
rename to meta/recipes-extended/libidn/libidn_1.30.bb
index 04b5344..7234747 100644
--- a/meta/recipes-extended/libidn/libidn_1.29.bb
+++ b/meta/recipes-extended/libidn/libidn_1.30.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(LGPLv2.1+ | LGPLv3) & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b35f8839295dd730a55f1a19ec086217 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://lib/idna.h;endline=21;md5=61a0e126c0c5552290d9bfa57e407dd6 \
-                    file://src/idn.c;endline=20;md5=3f55c28bede16bd7b1244be73067d195"
+                    file://lib/idna.h;endline=21;md5=7c0b3828d1b153663be9a04ad4f7975f \
+                    file://src/idn.c;endline=20;md5=f4235f2a2cb2b65786b2979fb3cf7fbf"
 
 inherit pkgconfig autotools gettext texinfo
 
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
 "
 
-SRC_URI[md5sum] = "2b67bb507207af379f9461e1307dc84b"
-SRC_URI[sha256sum] = "fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c"
+SRC_URI[md5sum] = "b17edc8551cd31cc5f14c82a9dabf58e"
+SRC_URI[sha256sum] = "39b9fc94d74081c185757b12e0891ce5a22db55268e7d1bb24533ff4432eb053"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.1.0


