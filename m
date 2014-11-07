Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28E0571FF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989808"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:40 -0800
Message-Id: <4d21866e9ea3edb4f8ccc4a0275e9c9d4885462d.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 15/19] hdparm: Upgrade to 9.45
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:57 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/hdparm/{hdparm_9.43.bb => hdparm_9.45.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.43.bb => hdparm_9.45.bb} (88%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.43.bb b/meta/recipes-extended/hdparm/hdparm_9.45.bb
similarity index 88%
rename from meta/recipes-extended/hdparm/hdparm_9.43.bb
rename to meta/recipes-extended/hdparm/hdparm_9.45.bb
index 805f76a..d11412d 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.43.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.45.bb
@@ -18,8 +18,8 @@ RDEPENDS_wiper = "bash gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "f73233be118d86c779a8463d8b6a3cdb"
-SRC_URI[sha256sum] = "2bbe92274971182192901ab220e94bd2e4896f924fa6b225d0cffd7d8c16b52a"
+SRC_URI[md5sum] = "1c75d0751a44928b6c4bc81fb16d7fe8"
+SRC_URI[sha256sum] = "23b01caa56a995cf0897877b6aff98ea622a5df255bc2894b1a7693387f38669"
 
 EXTRA_OEMAKE += 'STRIP="echo"'
 
-- 
1.8.3.1


