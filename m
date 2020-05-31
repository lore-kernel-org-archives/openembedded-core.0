Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.17634.1590940432241879764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F6flS/qw;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id h21so6883602ejq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J1Syt2SkSuvXbpvQoe+4cc+iz32OnLayn4QxMP2IGGg=;
        b=F6flS/qwLNn/AZtDDsMJoBeJpda+a/toCm47w4gA1QvE0KWnqLOuhbdWlCmpF5zPft
         iQFUHARxP0mRXJ0dUnUEm9WwSYMiSGAfHK7VuWdvg2kqDx9Sf2vk4MNjNw8FedBoVVBY
         LBGrGRycYB8dvlDHbFN2RwH0q0XDmG199L980VSFVm6uz95p/GJg3NlOqbyjCjNeFuPh
         Aorcw0Bz3Kfhbjqybr3BZpziM7NrurzycKtmPOAgyn4NCoOm6qYiCXOaaIscZX7v+oLe
         LZMh76MpzHyxTTD0p5Q1/mdz5MBYqZW6xOJrUVMxMG2B7d+WfdrkdyDBYH6Qe3VmHRDL
         Vk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J1Syt2SkSuvXbpvQoe+4cc+iz32OnLayn4QxMP2IGGg=;
        b=Z4aaMvvzGIQK8EwMsyGps6+BM6oEftRsEahbOb3H9aT7BFxfwpUtng6yD9nm1FfKYo
         FdXZT8L7EBWNvI/oIPhKowzfw9WHXzxse72OafFq7T+QBdi1dCUjk8/gPUlsRSxC9kWr
         w26dWzQfZZnLPj9IbSY7cst/cmKVwImfw4ZDOgwQFurbJxc8kNYR1x7U0wwH+lIfbeL0
         Y/n34Ze7huaErYKGF5n5Pwg5YBbMv04JHZIkSvj4Z7yY39IXS9lLHmEJuM2ysQZj9Omy
         euA8owhco3m9VdDUe3Yq0U02Tn4LqRCs8xiyGDKh1VZgSS7L/GO4vwi74NGhKVP6OIb/
         agiQ==
X-Gm-Message-State: AOAM530YUSb9XLCyY0JyzJCVQTIUKMjcOAAkalFTwdkkoTBD7niN7p07
	KX84VqHji6hib5STOf+vFcT1SYP5
X-Google-Smtp-Source: ABdhPJzFeRIzTQhnLI0geWojHIj2STEoNALMHYTte27FvvmlWvhfCm0Esjf7NWzssczN6r0G/uoYlA==
X-Received: by 2002:a17:906:1cc6:: with SMTP id i6mr15374440ejh.552.1590940430550;
        Sun, 31 May 2020 08:53:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/70] adwaita-icon-theme: upgrade 3.34.3 -> 3.36.1
Date: Sun, 31 May 2020 17:52:11 +0200
Message-Id: <20200531155254.10283-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...ta-icon-theme_3.34.3.bb => adwaita-icon-theme_3.36.1.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.34.3.bb => adwaita-icon-theme_3.36.1.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 372f144be0..5da3fbf6d8 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 4409423752885f76326d05c1266698155f47c5f9 Mon Sep 17 00:00:00 2001
+From 0a867caa8803a78f7cf3a204c4c358bc63daaf28 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4a84501..52dbb8e 100644
+index e749112..58790e8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.34.3],
+ AC_INIT([adwaita-icon-theme], [3.36.1],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
index 3a2727b701..473e1fc0be 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "9aea4ad9bc002aacad155ee0748b357f"
-SRC_URI[sha256sum] = "e7c2d8c259125d5f35ec09522b88c8fe7ecf625224ab0811213ef0a95d90b908"
+SRC_URI[md5sum] = "c61ca9d6b3ce70a9ab66dcff945923ff"
+SRC_URI[sha256sum] = "e498518627044dfd7db7d79a5b3d437848caf1991ef4ef036a2d3a2ac2c1f14d"
 
 DEPENDS += "librsvg-native"
 
-- 
2.26.2

