Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UCXmw-0008PX-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 16:58:55 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Mar 2013 07:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,779,1355126400"; d="scan'208";a="264098531"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Mar 2013 07:42:23 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 17:43:39 +0200
Message-Id: <1362411819-28821-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] libgpg-error: upgrade to 1.11
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
X-List-Received-Date: Mon, 04 Mar 2013 15:59:05 -0000

License checksum change due to:
- copyright year modification

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{libgpg-error-1.10 => libgpg-error-1.11}/pkgconfig.patch      | 0
 .../libgpg-error/{libgpg-error_1.10.bb => libgpg-error_1.11.bb}   | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.10 => libgpg-error-1.11}/pkgconfig.patch (100%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.10.bb => libgpg-error_1.11.bb} (77%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.10/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error-1.11/pkgconfig.patch
similarity index 100%
rename from meta/recipes-support/libgpg-error/libgpg-error-1.10/pkgconfig.patch
rename to meta/recipes-support/libgpg-error/libgpg-error-1.11/pkgconfig.patch
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.11.bb
similarity index 77%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.11.bb
index 64b50b9..1caa0dd 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.11.bb
@@ -5,18 +5,18 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=508c78081f11544da0fbb8c95913a301 \
+                    file://src/gpg-error.h.in;endline=23;md5=6ac0378874589a44d53512b3786b4bc0 \
                     file://src/init.c;endline=20;md5=b69742f2a8827d494c6f6a4b1768416c"
 
 
 SECTION = "libs"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "736a03daa9dc5873047d4eb4a9c22a16"
-SRC_URI[sha256sum] = "520629b4568b5c29b1991c8ffc267c8bdee5f223c7333c42a651b56f9b1c5431"
+SRC_URI[md5sum] = "b9fa55b71cae73cb2e44254c2acc4e2c"
+SRC_URI[sha256sum] = "ae3376480a073b120c7add08f1e6cfcc08500648ccf22461cd42db6224a218c0"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.11.7



