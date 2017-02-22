Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF207310C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302170"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:03 +0200
Message-Id: <bfaebeef90f2109ac8c79fa2506cc67f478601cd.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/24] bash-completion: update to 2.5
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{bash-completion_2.4.bb => bash-completion_2.5.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.4.bb => bash-completion_2.5.bb} (88%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.4.bb b/meta/recipes-support/bash-completion/bash-completion_2.5.bb
similarity index 88%
rename from meta/recipes-support/bash-completion/bash-completion_2.4.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.5.bb
index 42719f14367..dd22857a70c 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.4.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.5.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "1ea94864fb2b2446fbbdf82f10bd25df"
-SRC_URI[sha256sum] = "c0f76b5202fec9ef8ffba82f5605025ca003f27cfd7a85115f838ba5136890f6"
+SRC_URI[md5sum] = "15300010bd4034de12c3fc4f171692e3"
+SRC_URI[sha256sum] = "b0b9540c65532825eca030f1241731383f89b2b65e80f3492c5dd2f0438c95cf"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
-- 
2.11.0


