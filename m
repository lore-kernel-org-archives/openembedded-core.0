Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 09FF47147D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 04:09:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56735862"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jan 2015 12:05:39 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0S48Sds030005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 12:08:28 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 28 Jan 2015 12:09:11 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jan 2015 12:04:22 +0800
Message-ID: <1422417862-62783-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH][master]gnutls: update to 3.3.12
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
X-List-Received-Date: Wed, 28 Jan 2015 04:09:19 -0000
Content-Type: text/plain

update to 3.3.12 to fix some bugs.

http://article.gmane.org/gmane.comp.encryption.gpg.gnutls.devel/7967

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta/recipes-support/gnutls/gnutls_3.3.11.bb | 9 ---------
 meta/recipes-support/gnutls/gnutls_3.3.12.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.11.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.3.12.bb

diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
deleted file mode 100644
index 7ad462a..0000000
--- a/meta/recipes-support/gnutls/gnutls_3.3.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require gnutls.inc
-
-PR = "r1"
-
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-            file://configure.ac-fix-sed-command.patch \
-           "
-SRC_URI[md5sum] = "b657e3010c10cae2244e7ce79ee3d446"
-SRC_URI[sha256sum] = "aef28d629b6ba824bd435f9b23506525e657e3746d4aa021296b13cbaaa6ae71"
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.12.bb b/meta/recipes-support/gnutls/gnutls_3.3.12.bb
new file mode 100644
index 0000000..aa4c17b
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.3.12.bb
@@ -0,0 +1,9 @@
+require gnutls.inc
+
+PR = "r0"
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+            file://configure.ac-fix-sed-command.patch \
+           "
+SRC_URI[md5sum] = "a37b20b4352a5f542367ded904729c90"
+SRC_URI[sha256sum] = "67ab3e92c5d48f3323b897d7c1aa0bb2af6f3a84f5bd9931cda163a7ff32299b"
-- 
1.9.1


