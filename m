Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.3254.1594933696578548498
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HhR93P1R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l2so13096529wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E5wy5vUcFY/YyqiHUUAFM7teKE0Mrs2FBH4tZ6xOjfg=;
        b=HhR93P1Rwl8aK13kGmb69UvPsMhopxslLT3nvrUTIAAVxdNRBaHrUoj0mVlfqEMVX6
         PEDZFN5IHvtFuYZKoHXopYUQg1x4Iazq98E2ybwXsr31qwtMJkGUTQdhU9xQfWz++g9p
         VWch3iJUzx25hth/EjCt+apmsT5j9uVeqiJtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5wy5vUcFY/YyqiHUUAFM7teKE0Mrs2FBH4tZ6xOjfg=;
        b=WzPSR7eEhSLaWYwD3zdWzxS21sjlGh9x93sI4w5cZz6piLUCKsnn0uNBDCs96eIBil
         VK80jfxqs1vi6PIhErQ6sDlLHeCeuC5/DZjk13D/sjXwA0h09f/P/f8iPC5Y9YljLgGy
         /myaW0OAdp8/qnFlyLQW3NbCR9hbk/U9feh3SKpoQIQhKl8Qmm5NhiQqjvHbQ8/4atP1
         p35L0kEEYj5LNq5jsPsQleBJVuF4/Bm90ashI5VrP7JD6+B+P+TmjVS2prQ/IllRONDE
         YnB1S491YYzbIAsIVRh6v2+C0oWEGEehkInL46bmMbX81zKNa75d1c/tkFVfbm2IFQzH
         P0rQ==
X-Gm-Message-State: AOAM531rtv8fDISppAYgF3hKpaGZHTf4ZA5N36MzTd8zUcLMmb1gZRYC
	OqHmC+MeDgJBJe7UQNaPpVsnO60X/VSARw==
X-Google-Smtp-Source: ABdhPJy3Zeabsa6moRMWnKi7pYUP0T9RLWKoUkH4a3CaLertMTgWk7r1EVwoL4bSVamNRogZ9LB1kA==
X-Received: by 2002:a1c:e088:: with SMTP id x130mr5812530wmg.14.1594933694605;
        Thu, 16 Jul 2020 14:08:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/20] dpkg: upgrade 1.20.0 -> 1.20.5
Date: Thu, 16 Jul 2020 22:07:54 +0100
Message-Id: <20200716210808.7438-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-build.c-ignore-return-of-1-from-tar-cf.patch    | 9 +++++----
 .../dpkg/{dpkg_1.20.0.bb => dpkg_1.20.5.bb}              | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.20.0.bb => dpkg_1.20.5.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 7c354073648..ffe520c5130 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 450fece894fce750502be8accabfd88c585bda4c Mon Sep 17 00:00:00 2001
+From 15b081cc8bead80c493ab83369ecb3345a24a3dc Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -23,15 +23,16 @@ Upstream-Status: Inappropriate [OE specific]
 Original patch by RP 2015/3/27, rebased by Paul Eggleton
 
 Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
+
 ---
  dpkg-deb/build.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index a3d1912..1de7f9c 100644
+index 8436839cd..6b44a36f7 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -427,6 +427,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -434,6 +434,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -39,7 +40,7 @@ index a3d1912..1de7f9c 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -477,7 +478,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -486,7 +487,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
index 334294e6f88..d97b69c0b97 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "314ac02663c5bd1a82b34745150bf13a39a549a3"
+SRCREV = "823a67d67538b1b403a32d1fef40e6e228265566"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

