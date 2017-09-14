Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6A578578
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 02:07:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,390,1500912000"; d="scan'208";a="26250455"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 10:07:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 46FBF46BA6A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:07:22 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 10:07:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 10:07:03 +0800
Message-ID: <1505354824-33448-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505354824-33448-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505354824-33448-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 46FBF46BA6A2.A7D1C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libgudev: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 02:07:21 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/libgudev/libgudev_231.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libgudev/libgudev_231.bb b/meta/recipes-gnome/libgudev/libgudev_231.bb
index ae0f1c7..ad67926 100644
--- a/meta/recipes-gnome/libgudev/libgudev_231.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_231.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GObject wrapper for libudev"
-
+HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 SRC_URI[archive.md5sum] = "916c10c51ec61131e244c3936bbb2e0c"
 SRC_URI[archive.sha256sum] = "3b1ef99d4a8984c35044103d8ddfc3cc52c80035c36abab2bcc5e3532e063f96"
 
-- 
2.7.4




