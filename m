Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.705.1613175892724468801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 16:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O7QsezMK;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id lw17so957610pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 16:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wwH7GNgY7omaiLGSRuVdgGPgV/likX+hzYpfK6ja7Vs=;
        b=O7QsezMKgM6sZrxy0lIQPmGl8/4VsFCBxHExVfupAPoPNs/EkBMjJM1M5RhhmS8Oyg
         TyNDRD7gdKU/OjvbVPR5lIFaC9FfxkXE1QACdSCmDwPOcP51yzGBshc2AWS96e2/4W8u
         HuXkhtvd9NFVqfnN1pmRlcDa8bSp3BPIY7oBrCNEEhUB2u6ZW+HNAZlLKpEGkD2zwAhJ
         e9QqccEbe1O8aE/SD56qH7PDOCu6M1vm5ygReGbyQw7XkWrl+Jy3DJQcBxnVZkghQFnz
         tZcSjy4PRcAxYJ4uisp7zipguEnv+h5lDOJFTZz9Ah5XKYKMTkV1BGoc4KV/cUP75Hai
         ZcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wwH7GNgY7omaiLGSRuVdgGPgV/likX+hzYpfK6ja7Vs=;
        b=R8v/LF8uWY0okydvqTVTDABWIKteIEejcRG1pywGdo4fB8P9f3dQJ3Vua6EAIrDq6B
         dYq5nItIaLGBt7cKAoc2nwsWhAapsP7T8TpwJHiI3SxLzXmOf9jeRgbQLWUMfuthdEjC
         mXBE8t3VoRCewjanrnwtGO37RY/ZVZ1mcqEbS/pZHxeLTWsJhkG1/cVzEGsauBU5VXMp
         rcpkyZ3HJ7CT0F6DO2p8OcGSrSxBX1XT5K0hBdiQHUaaSw5fgNiTOxa9xYlWYpnN917l
         ErG7OlE+ZwwLivM+beyYbmwjwSAVy1YXqkgiBvpYsAuHyGbJRHIPS9b9eFtyhuSdZPGB
         xWrg==
X-Gm-Message-State: AOAM531i465QjrqyVnY6Bafb6SC6/IYeZnS/Arlr3LolYAgvEEQv4sKH
	brS/H12/al4I5SnpZRo0GCPsNxIWkptODQ==
X-Google-Smtp-Source: ABdhPJzXDnoP4v7y4Qfv9Ez5s7AeOTaMp9z1gH3PXM4q8J94ZUkVrtbcas1lbl+XbuYEoDsI2znwmA==
X-Received: by 2002:a17:90a:6a49:: with SMTP id d9mr4994738pjm.2.1613175892021;
        Fri, 12 Feb 2021 16:24:52 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:55f8:e3c0:af8d:902c])
        by smtp.gmail.com with ESMTPSA id o13sm6593255pgv.40.2021.02.12.16.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:24:51 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH] connman: update to 1.39
Date: Fri, 12 Feb 2021 16:24:49 -0800
Message-Id: <20210213002449.24303-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: akuster <akuster808@gmail.com>

Bug fix only and includes two security fixes:

CVE-2021-26675
CVE-2021-26676

Changelog:
- Fix issue with scanning state synchronization and iwd.
- Fix issue with invalid key with 4-way handshake offloading.
- Fix issue with DNS proxy length checks to prevent buffer overflow.
- Fix issue with DHCP leaking stack data via uninitialized variable.

[Yocto #14231]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb20fd47d738f469f7bbeb4b8d85040f9163722b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9af..df42e9ffb8 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.17.1

