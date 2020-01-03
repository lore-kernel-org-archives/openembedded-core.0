Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D72A37F8F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 01:36:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,388,1571673600"; d="scan'208";a="81257223"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 09:36:22 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id C1F6A406AB15
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 09:27:23 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 09:36:17 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 09:36:21 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2020 22:06:18 -0800
Message-ID: <1578031578-88217-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C1F6A406AB15.A2E73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glib-2.0: upgrade 2.62.3 -> 2.62.4
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
X-List-Received-Date: Fri, 03 Jan 2020 01:36:23 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../glib-2.0/{glib-2.0_2.62.3.bb => glib-2.0_2.62.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.3.bb => glib-2.0_2.62.4.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 25406ecfc8..7bf8648cad 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -20,5 +20,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "9766a37736974e636227d62f86bae40e"
-SRC_URI[sha256sum] = "4400adc9f0d3ffcfe8e84225210370ce3f9853afb81812ddadb685325aa655c4"
+SRC_URI[md5sum] = "d52234ecba128932bed90bbc3553bfe5"
+SRC_URI[sha256sum] = "4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc"
-- 
2.17.1




