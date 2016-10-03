Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C08C16093F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:16:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 03 Oct 2016 12:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,291,1473145200"; d="scan'208";a="15849483"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.33])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2016 12:16:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 14:17:27 -0500
Message-Id: <1475522247-9924-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] db: Remove unneeded PR
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
X-List-Received-Date: Mon, 03 Oct 2016 19:16:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PR is not need so remove it after upgrade to 6.0.35.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-support/db/db_6.0.35.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/db/db_6.0.35.bb b/meta/recipes-support/db/db_6.0.35.bb
index 32afbe8..ecb1bee 100644
--- a/meta/recipes-support/db/db_6.0.35.bb
+++ b/meta/recipes-support/db/db_6.0.35.bb
@@ -15,8 +15,6 @@ LICENSE = "AGPL-3.0"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
 
-PR = "r1"
-
 # Note, when upgraded to 6.1.x, a patch in RPM will need to be removed to activate db 6.1 support.
 SRC_URI = "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
            file://arm-thumb-mutex_db5.patch \
-- 
2.1.4


