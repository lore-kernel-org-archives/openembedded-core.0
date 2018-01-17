Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 74AD078682
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:59:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35393989"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2018 10:59:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B9EC48AEA17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 10:59:48 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 17 Jan 2018 10:59:47 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 10:59:38 +0800
Message-ID: <1516157978-837-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516157978-837-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516157978-837-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8B9EC48AEA17.A9E32
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] usbutils: 008 -> 009
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
X-List-Received-Date: Wed, 17 Jan 2018 02:59:49 -0000
Content-Type: text/plain

Upgrade usbutils from 008 to 009.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-bsp/usbutils/{usbutils_008.bb => usbutils_009.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_008.bb => usbutils_009.bb} (83%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_009.bb
similarity index 83%
rename from meta/recipes-bsp/usbutils/usbutils_008.bb
rename to meta/recipes-bsp/usbutils/usbutils_009.bb
index 3c821ea..30522fd 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_009.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://Fix-NULL-pointer-crash.patch \
           "
 
-SRC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
-SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
+SRC_URI[md5sum] = "b5dbc498b2eb5058f7a57fc6532d0aad"
+SRC_URI[sha256sum] = "e73543293a17c7803994eac97a49e58b377e08e6299ba11aad09794b91340e8b"
 
 inherit autotools pkgconfig distro_features_check
 
-- 
2.7.4




