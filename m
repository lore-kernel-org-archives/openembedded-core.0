Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8D7C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.2563.1633304536588002991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BEpIbiXe;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t2so3699796wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1BLRXuL8aP0huQvtrtyK0aFrErZ/jCMlLQQNFWBtok=;
        b=BEpIbiXe0BYsBWIbVj/LlBZxcgnVl8W2rsV7krI5Ba+XMyAO6noSvoPGZhINdKItzA
         B7TYIBjaeBdPDB+MoaGcbbgDl92OIRoEHUm2zIwsE5A1N71/7LJnm/8UsLCO+w2qHvFC
         QaEm9kCxJdgxR+YssnW1YKnRHXZ1zqOiYirxCpAvxlDC5gLE7f3DmH16/uzniIsVJfsd
         rSOJVAq67+X2Ln+RYFhaiOntBB02MqwgkDJ68f9EuxbZuxql3f2kEphqjB7dBD+25YmR
         jI5qjktD0GnYeQyEPqPjcYXIv7X0MRdxkh4SmZ91sJpU/1jX8n3URYJ1MaggEddXAToH
         ChHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h1BLRXuL8aP0huQvtrtyK0aFrErZ/jCMlLQQNFWBtok=;
        b=J6CW/ibLDbZ6sJpl3rDiy6AYZTzwqN1uepf3JHlW6bFcG0lcSTYCj8+l+FSExC+lkp
         wYokRxcSLEZo7RzjVLzv6MOKbJlknpKLVIeJF9YDO/UKOESRac8qC7PMgOXVi6qV5krf
         Kzf5yvLGnyo2ZxUSmFbgBHdqrv7w64UQFPh3TOTPYBZCzxaEfLkjy3vVN4cqebl1NrAV
         hBLH2aJACYEYBqymlK6v6xIkcARvBmKfsN3PfuwPlhmwhCRbrb3BVXiF1nDyeS/JYjde
         q4ZRWn161ttLkBsiowe7Bz5fsgNTcDk5fjEZN/esBsqbiDY1uKGXnE9VIaqwT1L+L2Ge
         UyqQ==
X-Gm-Message-State: AOAM533JnB/CdaaE7K8rM4LtRa/l7aREiFS11YbGBJ7dY9gjzXUoG2Bk
	SIIFOo57xbuRsF04SEsUDra/PBCTsTcyig==
X-Google-Smtp-Source: 
 ABdhPJwd6PK6uBtir/RS/6KQoGZmu6QlgNIJtxNj3V7leFYDn26+dmWYofgtRhKuL6h02JV1YveeqQ==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr10471974wrx.372.1633304534569;
        Sun, 03 Oct 2021 16:42:14 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:14 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 01/12] gstreamer1.0: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:41:55 +0100
Message-Id: <20211003234206.949967-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156565

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
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
2.33.0


