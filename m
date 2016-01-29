Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE86973189
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:04:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2016 04:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,363,1449561600"; d="scan'208";a="643457050"
Received: from mshai-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.30.5])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2016 04:04:07 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 14:04:06 +0200
Message-Id: <1454069046-10432-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] autotools.bbclass: use oe_runmake instead of ${MAKE}
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
X-List-Received-Date: Fri, 29 Jan 2016 12:04:11 -0000

Use oe_runmake like in base.bbclass so that EXTRA_OEMAKE will be
respected.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/autotools.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 1400b44..7bf510b 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -112,8 +112,7 @@ autotools_preconfigure() {
 				# regenerate them even if CFLAGS/LDFLAGS are different
 				cd ${S}
 				if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
-					echo "Running \"${MAKE} clean\" in ${S}"
-					${MAKE} clean
+					oe_runmake clean
 				fi
 				find ${S} -ignore_readdir_race -name \*.la -delete
 			fi
-- 
2.1.4


