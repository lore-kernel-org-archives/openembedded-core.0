Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BDA6C7D15F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:09:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,278,1549900800"; d="scan'208";a="57897387"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Mar 2019 14:09:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F8924CD5D29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:09:19 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 28 Mar 2019 14:09:21 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 14:09:55 +0800
Message-ID: <20190328060955.24787-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 3F8924CD5D29.A9F4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] less:upgrade 549 -> 550
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
X-List-Received-Date: Thu, 28 Mar 2019 06:09:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from less_549.bb to less_550.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/less/{less_549.bb => less_550.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_549.bb => less_550.bb} (89%)

diff --git a/meta/recipes-extended/less/less_549.bb b/meta/recipes-extended/less/less_550.bb
similarity index 89%
rename from meta/recipes-extended/less/less_549.bb
rename to meta/recipes-extended/less/less_550.bb
index 140c89fcb0..bb1618f1eb 100644
--- a/meta/recipes-extended/less/less_549.bb
+++ b/meta/recipes-extended/less/less_550.bb
@@ -28,8 +28,8 @@ DEPENDS = "ncurses"
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "d12863d348077739a4d3bc67ad9b7f00"
-SRC_URI[sha256sum] = "eec42357903faabfb294ffcc41ff08cbb29db54db46568cd8d0ed15a0482e19d"
+SRC_URI[md5sum] = "8caff88e34afff512b663d7c690bd2cf"
+SRC_URI[sha256sum] = "6a53639f08d7ed05b6e104b82c32193f79ac01a3eddb20e114e1c261948bd57b"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.20.1




