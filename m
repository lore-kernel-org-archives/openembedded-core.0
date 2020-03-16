Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C286261B4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:01:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,558,1574092800"; d="scan'208";a="86367493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 10:01:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D620E50A9984
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:51:37 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 10:01:41 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Mar 2020 10:01:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 00:39:36 -0700
Message-ID: <1584344377-112331-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584344377-112331-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584344377-112331-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D620E50A9984.A32F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] librepo: upgrade 1.11.2 -> 1.11.3
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
X-List-Received-Date: Mon, 16 Mar 2020 02:01:41 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../librepo/{librepo_1.11.2.bb => librepo_1.11.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.11.2.bb => librepo_1.11.3.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.11.2.bb b/meta/recipes-devtools/librepo/librepo_1.11.3.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.11.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.3.bb
index 6a0a59f865..3e745314a8 100644
--- a/meta/recipes-devtools/librepo/librepo_1.11.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "67c2d1f83f1bf87be3f26ba730fce7fbdf0c9fba"
+SRCREV = "59b3f76ca6e79786a213cda72ecafa232d30553f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




