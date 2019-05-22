Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED2C7E3C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 07:17:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,498,1549900800"; d="scan'208";a="64142268"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 May 2019 15:17:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C99F74CD81AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:17:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 22 May 2019 15:17:47 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2019 15:17:44 +0800
Message-ID: <1558509464-60442-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: C99F74CD81AE.A0560
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] meson.bbclass: Make meson support aarch64_be.
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
X-List-Received-Date: Wed, 22 May 2019 07:17:40 -0000
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




