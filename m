Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5616AFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2013 15:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154933"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:24 -0700
Message-Id: <db7bc951b9616f8c39871d73d7904557d571cf31.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 3/8] help2man: Update to 1.43.3
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../help2man/{help2man-native_1.43.2.bb => help2man-native_1.43.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.43.2.bb => help2man-native_1.43.3.bb} (80%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.43.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
similarity index 80%
rename from meta/recipes-devtools/help2man/help2man-native_1.43.2.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
index 22b235e..d20cee1 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.43.2.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bd816983f068ebcf8ca7a20463f7337d"
-SRC_URI[sha256sum] = "ec43eb74669e02cb61af142f1398bb882ff1dbbc9a8cc4f8cd70098fe425e4a9"
+SRC_URI[md5sum] = "a84868db7c139238df8add5d86a0b54f"
+SRC_URI[sha256sum] = "67978d118980ebd9f0c60be5db129527900a7b997b9568fc795ba9bdb341d303"
 
 inherit autotools native
 
-- 
1.8.1.4


