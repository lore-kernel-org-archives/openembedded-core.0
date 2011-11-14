Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFx-0002D5-JL
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055128"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:00 -0800
Message-Id: <ea7b944d792d35ecc52970308280ce698a7eaa64.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/21] time: drop default S and 2 useless comments
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:53 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/time/time_1.7.bb |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index 9f9a9e5..35afb1e 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -5,8 +5,5 @@ SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "e38d2b8b34b1ca259cf7b053caac32b3"
 SRC_URI[sha256sum] = "e37ea79a253bf85a85ada2f7c632c14e481a5fd262a362f6f4fd58e68601496d"
-#	   file://autofoo.patch
-#	   file://compile.patch
-S = "${WORKDIR}/time-${PV}"
 
 inherit autotools
-- 
1.7.6.4



