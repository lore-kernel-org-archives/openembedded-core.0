Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 358C360155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 12:18:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2014 04:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,696,1384329600"; d="scan'208";a="468321261"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.212])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2014 04:18:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 12:17:53 +0000
Message-Id: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
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
X-List-Received-Date: Tue, 21 Jan 2014 12:18:02 -0000

The default value for HOMEPAGE of "unknown" has been in place since the
early OE-Classic days, but it doesn't really make sense - "unknown" is
not a valid URL and it just means we have to explicitly check for this
hardcoded string if we're displaying the value in some form of UI, such
as Toaster. There is some code in the unmaintained oelint.bbclass to
check for this value, presumably on the assumption that the recipe will
explicitly set it to "" if there really isn't a homepage, but looking at
recipes in OE-Core and meta-oe suggests that we haven't been using this
convention for some time (with one exception in the latter) and it's
rather uncommon these days to have no URL to associate with a recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 57668e1..4fb6a1c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -241,7 +241,7 @@ This package contains documentation."
 
 LICENSE = "INVALID"
 MAINTAINER = "OE-Core Developers <openembedded-core@lists.openembedded.org>"
-HOMEPAGE = "unknown"
+HOMEPAGE = ""
 
 # Package dependencies and provides.
 
-- 
1.8.4.2


