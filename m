Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E68A07FBAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:32:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:32:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 21DFC406AB15
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:23:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:32:25 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:32:27 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2020 05:01:16 -0800
Message-ID: <1578056478-94580-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 21DFC406AB15.A3832
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] rng-tools: upgrade 6.8 -> 6.9
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
X-List-Received-Date: Fri, 03 Jan 2020 08:32:30 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../rng-tools/{rng-tools_6.8.bb => rng-tools_6.9.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/rng-tools/{rng-tools_6.8.bb => rng-tools_6.9.bb} (97%)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.8.bb b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
similarity index 97%
rename from meta/recipes-support/rng-tools/rng-tools_6.8.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.9.bb
index 83a48a4ec3..913342c315 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.8.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     file://default \
     file://rngd.service \
 "
-SRCREV = "eb5e34c7fb05594760f99d863fbe0401fe297b93"
+SRCREV = "4a865797a69dd38c64a86aa32884ecc9ba7b4d08"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




