Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.17514.1590940438225637372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Io8/rhky;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id x1so6857229ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mYT/V0d3MUIM0MrQn48ylP8XbnQKv/uTpmiurq1noU=;
        b=Io8/rhky2y5/IMUJQQewzjA/ncgl76CrFPN6rWwB914ZAcyf84bGCuiSCPZCQQFp7q
         Zp1Lda6UTRktfSCMqwOxt0Dbo3iRH7jUyI/cLolQMkoDUUFBf71XUQveiYWw3XUAHjAt
         y2UtVTtMdlB6opCAAd30CW7XB7SokKpPXwl1R3Cb24DDEpICOyfzWp+/Mo+lw9TE8wrF
         P74qiejP72z1emrKDxNsc3QUin5xMtXx5piHOAr8QzpHg5D25/NWM3RKfnwAG2WEk+1m
         mEwi7tZgxLGbg7qM+8imxqH5BfXBE34cqPZWb+7e2vlEpiMFE+CxJJPMcd5/3ox6UYJc
         niPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mYT/V0d3MUIM0MrQn48ylP8XbnQKv/uTpmiurq1noU=;
        b=KuVSZl8UNfIDTPDlLA9lsGtMIJu3vkvPAoZ0z/WuFdoBQLTyXMrdqJF940IhQ/LEIg
         SlxGEdhHVJmsWwzDUO+15zpA8tomY/sgJtfWoqmgiaIez5qNzdiz88S0HwoPA7suuVhG
         NX/Tf+z94vlfc1DPUKWGYHvhIEiQFJC6BDiz1YhZB5PmXvYzObseJfFFPKpMb0VmfXGD
         xkGVzfApD4PWKCdOYWksNwGEkCETa7EXAp8oWiFmdPR6nF8Lte+9kNrvYF9v4eScSz+m
         MaQAwo0biF02ZhU2N3jdJhJPzbgZrV7Gooco5fcceKyIpDnLir6CmOuKaerIBLd4ALXH
         961g==
X-Gm-Message-State: AOAM532AaPG18bRoUk8J7VXBIDNrB7lYmwpR2j+84CEVj4EFHHaN7ILq
	f9gBLRY/gV7Rt8irPe2JkI8c6d1u
X-Google-Smtp-Source: ABdhPJxT+LEJVZI9/Y/69Y5Jba6TWCuIElAXLddAcHQDciSuRgslXOzW6+aHk4rZoxZawKBGlFSN5w==
X-Received: by 2002:a17:906:6043:: with SMTP id p3mr15836373ejj.29.1590940436564;
        Sun, 31 May 2020 08:53:56 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:56 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/70] pixman: upgrade 0.38.4 -> 0.40.0
Date: Sun, 31 May 2020 17:52:18 +0200
Message-Id: <20200531155254.10283-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-for-FE_INVALID-definition-before-us.patch | 33 -------------------
 .../{pixman_0.38.4.bb => pixman_0.40.0.bb}    |  5 ++-
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
 rename meta/recipes-graphics/xorg-lib/{pixman_0.38.4.bb => pixman_0.40.0.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
deleted file mode 100644
index 23cbf53a41..0000000000
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0ccd906b904d21536d5ab41c6196760e3e5d72cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 May 2016 17:30:00 -0700
-Subject: [PATCH] test/utils: Check for FE_INVALID definition before use
-
-Some architectures e.g. nios2 do not support all exceptions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pixman/pixman/merge_requests/24]
-
- test/utils.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/test/utils.c b/test/utils.c
-index f8e42a5..fe32b1e 100644
---- a/test/utils.c
-+++ b/test/utils.c
-@@ -978,9 +978,11 @@ enable_invalid_exceptions (void)
- {
- #ifdef HAVE_FENV_H
- #ifdef HAVE_FEENABLEEXCEPT
-+#ifdef FE_INVALID
-     feenableexcept (FE_INVALID);
- #endif
- #endif
-+#endif
- }
- 
- void *
--- 
-2.8.2
-
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 22e19ba069..5a3bb22ec3 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -9,10 +9,9 @@ DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
-           file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
            "
-SRC_URI[md5sum] = "267a7af290f93f643a1bc74490d9fdd1"
-SRC_URI[sha256sum] = "da66d6fd6e40aee70f7bd02e4f8f76fc3f006ec879d346bae6a723025cfbdde7"
+SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
+SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.26.2

