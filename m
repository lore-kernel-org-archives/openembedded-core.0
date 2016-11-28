Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEF660761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412248"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:19 +0200
Message-Id: <3312d457391177816e42615d9c55fc2257111126.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/18] upstream-version-is-even.bbclass: ensure that the full version is matched.
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:30 -0000

Previously 4.3.2.1 would match as 3.2.1.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/upstream-version-is-even.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 89556ed..99714cb 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -2,4 +2,4 @@
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
 # to signify stable releases vs development releases.
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.10.2


