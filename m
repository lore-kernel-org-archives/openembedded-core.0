Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C4DD561043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:21:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,455,1574092800"; d="scan'208";a="83480836"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Feb 2020 14:21:07 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CC3F850A9976
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:11:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 18 Feb 2020 14:21:04 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Feb 2020 14:21:11 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2020 05:39:55 -0800
Message-ID: <1582033197-93331-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582033197-93331-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: CC3F850A9976.A3EE6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libarchive: upgrade 3.4.1 -> 3.4.2
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
X-List-Received-Date: Tue, 18 Feb 2020 06:21:08 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libarchive/{libarchive_3.4.1.bb => libarchive_3.4.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.1.bb => libarchive_3.4.2.bb} (93%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.1.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
similarity index 93%
rename from meta/recipes-extended/libarchive/libarchive_3.4.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 2d33dd80ab..c3edb573e7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -33,8 +33,8 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "59bff5ee6216cbb76c8354f6dd6f5a5a"
-SRC_URI[sha256sum] = "fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191"
+SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
+SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.17.1




