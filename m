Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F42A787BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 09:00:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36021536"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 17:00:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E5F149F19B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 16:59:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 16:59:58 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jan 2018 17:00:10 +0800
Message-ID: <1516957210-15531-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 7E5F149F19B1.A903B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] man-pages: 4.11 -> 4.14
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
X-List-Received-Date: Fri, 26 Jan 2018 09:00:01 -0000
Content-Type: text/plain

1.Upgrade man-pages from 4.11 to 4.14.
2.Update the checksum of LIC_FILES_CHKSUM, since README has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../man-pages/{man-pages_4.11.bb => man-pages_4.14.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.11.bb => man-pages_4.14.bb} (79%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.11.bb b/meta/recipes-extended/man-pages/man-pages_4.14.bb
similarity index 79%
rename from meta/recipes-extended/man-pages/man-pages_4.11.bb
rename to meta/recipes-extended/man-pages/man-pages_4.14.bb
index a3077a9..f8bd090 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.11.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.14.bb
@@ -4,11 +4,11 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
+LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "408300ed09d1ad5938070158b21da1d1"
-SRC_URI[sha256sum] = "e6db91a24e68c7c765b7b8e60f1591ed1049bc2dc3143db779eae4838b89d195"
+SRC_URI[md5sum] = "82bd2d05c4d0dba5e7a90d39c9555197"
+SRC_URI[sha256sum] = "aeebc6b09a11e7f7bbc98f3984fe8b8b2bde9d2f5f9dcbd4348a9e0d93704238"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.7.4




