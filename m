Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8175178280
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 05:58:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="21705866"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2017 13:58:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 380B846B5DF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 13:58:49 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 24 Jul 2017 13:58:53 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 13:58:39 +0800
Message-ID: <1500875919-24477-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 380B846B5DF4.A7390
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] radvd: 2.14 -> 2.17
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
X-List-Received-Date: Mon, 24 Jul 2017 05:58:56 -0000
Content-Type: text/plain

Update radvd from 2.14 to 2.17

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.14.bb | 5 -----
 meta-networking/recipes-daemons/radvd/radvd_2.17.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.14.bb
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.17.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.14.bb b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
deleted file mode 100644
index 2525249..0000000
--- a/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require radvd.inc
-
-SRC_URI[md5sum] = "acd3883dece2c7888d15596b05c9fae4"
-SRC_URI[sha256sum] = "46d31c05daea11c3d1e3dc092997d3631b3bc72b20a4f279b05304b83dbd7aa8"
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.17.bb b/meta-networking/recipes-daemons/radvd/radvd_2.17.bb
new file mode 100644
index 0000000..4baea01
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.17.bb
@@ -0,0 +1,5 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "64ee3fdb5544bcddef1c6cd80d77fa0a"
+SRC_URI[sha256sum] = "53757e7f2164899e1145482f1ae91829600a6e2f6fec29cfb3b350a3bb45bd5d"
-- 
2.7.4




