Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SUelO-0007aN-4F
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 15:59:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 06:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141279234"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.35])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 06:48:25 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 16:47:49 +0300
Message-Id: <1337176070-16359-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gnupg: Update to upstream version 2.0.19
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
X-List-Received-Date: Wed, 16 May 2012 13:59:38 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../gnupg/{gnupg_2.0.18.bb => gnupg_2.0.19.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.0.18.bb => gnupg_2.0.19.bb} (81%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
similarity index 81%
rename from meta/recipes-support/gnupg/gnupg_2.0.18.bb
rename to meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 3085494..1d19fe3 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
-PR = "r1"
+PR = "r0"
 
 inherit autotools gettext
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
-SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
+SRC_URI[md5sum] = "6a8589381ca1b0c1a921e9955f42b016"
+SRC_URI[sha256sum] = "efa23a8a925adb51c7d3b708c25b6d000300f5ce37de9bdec6453be7b419c622"
 
 EXTRA_OECONF = "--disable-ldap \
 		--with-zlib=${STAGING_LIBDIR}/.. \
-- 
1.7.9.5



