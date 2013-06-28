Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1173060655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:01:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 09:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973391"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:45 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:44 +0300
Message-Id: <cb6e6cc6bd68ce302acae8bbbfa06536c7bd2b7f.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372434126.git.ionutx.radu@intel.com>
References: <cover.1372434126.git.ionutx.radu@intel.com>
Subject: [PATCH 12/12] gpgme: Updated from 1.4.1 to 1.4.2
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
X-List-Received-Date: Fri, 28 Jun 2013 16:01:53 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>

License md5 was changed for src/gpgme.h.in:
"File: @configure_input@  */" was replaced by "Generated from gpgme.h.in for @GPGME_CONFIG_HOST@.  */"
---
 .../{gpgme-1.4.1 => gpgme-1.4.2}/disable_gpgconf_check.patch     |    0
 meta/recipes-support/gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb}    |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme-1.4.1 => gpgme-1.4.2}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb} (83%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.1/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.4.1/disable_gpgconf_check.patch
rename to meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.1.bb b/meta/recipes-support/gpgme/gpgme_1.4.2.bb
similarity index 83%
rename from meta/recipes-support/gpgme/gpgme_1.4.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.4.2.bb
index 13bc508..040cdf4 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.2.bb
@@ -6,14 +6,14 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=a7b9706396e8e12c17be7d8d556ef7a5 \
+                    file://src/gpgme.h.in;endline=23;md5=dccb4bb624011e36513c61ef0422d054 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
            file://disable_gpgconf_check.patch"
 
-SRC_URI[md5sum] = "07f1c0eb6596a94efa3ffb75e74bfbba"
-SRC_URI[sha256sum] = "7ab63e5086ebe4cfe7f78face1bb059a7a60da586b1e5c6a77bedcd6d04019b8"
+SRC_URI[md5sum] = "c8cb345ba7c0353e47bdf3c5c05e49be"
+SRC_URI[sha256sum] = "2c4f2bf71e53e6fb7badf07801d4248777566a621c8c2339c02c289731df6856"
 DEPENDS = "libgpg-error libassuan ${PTH}"
 PTH_libc-uclibc = "npth"
 PTH = "pth"
-- 
1.7.10.4


