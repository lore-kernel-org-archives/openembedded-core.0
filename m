Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9397F464
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 07:42:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73134891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 15:42:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE9714CDFCE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 15:42:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 15:42:50 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 15:42:09 +0800
Message-ID: <20190807074209.31089-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: DE9714CDFCE7.ABCED
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libglu:upgrade 9.0.0 -> 9.0.1
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
X-List-Received-Date: Wed, 07 Aug 2019 07:42:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/mesa/{libglu_9.0.0.bb => libglu_9.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/mesa/{libglu_9.0.0.bb => libglu_9.0.1.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.1.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/libglu_9.0.0.bb
rename to meta/recipes-graphics/mesa/libglu_9.0.1.bb
index eeb898f..068fb19 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b35645
 PE = "2"
 PR = "0"
 
-SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.bz2"
+SRC_URI = "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "be9249132ff49275461cf92039083030"
-SRC_URI[sha256sum] = "1f7ad0d379a722fcbd303aa5650c6d7d5544fde83196b42a73d1193568a4df12"
+SRC_URI[md5sum] = "5599a0e0a97335e10239d9165aced60d"
+SRC_URI[sha256sum] = "f6f484cfcd51e489afe88031afdea1e173aa652697e4c19ddbcb8260579a10f7"
 
 S = "${WORKDIR}/glu-${PV}"
 
-- 
2.7.4




