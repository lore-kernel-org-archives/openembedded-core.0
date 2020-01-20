Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDC27FCCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:03:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302871"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:03:08 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D4F8E4CE34CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:58 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:03:11 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:03:16 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:54 -0800
Message-ID: <1579523214-47426-12-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D4F8E4CE34CB.A5CC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] python3-dbus: upgrade 1.2.14 -> 1.2.16
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
X-List-Received-Date: Mon, 20 Jan 2020 09:03:08 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-dbus_1.2.14.bb => python3-dbus_1.2.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.14.bb => python3-dbus_1.2.16.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.14.bb b/meta/recipes-devtools/python/python3-dbus_1.2.16.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dbus_1.2.14.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.16.bb
index 04ebea9d9c..e1700fa869 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.14.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.16.bb
@@ -7,8 +7,8 @@ DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c8739234fca9fba26368d1a337abe830"
-SRC_URI[sha256sum] = "b10206ba3dd641e4e46411ab91471c88e0eec1749860e4285193ee68df84ac31"
+SRC_URI[md5sum] = "51a45c973d82bedff033a4b57d69d5d8"
+SRC_URI[sha256sum] = "11238f1d86c995d8aed2e22f04a1e3779f0d70e587caffeab4857f3c662ed5a4"
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-- 
2.17.1




