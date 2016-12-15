Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0F50F772C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480865"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:08 +0200
Message-Id: <b1e2c9c4107b123b35fb2ffc991da37bfaa9cf9d.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/16] upstream-version-is-even.bbclass: exclude various alphas, betas, pre-releases etc.
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:44 -0000

Was a problem with perl in particular.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/upstream-version-is-even.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/upstream-version-is-even.bbclass b/meta/classes/upstream-version-is-even.bbclass
index 99714cb..256c752 100644
--- a/meta/classes/upstream-version-is-even.bbclass
+++ b/meta/classes/upstream-version-is-even.bbclass
@@ -2,4 +2,4 @@
 # accepts even minor versions (i.e. 3.0.x, 3.2.x, 3.4.x, etc.)
 # This scheme is used by Gnome and a number of other projects
 # to signify stable releases vs development releases.
-UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.10.2


