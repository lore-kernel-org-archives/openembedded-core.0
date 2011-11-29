Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWny-000278-Nt
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:38 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720808"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:18 -0800
Message-Id: <587afb19b65ef32a52fb2ff13ab7caa8056e0e4b.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 18/26] libtasn1: Update to 2.11
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:39 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.10.bb => libtasn1_2.11.bb}  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.10.bb => libtasn1_2.11.bb} (80%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.10.bb b/meta/recipes-support/gnutls/libtasn1_2.11.bb
similarity index 80%
rename from meta/recipes-support/gnutls/libtasn1_2.10.bb
rename to meta/recipes-support/gnutls/libtasn1_2.11.bb
index ef15be7..1a87fc8 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.10.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.11.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-SRC_URI[md5sum] = "ef80c227d0dcdc2940fbc58faf8e0cf1"
-SRC_URI[sha256sum] = "17e4c06212e00437c13633c26ed73dad21784805008cf7550f1399adbd1006d0"
-
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
+SRC_URI[md5sum] = "ee8076752f2afcbcd12f3dd9bc622748"
+SRC_URI[sha256sum] = "f4d43c77c12ceabf1a72911472fc8c67e43728b328dfb1b83fd519ed5d079afb"
+
 inherit autotools binconfig lib_package
 
 BBCLASSEXTEND = "native"
-- 
1.7.6.4



