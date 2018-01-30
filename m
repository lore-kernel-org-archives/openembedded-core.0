Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7212A78881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 08:58:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36319148"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jan 2018 16:58:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F28D2486A787
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 16:58:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 30 Jan 2018 16:58:44 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Jan 2018 16:58:39 +0800
Message-ID: <1517302719-838-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517302719-838-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1517302719-838-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: F28D2486A787.A5D5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sysstat: 11.6.1 -> 11.7.1
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
X-List-Received-Date: Tue, 30 Jan 2018 08:58:47 -0000
Content-Type: text/plain

Upgrade sysstat from 11.6.1 to 11.7.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-extended/sysstat/{sysstat_11.6.1.bb => sysstat_11.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.6.1.bb => sysstat_11.7.1.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.6.1.bb b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.6.1.bb
rename to meta/recipes-extended/sysstat/sysstat_11.7.1.bb
index 4efd2a1..86738e7 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.6.1.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.7.1.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "33cff6260b9c8f0b908fe94ce7ab2773"
-SRC_URI[sha256sum] = "4b2a2cfa8c8fe6ae0155e168ed9a7066caebc3ecb903b0e64a9ede28ecb68fcb"
+SRC_URI[md5sum] = "bdcda7c9048c7c22fb1f30f75285d13d"
+SRC_URI[sha256sum] = "303a595b1af0330b183a0f1febfccf89f183b9575ae0562b91fdb876f3ef1feb"
-- 
2.7.4




