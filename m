Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.40970.1590446241164791394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=laLtyTeh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id v2so4197705pfv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4KLojuukUyr36H0pBxtKJhFnqe66P54AwbvC3k2oqQ4=;
        b=laLtyTehOO0ug+ZhQIyTC9zPDKGfS54Rd6tfGZDfh0Xs58CCKKlhhj7No6FdRvCALu
         67sRJxzKMTXb+t48S8m7tCBWfCPCUY3tjg2OKDZtXBoKB0Gd0UgDd0YeNXTPydYobWKE
         JTzWSACsJeTSdtKi5l9IVM81PZFR+BEKftEkk8XiWVh+QHVTeL5MBdYp9+zF9r4aPq2Y
         NVEdyp5s/kU9D800NzYMhLQ/JBA7wSTUgjw8qPWnnsTHDBoa55zOX0VjPRPyifhfvAki
         W1HcQ43GJY+gLhvSkA6UaO4++C/WPoAXRGoLe0fy4xNhGBzy+bdjauzNJcb1EajIzczY
         4Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4KLojuukUyr36H0pBxtKJhFnqe66P54AwbvC3k2oqQ4=;
        b=dqqHyTRxUqLo0A8R2bgTFKItDvZmTw3dQ3XqE+37zx2Zt+r/bJxZbxPHuzuT9NsPSZ
         GlAsKLwk5iRYCx+uSRirka+uL42uE52qjzHu2YGheIbeFX+Xum4K1fy0wVR8+cty51hd
         zxmZhCUnJhPfoDlAhwOTJxUvG7zFJc9cbWVk1YyDWENAFkfIlGF8HXYwx59av4DBf2LA
         XrnvRKBEEon7KFJV6w1ddYK8M9ysccikb76kYh0771Vmf3wm14n5DVrt+puSkbejrBsg
         vvR78KQ20zYa/z9wEQYyS43W2yrU8G3P4ASyR+jSEIHbzg/DAohnt3J7bOFRWzM0Lczw
         h4ZQ==
X-Gm-Message-State: AOAM531S4cfwet15AqejFBXUUj+efksQazp/9nhCIw8LiFJ+7k6qZJ7H
	GmrccKzITph7HNNJdnayf6K/RoZrP/w=
X-Google-Smtp-Source: ABdhPJwBP2EPm8OY1cpcjcPV2AtQQv+MrebkuOIt3Ss9mDBseTMqGvva0mKRj4UjB6bVCsUysEI1xQ==
X-Received: by 2002:aa7:8084:: with SMTP id v4mr6382607pff.211.1590446240151;
        Mon, 25 May 2020 15:37:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] gcr: depends on gnupg-native
Date: Mon, 25 May 2020 12:36:47 -1000
Message-Id: <da7360247995d7c8e79dfcaa0c0761952a9013f1.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Kai Kang <kai.kang@windriver.com>

It fails to build gcr if no commmand gpg on build host:

| meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or not executable

Add dependency gnupg-native to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit e4a6eda4c246b2bca059defed796bdab19a7ab5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gcr/gcr_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.34.0.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
index 9853b3f416..39e87de5f0 100644
--- a/meta/recipes-gnome/gcr/gcr_3.34.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt \
+DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-- 
2.17.1

