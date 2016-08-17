Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0B576FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:49:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10003056"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2016 15:49:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1E38142CD117
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 15:49:05 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 17 Aug 2016 15:49:03 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1461855641-5375-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 1E38142CD117.A8FCC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dbus-test: 1.10.8 -> 1.11.2
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
Date: Wed, 17 Aug 2016 07:49:12 -0000
X-Original-Date: Thu, 28 Apr 2016 18:00:41 +0300
X-List-Received-Date: Wed, 17 Aug 2016 07:49:12 -0000
Content-Type: text/plain

Upgrade dbus-test from 1.10.8 to 1.11.2.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-core/dbus/{dbus-test_1.10.8.bb => dbus-test_1.11.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.8.bb => dbus-test_1.11.2.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.8.bb b/meta/recipes-core/dbus/dbus-test_1.11.2.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.8.bb
rename to meta/recipes-core/dbus/dbus-test_1.11.2.bb
index 87dcd37..03110b1 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.8.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.11.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
-SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014"
+SRC_URI[md5sum] = "957a07f066f3730d2bb3ea0932f0081b"
+SRC_URI[sha256sum] = "5abc4c57686fa82669ad0039830788f9b03fdc4fff487f0ccf6c9d56ba2645c9"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.7.4




