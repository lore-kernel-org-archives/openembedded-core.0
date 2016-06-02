Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 05D70774B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 20:23:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2016 13:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,408,1459839600"; d="scan'208";a="979746816"
Received: from ahmadjaz-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.128])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2016 13:23:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 08:22:46 +1200
Message-Id: <275b27054ef38a72eecd19d22c9263f432cbc9a0.1464898710.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464898710.git.paul.eggleton@linux.intel.com>
References: <cover.1464898710.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464898710.git.paul.eggleton@linux.intel.com>
References: <cover.1464898710.git.paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/1] ca-certificates: add dependency for native/nativesdk on openssl-native
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
X-List-Received-Date: Thu, 02 Jun 2016 20:23:18 -0000

When running update-ca-certificates on the build host, as we do during
do_install for ca-certificates-native (and nativesdk-ca-certificates),
as of OE-Core commit cea46e7b8d9463306779301fa97f651d750f380f we now
need openssl-native so it can run c_rehash.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
index faefc78..1bea067 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = "ca-certificates-native"
-DEPENDS_class-native = ""
+DEPENDS_class-native = "openssl-native"
+DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
 
 SRCREV = "f54715702c5c0581c9461f78fd84e2c8d2ec243c"
 
-- 
2.5.5


