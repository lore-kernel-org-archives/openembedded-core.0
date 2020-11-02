Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.1160.1604335787436368377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkMl5fm0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id o9so17728934ejg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MTSDpb6+KFbU/0XHKvI8KOiwfmD90YjN+Z5/vPTRTQo=;
        b=bkMl5fm0ziK6UVN+0SXBQzO7lG4WaFD9OGzhNf8kAJTv65GCmqt0fUPvRrr3Zzn5XY
         Q6oCqtxPUd8lQAJrWqPI8s49yZNeMeUP5cTE7NJRrsEVCHM4vuyfRfhOsd3wKPTMH+CB
         6b3OJxVK0gue6Rcm4QJ8z9BJWLJk1hSVvqIWmThipIKGn6M+m6hPARXcdOkXt+6bpEwS
         L6IHzfS3Gy1pJv+Jh1hZewAhNB/MMsFG1K5cyUNGsa2jyiGpe9lGv+OxIiXPGtK8CSN3
         BUCNzYvklGcpp1oGTY/yHoQt1MCeVJcTAvcFovHDIvgdlTEzNFPRaRJgxEG7HYM4ARDi
         jv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MTSDpb6+KFbU/0XHKvI8KOiwfmD90YjN+Z5/vPTRTQo=;
        b=s2oxY/FDI/X0/AeB/Wh12b8r55LFkSUcdR1K5PHOaaFWsB42m+FozLmzo0e2RoNxh7
         jUUKJTSavzGQ58VAetRO/i5jCbeRRWziEYbzNXeY3qVsdLlQCgmDqvYrONRxedNFSmK+
         dfraqGhKrhnCneEEb18u6A3zkIoVGx3KQqmpFGUL4FV+9LkF3ZHUQn7tcboaR+x1wF7R
         6xVuVUg/tEYb+smJvIS6q8+6B5+o0qWwNuMODoARl5A1bZh+pTiDWmME2otzkTjy0gf7
         F6Mw3ApJ9ZpP0nAhlBHPKK9fyHUkguHLnMBTzhDGxj84DJXCHAjamcWizPXbyWAANEnh
         pwiw==
X-Gm-Message-State: AOAM532mYxVDKHGQ7RQ1NTD3+78Zv4r+Lz9x/rZAGKu3iiYAhaNdkmwO
	dp1ZJykotQiKDjIgW03O3FoY0emK9CkhCQ==
X-Google-Smtp-Source: ABdhPJz0HmdQxhNFk8gfynqAEDO6KjVCQAOkzKHWGrTQt/HYaZ0uMrRY+ECShX1qjxZ/DzzvDCWNgA==
X-Received: by 2002:a17:906:660f:: with SMTP id b15mr16773611ejp.333.1604335785829;
        Mon, 02 Nov 2020 08:49:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/80] libgudev: upgrade 233 -> 234
Date: Mon,  2 Nov 2020 17:48:19 +0100
Message-Id: <20201102164907.27572-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libgudev/{libgudev_233.bb => libgudev_234.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libgudev/{libgudev_233.bb => libgudev_234.bb} (83%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_233.bb b/meta/recipes-gnome/libgudev/libgudev_234.bb
similarity index 83%
rename from meta/recipes-gnome/libgudev/libgudev_233.bb
rename to meta/recipes-gnome/libgudev/libgudev_234.bb
index 8bc379ff62..9cea36df5b 100644
--- a/meta/recipes-gnome/libgudev/libgudev_233.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_234.bb
@@ -5,8 +5,7 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "587c4970eb23f4e2deee2cb1fb7838c94a78c578f41ce12cac0a3f4a80dabb03"
-SRC_URI[archive.md5sum] = "d59a317a40aaa02a2226056c0bb4d3e1"
+SRC_URI[archive.sha256sum] = "1baeacacf0db42fa073ad5183d1decce9317857416a2b0f82ce3370d711a2e37"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.29.0

