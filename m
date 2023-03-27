Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958AEC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 04:55:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.27916.1679892913968588391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 21:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQUevmMi;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id le6so7220938plb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679892913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxb4kQWJ39f/m0wn5ROUviDKHBw/zsRSqyZ0oXwfsX8=;
        b=JQUevmMi5+4Ombaa9GnhPli6WX5hzh8XuceB/mv3dB98d2gW0y44/Uhiu19q3zmZsq
         uopYLcwxojcbLyTrxRMX52TWCHNvBPOF/s+vTxNsPnhjycD0Y4Ynv4csDI1YR9lT7ucK
         QtJIBtGdoY1YvRSjeXAT8xBz3KJ/mJWShq3pxNT6l3l5PV+lscpMn1gtdB6T2/c8z4aU
         VpHTc5Q0mWZKfvL2dgP4TM5eG6cNH0alnOUQ5SQP9tENeZ04Bb4MhpCNf9oLdbFGGrXK
         GoLlyJI8SNAhlgOeAnsvnB9OHZI+khtQ00ij/6abSGQoXlC0ZQaKyzbBN1Kz6+FG4EEs
         91LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679892913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxb4kQWJ39f/m0wn5ROUviDKHBw/zsRSqyZ0oXwfsX8=;
        b=fMYd+hb+RdR4hGl/tqw3+A3eg7d26fJMIJBODrjSia9bob9ncRuiPetvP52M5Ym8fA
         ggXRn9K/NHrMR1UXjW8Sd5tB6Wrjn7GVfOH/Lwf6wHitL5fTSbmF/o/iQvNpz/GKe2fS
         O+ZxjNd87hKJe+ofzHxqE/UEDJ2efpPAbBRqf/TYVNMPEE65qswLPDKeLw94lxSKQL/j
         KRb4ONbLUANC/2/eo+NYBhIKx77eCsYOzz5cw1KQF4EnIz6uY78mTK67sanQmfbXMZp6
         irzpyEX1TdloaSS8JNgNYg+OJa3iJ+oAxApKs6yaSWI2gP9503LG+0Xk5OwPxcF5VDyo
         6Ksg==
X-Gm-Message-State: AAQBX9c6q8CHwfIRLLBGiYc6HReSTurxVRKR2s5f5hFWeHe1P7nU4CJI
	BwDxkapOFYAUOn8b7EDTGeH5q4PvuTowzQ==
X-Google-Smtp-Source: AKy350aWoZ8/9EfbHJ7P1jfjx4MfitW1zlx5NKduQ1rDhnJQQD59o1/2fJVI93jC7TxvtLIfzeFHsA==
X-Received: by 2002:a17:903:2804:b0:1a1:d5fd:1e71 with SMTP id kp4-20020a170903280400b001a1d5fd1e71mr10068619plb.20.1679892912859;
        Sun, 26 Mar 2023 21:55:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id t76-20020a635f4f000000b005133a5f3e85sm3326793pgb.43.2023.03.26.21.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 21:55:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vte: Upgrade to 0.72.0
Date: Sun, 26 Mar 2023 21:55:10 -0700
Message-Id: <20230327045510.1712084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 04:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179138

This is needed for many gnome 44 apps.
Drop upstreamed patch in this release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ty.cc-Do-not-typecast-to-GSpawnFlags.patch | 58 -------------------
 .../vte/{vte_0.70.3.bb => vte_0.72.0.bb}      |  5 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch
 rename meta/recipes-support/vte/{vte_0.70.3.bb => vte_0.72.0.bb} (90%)

diff --git a/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch b/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch
deleted file mode 100644
index 16553b506f..0000000000
--- a/meta/recipes-support/vte/vte/0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 9c7654e063d65fb2645459a32fd14eebab484857 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 1 Mar 2023 15:50:26 -0800
-Subject: [PATCH] vtepty.cc: Do not typecast to GSpawnFlags
-
-GSpawnFlags is enum with max value 1 << 15 which means it fits into a
-short int, however here we are OR'ing VTE_SPAWN_* as well which have
-higher values
-
-Fixes error like
-src/vtepty.cc:577:16: error: integer value 234881535 is outside the valid range of values [0, 4095] for this enumeration type [-Wenum-constexpr-conversion]
-
-Fixes issue https://gitlab.gnome.org/GNOME/vte/-/issues/2618
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2618]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/vtepty.cc | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/src/vtepty.cc b/src/vtepty.cc
-index 3aaa0d6b..2da2675f 100644
---- a/src/vtepty.cc
-+++ b/src/vtepty.cc
-@@ -574,18 +574,18 @@ catch (...)
- static constexpr inline auto
- all_spawn_flags() noexcept
- {
--        return GSpawnFlags(G_SPAWN_LEAVE_DESCRIPTORS_OPEN |
--                           G_SPAWN_DO_NOT_REAP_CHILD |
--                           G_SPAWN_SEARCH_PATH |
--                           G_SPAWN_STDOUT_TO_DEV_NULL |
--                           G_SPAWN_STDERR_TO_DEV_NULL |
--                           G_SPAWN_CHILD_INHERITS_STDIN |
--                           G_SPAWN_FILE_AND_ARGV_ZERO |
--                           G_SPAWN_SEARCH_PATH_FROM_ENVP |
--                           G_SPAWN_CLOEXEC_PIPES |
--                           VTE_SPAWN_NO_PARENT_ENVV |
--                           VTE_SPAWN_NO_SYSTEMD_SCOPE |
--                           VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE);
-+        return (G_SPAWN_LEAVE_DESCRIPTORS_OPEN |
-+                G_SPAWN_DO_NOT_REAP_CHILD |
-+                G_SPAWN_SEARCH_PATH |
-+                G_SPAWN_STDOUT_TO_DEV_NULL |
-+                G_SPAWN_STDERR_TO_DEV_NULL |
-+                G_SPAWN_CHILD_INHERITS_STDIN |
-+                G_SPAWN_FILE_AND_ARGV_ZERO |
-+                G_SPAWN_SEARCH_PATH_FROM_ENVP |
-+                G_SPAWN_CLOEXEC_PIPES |
-+                VTE_SPAWN_NO_PARENT_ENVV |
-+                VTE_SPAWN_NO_SYSTEMD_SCOPE |
-+                VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE);
- }
- 
- static constexpr inline auto
--- 
-2.39.2
-
diff --git a/meta/recipes-support/vte/vte_0.70.3.bb b/meta/recipes-support/vte/vte_0.72.0.bb
similarity index 90%
rename from meta/recipes-support/vte/vte_0.70.3.bb
rename to meta/recipes-support/vte/vte_0.72.0.bb
index 6da76a3053..c08ac879e1 100644
--- a/meta/recipes-support/vte/vte_0.70.3.bb
+++ b/meta/recipes-support/vte/vte_0.72.0.bb
@@ -20,9 +20,8 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-vtepty.cc-Do-not-typecast-to-GSpawnFlags.patch"
-SRC_URI[archive.sha256sum] = "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI[archive.sha256sum] = "40fe914d6c70db34176c922725b6c6ea15d5f3cb2a9b44c57e200a5f950a6736"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.40.0


