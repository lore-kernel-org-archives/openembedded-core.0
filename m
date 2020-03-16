Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6E31061B41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:01:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,558,1574092800"; d="scan'208";a="86367508"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 10:01:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 84BD750A9992
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:51:44 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 10:01:45 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Mar 2020 10:01:52 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 00:39:37 -0700
Message-ID: <1584344377-112331-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584344377-112331-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584344377-112331-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 84BD750A9992.A1CEF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xcb-proto: upgrade 1.13 -> 1.14
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
X-List-Received-Date: Mon, 16 Mar 2020 02:01:46 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-proto/{xcb-proto_1.13.bb => xcb-proto_1.14.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.13.bb => xcb-proto_1.14.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
index 7467090920..563143f070 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
@@ -11,9 +11,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
-SRC_URI[md5sum] = "abe9aa4886138150bbc04ae4f29b90e3"
-SRC_URI[sha256sum] = "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.gz"
+SRC_URI[md5sum] = "b3e265a6b42d994e3d811a5d0b9ca924"
+SRC_URI[sha256sum] = "1c3fa23d091fb5e4f1e9bf145a902161cec00d260fabf880a7a248b02ab27031"
 
 inherit autotools pkgconfig python3native
 
-- 
2.17.1




