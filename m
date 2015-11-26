Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CD8A66E687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574767"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:21 +0200
Message-Id: <d7de8a7809460a67ce5d0976ad562c97732d9ba0.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/29] vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:15 -0000

We need to make sure that our fixed vapigen.m4 is used instead.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/vala.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
index 9ff664a..615eb37 100644
--- a/meta/classes/vala.bbclass
+++ b/meta/classes/vala.bbclass
@@ -16,3 +16,9 @@ FILES_${PN}-dev += "\
     ${datadir}/vala/vapi/*.deps \
     ${datadir}/gir-1.0 \
 "
+
+# Remove vapigen.m4 that is bundled with tarballs
+# because it does not yet have our cross-compile fixes
+do_configure_prepend() {
+        rm -f ${S}/m4/vapigen.m4
+}
-- 
2.6.2


