Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 482B4786BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 00:34:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2018 16:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,398,1511856000"; d="scan'208";a="168296880"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 22 Jan 2018 16:34:57 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 16:35:06 -0800
Message-Id: <1516667706-44706-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] glibc-locale.inc: avoid duplicate packages
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
X-List-Received-Date: Tue, 23 Jan 2018 00:34:56 -0000

PACKAGES_DYNAMIC contained an identical set of packages twice.
I suspect this was a result of global search/replace when moving
recipes from eglibc to glibc long time ago.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 1a629fc..b3cb10b 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -39,7 +39,6 @@ PACKAGES = "localedef ${PN}-dbg"
 
 PACKAGES_DYNAMIC = "^locale-base-.* \
                     ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-.* ^glibc-binary-localedata-.* \
-                    ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.* \
                     ^${MLPREFIX}glibc-gconv$"
 
 # Create a glibc-binaries package
-- 
2.7.4


