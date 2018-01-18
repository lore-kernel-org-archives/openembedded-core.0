Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7CF78268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 02:26:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35429355"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2018 10:26:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BE001486A76D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:26:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 18 Jan 2018 10:26:45 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jan 2018 10:26:46 +0800
Message-ID: <1516242408-2389-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: BE001486A76D.A653A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] gdbm: 1.13 -> 1.14.1
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
X-List-Received-Date: Thu, 18 Jan 2018 02:26:52 -0000
Content-Type: text/plain

Upgrade gdbm from 1.13 to 1.14.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-support/gdbm/{gdbm_1.13.bb => gdbm_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.13.bb => gdbm_1.14.1.bb} (88%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.13.bb b/meta/recipes-support/gdbm/gdbm_1.14.1.bb
similarity index 88%
rename from meta/recipes-support/gdbm/gdbm_1.13.bb
rename to meta/recipes-support/gdbm/gdbm_1.14.1.bb
index 4bbe147..54e5696 100644
--- a/meta/recipes-support/gdbm/gdbm_1.13.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.14.1.bb
@@ -10,8 +10,8 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "8929dcda2a8de3fd2367bdbf66769376"
-SRC_URI[sha256sum] = "9d252cbd7d793f7b12bcceaddda98d257c14f4d1890d851c386c37207000a253"
+SRC_URI[md5sum] = "c2ddcb3897efa0f57484af2bd4f4f848"
+SRC_URI[sha256sum] = "cdceff00ffe014495bed3aed71c7910aa88bf29379f795abc0f46d4ee5f8bc5f"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.7.4




