Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ionutx.radu@intel.com>) id 1Ua5sm-0001dU-Gc
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:02:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2013 07:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="330858795"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 07:40:34 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 17:41:59 +0300
Message-Id: <1368024119-4149-10-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
References: <1368024119-4149-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 9/9] gpgme: Updated from 1.4.0 to 1.4.1
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
X-List-Received-Date: Wed, 08 May 2013 15:02:26 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../{gpgme-1.4.0 => gpgme-1.4.1}/disable_gpgconf_check.patch     |    0
 meta/recipes-support/gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb}    |    6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme-1.4.0 => gpgme-1.4.1}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.0.bb => gpgme_1.4.1.bb} (89%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.0/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.1/disable_gpgconf_check.patch
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.4.0/disable_gpgconf_check.patch
rename to meta/recipes-support/gpgme/gpgme-1.4.1/disable_gpgconf_check.patch
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.0.bb b/meta/recipes-support/gpgme/gpgme_1.4.1.bb
similarity index 89%
rename from meta/recipes-support/gpgme/gpgme_1.4.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.4.1.bb
index a8c1157..13bc508 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.1.bb
@@ -12,14 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://disable_gpgconf_check.patch"
 
-SRC_URI[md5sum] = "a0f93aba6d8a831ba14905085027f2f9"
-SRC_URI[sha256sum] = "728c959abb0795ed4357b308cdbba92210d22998b075664d1e038d3cc7145619"
+SRC_URI[md5sum] = "07f1c0eb6596a94efa3ffb75e74bfbba"
+SRC_URI[sha256sum] = "7ab63e5086ebe4cfe7f78face1bb059a7a60da586b1e5c6a77bedcd6d04019b8"
 DEPENDS = "libgpg-error libassuan ${PTH}"
 PTH_libc-uclibc = "npth"
 PTH = "pth"
 
-PR = "r0"
-
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
 
-- 
1.7.10.4



