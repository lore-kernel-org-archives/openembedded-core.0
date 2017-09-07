Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1FA77D48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 09:05:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.42,357,1500912000"; d="scan'208";a="25382888"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Sep 2017 17:05:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 81D3B4727AA0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 17:05:11 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 7 Sep 2017 17:05:11 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Sep 2017 17:05:09 +0800
Message-ID: <1504775109-22042-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504775109-22042-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1504775109-22042-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: 81D3B4727AA0.A542D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] foomatic: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Thu, 07 Sep 2017 09:05:14 -0000
Content-Type: text/plain

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index 3f439e7..742c9a5 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -1,4 +1,5 @@
 SUMMARY = "OpenPrinting printer support - filters"
+HOMEPAGE = "https://wiki.linuxfoundation.org/openprinting/start"
 DESCRIPTION = "Foomatic is a printer database designed to make it easier to set up \
 common printers for use with UNIX-like operating systems.\
 It provides the "glue" between a print spooler (like CUPS or lpr) and \
-- 
2.7.4




