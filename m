Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tzc4I-00029X-QV
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:55:23 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9E6DA2FD91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2013 18:39:38 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2013 15:39:12 -0800
Message-Id: <4f3d13947720d199ca76a9b2d91adc0db0b2df9b.1359329823.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9E6DA2FD91.996AA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/4] libtasn1: Upgrade to 2.13
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
X-List-Received-Date: Sun, 27 Jan 2013 23:55:23 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.12.bb => libtasn1_2.13.bb}  |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.12.bb => libtasn1_2.13.bb} (80%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.13.bb
similarity index 80%
rename from meta/recipes-support/gnutls/libtasn1_2.12.bb
rename to meta/recipes-support/gnutls/libtasn1_2.13.bb
index d0b4191..891c5b6 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.12.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.13.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
            "
 
-SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
-SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
+SRC_URI[md5sum] = "df27eaddcc46172377e6b907e33ddc83"
+SRC_URI[sha256sum] = "a56e46483d1d42fe44ba58c9758620844042468d7c2d75f6318cdf3222745a91"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.9.5



