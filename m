Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C98C17D0B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:18:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,276,1549900800"; d="scan'208";a="57813517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Mar 2019 16:18:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9CB234CD5BE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 16:18:18 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 27 Mar 2019 16:18:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 16:18:52 +0800
Message-ID: <20190327081852.20155-4-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
References: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 9CB234CD5BE4.AB43D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 3/3] at-spi2-atk:upgrade 2.30.0 -> 2.32.0
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

upgrade from at-spi2-atk_2.30.0.bb to at-spi2-atk_2.32.0.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb} (80%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
similarity index 80%
rename from meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
index 2244797071..8812d33d9a 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-SRC_URI[archive.md5sum] = "1ad754b90bcb14244b73ca4d0c14d274"
-SRC_URI[archive.sha256sum] = "e2e1571004ea7b105c969473ce455a95be4038fb2541471714aeb33a26da8a9a"
+SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
+SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.20.1




