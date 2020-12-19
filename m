Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.13440.1608404120443060608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 10:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dZ01j2MZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 3so6679549wmg.4
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 10:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaC1hW2+VbWoqEz6LZV3mSJw/xG6GIDWIDThg93WNYc=;
        b=dZ01j2MZN80gYXoIdySyunHEaHSY58Wu1eD7tCryWDTzg2Prh5nLN3g2K7jbY+w/7q
         jZV9FYVDyOO1iEM0a3HUMSDD0VzDiyatcwOCsFELPL3XzZwucWaVFqR+yiEAXhrFXIcb
         pyCD4tE41FYR6FArwA5G3n4Duz63rzIMU0eDMGj6i28x9w7qs0aPvf9BbISf5k1iNONn
         ZrXVMBveibw1LUekGn6spIiYvIsOWAJQdjZl7TuQfW1Ktswk/syuZ6ay2Kli4NwUbcFQ
         kvu/Ku9NqJFzuVnSaFwQLZXnhqxHZzutKzQh9UVLnuZaETqZ0+5B6u1nrDQTNUr0AAxa
         twoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaC1hW2+VbWoqEz6LZV3mSJw/xG6GIDWIDThg93WNYc=;
        b=qhJbx+kupkYlt9oozzllUxhE4Xo/oChp9zUd9Dl2dnNu8mseOQMkwpIX38HfdwCffV
         4SLFHU2OpIA0QRQuecf4IrTTtF360d/ZWNrSK0mIr3we3MpgRDYGgXB9lCM/Y2jJ6oLQ
         kVpb2PZqzTehDxsnA1VEhh2tU4bW7zEgskSRWhqbWhvdJMxMALqEsaUv0Ra5Mmn7cRhz
         4HBV+IpthvZbjxw32PdU+6omf8alT7yJ1M48i7HZ884BO82BF28yU0oqO4K65cjcrWiS
         3fuyQorc5BIKNVr8mmzXruNvDK0dFfQVEnFFQxmc6h8xILGDR+qGuzNJgczbYXG7wg0g
         0ckw==
X-Gm-Message-State: AOAM531pNvPEb2o3AmngaYqkHseuGdN60JNwkixR8+F1fffSXhemIgsJ
	I4rW2G+rmAUiz1MEO3T9TrKaQn1CPQbnvg==
X-Google-Smtp-Source: ABdhPJziL8kpfXxwLEtM4o+G3W5cmOmQIbOYN3Dkv2C+lcZ5HINgzezowC9CoV3+ihCI1QPm3b7hIw==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr9231194wmi.92.1608404117713;
        Sat, 19 Dec 2020 10:55:17 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h16sm6343053wmb.41.2020.12.19.10.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 10:55:17 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] spirv-tools: upgrade 2020.5 -> 2020.6
Date: Sat, 19 Dec 2020 18:55:22 +0000
Message-Id: <20201219185522.1487219-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/{spirv-tools_2020.5.bb => spirv-tools_2020.6.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2020.5.bb => spirv-tools_2020.6.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.5.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-tools_2020.5.bb
rename to meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index 5e42987240..eb07833f22 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
            git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
            file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch;destsuffix=${DEST_DIR}/effcee \
 "
-SRCREV_spirv-tools = "b27e039c68dd9eb959bb9249fcb2c9a54841474b"
-SRCREV_spirv-headers = "3fdabd0da2932c276b25b9b4a988ba134eba1aa6"
+SRCREV_spirv-tools = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
+SRCREV_spirv-headers = "f027d53ded7e230e008d37c8b47ede7cd308e19d"
 SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
 SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
 SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
-- 
2.29.2

