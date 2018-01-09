Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 67A727895E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 07:44:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35026342"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2018 15:44:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C0D19486A76D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 15:44:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 9 Jan 2018 15:44:28 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jan 2018 15:44:52 +0800
Message-ID: <1515483892-23237-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: C0D19486A76D.A7B66
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] cairo: 1.14.10 -> 1.14.12
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
X-List-Received-Date: Tue, 09 Jan 2018 07:44:31 -0000
Content-Type: text/plain

Upgrade cairo form 1.14.10 to 1.14.12

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/cairo/{cairo_1.14.10.bb => cairo_1.14.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.14.10.bb => cairo_1.14.12.bb} (93%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.10.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
similarity index 93%
rename from meta/recipes-graphics/cairo/cairo_1.14.10.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.12.bb
index fcdddc6..075ca1e 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.10.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://0001-cairo-Fix-CVE-2017-9814.patch \
           "
 
-SRC_URI[md5sum] = "146f5f4d0b4439fc3792fd3452b7b12a"
-SRC_URI[sha256sum] = "7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09"
+SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
+SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
2.7.4




