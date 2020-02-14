Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 647A4610BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:12:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,440,1574092800"; d="scan'208";a="83307845"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2020 00:12:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B317A406AB15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:02:33 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sat, 15 Feb 2020 00:12:08 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 15 Feb 2020 00:12:09 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2020 15:44:26 -0800
Message-ID: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B317A406AB15.A04EF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ell: upgrade 0.27 -> 0.28
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
X-List-Received-Date: Fri, 14 Feb 2020 16:12:08 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.27.bb => ell_0.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.27.bb => ell_0.28.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.27.bb b/meta/recipes-core/ell/ell_0.28.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.27.bb
rename to meta/recipes-core/ell/ell_0.28.bb
index 503f1e22a3..464bf631e3 100644
--- a/meta/recipes-core/ell/ell_0.27.bb
+++ b/meta/recipes-core/ell/ell_0.28.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e090d6a910a43c2a32114ba1cdc9f1f2"
-SRC_URI[sha256sum] = "afc5441d6f6ece512a188b1e6aeabd7153de4f38989c897a2197ae50fc46da96"
+SRC_URI[md5sum] = "e38089e54d4b41e508bbb7f37a4a59d9"
+SRC_URI[sha256sum] = "6254fcb98d681cb2c3078dde462ba20bf90e6c10919204c6878a4381adcdb74b"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1




