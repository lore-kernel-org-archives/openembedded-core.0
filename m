Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9838260825
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 00:52:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2013 17:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,724,1363158000"; d="scan'208";a="318101901"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2013 17:52:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2013 17:52:09 -0700
Message-Id: <1369270329-30373-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] wget: disable uuid by default
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
X-List-Received-Date: Thu, 23 May 2013 00:52:29 -0000

This will ensure a consistent build and not add additional dependency of
util-linux to wget

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/wget/wget.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 2787068..ba37a87 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -9,7 +9,8 @@ INC_PR = "r16"
 inherit autotools gettext update-alternatives
 
 EXTRA_OECONF = "--with-libc --enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} \
-                --with-ssl=openssl --disable-rpath --disable-iri"
+                --with-ssl=openssl --disable-rpath --disable-iri \
+                ac_cv_header_uuid_uuid_h=no"
 
 ALTERNATIVE_${PN} = "wget"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.8.1.4


