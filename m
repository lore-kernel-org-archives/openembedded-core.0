Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.13124.1589899881768908193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F8h7qpej;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id x10so5726303plr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=04Iz1+Q3OfmeI+bjvWJqsf3Y1hZM+xwauTiOjYesWKQ=;
        b=F8h7qpejv6kSU5Fraq8AS3C98krs7/rzirgGZf8yFg5ek/ZkEZ3p86Xajx2m6Ja0aT
         xN1wO5jERXjxkgfFC/95FXG9wO3pwODw6nLCwQJ/9Ci9HKAR4hids3fe34tvqYWGNZKQ
         xNkOm4YM0+fhR4zJhFKG4jph26PF/TXhCc7U2e0p6uOuuTC3+Mad1Ars0qNlu0VjevpO
         eATlAqb4RqKg2jP5yJi2Nt02VNuNK7B7ChEH31XdtPnN3GST5JlgwE5VePiKmZAgZMUE
         v4EDPorJlYd95OPl++DY71U+Y2FUIydszj4oE7ZJRCMYKQA5Z89+uoc72R3iiE+p6pkd
         4X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=04Iz1+Q3OfmeI+bjvWJqsf3Y1hZM+xwauTiOjYesWKQ=;
        b=TGy+lgov1igcSXsWEEasPG0hsTNJWAVuHIKAM9IwyeYiMpvvi6dw3UJEcWiCjz97Ks
         gMPuypp6HnxIt/XvDSBQcPlyV4Mvktiqh7w2lg2M3gnMFNMQGvXLoRvMUhhRLv5f3WAS
         zWo92JcZatdqvhWlU9/Mf/MIk41VAb2MsXrlvydsUUPZrJyp/HMYyPbb6jejdqV0/lK6
         IGjQqCa2jJNiZdIcybDWBOjq5Mke367lai2pMXZPRO3byMnlWswtt5vRTvrPAobmSGkA
         QGT/TIjWSqDtjpEoaLGVpI8piVAgaEi4pJmHEaos3Hvza+vK+7/zZYFcjPX/NVbmQHjK
         tFxQ==
X-Gm-Message-State: AOAM531x6SIZIjr76PE9jlk7DXEvaq6dbI1gFR1OR9EsI8vaMTJKJ8pT
	VZk5aUB2bO4JTZNl3gdpVcXUsmAJ
X-Google-Smtp-Source: ABdhPJyH/L7MkdmouPxmX5A9hLPKaQ1LJ3o5BvXwMqqGSPuors21JtdiHlxCgby8a/lAYPc/dvmLxw==
X-Received: by 2002:a17:902:848a:: with SMTP id c10mr21369573plo.124.1589899880939;
        Tue, 19 May 2020 07:51:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 1/8] git: Upgrade 2.20.1 -> 2.20.4
Date: Tue, 19 May 2020 07:51:08 -0700
Message-Id: <fe5aee43db25f622f4cbacc69765f94eca51395c.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

From: Adrian Bunk <bunk@stusta.de>

This includes the fixes for CVE-2020-5260 and CVE-2020-11008.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/git/git_2.20.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.20.4.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.4.bb

diff --git a/meta/recipes-devtools/git/git_2.20.1.bb b/meta/recipes-devtools/git/git_2.20.1.bb
deleted file mode 100644
index 877fb05e58..0000000000
--- a/meta/recipes-devtools/git/git_2.20.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "7a7769e5c957364ed0aed89e6e67c254"
-SRC_URI[tarball.sha256sum] = "edc3bc1495b69179ba4e272e97eff93334a20decb1d8db6ec3c19c16417738fd"
-SRC_URI[manpages.md5sum] = "78c6e54a61a167dab5e8ae07036293ab"
-SRC_URI[manpages.sha256sum] = "e9c123463abd05e142defe44a8060ce6e9853dfd8c83b2542e38b7deac4e6d4c"
diff --git a/meta/recipes-devtools/git/git_2.20.4.bb b/meta/recipes-devtools/git/git_2.20.4.bb
new file mode 100644
index 0000000000..e44da452ad
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.20.4.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "6f524e37186a79848a716e2a91330868"
+SRC_URI[tarball.sha256sum] = "92719084d7648b69038ea617a3bc45ec74f60ed7eef753ae2ad84b6f0b268e9a"
+SRC_URI[manpages.md5sum] = "dceabcda244042a06ed4cabd754627a5"
+SRC_URI[manpages.sha256sum] = "72fdd1799756b1240921d10eb5c67de9a651b44d429ba7293929c9d5344ad3e0"
-- 
2.17.1

