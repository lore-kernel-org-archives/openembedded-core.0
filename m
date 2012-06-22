Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8B-0007hO-IF
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173238"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:45 -0700
Message-Id: <59e09f44342b4fae68a15f32ba81b40eee0509d2.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/17] gpgme: updated to 1.3.2
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:07 -0000

From: Valentin Popa <valentin.popa@intel.com>

Licence update: the same licence and new copyright years added

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../disable_gpgconf_check.patch                    |    0
 .../gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb}       |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme-1.3.1 => gpgme-1.3.2}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb} (83%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.3.1/disable_gpgconf_check.patch
rename to meta/recipes-support/gpgme/gpgme-1.3.2/disable_gpgconf_check.patch
diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
similarity index 83%
rename from meta/recipes-support/gpgme/gpgme_1.3.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.3.2.bb
index 949a24c..b3c1d46 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.2.bb
@@ -5,19 +5,19 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=942b47052c0674c6a3b9b9e6127628a4 \
+                    file://src/gpgme.h.in;endline=23;md5=00846fee29ec2a6f5c808bfe7fc24e65 \
                     file://src/engine.h;endline=22;md5=e96acfaab1cff82dd8fbefddd2f5c436"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://disable_gpgconf_check.patch"
 
-SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
-SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
+SRC_URI[md5sum] = "326fe97077141713f0930aa87949a287"
+SRC_URI[sha256sum] = "cfd235663f1d1adc97abb38dd5e6d093bb7e155580f171f9ba0158feab69f875"
 DEPENDS = "libgpg-error libassuan ${PTH}"
 PTH_libc-uclibc = "npth"
 PTH = "pth"
 
-PR = "r3"
+PR = "r0"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
-- 
1.7.7.6



