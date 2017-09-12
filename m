Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C63D3784D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 07:51:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,382,1500912000"; d="scan'208";a="25828764"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2017 15:51:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 0CC5646BA6B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:51:15 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 12 Sep 2017 15:51:14 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 15:51:14 +0800
Message-ID: <1505202674-30256-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505202674-30256-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1505202674-30256-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 0CC5646BA6B8.A644B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] m4: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Tue, 12 Sep 2017 07:51:14 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/m4/m4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index 75d8bbe..2002594 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Traditional Unix macro processor"
+HOMEPAGE = "https://www.gnu.org/software/m4/m4.html"
 DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
-- 
2.7.4




