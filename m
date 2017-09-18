Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB9FE7827D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 04:45:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,410,1500912000"; d="scan'208";a="26727674"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Sep 2017 11:40:41 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0442E47CA461
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:40:38 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 18 Sep 2017 11:40:40 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Sep 2017 11:40:16 +0800
Message-ID: <1505706024-40394-11-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505706024-40394-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505706024-40394-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 0442E47CA461.A3D4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lsbinitscripts: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 18 Sep 2017 04:45:37 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.72.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
index 448663f..f1b53fe 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.72.bb
@@ -1,4 +1,5 @@
 SUMMARY = "SysV init scripts which are only used in an LSB image"
+HOMEPAGE = "https://wiki.debian.org/LSBInitScripts"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
-- 
2.7.4




