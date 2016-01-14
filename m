Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DE799731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103166"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:24 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:49 +0200
Message-Id: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/9] gpgme: upgrade to 1.6.0
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:26 -0000

License checksum changed because of text layout change.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/gpgme/{gpgme_1.5.4.bb => gpgme_1.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.5.4.bb => gpgme_1.6.0.bb} (85%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.5.4.bb b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
similarity index 85%
rename from meta/recipes-support/gpgme/gpgme_1.5.4.bb
rename to meta/recipes-support/gpgme/gpgme_1.6.0.bb
index 1598377..987d19b 100644
--- a/meta/recipes-support/gpgme/gpgme_1.5.4.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=71ba2ae8d6ca034ed10bd099a8cf473c \
+                    file://src/gpgme.h.in;endline=23;md5=5027eec93a996272a9a0a6a86cf35775 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/${BP}.tar.bz2 \
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/${BP}.tar.bz2 \
            file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "feafa03ea064e1d1dc11bc2b88404623"
-SRC_URI[sha256sum] = "bb38c0ec8815c9e94e6047b484984808a8dad9d6bec8df33dc5339fd55ffea6c"
+SRC_URI[md5sum] = "60d730d22e8065fd5de309e8b98e304b"
+SRC_URI[sha256sum] = "b09de4197ac280b102080e09eaec6211d081efff1963bf7821cf8f4f9916099d"
 
 DEPENDS = "libgpg-error libassuan"
 
-- 
2.1.4


