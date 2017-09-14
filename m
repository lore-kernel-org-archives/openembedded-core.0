Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3B30F78599
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:07:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,391,1500912000"; d="scan'208";a="26274207"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Sep 2017 17:07:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6488B47ACDA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 17:07:03 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 14 Sep 2017 17:07:02 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 17:06:24 +0800
Message-ID: <1505379985-34044-5-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505379985-34044-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505379985-34044-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 6488B47ACDA9.A67A9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sysprof: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 14 Sep 2017 09:07:01 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-kernel/sysprof/sysprof_3.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
index 168f2fd..79a27be 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "System-wide Performance Profiler for Linux"
+HOMEPAGE = "http://www.sysprof.com"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
-- 
2.7.4




