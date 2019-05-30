Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1C88D7C427
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 03:16:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,529,1549900800"; d="scan'208";a="65157369"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2019 11:16:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BD94D4CDBF45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:16:11 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 30 May 2019 11:16:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2019 11:17:23 +0800
Message-ID: <20190530031723.13340-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: BD94D4CDBF45.AAFF3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dbus-test:upgrade 1.12.12 -> 1.12.14
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
X-List-Received-Date: Thu, 30 May 2019 03:16:12 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from dbus-test_1.12.12.bb to dbus-test_1.12.14.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dbus/{dbus-test_1.12.12.bb => dbus-test_1.12.14.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.12.bb => dbus-test_1.12.14.bb} (95%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.12.bb b/meta/recipes-core/dbus/dbus-test_1.12.14.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.12.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.14.bb
index f95b31a863..d7eb628285 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.12.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.14.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "ea11069521beeee4e47f0086596a43c8"
-SRC_URI[sha256sum] = "9546f226011a1e5d9d77245fe5549ef25af4694053189d624d0d6ac127ecf5f8"
+SRC_URI[md5sum] = "9e748b8c50dae17ae639f1c55ae6417d"
+SRC_URI[sha256sum] = "44f9c290ae8f6cadeb2c329316c03716f171ce10daddd85c0bffd0f7df514c8d"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.20.1




