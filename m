Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3978D7E05D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 08:31:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,550,1549900800"; d="scan'208";a="66067080"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2019 16:31:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 530A64CDD0B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 16:31:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 5 Jun 2019 16:32:08 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 25 May 2019 10:32:07 +0800
Message-ID: <1558751527-37961-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 530A64CDD0B2.ADB8B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [warrior][master][PATCH] nativesdk-qemu:Make it support aarch64_be.
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
X-List-Received-Date: Wed, 05 Jun 2019 08:31:58 -0000
Content-Type: text/plain

Otherwise, there will be "no aarch64_be-softmmu" error.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 550d6f0..8184ef5 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -13,7 +13,7 @@ def get_qemu_target_list(d):
             softmmuonly += arch + "-softmmu,"
             archs.remove(arch)
     linuxuseronly = ""
-    for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus']:
+    for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus', 'aarch64_be']:
         if arch in archs:
             linuxuseronly += arch + "-linux-user,"
             archs.remove(arch)
-- 
1.9.1




