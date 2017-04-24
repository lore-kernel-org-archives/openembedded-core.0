Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 619DA60620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:12:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18070130"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2017 10:12:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C3D8047E6346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:12:46 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 24 Apr 2017 10:12:52 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Apr 2017 10:12:34 +0800
Message-ID: <1492999954-21326-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C3D8047E6346.A79BE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gperf: 3.0.4 -> 3.1
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
X-List-Received-Date: Mon, 24 Apr 2017 02:12:54 -0000
Content-Type: text/plain

Upgrade gperf from 3.0.4 to 3.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/gperf/gperf_3.0.4.bb | 5 -----
 meta/recipes-extended/gperf/gperf_3.1.bb   | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-extended/gperf/gperf_3.0.4.bb
 create mode 100644 meta/recipes-extended/gperf/gperf_3.1.bb

diff --git a/meta/recipes-extended/gperf/gperf_3.0.4.bb b/meta/recipes-extended/gperf/gperf_3.0.4.bb
deleted file mode 100644
index 64003fc..0000000
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
index 0000000..942820b
--- /dev/null
+++ b/meta/recipes-extended/gperf/gperf_3.1.bb
@@ -0,0 +1,5 @@
+require gperf.inc
+
+
+SRC_URI[md5sum] = "9e251c0a618ad0824b51117d5d9db87e"
+SRC_URI[sha256sum] = "588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2"
-- 
2.7.4




