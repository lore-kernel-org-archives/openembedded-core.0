Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0847488C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395410"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:34 +0300
Message-Id: <20180517113837.24240-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/10] rt-tests: fix upstream version check
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
X-List-Received-Date: Thu, 17 May 2018 11:46:12 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 5606d8e3851..f87952e0a8d 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -3,6 +3,8 @@ SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
+# 1.2 and 1.3 seem to be development versions
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.2)(?!1\.3)(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


