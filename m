Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 804577FC4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:02:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302811"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:02:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E96AB406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:10 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:02:21 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:02:28 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:47 -0800
Message-ID: <1579523214-47426-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: E96AB406AB15.A3004
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] iproute2: upgrade 5.3.0 -> 5.4.0
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
X-List-Received-Date: Mon, 20 Jan 2020 09:02:25 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../iproute2/{iproute2_5.3.0.bb => iproute2_5.4.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.3.0.bb => iproute2_5.4.0.bb} (66%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.4.0.bb
similarity index 66%
rename from meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.4.0.bb
index 75772d4696..7f8ea7b870 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.4.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
           "
 
-SRC_URI[md5sum] = "227404413c8d6db649d6188ead1e5a6e"
-SRC_URI[sha256sum] = "cb1c1e45993a3bd2438543fd4332d70f1726a6e6ff97dc613a8258c993117b3f"
+SRC_URI[md5sum] = "54d86cadb4cd1d19fd7114b4e53adf51"
+SRC_URI[sha256sum] = "fe97aa60a0d4c5ac830be18937e18dc3400ca713a33a89ad896ff1e3d46086ae"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1




