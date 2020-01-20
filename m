Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 55E9E7FC44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302800"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 327CB406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:52:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:09 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:16 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:46 -0800
Message-ID: <1579523214-47426-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 327CB406AB15.A3012
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] grep: upgrade 3.3 -> 3.4
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:12 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-extended/grep/{grep_3.3.bb => grep_3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_3.3.bb => grep_3.4.bb} (89%)

diff --git a/meta/recipes-extended/grep/grep_3.3.bb b/meta/recipes-extended/grep/grep_3.4.bb
similarity index 89%
rename from meta/recipes-extended/grep/grep_3.3.bb
rename to meta/recipes-extended/grep/grep_3.4.bb
index 704a3ecd06..fb8dcec490 100644
--- a/meta/recipes-extended/grep/grep_3.3.bb
+++ b/meta/recipes-extended/grep/grep_3.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "05d0718a1b7cc706a4bdf8115363f1ed"
-SRC_URI[sha256sum] = "b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514"
+SRC_URI[md5sum] = "111b117d22d6a7d049d6ae7505e9c4d2"
+SRC_URI[sha256sum] = "58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.17.1




