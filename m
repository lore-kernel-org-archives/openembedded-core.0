Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF70B7E5F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 06:13:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="73869770"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2019 14:13:25 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5B9844CE03C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:13:25 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 19 Aug 2019 14:13:29 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2019 14:12:47 +0800
Message-ID: <20190819061247.29086-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5B9844CE03C7.A91F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] acpid:upgrade 2.0.31 -> 2.0.32
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
X-List-Received-Date: Mon, 19 Aug 2019 06:13:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.31.bb => acpid_2.0.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.31.bb => acpid_2.0.32.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.31.bb b/meta/recipes-bsp/acpid/acpid_2.0.32.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.31.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.32.bb
index 4074921..227e4a4 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.31.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.32.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "599dd38681b5917eeeafb58176793952"
-SRC_URI[sha256sum] = "fc9dc669ed85d9a1739aa76915e0667c6697c5431160f8dfb253046c6a072cc3"
+SRC_URI[md5sum] = "248995264b9d1cd8bdb923d5b190fd44"
+SRC_URI[sha256sum] = "f2d2d30b3edc3234bd82f6f7186699a6aa3c85c8d20bc4e30e9b3c68a1ed157e"
-- 
2.7.4




