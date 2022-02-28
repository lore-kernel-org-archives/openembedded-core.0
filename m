Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F75C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19882.1646056851264633887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Re0oiTt9;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056851; x=1677592851;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D18Y4KjPhFweP0WCrQo+yKB38wNy2AQ1iaPaU5Q+r2I=;
  b=Re0oiTt9mLtQfyjYCjLRFb3+QPDT1xE7SCdKWHMJwwahPXjnWNeFii8Y
   j3ZEdeGIwtE18UGtb7JHLvkYAo+u+F/t+eWqihc5QUsnS8BwZfNcnc/wB
   yY8nnCmqr7AcnWrfdjhWe49VNBmifEFj/IQXY7KuwcTtiiom8+tmSGQdz
   /q7hK1B9yMCd6NAzQUgEuT9WzmCh8nLIQ35EEGdsci36EnKgQfOlSG1eY
   rrBiJi/LFzdp7NMhrd0wTkhTQMQexeV0ECYKK1ND6EvGheLV2sufGmDTs
   cVfUJf3mgmxyUYed4iRwiZy8N8VxxK/B9BVIRtYKka0+GskcfUArYbdkN
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232856979"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232856979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092183"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/39] gstreamer1.0: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 21:59:54 +0800
Message-Id: 
 <78c540178a9dfef163d3956309562ab5f0709b8e.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162460

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
index 8562070968..abf68be785 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-meson-Add-option-for-installed-tests.patch \
            file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
            "
-SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
+SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


