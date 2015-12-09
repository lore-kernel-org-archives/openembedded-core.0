Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83C7560589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661851"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:21 +0200
Message-Id: <80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:06 -0000

[YOCTO #8765]
[YOCTO #8758]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (94%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
similarity index 94%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
index 249f8c4..e41f46b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
@@ -39,8 +39,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://ptest_makefile_deps.patch  \
            "
 
-SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-SRC_URI[sha256sum] = "671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8"
+SRC_URI[md5sum] = "5262bfa25b60ed9de9f28d5d52d77fc5"
+SRC_URI[sha256sum] = "e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
2.6.2


