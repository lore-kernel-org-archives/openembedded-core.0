Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CB8BF7D32D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,322,1569254400"; d="scan'208";a="78708068"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Nov 2019 13:15:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F08884CE14FF
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:07:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 19 Nov 2019 13:15:42 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2019 04:33:29 -0800
Message-ID: <1574166809-94711-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: F08884CE14FF.A7E5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dwaita-icon-theme:upgrade 3.34.0 -> 3.34.3
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
X-List-Received-Date: Tue, 19 Nov 2019 05:15:44 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch   | 2 +-
 .../{adwaita-icon-theme_3.34.0.bb => adwaita-icon-theme_3.34.3.bb}    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.34.0.bb => adwaita-icon-theme_3.34.3.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index a062aa6..372f144 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -19,7 +19,7 @@ index 4a84501..52dbb8e 100644
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.34.0],
+ AC_INIT([adwaita-icon-theme], [3.34.3],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
index 3f6b60f..3a2727b 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "41b860c17efe065849b0cbf46e88811a"
-SRC_URI[sha256sum] = "40b7e91f8263552b64d0f9beff33150291b086618ce498c71bf10035e48c7c7f"
+SRC_URI[md5sum] = "9aea4ad9bc002aacad155ee0748b357f"
+SRC_URI[sha256sum] = "e7c2d8c259125d5f35ec09522b88c8fe7ecf625224ab0811213ef0a95d90b908"
 
 DEPENDS += "librsvg-native"
 
-- 
2.7.4




