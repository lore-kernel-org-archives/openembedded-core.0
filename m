Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3B26877F34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 02:00:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36992083"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Feb 2018 10:00:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D540C48AE765
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 10:00:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 12 Feb 2018 10:00:39 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:00:42 +0800
Message-ID: <1518400842-17896-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: D540C48AE765.A81F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] util-linux: 2.31 -> 2.31.1
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
X-List-Received-Date: Mon, 12 Feb 2018 02:00:37 -0000
Content-Type: text/plain

1.Upgrade util-linux from 2.31 to 2.31.1.
2.Modify ALTERNATIVE_TARGET, since rfkill has been moved to /usr/sbin.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-core/util-linux/util-linux.inc                           | 2 +-
 .../util-linux/{util-linux_2.31.bb => util-linux_2.31.1.bb}           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.31.bb => util-linux_2.31.1.bb} (87%)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 248e8be..922cecd 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -270,7 +270,7 @@ ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
 ALTERNATIVE_util-linux-rfkill = "rfkill"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
-ALTERNATIVE_TARGET[rfkill] = "${base_bindir}/rfkill"
+ALTERNATIVE_TARGET[rfkill] = "${sbindir}/rfkill"
 
 ALTERNATIVE_util-linux-getopt = "getopt"
 ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
diff --git a/meta/recipes-core/util-linux/util-linux_2.31.bb b/meta/recipes-core/util-linux/util-linux_2.31.1.bb
similarity index 87%
rename from meta/recipes-core/util-linux/util-linux_2.31.bb
rename to meta/recipes-core/util-linux/util-linux_2.31.1.bb
index a83919b..6836682 100644
--- a/meta/recipes-core/util-linux/util-linux_2.31.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.31.1.bb
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
 "
 SRC_URI_append_class-native = " file://no_getrandom.patch"
-SRC_URI[md5sum] = "5b6821c403c3cc6e7775f74df1882a20"
-SRC_URI[sha256sum] = "f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a"
+SRC_URI[md5sum] = "7733b583dcb51518944d42aa62ef19ea"
+SRC_URI[sha256sum] = "1a51b16fa9cd51d26ef9ab52d2f1de12403b810fc8252bf7d478df91b3cddf11"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
2.7.4




