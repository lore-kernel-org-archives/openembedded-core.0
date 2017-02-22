Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 500047310C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302161"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:01 +0200
Message-Id: <30b9ca4510f61d62de669ba22390da97cc47e2cc.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/24] libva: fix upstream version check
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/libva/libva_1.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb b/meta/recipes-graphics/libva/libva_1.7.3.bb
index a7b4b90a062..982b48ce943 100644
--- a/meta/recipes-graphics/libva/libva_1.7.3.bb
+++ b/meta/recipes-graphics/libva/libva_1.7.3.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.7-branch"
 SRCREV = "dbf9f7e33349c3cee8d131e93a6a4f91255635cb"
+UPSTREAM_CHECK_GITTAGREGEX = "libva-(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


