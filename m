Return-Path: <zhengrq.fnst@cn.fujitsu.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Mar 2020 10:25:16 UTC
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DA77361671
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:25:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,513,1574092800"; d="scan'208";a="85657894"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Mar 2020 18:15:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D97E450A997B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:05:22 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 18:15:14 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2020 18:15:07 +0800
Message-ID: <1583316907-9688-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D97E450A997B.A5FE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xkbcomp: upgrade 1.4.2 -> 1.4.3
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
X-List-Received-Date: Wed, 04 Mar 2020 10:25:17 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-app/{xkbcomp_1.4.2.bb => xkbcomp_1.4.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.4.2.bb => xkbcomp_1.4.3.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
index ed1eed8662..2fa79c8438 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.3.bb
@@ -15,5 +15,5 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF += "--disable-selective-werror"
 
-SRC_URI[md5sum] = "12610df19df2af3797f2c130ee2bce97"
-SRC_URI[sha256sum] = "6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424"
+SRC_URI[md5sum] = "6e4751d99373f85d459ab4dff28893f5"
+SRC_URI[sha256sum] = "06242c169fc11caf601cac46d781d467748c6a330e15b36dce46520b8ac8d435"
-- 
2.17.1




