Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 781BE60197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 08:55:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,295,1549900800"; d="scan'208";a="58196533"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2019 16:55:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A45504CD77B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:55:30 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Apr 2019 16:55:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Apr 2019 16:56:06 +0800
Message-ID: <20190401085606.13910-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: A45504CD77B8.A8138
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sysprof:upgrade 3.30.2 -> 3.32.0
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
X-List-Received-Date: Mon, 01 Apr 2019 08:55:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from sysprof_3.30.2.bb to sysprof_3.32.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../sysprof/{sysprof_3.30.2.bb => sysprof_3.32.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/sysprof/{sysprof_3.30.2.bb => sysprof_3.32.0.bb} (88%)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb b/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
similarity index 88%
rename from meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
index 24e49cb0d5..b92933806c 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.30.2.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.32.0.bb
@@ -9,8 +9,8 @@ inherit gnomebase gettext systemd upstream-version-is-even gsettings
 
 DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 
-SRC_URI[archive.md5sum] = "80cb47906eced2e7b9976bf00deec323"
-SRC_URI[archive.sha256sum] = "e90878e5a509bd79d170a7a51d47cc5508ab1363afaf0d97654373dfd9c8ba0b"
+SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
+SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
 SRC_URI += " \
            file://define-NT_GNU_BUILD_ID.patch \
            file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
-- 
2.20.1




