Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EB081600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688663"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:11 +0300
Message-Id: <362667141549f7e3bcf12b1107889921e04de92e.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/15] bash-completion: update to 2.4
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{bash-completion_2.3.bb => bash-completion_2.4.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.3.bb => bash-completion_2.4.bb} (88%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.3.bb b/meta/recipes-support/bash-completion/bash-completion_2.4.bb
similarity index 88%
rename from meta/recipes-support/bash-completion/bash-completion_2.3.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.4.bb
index 5e6c1d8..42719f1 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.3.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.4.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6697dc47adfe70cab5023b7b8186ad57"
-SRC_URI[sha256sum] = "b2e081af317f3da4fff3a332bfdbebeb5514ebc6c2d2a9cf781180acab15e8e9"
+SRC_URI[md5sum] = "1ea94864fb2b2446fbbdf82f10bd25df"
+SRC_URI[sha256sum] = "c0f76b5202fec9ef8ffba82f5605025ca003f27cfd7a85115f838ba5136890f6"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
-- 
2.9.3


