Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.1215.1604335792944872775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B8RahHPX;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id oq3so17944518ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XQR2whIXVBJDK8z8AiXKZ5fr/a3uiAStL59DVPDLfX8=;
        b=B8RahHPXxP4n6X/s/vAyZovQb5T1HEpPHCbgvqdP21hnDhVPst4j/HGCIlH9d42UX2
         gMJ/T9rDqkg2sEX65Cv5Edglvu8cE/cVr1szH4aegKrXC1sNtCjIgoBYJCK6JfN7+798
         8B0pLyt71oBQj5X9I4UyfR5WLHid1zP7b1ptjGLYUDJH46KP0aXU8vGvB9fV4mDXJIBk
         nfegf55ribkl3NqEoZYgAtYJEyb8cGErIDKVqTqEZXhwhw7BjUJixe+Cix8HQRhjY88j
         rK4de5enjqVkPpuElgK3xxpoRf8O8f7dEvNcRAbG9PLQp1nM9pkPw77sQUWyqGwWhRs3
         6/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XQR2whIXVBJDK8z8AiXKZ5fr/a3uiAStL59DVPDLfX8=;
        b=c7WBEw05YdAqZjChHKFI1BuvDtdffoO1ZRKlgv8HTBW0FqMOaM8LQcrVrbkcdjinLO
         a504/9hWkkj2P52bQXEw1tLABNebbOF66rI4WSXKnJsIlh9nSavnwac46kiibKjhDVQU
         qoKIEXAGUrP7vpW+MO47l4cHK9qeQLKmUP1TEveQ0YHyP0b8lTMnsNTBi32HUSiGClRK
         IHfvseCz5tsqA71AWcOKwEoMJ0T8veeEXSGUtLMlKkDdRJlAPo3EtHranNERPDejlcIQ
         ZaXTSD4isUac3+zFJehOG6QJmHRw3gE4unE+k5u7r18KyQp3RW8LeIoyyUBQHXYS2MdG
         rnzQ==
X-Gm-Message-State: AOAM530/VKfY1BckW4pmOa+ZHonzW8UPSGIE8NDjHk4U+Bux3eXx2Psj
	5nMaBaSwQzEitHNKqU3OO6PxXW1V5f7SYA==
X-Google-Smtp-Source: ABdhPJzYbNqRAmMkmbR+Ez8PzCIohO9G0+7XgObgnskqDcUQDXza438n7pmISwyFO+/nAYvbMz910w==
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr14327526ejz.3.1604335791274;
        Mon, 02 Nov 2020 08:49:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/80] libxkbcommon: upgrade 0.10.0 -> 1.0.1
Date: Mon,  2 Nov 2020 17:48:25 +0100
Message-Id: <20201102164907.27572-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxkbcommon_0.10.0.bb => libxkbcommon_1.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.10.0.bb => libxkbcommon_1.0.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
index 16d9c36eae..4ef20b0721 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
@@ -9,8 +9,7 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2d9ad3a46b317138b5e72a91cf105451"
-SRC_URI[sha256sum] = "57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2"
+SRC_URI[sha256sum] = "ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.29.0

