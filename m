Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FD2C54755
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.45974.1747040641752055042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AW1cptN1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040642; x=1778576642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=y8Fl4u1kYQV5XegsX70/X8xEr4VFfgzBe6Dad6KQ6rM=;
  b=AW1cptN1FmRvNMqvsSNVvradqrbPCqnxZDae32Q4rBTMXro9WIXgHx3z
   F+3brKc6Ou84eEBONG3NhoOGZgNnImAGgqrgewia1950bpBoxWhx/c/4t
   CHJhF8S2u7bdhYRJqn6kL+bjkSr9CQ3KQC/kPbSGTcTmdISlmZ8WAFQUX
   zsYjMnk71VdnD8DplA0zmOL5TbMplJwx54nGpdjtuHdpiEYIBNroZBSrL
   wxKWaJYl4EPto8suPvOnmSjTBoaqzCD5mxXbSEOnqT9MHG6XuvztB+RCp
   VtLejPuGpCRjicuLEnXDY8KNx5GG664Uc9S+mm3HskfXa2JvKsVLg9lxg
   g==;
X-CSE-ConnectionGUID: AIJxHLY6TJezco/YcNR6yA==
X-CSE-MsgGUID: 42W0gfNTRb+Yapj3QSVbzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199133687"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199133687"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BDA1D6EFC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E073FD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9E76C1A009A;
	Mon, 12 May 2025 17:03:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/56] libadwaita: upgrade 1.7.0 -> 1.7.2
Date: Mon, 12 May 2025 17:03:03 +0800
Message-Id: <1747040619-7566-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216319

From: Wang Mingyu <wangmy@fujitsu.com>

90d68222c184f681472d9d9ce2ae443ebd76386e.patch
removed since it's included in 1.7.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...8222c184f681472d9d9ce2ae443ebd76386e.patch | 38 -------------------
 ...ibadwaita_1.7.0.bb => libadwaita_1.7.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.0.bb => libadwaita_1.7.2.bb} (82%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch b/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
deleted file mode 100644
index d3a3535013..0000000000
--- a/meta/recipes-gnome/libadwaita/libadwaita/90d68222c184f681472d9d9ce2ae443ebd76386e.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 90d68222c184f681472d9d9ce2ae443ebd76386e Mon Sep 17 00:00:00 2001
-From: Maximiliano Sandoval <msandova@gnome.org>
-Date: Sat, 15 Mar 2025 10:47:31 +0100
-Subject: [PATCH] meson: Check g-i before using --doc-format arg
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libadwaita/-/commit/90d68222c184f681472d9d9ce2ae443ebd76386e.patch]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- src/meson.build | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 90cecc6a1..585fe3aad 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -450,11 +450,17 @@ meson.override_dependency(package_api_name, libadwaita_dep)
- 
- if introspection
- 
-+   gir_dep = dependency('gobject-introspection-1.0')
-    libadwaita_gir_extra_args = [
-      '--quiet',
--     '--doc-format=gi-docgen',
-      '-DADWAITA_COMPILATION',
-    ]
-+   if gir_dep.version().version_compare('>=1.83.2')
-+     libadwaita_gir_extra_args += [
-+       '--doc-format=gi-docgen',
-+     ]
-+   endif
-+
- 
-    libadwaita_gir = gnome.generate_gir(libadwaita,
-                  sources: libadwaita_generated_headers + libadwaita_public_headers + libadwaita_public_sources,
--- 
-GitLab
-
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
similarity index 82%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
index 55985bf7cc..4dc583ab39 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.0.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.7.2.bb
@@ -11,8 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gi-docgen vala features_check
 
-SRC_URI[archive.sha256sum] = "58bf99b8a9f8b0171964de0ae741d01d5a09db3662134fa67541c99a8ed7dec0"
-SRC_URI += "file://90d68222c184f681472d9d9ce2ae443ebd76386e.patch"
+SRC_URI[archive.sha256sum] = "28ee2ff589c6debe47af9da7a56e37c97d6849e003918a4b223f690d25f960be"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.43.0


