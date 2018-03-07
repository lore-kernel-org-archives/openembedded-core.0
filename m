Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E918878A0A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 03:10:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37560149"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Mar 2018 11:10:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 99B264D0EFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 11:10:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 7 Mar 2018 11:10:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Mar 2018 11:10:10 +0800
Message-ID: <1520392210-13037-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520392210-13037-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1520392210-13037-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 99B264D0EFEA.A64C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] patch:2.7.5 -> 2.7.6
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
X-List-Received-Date: Wed, 07 Mar 2018 03:10:22 -0000
Content-Type: text/plain

Upgrade patch from 2.7.5 to 2.7.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/patch/{patch_2.7.5.bb => patch_2.7.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/patch/{patch_2.7.5.bb => patch_2.7.6.bb} (71%)

diff --git a/meta/recipes-devtools/patch/patch_2.7.5.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
similarity index 71%
rename from meta/recipes-devtools/patch/patch_2.7.5.bb
rename to meta/recipes-devtools/patch/patch_2.7.6.bb
index 151f021..576a2ac 100644
--- a/meta/recipes-devtools/patch/patch_2.7.5.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv3"
 
 SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
 
-SRC_URI[md5sum] = "ed4d5674ef4543b4eb463db168886dc7"
-SRC_URI[sha256sum] = "7436f5a19f93c3ca83153ce9c5cbe4847e97c5d956e57a220121e741f6e7968f"
+SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
+SRC_URI[sha256sum] = "8cf86e00ad3aaa6d26aca30640e86b0e3e1f395ed99f189b06d4c9f74bc58a4e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.7.4




