Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9516377E9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 07:42:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19007760"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 May 2017 15:42:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CAC3147C6104
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 15:42:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 18 May 2017 15:42:28 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 May 2017 15:41:07 +0800
Message-ID: <1495093267-84866-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: CAC3147C6104.A5C9B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3 2/2] libx11-diet: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Thu, 18 May 2017 07:42:31 -0000
Content-Type: text/plain

Upgrade libx11-diet from 1.6.4 to 1.6.5

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libx11-diet_1.6.4.bb => libx11-diet_1.6.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.4.bb => libx11-diet_1.6.5.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb
index 0c761d7..295f96a2 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.5.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.diff \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
-SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
+SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
+SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
 
 EXTRA_OECONF += "--disable-xlocale"
 
-- 
2.7.4




