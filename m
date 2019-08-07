Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE8D7EFB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:20:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73122124"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 13:20:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 658E54CDFCE5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 13:20:22 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 13:20:22 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 13:19:40 +0800
Message-ID: <20190807051940.26060-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 658E54CDFCE5.A9D5E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ell:upgrade 0.20 -> 0.21
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
X-List-Received-Date: Wed, 07 Aug 2019 05:20:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.20.bb => ell_0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.20.bb => ell_0.21.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.20.bb b/meta/recipes-core/ell/ell_0.21.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.20.bb
rename to meta/recipes-core/ell/ell_0.21.bb
index 81caa80..487fbcc 100644
--- a/meta/recipes-core/ell/ell_0.20.bb
+++ b/meta/recipes-core/ell/ell_0.21.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "920189f5be4ee4cd72d610baeb20da65"
-SRC_URI[sha256sum] = "d4aa08915f4058ecaab509dffbe22665d71dba6fe9626caff63c0e5f4b78a394"
+SRC_URI[md5sum] = "f94f8c812b0426b0c30b651fa5142dd9"
+SRC_URI[sha256sum] = "a0db4e3057ba41035637354b6af2aa4c74f83509e0c3e563d682df9d72eaff17"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.7.4




