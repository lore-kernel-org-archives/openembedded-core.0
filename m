Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72ED8731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103216"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:31 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:53 +0200
Message-Id: <4bf7acdb66a5014b0433d275ff3c253b9cd86b31.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/9] libgpg-error: upgrade to 1.21
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:32 -0000

License checksum changed because text layout changed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libgpg-error/{libgpg-error_1.19.bb => libgpg-error_1.21.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.19.bb => libgpg-error_1.21.bb} (86%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
similarity index 86%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
index c69930a..0dd1602 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.21.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=8b204918f0ca707136394d8bb20c7ebc \
+                    file://src/gpg-error.h.in;endline=23;md5=93d3155af141ae3b369a5d09ca9d6234 \
                     file://src/init.c;endline=20;md5=8f5a9b59634f4aebcd0ec9d3ebd53bfe"
 
 
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	   file://0001-libgpg-error-Add-nios2-support.patch \
 	  "
-SRC_URI[md5sum] = "c04c16245b92829281f43b5bef7d16da"
-SRC_URI[sha256sum] = "53120e1333d5c5d28d87ff2854e9e98719c8e214152f17ad5291704d25c4978b"
+SRC_URI[md5sum] = "ab0b5aba6d0a185b41d07bda804fd8b2"
+SRC_URI[sha256sum] = "b7dbdb3cad63a740e9f0c632a1da32d4afdb694ec86c8625c98ea0691713b84d"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.1.4


