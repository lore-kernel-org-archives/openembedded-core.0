Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A68EA74CCC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254282"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:37 +0300
Message-Id: <20180504123244.43049-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/14] ca-certificates: update to 20180409
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
X-List-Received-Date: Fri, 04 May 2018 12:38:44 -0000

License-Update: URI fix
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20170717.bb => ca-certificates_20180409.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
similarity index 95%
rename from meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
index 350294858be..ccf8129cecc 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0+ & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need c_rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
+SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.16.1


