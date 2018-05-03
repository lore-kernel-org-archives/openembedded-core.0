Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 59F6374814
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 07:25:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39517234"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 May 2018 15:25:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 130A74B34D23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 15:25:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 3 May 2018 15:25:06 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 15:24:58 +0800
Message-ID: <20180503072458.19458-4-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
References: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 130A74B34D23.ABD4A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xcb-proto:1.12->1.13
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
X-List-Received-Date: Thu, 03 May 2018 07:25:08 -0000
Content-Type: text/plain

1.Upgrade xcb-proto 1.12 to 1.13

2.Delete 0001-Make-whitespace-use-consistent.patch,0002-print-is-a-function-and-needs-parentheses.patch ,since it is integrated upstream.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../xorg-proto/{xcb-proto_1.12.bb => xcb-proto_1.13.bb}             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.12.bb => xcb-proto_1.13.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
index 25a8373..bc0e837 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
-           file://0001-Make-whitespace-use-consistent.patch \
-           file://0002-print-is-a-function-and-needs-parentheses.patch \
            "
-SRC_URI[md5sum] = "14e60919f859560f28426a685a555962"
-SRC_URI[sha256sum] = "5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c480a4906"
+SRC_URI[md5sum] = "abe9aa4886138150bbc04ae4f29b90e3"
+SRC_URI[sha256sum] = "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




