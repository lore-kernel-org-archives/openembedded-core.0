Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87076755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 23:14:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Oct 2015 16:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,202,1444719600"; d="scan'208";a="588518889"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.171])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2015 16:14:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 17:13:22 -0600
Message-Id: <1445901202-17852-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] acpid: Upgrade to 2.0.25
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
X-List-Received-Date: Mon, 26 Oct 2015 23:14:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.23.bb => acpid_2.0.25.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.23.bb b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.23.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.25.bb
index a5317a4..f00d25a 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.23.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "d7bcdcdefcd53b03730e50ba842554ea"
-SRC_URI[sha256sum] = "4396aaec13510c3a1faa941a15a4b5335b6ae4fbec8438b9249b88c3b66187ee"
+SRC_URI[md5sum] = "69bb0cc4a0a89eb2dfecc4851087f568"
+SRC_URI[sha256sum] = "0b700a8072bec162c512f72cbe419195601ab3e0ffd2138f9bd95ed3097a5c68"
-- 
2.1.4


