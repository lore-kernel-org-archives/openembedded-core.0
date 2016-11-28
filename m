Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E69371ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:31 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412253"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:20 +0200
Message-Id: <345fd30d855afe09fda8bc2f776a41478b9fabc2.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/18] gnutls: update to 3.5.6
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnutls/{gnutls_3.5.5.bb => gnutls_3.5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.5.5.bb => gnutls_3.5.6.bb} (60%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.5.5.bb b/meta/recipes-support/gnutls/gnutls_3.5.6.bb
similarity index 60%
rename from meta/recipes-support/gnutls/gnutls_3.5.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.6.bb
index d255959..2e70734 100644
--- a/meta/recipes-support/gnutls/gnutls_3.5.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.6.bb
@@ -4,6 +4,6 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "fb84c4d7922c1545da8dda4dcb9487d4"
-SRC_URI[sha256sum] = "86994fe7804ee16d2811e366b9bf2f75304f8e470ae0e3716d60ffeedac0e529"
+SRC_URI[md5sum] = "7a38b23757aae009c3eb5bb12fb0afda"
+SRC_URI[sha256sum] = "6338b715bf31c758606ffa489c7f87ee1beab947114fbd2ffefd73170a8c6b9a"
 
-- 
2.10.2


