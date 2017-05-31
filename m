Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A3373780A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:39:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1176493834"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2017 04:39:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 68E4C5803AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 04:39:36 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:39:35 +0300
Message-Id: <1496230776-38517-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1496230776-38517-1-git-send-email-maxin.john@intel.com>
References: <1496230776-38517-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] libtasn1: upgrade 4.10 -> 4.12
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
X-List-Received-Date: Wed, 31 May 2017 11:39:38 -0000

Noteworthy changes:

1. Introduced the ASN1_TIME_ENCODING_ERROR error code to indicate an invalid
encoding in the DER time fields.
2. Introduced flag ASN1_DECODE_FLAG_ALLOW_INCORRECT_TIME. This flag allows
decoding errors in time fields even when in strict DER mode.
3. Added safety check in asn1_find_node(). That prevents a crash when a very
long variable name is provided by the developer.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.10.bb => libtasn1_4.12.bb} (83%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.10.bb b/meta/recipes-support/gnutls/libtasn1_4.12.bb
similarity index 83%
rename from meta/recipes-support/gnutls/libtasn1_4.10.bb
rename to meta/recipes-support/gnutls/libtasn1_4.12.bb
index 33a768d..cec1a9b 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.10.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.12.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "f4faffdf63969d0e4e6df43b9679e8e5"
-SRC_URI[sha256sum] = "681a4d9a0d259f2125713f2e5766c5809f151b3a1392fd91390f780b4b8f5a02"
+SRC_URI[md5sum] = "5c724bd1f73aaf4a311833e1cd297b21"
+SRC_URI[sha256sum] = "6753da2e621257f33f5b051cc114d417e5206a0818fe0b1ecfd6153f70934753"
 
 inherit autotools texinfo binconfig lib_package gtk-doc
 
-- 
2.4.0


