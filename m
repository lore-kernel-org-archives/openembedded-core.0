Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CC37273123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 11:20:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="33090785"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Dec 2017 19:20:23 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8321648AE9FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 19:20:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 27 Dec 2017 19:20:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Dec 2017 19:20:25 +0800
Message-ID: <1514373625-2928-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8321648AE9FD.A557D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] at-spi2-core: 2.26.0 -> 2.26.2
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
X-List-Received-Date: Wed, 27 Dec 2017 11:20:22 -0000
Content-Type: text/plain

Upgrade at-spi2-core from 2.26.0 to 2.26.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../atk/{at-spi2-core_2.26.0.bb => at-spi2-core_2.26.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.26.0.bb => at-spi2-core_2.26.2.bb} (88%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.26.0.bb b/meta/recipes-support/atk/at-spi2-core_2.26.2.bb
similarity index 88%
rename from meta/recipes-support/atk/at-spi2-core_2.26.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.26.2.bb
index 6818854..521ee3b 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.26.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.26.2.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-build-Add-with-systemduserunitdir.patch \
            "
 
-SRC_URI[md5sum] = "ef3de25da46da8f650915205eb7e1a33"
-SRC_URI[sha256sum] = "511568a65fda11fdd5ba5d4adfd48d5d76810d0e6ba4f7460f1b2ec0dbbbc337"
+SRC_URI[md5sum] = "4a042e4c801fdb793788b749eab21485"
+SRC_URI[sha256sum] = "c80e0cdf5e3d713400315b63c7deffa561032a6c37289211d8afcfaa267c2615"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
 
-- 
2.7.4




