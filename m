Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45D1471ACC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 02:39:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18622700"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2017 10:39:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 636F647C6770
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 10:39:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 9 May 2017 10:39:06 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 10:39:17 +0800
Message-ID: <1494297557-17469-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 636F647C6770.A72CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpthread-stubs: 0.3 -> 0.4
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
X-List-Received-Date: Tue, 09 May 2017 02:39:09 -0000
Content-Type: text/plain

Upgrade libpthread-stubs from 0.3 to 0.4.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../xorg-lib/{libpthread-stubs_0.3.bb => libpthread-stubs_0.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libpthread-stubs_0.3.bb => libpthread-stubs_0.4.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
rename to meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
index 5514c7f..a699841 100644
--- a/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb
@@ -14,8 +14,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libpthread-stubs-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e8fa31b42e13f87e8f5a7a2b731db7ee"
-SRC_URI[sha256sum] = "35b6d54e3cc6f3ba28061da81af64b9a92b7b757319098172488a660e3d87299"
+SRC_URI[md5sum] = "48c1544854a94db0e51499cc3afd797f"
+SRC_URI[sha256sum] = "e4d05911a3165d3b18321cc067fdd2f023f06436e391c6a28dff618a78d2e733"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




