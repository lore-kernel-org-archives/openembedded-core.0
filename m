Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8B978998
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:32:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="43166954"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2018 17:32:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D09DA4B6ADFF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 17:32:24 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 7 Aug 2018 17:32:26 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2018 17:31:47 +0800
Message-ID: <20180807093148.17801-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
References: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: D09DA4B6ADFF.A31BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] librepo:1.8.1 -> 1.9.0
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
X-List-Received-Date: Tue, 07 Aug 2018 09:32:34 -0000
Content-Type: text/plain

Upgrade librepo from 1.8.1 to 1.9.0

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/librepo/{librepo_1.8.1.bb => librepo_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.8.1.bb => librepo_1.9.0.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.8.1.bb b/meta/recipes-devtools/librepo/librepo_1.9.0.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.8.1.bb
rename to meta/recipes-devtools/librepo/librepo_1.9.0.bb
index 4569885..cebf3c7 100644
--- a/meta/recipes-devtools/librepo/librepo_1.8.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "7b9b7bf388f3f059529c6f50c40b30919fef30f9"
+SRCREV = "6e939a1f41685755356e1dc881db2890f94e2614"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




