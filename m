Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.13951.1590157584206351148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SN6vMeqx;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id b12so4442394plz.13
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=04Iz1+Q3OfmeI+bjvWJqsf3Y1hZM+xwauTiOjYesWKQ=;
        b=SN6vMeqxsqx/ri9/8IO17HaUgymKaLVo01toGWpUDUe/congwxLEz/yA8s41sKpFDn
         BcpCrVZhehDt3Sl9k6xVHMN3O8DQaLFQaL//blof1oHLe4kUDeeZQWVb1Jh5s6E+R8Z6
         /WnHZYStVwjYQu4bS1X89uf863ztWxJbyOTCWzZdylRcQcUZuqEhp0i9hJ6a52CpCk7i
         +SS0XpaDGQoOKWmDNGCJcx/yoKHOzJMrU3Xa5ymJu/t+pDrcaHpqHXU13aPMr8pIaAAW
         QIGK5baQxL9F817dE9tzcOHvhyp3Jl0zUTzlpEaxukb6L9qfdWe1NMCCFTcfReC/XEnG
         c85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=04Iz1+Q3OfmeI+bjvWJqsf3Y1hZM+xwauTiOjYesWKQ=;
        b=HcW+24u3o3SRH9C+C+n0AbaiTz0ewnYa2qzzCsO+Eq/Wyk5bOPEeg1SNJLvOSEQdpd
         W7kU/wdTUragaMF579r4ZBcQrm+uky/KHCDe56+sY71vKVVrlb0sMeIvA2XljO/6+MFb
         gZVFhUCxg5cumgyDAXziLlOqyHyU+YbOLo+drNxuLQvZdVhbJscvAaGuEh798f82bQLg
         dmZ1Mbevf7vT+Dun4Y8/GI66PRjuG4bntg1zqT1yzMnJsXy6xPR3KbD0D28HEC7ZXXcF
         Kff1kDaIxKMMmk/vdkSTZq/q3rfcD4tNvgx9PIKiSoCTOAxIDrUcJ5koj4tQtKTSmGIg
         XrJA==
X-Gm-Message-State: AOAM532Kq/mUeQX8ynuWLsrAz77vaHh3dpVexLJvwKERTdetIYO+hAXH
	zVQafFErXzl2kMAmWw1ISbGxwNFB
X-Google-Smtp-Source: ABdhPJykcMVQvQeHozNqtyNEQ8vRT+XZkSlSzCNrKUjHfCdGHKIyaqTlapMr9y0llea4ihpp1WL6+Q==
X-Received: by 2002:a17:902:8546:: with SMTP id d6mr14011488plo.164.1590157583525;
        Fri, 22 May 2020 07:26:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 1/8] git: Upgrade 2.20.1 -> 2.20.4
Date: Fri, 22 May 2020 07:26:10 -0700
Message-Id: <fe5aee43db25f622f4cbacc69765f94eca51395c.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

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

