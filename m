Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C75A6A9A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:36:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327677987"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:36:40 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:37:39 +0300
Message-Id: <1370957859-28122-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gzip : upgrade to 1.6
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
X-List-Received-Date: Tue, 11 Jun 2013 13:36:40 -0000

upgrade from 1.5 -> 1.6

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../gzip/{gzip_1.5.bb => gzip_1.6.bb}              |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gzip/{gzip_1.5.bb => gzip_1.6.bb} (51%)

diff --git a/meta/recipes-extended/gzip/gzip_1.5.bb b/meta/recipes-extended/gzip/gzip_1.6.bb
similarity index 51%
rename from meta/recipes-extended/gzip/gzip_1.5.bb
rename to meta/recipes-extended/gzip/gzip_1.6.bb
index f7b8593..bd1f70a 100644
--- a/meta/recipes-extended/gzip/gzip_1.5.bb
+++ b/meta/recipes-extended/gzip/gzip_1.6.bb
@@ -7,5 +7,5 @@ NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "11b76536941ee1c0221fe6eefbcb32cb"
-SRC_URI[sha256sum] = "b5d56e8ffc9918e8c941fab56e04121194f9870adeeb859e09c09eac264035a3"
+SRC_URI[md5sum] = "38603cb2843bf5681ff41aab3bcd6a20"
+SRC_URI[sha256sum] = "97eb83b763d9e5ad35f351fe5517e6b71521d7aac7acf3e3cacdb6b1496d8f7e"
-- 
1.7.9.5


