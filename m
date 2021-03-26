Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.8334.1616733432303771045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 21:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9+V4yTp;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so3653498pjc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 21:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqx35qFS8XP8BspEWCtEa6/BbeDCdiZJ1KVRiBUXUOg=;
        b=Q9+V4yTpQ5dYr1JvGjkWhGX/I6Lu69jOjBc8Gq+cQpYrhsNtUeMJgyL08ShQ4T1duF
         RQA+a18pDoQq1Qq/mbu6b48X1YooBPXQAO/d1gPx0MTZSM8EuFRTDMSZqhG/lUYQcfNJ
         j12fZ828qVbVSyq9R7xpykckKIazi7r3KI264uVZjVgq3qDiDh25nSC0ZISppaEFhaRL
         87JiszKq6YQ4Nc1XDblEfq+Q49G67ZAhyIdirs1TX6Vjll7rvD6E+66bqmbUbC6hihtb
         Jw1Z/nSkjBugeKnMLO4oG5Z62ySTZoNS+jAoX9RW5cJjqV4TVCkRWzeokRFRsBk+1yJ8
         ognA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqx35qFS8XP8BspEWCtEa6/BbeDCdiZJ1KVRiBUXUOg=;
        b=uESoTFiNVKXV+P0+1gg9rXfcPxJSFHYGrh76f20zV5y/cmecRBBRCehQF3wMuCZnlZ
         oZa1gZ5cj3pNVW1xNNY78ShgV01yEpUBZN7ebDNwEQctj7XWOnz5P61rJr8znFLUVFlR
         T56OQ/YiZTqDxLSUrpMVAWULW0lkxOURsZx1r4UpVkwERGfdUO+b8bOw7c7Lzxb5tlUO
         9K5DHokPZ+oheGowHRY+A7URIAPQZNP/Q23f47F9DEudrvEfOdmET87i3GXNcYPI3nDo
         mP7jk/hgClGIZSZfnGV8vbCesRR3jEmuFtegZqJFjB8IG56PfPOsiSnKwagZNbTHfYl0
         aVGQ==
X-Gm-Message-State: AOAM532WoBys4VgBc3D6nAopEPFLXhdMZ3BMGO8HNZhUm1AuJE7Yan3x
	/eXHi84QAijSkz6kxoKNfKuanMylUjkLKg==
X-Google-Smtp-Source: ABdhPJz2aPofe0O7bfHJEGdlRKyCZErJzvm9dyxPnHAnqjkupeqGoa+fMUf3RnsWB4ED21BDbtvVqA==
X-Received: by 2002:a17:90a:14c3:: with SMTP id k61mr11907858pja.206.1616733431485;
        Thu, 25 Mar 2021 21:37:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id t17sm7650735pgk.25.2021.03.25.21.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 21:37:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] grub2: Disable for RISCV32
Date: Thu, 25 Mar 2021 21:37:08 -0700
Message-Id: <20210326043708.1118307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A full working port is not available yet, until such time disable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bcff676c26..d88c3fd3ad 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,7 +33,7 @@ UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)\.tar\.(gz|xz)"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|riscv64)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST_armv7a = 'null'
 COMPATIBLE_HOST_armv7ve = 'null'
 
-- 
2.31.0

