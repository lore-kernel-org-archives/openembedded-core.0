Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C474C7665F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:45:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 02:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1095003077"
Received: from matzta-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.15.63])
	by orsmga001.jf.intel.com with ESMTP; 15 Feb 2017 02:45:28 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 12:45:27 +0200
Message-Id: <1487155527-17875-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] scripts/buildstats-diff: fix epoch numbers in --ver-diff
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
X-List-Received-Date: Wed, 15 Feb 2017 10:45:30 -0000

Incorrect data was printed (recipe name instead of epoch number) when
displaying changes in epoch.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 5cea184..adeba44 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -301,7 +301,7 @@ def print_ver_diff(bs1, bs2):
         print("\nEPOCH CHANGED:")
         print("--------------")
         for pkg in sorted(echanged):
-            field1 = "{} -> {}".format(pkg, bs1[pkg]['epoch'], bs2[pkg]['epoch'])
+            field1 = "{} -> {}".format(bs1[pkg]['epoch'], bs2[pkg]['epoch'])
             field2 = "{} -> {}".format(bs1[pkg]['nevr'], bs2[pkg]['nevr'])
             print(fmt_str.format(pkg, field1, field2, maxlen=maxlen))
 
-- 
2.6.6


