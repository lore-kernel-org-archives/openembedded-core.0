Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.1224.1604335802193653337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1m7FaCq;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id o9so17729992ejg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MhfrDv5ieHsb88ErD3GL6PoTvPOVrm78JX5o0sYQ71Y=;
        b=s1m7FaCqIgX8AAAdHujO0RWMRCGgfs18RW9cfeMUCcWstRKjzgBnj9jRCnVtt3xGRj
         paQPaVlC2qRGiQybmR90mpt00fVPs8JzzOv7nSNKUi16Fa5Pq2Th5OEZvHmo0hiG3z36
         yjiaTkBLSU0hGX5ymGxi/ac4fSJ0HOmkVtzqWwuIo25sf5Wtah6hyO4J8SIxkSHTBrYR
         3HxATeuH+JNwauqEdmbHGKj8v04PQQ7K7yNuA5NBRaDZPomfUUhBHYVCwFwxYFapJLj2
         3YEWNI3iQ73cMMrpUxpWwteXOTvy4rbOloALWuX8q7gIREiQNOWjSFSv0reVr3fmxQo5
         Zltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhfrDv5ieHsb88ErD3GL6PoTvPOVrm78JX5o0sYQ71Y=;
        b=KJjF+MvHeqIZ/WxDHp1nWCS88k72si9EKW/h/LqXAKS119VWTqK67qRjkod75Y5SjD
         fmOtsdDZ+AdRIMlyUEuaoFoXfxh8MVuBqogWlZkX5BrarzoMXULbcf0nvmWdwnOKNn+3
         gvPhlSyXI4c29YQgybmSnCwytwsS2sDnipi8TINS5WT6PY137GIHcM7qFCenhVIO3Jxw
         gfAqlRxsjqNxZbWXffWdeXdVY30OHCTWPvaLlOGR1QeZHDUtsnsRKWPi407HACx47odN
         If/i9XCuYbWqMxaYJYqmCE+zTfrfmZxleiXJrvCY86LOKwv6xX4VgCY4AiOSjveXNU/J
         y/jQ==
X-Gm-Message-State: AOAM533okppcQerZberEgAUgOF6eYkh5fusm0bdrEGMVvxf3d5TZGJ36
	AvEWJQgusf4a8FKDOX5ULXVnvu+VzjBOlQ==
X-Google-Smtp-Source: ABdhPJzwEGMS2mrnJkJrNJJYjLL2rU946QhHy+PAo+T6e3wdL0YwTKj+xYqEdVk0gMrNBKt38bmNig==
X-Received: by 2002:a17:906:604e:: with SMTP id p14mr2728286ejj.515.1604335800199;
        Mon, 02 Nov 2020 08:50:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:59 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 48/80] kea: upgrade 1.7.10 -> 1.9.1
Date: Mon,  2 Nov 2020 17:48:35 +0100
Message-Id: <20201102164907.27572-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb} (96%)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.9.1.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_1.7.10.bb
rename to meta/recipes-connectivity/kea/kea_1.9.1.bb
index c9a5819e47..9e7c08e792 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.9.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
     file://fix-multilib-conflict.patch \
     file://fix_pid_keactrl.patch \
 "
-SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
+SRC_URI[sha256sum] = "ece8cc10fafa2aa8bf5cc18f95f4bfb05bd52f8ee6a152d1ee8b53c28a526999"
 
 inherit autotools systemd update-rc.d
 
-- 
2.29.0

