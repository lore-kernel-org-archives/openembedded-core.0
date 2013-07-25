Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5249D6B3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:16:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2013 10:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="376428514"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 25 Jul 2013 10:15:16 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 20:17:42 +0300
Message-Id: <1374772664-9304-2-git-send-email-ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374772664-9304-1-git-send-email-ionutx.radu@intel.com>
References: <1374772664-9304-1-git-send-email-ionutx.radu@intel.com>
Subject: [PATCH 1/3] no-nls-dpkg.patch: Added Upstream Status
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
X-List-Received-Date: Thu, 25 Jul 2013 17:16:22 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
index f1dd5fd..a0996d4 100644
--- a/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.8.2/no-nls-dpkg.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
 @@ -42,6 +42,12 @@
-- 
1.7.10.4


