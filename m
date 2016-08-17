Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B90886FF9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:26:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10007013"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2016 17:26:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id EA7D442EB201
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 17:26:28 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 17 Aug 2016 17:26:28 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 17:25:17 +0800
Message-ID: <1471425917-5930-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: EA7D442EB201.AE284
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dbus: 1.10.8 -> 1.10.10
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
X-List-Received-Date: Wed, 17 Aug 2016 09:26:31 -0000
Content-Type: text/plain

Upgrade dbus from 1.10.8 to 1.10.10.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.8.bb => dbus-test_1.10.10.bb} | 4 ++--
 meta/recipes-core/dbus/{dbus_1.10.8.bb => dbus_1.10.10.bb}           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.8.bb => dbus-test_1.10.10.bb} (93%)
 rename meta/recipes-core/dbus/{dbus_1.10.8.bb => dbus_1.10.10.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.8.bb b/meta/recipes-core/dbus/dbus-test_1.10.10.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.8.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.10.bb
index 87dcd37..650b7ab 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.8.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.10.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
-SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014"
+SRC_URI[md5sum] = "495676d240eb982921b3ad1343526849"
+SRC_URI[sha256sum] = "9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.10.8.bb b/meta/recipes-core/dbus/dbus_1.10.10.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.10.8.bb
rename to meta/recipes-core/dbus/dbus_1.10.10.bb
index 62dd8bb..4db0b9b 100644
--- a/meta/recipes-core/dbus/dbus_1.10.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.10.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://0001-configure.ac-explicitely-check-stdint.h.patch \
 "
 
-SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
-SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014"
+SRC_URI[md5sum] = "495676d240eb982921b3ad1343526849"
+SRC_URI[sha256sum] = "9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
2.7.4




