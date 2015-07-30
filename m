Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 872F6762CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:24:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99073927"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2015 17:28:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6U9N07W016599
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:23:00 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 30 Jul 2015 17:24:52 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:24:45 -0400
Message-ID: <1438277085-8540-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [oe][meta-oe][PATCH] libdbi: upgrade 0.8.4 -> 0.9.0
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
X-List-Received-Date: Thu, 30 Jul 2015 09:24:57 -0000
Content-Type: text/plain

From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>

Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb | 6 ------
 meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb
 create mode 100644 meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb

diff --git a/meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb b/meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb
deleted file mode 100644
index aee0099..0000000
--- a/meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${PN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "c5f15407ef7b07ba854cd8c9b15b88ff"
-SRC_URI[sha256sum] = "ef38db616f0752ccb09b8ba2eac471722369b8ded50b153c25e238cac2c8de99"
diff --git a/meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb b/meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb
new file mode 100644
index 0000000..24eae28
--- /dev/null
+++ b/meta-oe/recipes-support/libdbi/libdbi_0.9.0.bb
@@ -0,0 +1,6 @@
+require ${PN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "05e2ceeac4bc85fbe40de8b4b22d9ab3"
+SRC_URI[sha256sum] = "dafb6cdca524c628df832b6dd0bf8fabceb103248edb21762c02d3068fca4503"
-- 
1.8.4.2


