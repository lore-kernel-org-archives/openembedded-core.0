Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD0565CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 09:42:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2016 02:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,444,1459839600"; d="scan'208";a="994181131"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 02:42:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:42:47 +0300
Message-Id: <1465465368-26196-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] bash-completion: fix upstream version check
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
X-List-Received-Date: Thu, 09 Jun 2016 09:42:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/bash-completion/bash-completion_2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.1.bb b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
index 8b257d2..9877720 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.1.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -12,6 +12,7 @@ SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
 SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
+UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
 
-- 
2.8.1


