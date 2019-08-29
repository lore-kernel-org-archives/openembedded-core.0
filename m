Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 69D8A7C346
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 03:27:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="74502381"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Aug 2019 11:27:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CD294CE0870
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 11:27:51 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 29 Aug 2019 11:27:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2019 11:27:17 +0800
Message-ID: <20190829032717.1988-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3CD294CE0870.A7DB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libsolv:upgrade 0.7.5 -> 0.7.6
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
X-List-Received-Date: Thu, 29 Aug 2019 03:27:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/libsolv/{libsolv_0.7.5.bb => libsolv_0.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.5.bb => libsolv_0.7.6.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.5.bb b/meta/recipes-extended/libsolv/libsolv_0.7.6.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.5.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.6.bb
index 80ce76b..3df8993 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.5.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.6.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "2cab7ea00d08390374b25b11d969f3740c4660f4"
+SRCREV = "17ce4bc4fb52a0b32964f3b7d491c18177980be1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4




