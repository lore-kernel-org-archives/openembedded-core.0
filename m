Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C7C6777A61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 10:43:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 03:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="882975510"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2017 03:43:18 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 13:41:01 +0300
Message-Id: <20170726104103.13050-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH 1/3] gperf: upgrade to 3.1
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
X-List-Received-Date: Wed, 26 Jul 2017 10:43:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/gperf/gperf_3.0.4.bb | 5 -----
 meta/recipes-extended/gperf/gperf_3.1.bb   | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-extended/gperf/gperf_3.0.4.bb
 create mode 100644 meta/recipes-extended/gperf/gperf_3.1.bb

diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb b/meta/recipes-extended/gperf/gperf_3.0.4.bb
deleted file mode 100644
index 64003fc0bb7..00000000000
--- a/meta/recipes-extended/gperf/gperf_3.0.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gperf.inc
-
-
-SRC_URI[md5sum] = "c1f1db32fb6598d6a93e6e88796a8632"
-SRC_URI[sha256sum] = "767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e"
diff --git a/meta/recipes-extended/gperf/gperf_3.1.bb b/meta/recipes-extended/gperf/gperf_3.1.bb
new file mode 100644
index 00000000000..942820b91d5
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -0,0 +1,5 @@
+require gperf.inc
+
+
+SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
+SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
-- 
2.13.2


