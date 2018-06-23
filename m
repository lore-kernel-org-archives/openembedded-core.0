Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 68F3F754D6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:53:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424602"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:53:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F2C5E4B41ECF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 18:53:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Sat, 23 Jun 2018 18:53:55 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 03:53:00 +0800
Message-ID: <1529783581-46179-8-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: F2C5E4B41ECF.AA4F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 7/8] [PATCH v2] rpm: Add DEPENDS for nativesdk.
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
X-List-Received-Date: Sat, 23 Jun 2018 10:53:56 -0000
Content-Type: text/plain

Add DEPENDS for nativesdk.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index e5e87d3..6ca5c94 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -52,6 +52,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
+DEPENDS_append_class-nativesdk = " file-replacement-nativesdk"
 
 inherit autotools gettext pkgconfig python3native
 export PYTHON_ABI
-- 
2.7.4




