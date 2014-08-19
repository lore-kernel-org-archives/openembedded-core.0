Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF1270E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283390"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:11 -0700
Message-Id: <d93fc772046e4bf2ed8c8fcbabcedb7ba8587a90.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
In-Reply-To: <cover.1408459360.git.sgw@linux.intel.com>
References: <cover.1408459360.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] libidn: Upgrade to 1.29
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

The COPYING and other files updated the year to 2014 so the Checksums
needed to be updated also.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/libidn/{libidn_1.28.bb => libidn_1.29.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.28.bb => libidn_1.29.bb} (75%)

diff --git a/meta/recipes-extended/libidn/libidn_1.28.bb b/meta/recipes-extended/libidn/libidn_1.29.bb
similarity index 75%
rename from meta/recipes-extended/libidn/libidn_1.28.bb
rename to meta/recipes-extended/libidn/libidn_1.29.bb
index bd079c1..04b5344 100644
--- a/meta/recipes-extended/libidn/libidn_1.28.bb
+++ b/meta/recipes-extended/libidn/libidn_1.29.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specification
 HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "(LGPLv2.1+ | LGPLv3) & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3231f57e8fce0f62f81b03107e788888 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b35f8839295dd730a55f1a19ec086217 \
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://lib/idna.h;endline=21;md5=f73089b7f52dd2cb3540e274bd76106d \
-                    file://src/idn.c;endline=20;md5=d7797e6cc3a7b48e6050fc0d27104595"
+                    file://lib/idna.h;endline=21;md5=61a0e126c0c5552290d9bfa57e407dd6 \
+                    file://src/idn.c;endline=20;md5=3f55c28bede16bd7b1244be73067d195"
 
 inherit pkgconfig autotools gettext texinfo
 
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
 "
 
-SRC_URI[md5sum] = "43a6f14b16559e10a492acc65c4b0acc"
-SRC_URI[sha256sum] = "dd357a968449abc97c7e5fa088a4a384de57cb36564f9d4e0d898ecc6373abfb"
+SRC_URI[md5sum] = "2b67bb507207af379f9461e1307dc84b"
+SRC_URI[sha256sum] = "fb82747dbbf9b36f703ed27293317d818d7e851d4f5773dedf3efa4db32a7c7c"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
1.8.3.1


