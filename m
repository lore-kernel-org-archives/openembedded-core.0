Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 285087F350
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 05:50:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,356,1559491200"; d="scan'208";a="73124942"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 13:50:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B2104CDFCDA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 13:50:31 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 13:50:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 13:49:49 +0800
Message-ID: <20190807054949.26520-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8B2104CDFCDA.AA4DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libgudev:upgrade 232 -> 233
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
X-List-Received-Date: Wed, 07 Aug 2019 05:50:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-gnome/libgudev/{libgudev_232.bb => libgudev_233.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libgudev/{libgudev_232.bb => libgudev_233.bb} (74%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_232.bb b/meta/recipes-gnome/libgudev/libgudev_233.bb
similarity index 74%
rename from meta/recipes-gnome/libgudev/libgudev_232.bb
rename to meta/recipes-gnome/libgudev/libgudev_233.bb
index 19fe962..a9f6bdd 100644
--- a/meta/recipes-gnome/libgudev/libgudev_232.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_233.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GObject wrapper for libudev"
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
-SRC_URI[archive.sha256sum] = "ee4cb2b9c573cdf354f6ed744f01b111d4b5bed3503ffa956cefff50489c7860"
-SRC_URI[archive.md5sum] = "6914852377156665567abf8a38d89236"
+SRC_URI[archive.sha256sum] = "587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03"
+SRC_URI[archive.md5sum] = "d59a317a40aaa02a2226056c0bb4d3e1"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.7.4




