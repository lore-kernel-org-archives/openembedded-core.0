Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 68D137317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2016 07:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="971615010"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2016 07:49:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6B6F76A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:27 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:43 +0300
Message-Id: <1462286989-22848-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/10] libtasn1: upgrade to 4.8
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
X-List-Received-Date: Tue, 03 May 2016 14:49:52 -0000

4.7 -> 4.8

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/gnutls/libtasn1_4.7.bb | 20 --------------------
 meta/recipes-support/gnutls/libtasn1_4.8.bb | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1_4.7.bb
 create mode 100644 meta/recipes-support/gnutls/libtasn1_4.8.bb

diff --git a/meta/recipes-support/gnutls/libtasn1_4.7.bb b/meta/recipes-support/gnutls/libtasn1_4.7.bb
deleted file mode 100644
index 7f08569..0000000
--- a/meta/recipes-support/gnutls/libtasn1_4.7.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for ASN.1 and DER manipulation"
-HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
-
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE_${PN}-bin = "GPLv3+"
-LICENSE_${PN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
-
-SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
-           file://dont-depend-on-help2man.patch \
-           "
-
-SRC_URI[md5sum] = "12d10ca4ae0a3b95f7aa06a076da39ec"
-SRC_URI[sha256sum] = "a40780dc93fc6d819170240e8ece25352058a85fd1d2347ce0f143667d8f11c9"
-
-inherit autotools texinfo binconfig lib_package
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gnutls/libtasn1_4.8.bb b/meta/recipes-support/gnutls/libtasn1_4.8.bb
new file mode 100644
index 0000000..360d529
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1_4.8.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Library for ASN.1 and DER manipulation"
+HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
+
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
+
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
+           file://dont-depend-on-help2man.patch \
+           "
+
+SRC_URI[md5sum] = "9a6767705725544f2b86670dcfb34107"
+SRC_URI[sha256sum] = "fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b577373577c93a8c513"
+
+inherit autotools texinfo binconfig lib_package
+
+BBCLASSEXTEND = "native"
-- 
2.4.0


