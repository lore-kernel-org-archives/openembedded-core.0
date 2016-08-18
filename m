Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31A5573177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:09:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10027426"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 10:09:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4B84442BC500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:09:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 10:09:20 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 10:08:06 +0800
Message-ID: <1471486086-8512-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 4B84442BC500.AB35E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] kexec-tools: 2.0.12 -> 2.0.13
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
X-List-Received-Date: Thu, 18 Aug 2016 02:09:32 -0000
Content-Type: text/plain

Upgrade kexec-tools from 2.0.12 to 2.0.13.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb} (88%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
similarity index 88%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
index 59376c8..338a7d9 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.13.bb
@@ -10,8 +10,8 @@ SRC_URI += " \
             file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
          "
 
-SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
-SRC_URI[sha256sum] = "cc7b60dad0da202004048a6179d8a53606943062dd627a2edba45a8ea3a85135"
+SRC_URI[md5sum] = "b7595eb4705e482ee6fc1121a5b6131b"
+SRC_URI[sha256sum] = "70df562d76213e54833228379710ada1afd98a86ee1ce5644eaa68c54e102e25"
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
-- 
2.7.4




