Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D3B0D7D0CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:18:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,276,1549900800"; d="scan'208";a="57813515"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Mar 2019 16:18:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id F038C4CD5BDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:18:17 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 27 Mar 2019 16:18:20 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 16:18:51 +0800
Message-ID: <20190327081852.20155-3-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
References: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: F038C4CD5BDF.AC0BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 2/3] at-spi2-core:upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 08:18:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

upgrade from at-spi2-core_2.30.0.bb to at-spi2-core_2.32.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.32.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.32.0.bb} (92%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.32.0.bb
similarity index 92%
rename from meta/recipes-support/atk/at-spi2-core_2.30.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.32.0.bb
index d0b567a5e5..0eaa7b55c5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.32.0.bb
@@ -8,8 +8,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
-SRC_URI[sha256sum] = "0175f5393d19da51f4c11462cba4ba6ef3fa042abf1611a70bdfed586b7bfb2b"
+SRC_URI[md5sum] = "57269004541646c4c5cf0bcb7c99bb5b"
+SRC_URI[sha256sum] = "43a435d213f8d4b55e8ac83a46ae976948dc511bb4a515b69637cb36cf0e7220"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
-- 
2.20.1




