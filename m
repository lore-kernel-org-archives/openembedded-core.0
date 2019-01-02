Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E6EE860234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 05:18:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,429,1539619200"; d="scan'208";a="51111333"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2019 13:18:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 014454B7D4C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 13:18:24 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 2 Jan 2019 13:18:29 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jan 2019 13:17:48 +0800
Message-ID: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 014454B7D4C2.ABFE8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] Added armeb into meson.bbclass.
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
X-List-Received-Date: Wed, 02 Jan 2019 05:18:27 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 3cbdcf1..a922ae5 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -54,6 +54,8 @@ def meson_cpu_family(var, d):
         return 'ppc'
     elif arch == 'powerpc64':
         return 'ppc64'
+    elif arch == 'armeb':
+        return 'arm'
     elif arch == 'mipsel':
         return 'mips'
     elif re.match(r"i[3-6]86", arch):
-- 
2.7.4




