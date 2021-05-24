Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.20536.1621847656675185811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=okgj4nO3;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id f18so10509251ejq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHlX6JQxuZMUR9E5NgweqhvL+rSBARGZuZ6NaZDgXQs=;
        b=okgj4nO3mfzkAX5FmOXxi5lKlv0dxipU0aVXg9GM43Qf1cDBaQ/glN7a01bdWCY/Qo
         ZRWEj9Z3viRjI1T8bpo78G3YFz68+kajqFHwdq5k5PhZ0eNp3rpu9BEZdvRLCEabeivj
         JZoanIerK5ujYeYCvyQB2nkmCqF2QOlfR/BjUC6qbnLGsn5cdwMp1qx6h2qgyV7FJuCJ
         DcwED4nwuTqUJF8ObUAv4ejNSWVB/uUSB6y1RIcgEgxCNP0KvQ5tjcMnUA0fUQAf8HQw
         bhCIBymPfYiwV63BogFquFdm/XqRAIRf2locTdpYx8TJtVmWYdQiYyTjZmDswl6377WS
         Fgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHlX6JQxuZMUR9E5NgweqhvL+rSBARGZuZ6NaZDgXQs=;
        b=cFeoN0yv0Jb+HLTCSFtu+E1VTaIyMf4wKN+E2cNT39C81lARBiE28OXw/6vZNcSuPa
         mon8NRAVRJXVBHSOPBvDVW43sedi//BXhdhVB8Ajrz+icy4faB7QJ6qPLU8zbncwzW5B
         htQGEaZtC1dsnkfUkmjhKS9xQY/t8z1Ye1sQIu90oQ/u7rSrlF8PzHKcJ4NUOBMpI+4N
         PdMFbKrLZMstaYmtTGiRkFgabRtInds/VltyUvsR8ziFFd6Bo8QwmWNILMH/qpE/83DR
         EYp8gNW6rTxPTnHk9PxHNrkJ9nC2vfH1BPbAyi4sTWAv5EbvIxuhNJCwY8sRC7rV/xdG
         g+mA==
X-Gm-Message-State: AOAM532U30F42d15c2MklZ6fdnQHD0sTP202u6BS3MEZJSz1eNdUJl1p
	X6wxhBnqlg4r+j0p9JHdOeE1y8KUytE=
X-Google-Smtp-Source: ABdhPJwzYRvDXjD5TBblVMAe4GfH66YKe93sNfYH9/hg2OZSVY/L4lVgbxXh/AQ+klZgrdrZtv5+NQ==
X-Received: by 2002:a17:907:9715:: with SMTP id jg21mr21805517ejc.52.1621847655299;
        Mon, 24 May 2021 02:14:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/21] apt: upgrade 2.2.2 -> 2.2.3
Date: Mon, 24 May 2021 11:13:42 +0200
Message-Id: <20210524091347.419253-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../apt/0001-Do-not-init-tables-from-dpkg-configuration.patch   | 2 +-
 ...1-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 2 +-
 meta/recipes-devtools/apt/{apt_2.2.2.bb => apt_2.2.3.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.2.2.bb => apt_2.2.3.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index e0e7e0cd58..a9a8eb6306 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From 382f8381ef8baf754057e376a6d9bf840ca6d543 Mon Sep 17 00:00:00 2001
+From 5fb6355c7dd00c97fe90e805ace075b6e9b6952d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index c14dc2a414..34d0c4b4cd 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a603b3281f3f60a87531c8cec4843f970170d409 Mon Sep 17 00:00:00 2001
+From 76f8386cac7f13688b386686e0b1fc4b1b574f53 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.3.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.2.2.bb
rename to meta/recipes-devtools/apt/apt_2.2.3.bb
index 192aec46bf..ff9270c4b3 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.3.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "c5449a4c2126a12497a9949cd10209926005d329f6ce7942a3781fa2fcf50487"
+SRC_URI[sha256sum] = "2880474bc08c79f103cd30d24a9c30c78b480c65076e466d24df93b9fa05ab27"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.31.1

