Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA39C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:17 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783391"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786408"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:15 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/37] gstreamer1.0: 1.18.4 -> 1.18.5
Date: Tue, 26 Oct 2021 23:57:45 +0800
Message-Id: 
 <8fc9f5ad560b8d530cbffacbd1191fba4c2b14d4.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157417

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d325f0d31bb1cbe889c7303ac2999c4dae391b34)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0002-Remove-unused-valgrind-detection.patch    | 14 +++++++-------
 ...treamer1.0_1.18.4.bb => gstreamer1.0_1.18.5.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.4.bb => gstreamer1.0_1.18.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
index 96abef17b0..5121044734 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
@@ -1,4 +1,4 @@
-From 598d108e2c438d8f2ecd3bf948fa3ebbd3681490 Mon Sep 17 00:00:00 2001
+From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
 Date: Fri, 14 Aug 2020 16:38:26 +0100
 Subject: [PATCH 2/3] Remove unused valgrind detection
@@ -19,7 +19,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  3 files changed, 42 deletions(-)
 
 diff --git a/gst/gst_private.h b/gst/gst_private.h
-index eefd044d9..8252ede51 100644
+index eefd044..8252ede 100644
 --- a/gst/gst_private.h
 +++ b/gst/gst_private.h
 @@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
@@ -32,12 +32,12 @@ index eefd044d9..8252ede51 100644
  G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
  G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
 diff --git a/gst/gstinfo.c b/gst/gstinfo.c
-index 5d317877b..097f8b20d 100644
+index eea1a21..d3035d6 100644
 --- a/gst/gstinfo.c
 +++ b/gst/gstinfo.c
 @@ -305,36 +305,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
- static volatile gint G_GNUC_MAY_ALIAS __default_level = GST_LEVEL_DEFAULT;
- static volatile gint G_GNUC_MAY_ALIAS __use_color = GST_DEBUG_COLOR_MODE_ON;
+ static gint G_GNUC_MAY_ALIAS __default_level = GST_LEVEL_DEFAULT;
+ static gint G_GNUC_MAY_ALIAS __use_color = GST_DEBUG_COLOR_MODE_ON;
  
 -/* FIXME: export this? */
 -gboolean
@@ -82,7 +82,7 @@ index 5d317877b..097f8b20d 100644
    env = g_getenv ("GST_DEBUG_OPTIONS");
    if (env != NULL) {
      if (strstr (env, "full_tags") || strstr (env, "full-tags"))
-@@ -2503,12 +2470,6 @@ gst_debug_construct_win_color (guint colorinfo)
+@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint colorinfo)
    return 0;
  }
  
@@ -96,7 +96,7 @@ index 5d317877b..097f8b20d 100644
  _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
      const gchar * func, gint line, GObject * obj, const gchar * msg,
 diff --git a/meson.build b/meson.build
-index ce1921aa4..7a84d0981 100644
+index 82a1728..42ae617 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -200,7 +200,6 @@ check_headers = [
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
index ee418322ad..0d82dd338c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0006-tests-use-a-dictionaries-for-environment.patch \
            file://0007-tests-install-the-environment-for-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
+SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.31.1


