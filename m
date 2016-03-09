Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3360F6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083630"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:54 +0200
Message-Id: <e007d26e3ff7a3483b18d7092a9e8d14b49c588e.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/24] vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:18 -0000

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
2.7.0


