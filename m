Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C07B6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 06:58:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10227166"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2016 14:58:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E160B430CD06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:57:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.90) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 24 Aug 2016 14:57:58 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1464926549-4111-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.90]
X-yoursite-MailScanner-ID: E160B430CD06.AE82D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nasm: 2.11.08 -> 2.12.02
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
Date: Wed, 24 Aug 2016 06:58:02 -0000
X-Original-Date: Fri, 3 Jun 2016 12:02:29 +0800
X-List-Received-Date: Wed, 24 Aug 2016 06:58:02 -0000
Content-Type: text/plain

Upgrade nasm from 2.11.08 to 2.12.02.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb} (81%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.11.08.bb b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
similarity index 81%
rename from meta/recipes-devtools/nasm/nasm_2.11.08.bb
rename to meta/recipes-devtools/nasm/nasm_2.12.02.bb
index e0724e6..e2e7158 100644
--- a/meta/recipes-devtools/nasm/nasm_2.11.08.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.12.02.bb
@@ -7,8 +7,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 "
 
-SRC_URI[md5sum] = "7aae5cb8e03fac48029c82a7470ab066"
-SRC_URI[sha256sum] = "9da3a0291a0bdc06305b7ba194f1e2c2b55ae6f11210b4af43729868149d5445"
+SRC_URI[md5sum] = "d15843c3fb7db39af80571ee27ec6fad"
+SRC_URI[sha256sum] = "00b0891c678c065446ca59bcee64719d0096d54d6886e6e472aeee2e170ae324"
 
 inherit autotools-brokensep
 
-- 
2.7.4




