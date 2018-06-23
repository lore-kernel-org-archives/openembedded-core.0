Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3744375449
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:53:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424592"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:53:41 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F1BF04B41ED0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 18:53:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Sat, 23 Jun 2018 18:53:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 03:52:54 +0800
Message-ID: <1529783581-46179-2-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: F1BF04B41ED0.A8EC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 1/8][PATCH v2] slang: add nativesdk
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
X-List-Received-Date: Sat, 23 Jun 2018 10:53:42 -0000
Content-Type: text/plain

Add nativesdk for slang.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/slang/slang_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang_2.3.2.bb b/meta/recipes-extended/slang/slang_2.3.2.bb
index 87fd41a..e53c432 100644
--- a/meta/recipes-extended/slang/slang_2.3.2.bb
+++ b/meta/recipes-extended/slang/slang_2.3.2.bb
@@ -78,4 +78,4 @@ FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 PARALLEL_MAKE = ""
 PARALLEL_MAKEINST = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4




