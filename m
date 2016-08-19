Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CC5816FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 07:47:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10076007"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2016 15:47:39 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E53A142CD111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:47:36 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 19 Aug 2016 15:47:36 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 03:47:33 -0400
Message-ID: <1471592853-1509-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJTo0LYu=Cnm0s-k3GMxnSZ3WziEUNvLjGRCgGW9CBHMo1EHdQ@mail.gmail.com>
References: <CAJTo0LYu=Cnm0s-k3GMxnSZ3WziEUNvLjGRCgGW9CBHMo1EHdQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: E53A142CD111.A66A4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] adwaita-icon-theme: 3.18.0 -> 3.20
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
X-List-Received-Date: Fri, 19 Aug 2016 07:47:39 -0000
Content-Type: text/plain

1) Upgrade adwaita-icon-theme from 3.18.0 to 3.20.
2) Delete DEPENDS, since intltool is not needed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.20.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.20.bb} (90%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
similarity index 90%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
index 34b82b7..bb0eaeb 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
@@ -8,14 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c"
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
 
-DEPENDS += "intltool-native"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
           "
 
-SRC_URI[md5sum] = "ec1fa3fde83ad166ae7075a97dc1ec4b"
-SRC_URI[sha256sum] = "5e9ce726001fdd8ee93c394fdc3cdb9e1603bbed5b7c62df453ccf521ec50e58"
+SRC_URI[md5sum] = "411be2bd68dd8b0a3c86aca2eb351ce4"
+SRC_URI[sha256sum] = "7a0a887349f340dd644032f89d81264b694c4b006bd51af1c2c368d431e7ae35"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.7.4




