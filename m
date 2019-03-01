Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDC2A7CD17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 09:54:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,427,1544457600"; d="scan'208";a="55608673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Mar 2019 17:53:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 28D984C53466
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:53:49 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 1 Mar 2019 17:54:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 17:54:10 +0800
Message-ID: <20190301095410.2056-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 28D984C53466.A6657
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] adwaita-icon-theme: upgrade 3.30.1 -> 3.31.91
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
X-List-Received-Date: Fri, 01 Mar 2019 09:54:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

upgrade from adwaita-icon-theme_3.30.1.bb to adwaita-icon-theme_3.31.91.bb

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.31.91.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
index 3e9420ed9a..6c78cea4a5 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.31.91.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
-SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
+SRC_URI[md5sum] = "e5bc34fabe11fe6680afc0c4676d3bf9"
+SRC_URI[sha256sum] = "9541d2505e19f99e86e98f25ffd6786089f4505f7811b7c6c314b05dc26b7d6b"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.20.1




