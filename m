Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E40960FDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:50:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574092800"; d="scan'208";a="83096264"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2020 17:50:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 288EC406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:40:43 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 10 Feb 2020 17:50:16 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 10 Feb 2020 17:50:18 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2020 09:38:05 -0800
Message-ID: <1581356285-65315-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 288EC406AB15.A2586
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] librepo: upgrade 1.11.1 -> 1.11.2
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
X-List-Received-Date: Mon, 10 Feb 2020 09:50:14 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../librepo/{librepo_1.11.1.bb => librepo_1.11.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.11.1.bb => librepo_1.11.2.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.11.1.bb b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.11.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.2.bb
index dbf1016456..6a0a59f865 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "5ade10012d40fad27a7aa1085091c2c5fdd099ff"
+SRCREV = "67c2d1f83f1bf87be3f26ba730fce7fbdf0c9fba"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




