Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 113816B8BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 03:34:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76572267"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 11:34:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EC7CB4CE14F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 11:34:22 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 11:34:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 11:34:23 +0800
Message-ID: <20191007033423.16829-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: EC7CB4CE14F5.AADF2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] librepo:upgrade 1.10.5 -> 1.10.6
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
X-List-Received-Date: Mon, 07 Oct 2019 03:34:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/librepo/{librepo_1.10.5.bb => librepo_1.10.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.10.5.bb => librepo_1.10.6.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.10.5.bb b/meta/recipes-devtools/librepo/librepo_1.10.6.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.10.5.bb
rename to meta/recipes-devtools/librepo/librepo_1.10.6.bb
index 87d64bf..cf4de22 100644
--- a/meta/recipes-devtools/librepo/librepo_1.10.5.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.10.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "385e2ced1083cac0bcb19e30500311f6923e6dfc"
+SRCREV = "2ec349f1c686c1704dc83da6c118035ff57c8dea"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




