Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.1219.1604335797616130667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WpaCZ0xO;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id o21so12768749ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDSk07dPfaB3/QvRXTtWelcqt/ojYX/1GiR57M+kANE=;
        b=WpaCZ0xORB6hSAjxzChIDuOMULhNeH7Qj5PYq64N5XlneKH2tlwoE8lxplO06+4I/b
         yyuVKqFgoeUs3BFOocKawWdiIUyByhU9OKbG5io5p7nLd6XGsTbb1h4KaCvDEKmKlKat
         3+5jXgqYaT9eDFfPAF+8maNFhn/JVs7NMnrizGCTPpwWUDIcIk2WE5c1M1drNn5YGSr4
         +c24Mli9/8u28/cvR1FmwIFIcmRdHLD2WWxyIBMlo1WChENYaIUc0QzlFtL6NZjxRdaw
         0NqZokalBNmU0AULnR03XPzHR/MVGJRzNcmA631a2y4ei3Blxt07uM1/S4MMpTacJn6n
         Vkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WDSk07dPfaB3/QvRXTtWelcqt/ojYX/1GiR57M+kANE=;
        b=AiZEDxvZlLHwie7jO7vicDfpzWOdNab/V6+J87hMrK2hy3+rkJQVkqBG/yAhIIeceL
         I/pP85tVb6CNQganC1UTNEos8Mvlb7F4xbkUsuuYDiVjq3uhC4eFdQr+/I0Se3dg39DM
         33sTrziQLndzfBNUyGeU//QogLEBBbJZftiyM01YepiljHKHkXUJoEqxEChVmw0YTZRd
         gek9vp0r0I9jBOeYASBpxuw21QzxAiRawZLt+xdiYMdmNpYN+3WupstYLYFxw9n3UOaI
         VjdxZwdY6hyFgfUnXqBGdJgukQxHaRmI8ZbG9WZYtJDw2N9EXBUVgP/SaMeXwEAb+YDL
         16Yg==
X-Gm-Message-State: AOAM531d0sruK53Wsr5x26vpbresKfOdjciYyhcU+QPXqMmKPLjVWu+P
	5YOcDABxUI9Ukc3qfZkmtkRE0gl5pHTfcQ==
X-Google-Smtp-Source: ABdhPJyP6juresiyC7jIbr2qDCs7yP/2dUMwKDyWyjzPo5H1p2JLXzQyRMP3A5pRsgg2vkQnXQxSlg==
X-Received: by 2002:a17:906:ec9:: with SMTP id u9mr16172499eji.400.1604335795980;
        Mon, 02 Nov 2020 08:49:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:55 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/80] vala: upgrade 0.48.9 -> 0.50.1
Date: Mon,  2 Nov 2020 17:48:30 +0100
Message-Id: <20201102164907.27572-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.48.9.bb => vala_0.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.48.9.bb => vala_0.50.1.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.48.9.bb b/meta/recipes-devtools/vala/vala_0.50.1.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.48.9.bb
rename to meta/recipes-devtools/vala/vala_0.50.1.bb
index 09bfcd6474..cca7eef523 100644
--- a/meta/recipes-devtools/vala/vala_0.48.9.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.1.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "9cea16d3bb3daddbfe0556b99fbfa08146230db7651e1e674cd08b4df5cefea9"
+SRC_URI[sha256sum] = "958d9f06c9c3d7d1b2145512a9bc2a7c6aefbbf0416a04c7a0ecf463f7138f6c"
-- 
2.29.0

