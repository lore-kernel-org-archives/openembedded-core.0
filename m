Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 411106FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 03:11:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35461434"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2018 11:11:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B85848AEA18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 11:10:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 19 Jan 2018 11:10:58 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jan 2018 11:10:58 +0800
Message-ID: <1516331459-4093-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 8B85848AEA18.A54E0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] adwaita-icon-theme: 3.26.0 -> 3.26.1
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
X-List-Received-Date: Fri, 19 Jan 2018 03:11:05 -0000
Content-Type: text/plain

Upgrade adwaita-icon-theme from 3.26.0 to 3.26.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../{adwaita-icon-theme_3.26.0.bb => adwaita-icon-theme_3.26.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.26.0.bb => adwaita-icon-theme_3.26.1.bb} (93%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb
similarity index 93%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb
index bfb56d5..6437d5e 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.26.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "3218540331a26c3d7a904ffe3d00bed8"
-SRC_URI[sha256sum] = "9cad85de19313f5885497aceab0acbb3f08c60fcd5fa5610aeafff37a1d12212"
+SRC_URI[md5sum] = "3ef87e789711e5130792d4b5366c005d"
+SRC_URI[sha256sum] = "28ba7392c7761996efd780779167ea6c940eedfb1bf37cfe9bccb7021f54d79d"
 
 do_install_append() {
 	# Build uses gtk-encode-symbolic-svg to create png versions:
-- 
2.7.4




