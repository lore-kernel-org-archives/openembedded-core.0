Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 156007FAB7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 02:28:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,251,1571673600"; d="scan'208";a="79195950"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2019 10:28:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C06894CE20C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 10:19:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Nov 2019 10:28:05 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Nov 2019 01:12:28 -0800
Message-ID: <1574932348-14525-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574932348-14525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1574932348-14525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C06894CE20C1.A8CA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] stress-ng 0.10.10 -> 0.10.11
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
X-List-Received-Date: Thu, 28 Nov 2019 02:28:07 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.10.10.bb => stress-ng_0.10.11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.10.bb => stress-ng_0.10.11.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
index 47a98f3..0e17385 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.10.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.11.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "ad4de38d6ff1ccf3640573e967dfb136"
-SRC_URI[sha256sum] = "031de5ebc44b49992c11633f10aae96da05a85b326aebdffd88ba8c445d23cf4"
+SRC_URI[md5sum] = "08b694eeb152c659b06cbe0c723fbf2a"
+SRC_URI[sha256sum] = "ec41d375d1ae61862b00a939a5263791c8c8fdb262ad14ea204944df4ca140f1"
 
 DEPENDS = "coreutils-native"
 
-- 
2.7.4




