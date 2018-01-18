Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E573C78268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 02:26:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35429354"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2018 10:26:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F3FAB486A777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:26:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 18 Jan 2018 10:26:47 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jan 2018 10:26:47 +0800
Message-ID: <1516242408-2389-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516242408-2389-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516242408-2389-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: F3FAB486A777.A7EB3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] icu: 60.1 -> 60.2
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
X-List-Received-Date: Thu, 18 Jan 2018 02:26:51 -0000
Content-Type: text/plain

Upgrade icu from 60.1 to 60.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/icu/{icu_60.1.bb => icu_60.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/icu/{icu_60.1.bb => icu_60.2.bb} (86%)

diff --git a/meta/recipes-support/icu/icu_60.1.bb b/meta/recipes-support/icu/icu_60.2.bb
similarity index 86%
rename from meta/recipes-support/icu/icu_60.1.bb
rename to meta/recipes-support/icu/icu_60.2.bb
index d9d6b37..585a92b 100644
--- a/meta/recipes-support/icu/icu_60.1.bb
+++ b/meta/recipes-support/icu/icu_60.2.bb
@@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "3d164a2d1bcebd1464c6160ebb8315ef"
-SRC_URI[sha256sum] = "f8f5a6c8fbf32c015a467972bdb1477dc5f5d5dfea908b6ed218715eeb5ee225"
+SRC_URI[md5sum] = "43861b127744b3c0b9d7f386f4b9fa40"
+SRC_URI[sha256sum] = "f073ea8f35b926d70bb33e6577508aa642a8b316a803f11be20af384811db418"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.7.4




