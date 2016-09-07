Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1D998776F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 02:58:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10689613"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Sep 2016 10:58:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 96BD94026B51
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 10:58:04 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 7 Sep 2016 10:58:03 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2016 22:58:00 -0400
Message-ID: <1473217080-1941-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 96BD94026B51.A442C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] wayland: 1.11.0 -> 1.11.93
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
X-List-Received-Date: Wed, 07 Sep 2016 02:58:12 -0000
Content-Type: text/plain

1) Upgrade wayland from 1.11.0 to 1.11.93.
2) Delete one patch, since it is no use.
    0001-scanner-Use-unit32_t-instead-of-uint.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../wayland/{wayland_1.11.0.bb => wayland_1.11.93.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.11.0.bb => wayland_1.11.93.bb} (88%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.11.0.bb b/meta/recipes-graphics/wayland/wayland_1.11.93.bb
similarity index 88%
rename from meta/recipes-graphics/wayland/wayland_1.11.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.11.93.bb
index 3413406..234f245 100644
--- a/meta/recipes-graphics/wayland/wayland_1.11.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.11.93.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-scanner-Use-unit32_t-instead-of-uint.patch \
            "
-SRC_URI[md5sum] = "fccf680be066e234729d5b69e0bd0fa9"
-SRC_URI[sha256sum] = "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"
+SRC_URI[md5sum] = "903ae84fdbcb9943feef8598f038b989"
+SRC_URI[sha256sum] = "3133fb55c40392c3923debd6e9ee64e758709795eccff0b8005cb4118454f08f"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.7.4




