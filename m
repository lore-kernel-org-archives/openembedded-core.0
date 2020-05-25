Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.40873.1590446278456934561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QDZV3/3g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id n15so9302104pfd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wt6Ez/pZXQRtlwMjuU60CYZyHYarlPDRluqEiqfruIs=;
        b=QDZV3/3g6GHZZLvz9+uy7NFx7aZE3IbXVxS+irwvC8aSKJarxMi503rjwmqehVkvP5
         3OMcaV34RAVE3PLWnm2kHt5/UzlfPbiA4mul0qqEW0obwKfAJF+8JQAll6KSbbUH8fBr
         kiMAZUzTiCdfgJpJos+jOzkBjUYGRSOVog+PNLZ5NsUQEluxzLytLwse6XwjPidbYM/j
         /x2sq6VKJXIdzddMpDBoShYwgSxxIfiTOT+uRnkz5y8+Sp41QPABdg58yMMqC9j/epWU
         +zA/QOABLL5zMT4QE0nVxIhlkEThSVQAt9RVjtupaUUdMJ4w8NHoO46gn/lF44Z0hxMB
         97qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wt6Ez/pZXQRtlwMjuU60CYZyHYarlPDRluqEiqfruIs=;
        b=RC8fLZYF3ivJASS9CZ7w0cvaiLyBkupaPUV+lBAR41gs3kFIkQ5DsBeJticDG77kvA
         yRKkt9vKI6Qk9OU4uhZHsfhdPNgLA9PaCFQVQoBf3NZTfmebJa2c6R0qM3g6zI2EvO8A
         od5hyk0G/ObJsj5553WOouhED8dUOsJBHU59AtLrL2YavU5+LEl4Su2GmJ0Nj+evX6mI
         ojYtJmbkYNFGm6a+gTTOWht8E9aI27zawPxZZxowdT2lc9QYbYAuuUZah39nclEH60N0
         XKxJTQGu1o6JzZ0Lv1zr9Rp/VSXKblJNh2GaC2gkVss8rAf/COo7lulb7rSGpUNiS5DN
         oz+g==
X-Gm-Message-State: AOAM531AY9YT9y2cj2yiYcthmiA4NmHDfTTPYpvEEL5PlG62TUDafmPw
	GIkA4NiM1sKM/IVknP2fUCR+XUNrAxc=
X-Google-Smtp-Source: ABdhPJzZpyw9Mwjf1UHwvc3dxp0nofXrv1RgyQB+P+SLyt/Skki9jtDLGq7LKjKShw/vrh06w4/yqg==
X-Received: by 2002:a63:1066:: with SMTP id 38mr28830128pgq.207.1590446277560;
        Mon, 25 May 2020 15:37:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] git: Upgrade 2.24.1 -> 2.24.3
Date: Mon, 25 May 2020 12:37:01 -1000
Message-Id: <b88e68c8d849274df7149fee6e794d6b2549f8ca.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This includes the fixes for CVE-2020-5260 and CVE-2020-11008.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.24.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.24.3.bb |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.24.3.bb

diff --git a/meta/recipes-devtools/git/git_2.24.1.bb b/meta/recipes-devtools/git/git_2.24.1.bb
deleted file mode 100644
index daea31eab2..0000000000
--- a/meta/recipes-devtools/git/git_2.24.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
-SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
-SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
diff --git a/meta/recipes-devtools/git/git_2.24.3.bb b/meta/recipes-devtools/git/git_2.24.3.bb
new file mode 100644
index 0000000000..ddd875f07b
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.24.3.bb
@@ -0,0 +1,9 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.sha256sum] = "ef6d1d1de1d7921a54d23d07479bd2766f050d6435cea5d3b5322aa4897cb3d7"
+SRC_URI[manpages.sha256sum] = "325795ba33c0be02370de79636f32ad3b447665c1f2b5b4de65181fa804bed31"
-- 
2.17.1

