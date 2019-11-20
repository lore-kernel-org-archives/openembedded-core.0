Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 88AD57D1E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:03:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,220,1571673600"; d="scan'208";a="78778656"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Nov 2019 14:03:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 55B184B6EC6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:54:55 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 20 Nov 2019 14:03:10 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2019 14:03:46 +0800
Message-ID: <20191120060346.3867-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 55B184B6EC6D.A8F37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] alsa-utils:upgrade 1.1.9 -> 1.2.1
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
X-List-Received-Date: Wed, 20 Nov 2019 06:03:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../alsa/{alsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
index 03b5c8de30..124079e512 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5ed21c3e296c06046cc986e732f625f6"
-SRC_URI[sha256sum] = "5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a"
+SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
+SRC_URI[sha256sum] = "0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.20.1




