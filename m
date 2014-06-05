Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 08E4D6B7BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 13:09:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2014 06:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,981,1392192000"; d="scan'208";a="523166194"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2014 06:09:09 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 16:08:29 +0300
Message-Id: <1401973712-6149-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gnutls: upgrade to 3.2.15
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
X-List-Received-Date: Thu, 05 Jun 2014 13:09:34 -0000

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-support/gnutls/{gnutls_3.2.13.bb => gnutls_3.2.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.2.13.bb => gnutls_3.2.15.bb} (40%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.2.13.bb b/meta/recipes-support/gnutls/gnutls_3.2.15.bb
similarity index 40%
rename from meta/recipes-support/gnutls/gnutls_3.2.13.bb
rename to meta/recipes-support/gnutls/gnutls_3.2.15.bb
index 97e2df2..ce8bdfd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.2.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.2.15.bb
@@ -3,5 +3,5 @@ require gnutls.inc
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
            "
 
-SRC_URI[md5sum] = "300e5f413054e2f4719c1c3b5179a611"
-SRC_URI[sha256sum] = "e83676218ba80c4d577d7027b5b087692280347a9b06f90a452403ba70faa604"
+SRC_URI[md5sum] = "ec3b06f80e312137386c5d322183ca5a"
+SRC_URI[sha256sum] = "30bdc7b34b220258f714602cdf0afa1abf0883bf926f35f400c88b1c72ca77b9"
-- 
1.9.1


