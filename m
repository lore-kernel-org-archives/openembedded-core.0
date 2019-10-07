Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 453696C1BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 05:06:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76574592"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 13:06:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 836864CE042F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:06:25 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 13:06:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 13:06:26 +0800
Message-ID: <20191007050626.17591-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 836864CE042F.A734D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] msmtp:upgrade 1.8.5 -> 1.8.6
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
X-List-Received-Date: Mon, 07 Oct 2019 05:06:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.8.5.bb => msmtp_1.8.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.5.bb => msmtp_1.8.6.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.5.bb b/meta/recipes-extended/msmtp/msmtp_1.8.6.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.8.5.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.6.bb
index 4f6b66f..809144b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.5.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.6.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "5d7bb10606fbceeb2e0687379c75234b"
-SRC_URI[sha256sum] = "1613daced9c47b8c028224fc076799c2a4d72923e242be4e9e5c984cbbbb9f39"
+SRC_URI[md5sum] = "adff4a9992e1b47aa5468b974550304e"
+SRC_URI[sha256sum] = "6625f147430c65ba8527f52c4fe5d4d33552d3c0fb6d793ba7df819a3b3042e1"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.7.4




