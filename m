Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 12CDC73285
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877486"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:28 +0200
Message-Id: <5d337968d9beb064f89d165da20c2528a2128e13.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/5] ca-certificates: update to 20160104
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:19 -0000

LICENSE checksum changed due to an updated file listing in debian/copyright

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20150426.bb => ca-certificates_20160104.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20150426.bb => ca-certificates_20160104.bb} (93%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
similarity index 93%
rename from meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
index 716e3df..4266926 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -5,14 +5,13 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0+ & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=48d2baf97986999e776b43c8dd9e0c5a"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = "ca-certificates-native"
 DEPENDS_class-native = ""
 
-# tag: debian/20150426 + 2
-SRCREV = "d4790d2832aaac9152f450e06661511067592227"
+SRCREV = "f54715702c5c0581c9461f78fd84e2c8d2ec243c"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-remove-c-rehash.patch \
-- 
2.6.4


