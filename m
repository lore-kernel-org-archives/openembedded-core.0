Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8106A6EFCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 06:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,860,1384329600"; d="scan'208";a="484721918"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 06:22:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 14:22:28 +0000
Message-Id: <0cdf4c9dadeba69693d8bfa0c553817d0f8e8634.1392646768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] eglibc-locale: add eglibc-gconv to PACKAGES_DYNAMIC
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
X-List-Received-Date: Mon, 17 Feb 2014 14:22:44 -0000

If you try to add eglibc-gconv to an image, you'll get a NoProvider
error because nothing at parse time states that it provides this (it's
added to PACKAGES in populate_packages). This problem manifests itself
in Hob for example when customising an image.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index e615e51..4da5abd 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -35,7 +35,8 @@ PACKAGES = "localedef ${PN}-dbg"
 
 PACKAGES_DYNAMIC = "^locale-base-.* \
                     ^eglibc-gconv-.* ^eglibc-charmap-.* ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
-                    ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
+                    ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.* \
+                    ^${MLPREFIX}eglibc-gconv$"
 
 # Create a eglibc-binaries package
 ALLOW_EMPTY_${BPN}-binaries = "1"
-- 
1.8.5.3


