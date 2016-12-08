Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1846B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 01:22:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13708087"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 09:22:37 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 517614670074
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 09:22:33 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 09:22:33 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2016 01:22:18 -0800
Message-ID: <1481188938-53432-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 517614670074.AFD7F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libnotify : 0.7.6 -> 0.7.7
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
X-List-Received-Date: Thu, 08 Dec 2016 01:22:43 -0000
Content-Type: text/plain

Upgrade libnotify from 0.7.6 to 0.7.7.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libnotify/{libnotify_0.7.6.bb => libnotify_0.7.7.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.6.bb => libnotify_0.7.7.bb} (79%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
similarity index 79%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
index ce8e5ae..2ab2f1f 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
@@ -9,8 +9,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
-SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
+SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
+SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
 
 # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
 # meta-gnome libnotify3: 0.7.x)
-- 
2.7.4




