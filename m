Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AA98A77109
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 07:48:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9924575"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Aug 2016 15:48:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7174E429594D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 15:48:51 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 15 Aug 2016 15:48:54 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2016 03:04:20 -0400
Message-ID: <1471244660-1854-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 7174E429594D.A4BFA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] adwaita-icon-theme: 3.18.0 -> 3.21.2
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
X-List-Received-Date: Mon, 15 Aug 2016 07:48:57 -0000
Content-Type: text/plain

Upgrade adwaita-icon-theme from 3.18.0 to 3.21.2.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.21.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.21.2.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
index 34b82b7..7e0a06e 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
@@ -14,8 +14,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "ec1fa3fde83ad166ae7075a97dc1ec4b"
-SRC_URI[sha256sum] = "5e9ce726001fdd8ee93c394fdc3cdb9e1603bbed5b7c62df453ccf521ec50e58"
+SRC_URI[md5sum] = "cdd4e593ba8bd886c8f26bbaa9219fb1"
+SRC_URI[sha256sum] = "c083bc8188e5d84379fcd93d2ac833ab1b6138f35a330e2a63048a4f63afd165"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.7.4




