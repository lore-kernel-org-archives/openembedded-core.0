Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 951297734D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 14:06:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 06:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,395,1449561600"; d="scan'208";a="905490111"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2016 06:06:38 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:06:35 +0200
Message-Id: <1454594795-23064-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454594795-23064-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454594795-23064-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH] ncurses: use closing curly brackets in FILES_${PN}-tools variable
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
X-List-Received-Date: Thu, 04 Feb 2016 14:06:37 -0000

This patch removes a workaround (needed for bitbake python parser) where
closing curly brackets were replaced by ascii code '\x7d'.

This commit requires a bitbake version with the
"data_smart: simple bracket matching inside python expressions" patch
applied.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fbe74d5..35b8b94 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -284,8 +284,8 @@ FILES_${PN}-tools = "\
   ${bindir}/infotocap \
   ${bindir}/captoinfo \
   ${bindir}/infocmp \
-  ${bindir}/clear${@['', '.${BPN\x7d']['${CLASSOVERRIDE}' == 'class-target']} \
-  ${bindir}/reset${@['', '.${BPN\x7d']['${CLASSOVERRIDE}' == 'class-target']} \
+  ${bindir}/clear${@['', '.${BPN}']['${CLASSOVERRIDE}' == 'class-target']} \
+  ${bindir}/reset${@['', '.${BPN}']['${CLASSOVERRIDE}' == 'class-target']} \
   ${bindir}/tack \
   ${bindir}/tabs \
 "
-- 
2.6.2


