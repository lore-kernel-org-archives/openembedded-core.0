Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B497C6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 10:17:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13689788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Dec 2016 18:17:08 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C4E274670074
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 18:17:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 7 Dec 2016 18:17:03 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 10:16:51 -0800
Message-ID: <1481134611-52481-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C4E274670074.A4D15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] cups: 2.1.4 -> 2.2.1
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
X-List-Received-Date: Wed, 07 Dec 2016 10:17:08 -0000
Content-Type: text/plain

Upgrade cups from 2.1.4 to 2.2.1.

License checksum changes are not related to license changes.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/cups/cups.inc      | 2 +-
 meta/recipes-extended/cups/cups_2.1.4.bb | 6 ------
 meta/recipes-extended/cups/cups_2.2.1.bb | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups_2.1.4.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.2.1.bb

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 02b6358..e18980b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
 
-SRC_URI = "https://github.com/apple/cups/releases/download/release-${PV}/${BP}-source.tar.gz \
+SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tar.gz \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
diff --git a/meta/recipes-extended/cups/cups_2.1.4.bb b/meta/recipes-extended/cups/cups_2.1.4.bb
deleted file mode 100644
index 0fab806..0000000
--- a/meta/recipes-extended/cups/cups_2.1.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
-
-SRC_URI[md5sum] = "9f9bf6e3b9c20a3519b4dc409666d6e7"
-SRC_URI[sha256sum] = "4b14fd833180ac529ebebea766a09094c2568bf8426e219cb3a1715304ef728d"
diff --git a/meta/recipes-extended/cups/cups_2.2.1.bb b/meta/recipes-extended/cups/cups_2.2.1.bb
new file mode 100644
index 0000000..7c5e776
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.2.1.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
+
+SRC_URI[md5sum] = "a94da2a1e9dbdccb4f3836a38a431931"
+SRC_URI[sha256sum] = "83b8730aa977cc055e7410df6a3a682548994c113994ca630a16513017e419d5"
-- 
2.7.4




