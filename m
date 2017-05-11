Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BB18D71B87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 08:22:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18731852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2017 16:22:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7AF9847C610C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:22:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 11 May 2017 16:22:54 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 May 2017 16:21:39 +0800
Message-ID: <1494490899-110501-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 7AF9847C610C.A87AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libunwind: 1.1 -> 1.2
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
X-List-Received-Date: Thu, 11 May 2017 08:22:59 -0000
Content-Type: text/plain

Upgrade libunwind from 1.1 to 1.2.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-support/libunwind/libunwind_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_git.bb
index b637c5c..2c00f80 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_git.bb
@@ -1,8 +1,8 @@
 require libunwind.inc
 
-PV = "1.1+git${SRCPV}"
+PV = "1.2+git${SRCPV}"
 
-SRCREV = "bc8698fd7ed13a629a8ec3cb2a89bd74f9d8b5c0"
+SRCREV = "0326f1048a0d75ea9498360f60a0c711cd190b7b"
 
 SRC_URI = "git://git.sv.gnu.org/libunwind.git \
            file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
-- 
2.7.4




