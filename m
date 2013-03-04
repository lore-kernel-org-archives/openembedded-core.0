Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UCWkS-0003EZ-Ta
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 15:52:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2013 06:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,779,1355126400"; d="scan'208";a="298734965"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2013 06:35:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 16:37:03 +0200
Message-Id: <1362407823-27662-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] gpgme: upgrade to 1.4.0
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
X-List-Received-Date: Mon, 04 Mar 2013 14:52:18 -0000

License md5 checkum change due to:
- copyright year modification
- space modifications

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{gpgme-1.3.2 => gpgme-1.4.0}/disable_gpgconf_check.patch   |  0
 meta/recipes-support/gpgme/{gpgme_1.3.2.bb => gpgme_1.4.0.bb}  | 10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme-1.3.2 => gpgme-1.4.0}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.3.2.bb => gpgme_1.4.0.bb} (76%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.0/disable_gpgconf_check.patch
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
rename to meta/recipes-support/gpgme/gpgme-1.4.0/disable_gpgconf_check.patch
diff --git a/meta/recipes-support/gpgme/gpgme_1.3.2.bb b/meta/recipes-support/gpgme/gpgme_1.4.0.bb
similarity index 76%
rename from meta/recipes-support/gpgme/gpgme_1.3.2.bb
rename to meta/recipes-support/gpgme/gpgme_1.4.0.bb
index f19892c5..23f4e4d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.0.bb
@@ -5,19 +5,19 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=00846fee29ec2a6f5c808bfe7fc24e65 \
-                    file://src/engine.h;endline=22;md5=e96acfaab1cff82dd8fbefddd2f5c436"
+                    file://src/gpgme.h.in;endline=23;md5=a7b9706396e8e12c17be7d8d556ef7a5 \
+                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://disable_gpgconf_check.patch"
 
-SRC_URI[md5sum] = "326fe97077141713f0930aa87949a287"
-SRC_URI[sha256sum] = "cfd235663f1d1adc97abb38dd5e6d093bb7e155580f171f9ba0158feab69f875"
+SRC_URI[md5sum] = "a0f93aba6d8a831ba14905085027f2f9"
+SRC_URI[sha256sum] = "728c959abb0795ed4357b308cdbba92210d22998b075664d1e038d3cc7145619"
 DEPENDS = "libgpg-error libassuan ${PTH}"
 PTH_libc-uclibc = "npth"
 PTH = "pth"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
-- 
1.7.11.7



