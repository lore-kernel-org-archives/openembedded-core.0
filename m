Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A36C37FBAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:32:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:32:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EEFFA49E9329
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:23:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:32:27 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:32:31 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2020 05:01:17 -0800
Message-ID: <1578056478-94580-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578056478-94580-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578056478-94580-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EEFFA49E9329.A624E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] stress-ng: upgrade 0.10.13 -> 0.10.15
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
X-List-Received-Date: Fri, 03 Jan 2020 08:32:31 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.10.13.bb => stress-ng_0.10.15.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.10.13.bb => stress-ng_0.10.15.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
index 37ace21d48..5402130fda 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.13.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.15.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "f7e53cae53e37d882131e87dc88af0ea"
-SRC_URI[sha256sum] = "da0442053de6db62517c49ad129a8a3f776f60e60591f3be05819eef512acb45"
+SRC_URI[md5sum] = "303a7276e3a9e3dd03be6cabc9e84a75"
+SRC_URI[sha256sum] = "1d0ca8a2f287e13c2d36c01e874d16d67bcb368d8d26563324c9aaf0ddb100c1"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1




