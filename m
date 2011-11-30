Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVs8i-0007gJ-2k
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:56:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2011 13:49:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="90762461"
Received: from unknown (HELO localhost) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 13:49:42 -0800
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 13:49:43 -0800
Message-Id: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/4] meta-environment: Fix a typo in do_populate_sysroot[noexec]
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
X-List-Received-Date: Wed, 30 Nov 2011 21:56:28 -0000

From: Darren Hart <dvhart@linux.intel.com>

I noticed with while grepping for usage of noexec. Replace
do_populage_sysroot with do_populate_sysroot.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 39ba96c..8f9391a 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -48,4 +48,4 @@ do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-do_populage_sysroot[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
-- 
1.7.6.4



