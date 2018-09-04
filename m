Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 599AC750F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:36:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="44439535"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Sep 2018 17:36:32 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F1F1F4B6EC84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 17:36:31 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 4 Sep 2018 17:36:30 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 17:36:29 +0800
Message-ID: <20180904093629.31250-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: F1F1F4B6EC84.A1C4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] libdrm:2.4.93 -> 2.4.94
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
X-List-Received-Date: Tue, 04 Sep 2018 09:36:32 -0000
Content-Type: text/plain

Upgrade libdrm from 2.4.93 to 2.4.94.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/drm/{libdrm_2.4.93.bb => libdrm_2.4.94.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.93.bb => libdrm_2.4.94.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.93.bb b/meta/recipes-graphics/drm/libdrm_2.4.94.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.93.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.94.bb
index 9219d87..d654292 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.93.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.94.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "0ba45ad1551b2c1b6df0797a3e65f827"
-SRC_URI[sha256sum] = "6e84d1dc9548a76f20b59a85cf80a0b230cd8196084f5243469d9e65354fcd3c"
+SRC_URI[md5sum] = "e9803233838007047f39eb385c70d9e0"
+SRC_URI[sha256sum] = "b73c59b0a3760502c428ba81de49cd4807657d26be5e697eba3a87dd021d16be"
 
 inherit meson pkgconfig manpages
 
-- 
2.7.4




