Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DFB5477BCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 07:23:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18172945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2017 15:23:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id ADD2747E6346
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 15:22:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 26 Apr 2017 15:22:58 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Apr 2017 15:22:34 +0800
Message-ID: <1493191354-11520-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: ADD2747E6346.A6C7C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] libgpg-error: 1.26 -> 1.27
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
X-List-Received-Date: Wed, 26 Apr 2017 07:23:08 -0000
Content-Type: text/plain

1) Upgrade libgpg-error from 1.26 to 1.27.
2) One file's LIC_FILES_CHKSUM checksums changed (src/gpg-error.h.in),but LICENSE remains the same.
3) Delete PR assignmen,since the version is upgraded.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libgpg-error/{libgpg-error_1.26.bb => libgpg-error_1.27.bb}    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.26.bb => libgpg-error_1.27.bb} (88%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
similarity index 88%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
index 090db1b..b2e2d50 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=64af9846baaf852793fd3a5af393acbf \
+                    file://src/gpg-error.h.in;endline=23;md5=beae1e44d8d5c265d194760276033a7c \
                     file://src/init.c;endline=20;md5=872b2389fe9bae7ffb80d2b91225afbc"
 
 
@@ -16,9 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
 
-SRC_URI[md5sum] = "97456709dbbcbb69354317ffe3e347cd"
-SRC_URI[sha256sum] = "4c4bcbc90116932e3acd37b37812d8653b1b189c1904985898e860af818aee69"
-PR = "r1"
+SRC_URI[md5sum] = "5217ef3e76a7275a2a3b569a12ddc989"
+SRC_URI[sha256sum] = "4f93aac6fecb7da2b92871bb9ee33032be6a87b174f54abf8ddf0911a22d29d2"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.7.4




