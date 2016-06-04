Return-Path: <william.c.randle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D535177197
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 22:45:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Jun 2016 15:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,419,1459839600"; d="scan'208";a="116139556"
Received: from wcrandle-mobl.amr.corp.intel.com ([10.254.180.184])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2016 15:45:36 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jun 2016 15:45:02 -0700
Message-Id: <1465080303-5506-3-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
References: <1465080303-5506-1-git-send-email-william.c.randle@intel.com>
Subject: [PATCH 2/3] perl: some perl tests require libssp
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
X-List-Received-Date: Sat, 04 Jun 2016 22:45:35 -0000

Add libssp to the list of dependencies when building with perl-ptest
as some tests require it.

[YOCTO #8656]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 5f0989f..bf6fde6 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -34,4 +34,4 @@ python populate_packages_prepend() {
             '${PN}-ptest%s', '%s', recursive=True, match_path=True)
 }
 
-RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed"
+RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed libssp"
-- 
2.5.5


