Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tzc4A-00025r-RG
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:55:15 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 95B062FD91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2013 18:39:28 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2013 15:39:10 -0800
Message-Id: <8087cbac38ba638868b9b858440d61a9e199589c.1359329823.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1359329823.git.scott.a.garman@intel.com>
References: <cover.1359329823.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 95B062FD91.B8CF1
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/4] libtasn1: Update to 2.12
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
X-List-Received-Date: Sun, 27 Jan 2013 23:55:15 -0000

From: Saul Wold <sgw@linux.intel.com>

Use the GUN_MIRROR correctly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb}  |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb} (71%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.11.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
similarity index 71%
rename from meta/recipes-support/gnutls/libtasn1_2.11.bb
rename to meta/recipes-support/gnutls/libtasn1_2.12.bb
index 1a87fc8..aae409e 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.11.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PR = "r0"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ee8076752f2afcbcd12f3dd9bc622748"
-SRC_URI[sha256sum] = "f4d43c77c12ceabf1a72911472fc8c67e43728b328dfb1b83fd519ed5d079afb"
+SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
+SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.9.5



