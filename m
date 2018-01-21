Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 83BE471BB9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 09:02:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 01:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,390,1511856000"; d="scan'208";a="11389297"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga007.jf.intel.com with ESMTP; 21 Jan 2018 01:02:36 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 01:02:32 -0800
Message-Id: <20180121090232.27324-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] perl: add Config_git.PL to -lib
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
X-List-Received-Date: Sun, 21 Jan 2018 09:02:35 -0000

Fixes:
Warning: failed to load Config_git.pl, something strange about this perl

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 0baf3abb60b..f13a63a80a3 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -280,6 +280,7 @@ FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
                    ${libdir}/perl/config.sh \
+		   ${libdir}/perl/${PV}/Config_git.pl \
                    ${libdir}/perl/${PV}/Config_heavy.pl \
                    ${libdir}/perl/${PV}/Config_heavy-target.pl"
 FILES_${PN}-pod = "${libdir}/perl/${PV}/pod \
-- 
2.13.6


