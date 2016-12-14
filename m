Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95BDB72002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 05:04:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13899506"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Dec 2016 13:04:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id CA013477B1C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 13:04:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 14 Dec 2016 13:04:25 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 05:04:00 -0800
Message-ID: <1481720640-2251-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: CA013477B1C5.A78F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] libxkbcommon: 0.6.1 -> 0.7.0
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
X-List-Received-Date: Wed, 14 Dec 2016 05:04:33 -0000
Content-Type: text/plain

1)Upgrade libxkbcommon from 0.6.1 to 0.7.0.
2)License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libxkbcommon_0.6.1.bb => libxkbcommon_0.7.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.6.1.bb => libxkbcommon_0.7.0.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
index fc08109..a6836d8 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.6.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
@@ -2,15 +2,15 @@ SUMMARY = "Generic XKB keymap library"
 DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
 processes a reduced subset of keymaps as defined by the XKB specification."
 HOMEPAGE = "http://www.xkbcommon.org"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=09457b156e3155972abebcaaaa0cb434"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
 LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "67a8f322b5fa32352272e811bb90dd73"
-SRC_URI[sha256sum] = "5b0887b080b42169096a61106661f8d35bae783f8b6c58f97ebcd3af83ea8760"
+SRC_URI[md5sum] = "61ba550fc529ea4d6f9faa2cad62c95f"
+SRC_URI[sha256sum] = "09351592312d67b438655f54da5b67853026662c4a57e6be4d225f04a9989798"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.7.4




