Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 21D367D2F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 06:51:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,490,1549900800"; d="scan'208";a="63795847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2019 14:51:55 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 699884CDAD75
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:51:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 May 2019 14:52:02 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1556598106-56298-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 699884CDAD75.AE28F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] meson.bbclass: Make meson support aarch64_be.
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
Date: Mon, 20 May 2019 06:51:56 -0000
X-Original-Date: Tue, 30 Apr 2019 12:21:46 +0800
X-List-Received-Date: Mon, 20 May 2019 06:51:56 -0000
Content-Type: text/plain

Added aarch64_be into cpu family.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 115d1ae..0edbfc1 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -56,6 +56,8 @@ def meson_cpu_family(var, d):
         return 'ppc64'
     elif arch == 'armeb':
         return 'arm'
+    elif arch == 'aarch64_be':
+        return 'aarch64'
     elif arch == 'mipsel':
         return 'mips'
     elif arch == 'mips64el':
-- 
2.7.4




