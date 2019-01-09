Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE69D7C075
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 01:52:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,455,1539619200"; d="scan'208";a="51597030"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2019 09:52:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 840F24BAC828
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 09:52:00 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 9 Jan 2019 09:52:06 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 09:52:22 +0800
Message-ID: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 840F24BAC828.AE608
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] dbus:upgrade to 1.13.6
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
X-List-Received-Date: Wed, 09 Jan 2019 01:52:05 -0000
Content-Type: text/plain

1.Upgrade dbus from 1.12.10 to 1.13.6.
2.Upgrade dbus-test from 1.12.10 to 1.13.6.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../dbus/{dbus-test_1.12.10.bb => dbus-test_1.13.6.bb}        | 4 ++--
 meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.13.6.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.10.bb => dbus-test_1.13.6.bb} (95%)
 rename meta/recipes-core/dbus/{dbus_1.12.10.bb => dbus_1.13.6.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.13.6.bb
similarity index 95%
rename from meta/recipes-core/dbus/dbus-test_1.12.10.bb
rename to meta/recipes-core/dbus/dbus-test_1.13.6.bb
index 25b9395120..695e8d736d 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.13.6.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
-SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
+SRC_URI[md5sum] = "aeee1cbbed4d0f2b57fce5bf44828bda"
+SRC_URI[sha256sum] = "b533693232d36d608a09f70c15440c1816319bac3055433300d88019166c1ae4"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.13.6.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.12.10.bb
rename to meta/recipes-core/dbus/dbus_1.13.6.bb
index d71f7f7042..50859152a8 100644
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.13.6.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
-SRC_URI[sha256sum] = "4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7"
+SRC_URI[md5sum] = "aeee1cbbed4d0f2b57fce5bf44828bda"
+SRC_URI[sha256sum] = "b533693232d36d608a09f70c15440c1816319bac3055433300d88019166c1ae4"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
2.17.2




