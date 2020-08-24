Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.197577.1598282121506211328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A/TShHhG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id s14so4377478plp.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EnKEoFJOiuAPEm8kdmVr/dkw3PdYeb9u5DKTaI08B3E=;
        b=A/TShHhG6wrv12sJnQRT/45NmM7oU6ra6LbIBnF0C/K+vt2cTsqOOyQNNylcMeWkd3
         LzTYPMBf5WX9ZnhlbI28Ly9S7QbrfN1X9WKOlmC3kpnTkDd/2cuY5QtbfpHAWjn7unaZ
         fYoxlvM9kTzdvAGEutLaWxW9GTgZj34pnRpk8r+H/QP6qIvGqqxdm9ZZAfvn/NnOmsOM
         whm5X701uXobpSyduruzTvkQyDDlO1nEjCub3qIiLatWE+pvlQzuVUVFuENTzotY2ju2
         Xcja8OX4J3p3h2uDSI0kHAhyyd01yoqDHRdP84+ALlRW8z1Tk7Zy/b5DSMIR2uh4g8yI
         jdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EnKEoFJOiuAPEm8kdmVr/dkw3PdYeb9u5DKTaI08B3E=;
        b=VJ2qU4iPyk//PTHiiNUhQDG89bZiZnIAWdgX3cMLd+qrB6zGzc7QWKAsfEo3XWQMki
         dyUobHd4q4gR21xrQadFMyt2bS2Z1aYmGv6qu/ivvKHpIhp7Dych2H8UePQ7x33aii9n
         IWL6JqHdnDmNxqhvIU1Ualrg0iuiYzzpn10vj7t1WBMGi0nT6WIFntxuSGpzoTVoFXRh
         yTzzmwLk4hlAZHitlNZyCxqKHPqCEwP7LmoQ/SKXx/OJ9v3S5vAS7Teph4npejW1wZOg
         X2f+c4wV4jeWqgo5OjIkdynWYyH3DXOyVFMPUC52nicCIfGgcj7rr8pYjmTnUvVazEDr
         mp3Q==
X-Gm-Message-State: AOAM532J362OtdriJPkAbQgDasbPfo20CZBTgJGZQp/OAYaBSbUxLORK
	ui3XIDHcD7olYf+GZBCh5iLYnsZPlI8lElDsYHg=
X-Google-Smtp-Source: ABdhPJzPDXWXa+ObTUWBFyNRF0jTx/pnXJYShc3ifyOO9bjvqcku3ny60kcmCNxwY5o73dF5nRkfrA==
X-Received: by 2002:a17:90a:b108:: with SMTP id z8mr4841022pjq.39.1598282120488;
        Mon, 24 Aug 2020 08:15:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] librsvg: Upgrade 2.40.20 -> 2.40.21
Date: Mon, 24 Aug 2020 05:14:50 -1000
Message-Id: <586da5f972a7cc701969fb36f2a15bd36f6dece0.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This fixes CVE-2019-20446.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c117379dec1e33216fcbaf49d2b6130adf54bc1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librsvg/{librsvg_2.40.20.bb => librsvg_2.40.21.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.20.bb => librsvg_2.40.21.bb} (92%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
similarity index 92%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
index 6dd0533a5d..237aec6062 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
@@ -23,8 +23,7 @@ SRC_URI += "file://gtk-option.patch \
             file://0001-Remove-non-reproducible-SRCDIR.patch \
 "
 
-SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
-SRC_URI[archive.sha256sum] = "cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b"
+SRC_URI[archive.sha256sum] = "f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
-- 
2.17.1

