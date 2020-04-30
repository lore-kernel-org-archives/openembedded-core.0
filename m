Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.3981.1588240715584279901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bsYzdcQo;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id e26so1134878wmk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6o9yBOtcEFVyZZee5VV7uLkwhwKniVt1nqDJgPHWSss=;
        b=bsYzdcQotKiu5SOuhaLAciuCVTaaMEKLPcfX/qm/9O+/Hp1SObgYLc5XoU4xzPoj/8
         cYnbj6CS1SMDyEECTGul/w+/FL0QnXfcYVvkjc2oS4pCU29C0ko1QV6ZzD7LSJ13f94w
         rDuRC357gdg8y+cKkYRzKvihBe3Tq4HKacInl8s2cQdvlnj7tfwM/TNLKELoqfAVWG9a
         v3mbjJMbyITSgDEowi8IMxBXppYPIeE3/kiFPXuT9xxshp7GstjIc/q5BgXJPWhTbwyi
         2iKgkc2ls3czyFGbNt+GTxrgC6XG+A98GwN+8R3FTROExFstb9JwfsGjONS03McdtI76
         EOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6o9yBOtcEFVyZZee5VV7uLkwhwKniVt1nqDJgPHWSss=;
        b=jIchAlB7ymsBdyvYe3qWgUU7AZ1pYJgd8feq40OP2EOs8GHclfcAOjejmS0V3WBe1V
         +G00OBVmBb4WsQdrVWEFQBntIssM0TYpXgsiLwOseB1wkFm5ux8/tOz6WCoLlFOzSsxX
         KdjFC7hOBFsoIWZVGHQz0KYJw+eJ8OI6UEmFaqv4fJCay5uTlyVguG8K6MtV346/V/UZ
         wxrEsiL38hGDbSMwxaRPJlaSEjOLttZuvjvFGpNiMC6exOr/8Uua/Fk9ixD5Gsboptxo
         gQJJveLmvvCV5NfQp+t3hONB2crUM4hZhzyDR6q1Em/pdJ7Txrfu7ZBIULxxBci2V6mt
         SNlw==
X-Gm-Message-State: AGi0PuaKIJaNmyoN/fi/8HPAYCjZ1Nv15qCjsA/39gJjoXcg+FAAJHwt
	8JClyOh5UHKe96DLn9Kr1kS8d4I+
X-Google-Smtp-Source: APiQypJCTEtzRb61/LYXSTRmdo8YZ1XQEirRs2VE4bezXBEL//XNc4pt1daiaPgSeIew+3r68y2hhA==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr2116514wmi.147.1588240713928;
        Thu, 30 Apr 2020 02:58:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/17] xcb-proto: update to 1.14
Date: Thu, 30 Apr 2020 11:58:04 +0200
Message-Id: <20200430095815.2824-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-proto/{xcb-proto_1.13.bb => xcb-proto_1.14.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.13.bb => xcb-proto_1.14.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
index 7467090920..6de30098d6 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb
@@ -11,9 +11,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
-SRC_URI[md5sum] = "abe9aa4886138150bbc04ae4f29b90e3"
-SRC_URI[sha256sum] = "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
+SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.xz"
+SRC_URI[sha256sum] = "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605"
 
 inherit autotools pkgconfig python3native
 
-- 
2.26.1

