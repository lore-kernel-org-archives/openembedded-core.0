Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A9AD770100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:48:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 26 Apr 2016 01:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,536,1455004800"; d="scan'208";a="692369576"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2016 01:48:47 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 78D116A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:36:23 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 11:48:24 +0300
Message-Id: <1461660505-24823-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1461660505-24823-1-git-send-email-maxin.john@intel.com>
References: <1461660505-24823-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] bash: fix dependencies and QA Issue
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
X-List-Received-Date: Tue, 26 Apr 2016 08:48:47 -0000

Fix the following QA warning:

WARNING: bash-4.3.30-r0 do_package_qa: QA Issue: bash rdepends on libiconv,
but it isn't a build dependency, missing libiconv in DEPENDS
or PACKAGECONFIG? [build-deps]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 93ca00b..1d08526 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -2,7 +2,7 @@ SUMMARY = "An sh-compatible command language interpreter"
 HOMEPAGE = "http://tiswww.case.edu/php/chet/bash/bashtop.html"
 SECTION = "base/shell"
 
-DEPENDS = "ncurses bison-native"
+DEPENDS = "ncurses bison-native virtual/libiconv"
 
 inherit autotools gettext texinfo update-alternatives ptest
 
-- 
2.4.0


