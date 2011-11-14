Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFi-000238-9f
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:38 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055120"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:55 -0800
Message-Id: <33a325a1d2df19b80e7a2ecd55548e88df40cdf0.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/21] aspell: force ARM mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2011 04:34:38 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* this is just work around for ICE, better fix would be to fix gcc
| ./common/fstream.hpp:23:9: note: the mangling of 'va_list' has changed in GCC 4.4
| modules/speller/default/typo_editdist.cpp: In function 'short int aspeller::typo_edit_distance(acommon::ParmString, acommon::ParmString, const aspeller::TypoEditDistanceInfo&)':
| modules/speller/default/typo_editdist.cpp:77:3: internal compiler error: in gen_thumb_movhi_clobber, at config/arm/arm.md:5937
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[1]: *** [modules/speller/default/typo_editdist.lo] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/aspell-0.60.6.1-r0/aspell-0.60.6.1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/aspell/aspell_0.60.6.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index d773ee3..596cdf6 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-PR = "r0"
+PR = "r1"
 PACKAGES += "libaspell libpspell libpspell-dev aspell-utils"
 
 FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
-- 
1.7.6.4



