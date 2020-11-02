Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.1229.1604335827307581415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DX0vtliL;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id k3so19761953ejj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1uqD1Q8wBTKOd+x5CkaP5q/Z/U3KpejB2xZBIO6Act8=;
        b=DX0vtliLDSJYnKoNtBzkq/4jJYjkF3E+8q0I7WrzdM767aRcjHxMAkIjL3qD9pu4wW
         o6HPDBPRiV4IbY1t/WsVqvWiN8qYob9RmmdNlzSWYc5cj6UP4YxrsHMiVQRAxaL1Wuw0
         E/q9afKQ8sO/UA44qIQImV87CzjfcLvLusxefiURBdUirY0XUO/TxgeZH72Qvjb0QIic
         YKxv58ezqg69ohKZDSL1OqeA6AP7SYVpD64d2rKpMhPJoH24ZGUwp5axQUoGEqN4BsQ7
         xagZMDc0Ha5JRDBRWo4WutXNMsB51c0JpH52hJHJgjRpBVq1dGnIZ3wPyfHJTBVcY/4j
         zmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1uqD1Q8wBTKOd+x5CkaP5q/Z/U3KpejB2xZBIO6Act8=;
        b=WA9HJRMVHyWAqonvt4bfvjN2g/uzUoKaCQHRP0d/CmujICrsJ8d8H+jkwhVp/VuNT+
         8ey3IbGaiUvv/KtuchPFJpO/ft7b9JF8sDEse/CB2johRH2/A4bA6Ttw9vyd4oMXzODa
         mk26fxTlK87rH47kZnixGGID1LIywhu630KZv3oluvppf5x/3HCf+oRFTjzDukRmAQ2t
         bayBqSz/Pml58zSGKxGg1XwUPhstH4zDraa98TqwL+m0APzLEmvsrGqenijPcWcTfLyq
         KCA7GUhliZLE1DemBJRVjOXOQeVP8Pes6gpRxfkmtccIKb0PI2tQ7w8oJlUE9qWfiqmP
         krYw==
X-Gm-Message-State: AOAM530yORKOhf/tpxWrZrgFO6j9TAaWpH7+wlFhDL6WO0Mzxb+T9XSJ
	KYdHSzEfzs5BwlMY1n2rmDJNItlRqOQTUg==
X-Google-Smtp-Source: ABdhPJxlpUML6pfsTUhptp87GhexJkS6B34gJMM4PY85wVwApesgUqyQQ9b+N1L//EPA6rFszTc0OQ==
X-Received: by 2002:a17:906:6702:: with SMTP id a2mr15738206ejp.309.1604335825639;
        Mon, 02 Nov 2020 08:50:25 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:25 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 77/80] libgcrypt: upgrade 1.8.6 -> 1.8.7
Date: Mon,  2 Nov 2020 17:49:04 +0100
Message-Id: <20201102164907.27572-77-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libgcrypt/{libgcrypt_1.8.6.bb => libgcrypt_1.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.6.bb => libgcrypt_1.8.7.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb
index ac09417e89..0cad41dfa9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
            file://determinism.patch \
 "
-SRC_URI[sha256sum] = "0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975"
+SRC_URI[sha256sum] = "03b70f028299561b7034b8966d7dd77ef16ed139c43440925fe8782561974748"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.29.0

