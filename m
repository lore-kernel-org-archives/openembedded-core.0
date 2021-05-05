Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.9785.1620227955466824819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FgeTiPE2;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id r9so3473940ejj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJ/kcSgmb+597eKT4mfjsLCW9RnYgftuqr+IrCKr5y4=;
        b=FgeTiPE2pipY/IiloS2hvGPWmRcUbauN8munh1ELrWgHH2LtkdbZUArtipvcW/PVWj
         2YpfjoaQRLQb5OEMRnLHG271qF6QY5nM/FzlHhn1sPcaH9US0IKz8kV1KclaL85d5tnn
         cPm1uon8SIOlSIZUoBni2TpBjrUOiXT2rZnUC1zKNdNkqe1qh5At53U5uxcXJ7+ZpJCU
         iOC7xUvIcmaw0D8oaW5t/HmroNuUYfWnPcTRxB437PmvUrjB5ex5RtRDT0J5++sGZM+m
         t1RHDgWJ8BB4c7d2bx3s85Ls06yJZmHcDw0W9RhiD/73Yl4wBwYcSpT8nqYOYCIJ+TAL
         DNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJ/kcSgmb+597eKT4mfjsLCW9RnYgftuqr+IrCKr5y4=;
        b=S33vkQBiXQDHfniRqO2TPdt3AJhL7m1LklD9JG+pnHUTx5KATGJlm3kq0xfcPok6z8
         25oVjBoycWtUApozEvOs99uwHxt+DF3JgaS1jZCkXO7/ajP8+2SG0/gUj1eK6ieRMEx+
         pDkJuwhTnb4KGfb+5OInjKvYvVMDuct4i9HgWo+zO2SMfgJ9t8uFw8VDTus/iaZ0KAQw
         tiFpXJku9MZHjf9UtSAhfvIrZ72f+ASYzTgvq9342HPtr99hl1jBJsKCvzgWc9SiX8IB
         sAk5r6Evj38pZxUmvgOeD5S7PM0LqQnOAC8hJc/eCOpR341muKFobYOBl0cNZMNtmZFl
         In+Q==
X-Gm-Message-State: AOAM533OaKPw86oHz1A3KaXSmzyMFDehZv7dB98+fB35lPlP3DEdDBhh
	kOPbJYz+3TMHjwX5eQTzsfZ6XRLAaDw3Zw==
X-Google-Smtp-Source: ABdhPJy3pKUuz0g5jT2D9BgdclFBKcfuCnieHdX8MightM6e8p+1ndm82bgrBjwEVbgG4HL8ZgoE2g==
X-Received: by 2002:a17:906:5ad5:: with SMTP id x21mr28173258ejs.422.1620227953951;
        Wed, 05 May 2021 08:19:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/61] ffmpeg: update 4.3.2 -> 4.4
Date: Wed,  5 May 2021 17:18:11 +0200
Message-Id: <20210505151850.660512-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop mips64_cpu_detection.patch as upstream
has changed the code in a way that's difficult
to rebase.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ffmpeg/ffmpeg/mips64_cpu_detection.patch  | 32 -------------------
 .../ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
deleted file mode 100644
index 69429af8f0..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-It will add -mips64r6 and -mips64r2 to cmdline which will
-cause conflicts
-
-in OE we user mips32r2 and mips64r2 for mips arch versions
-so there is no benefit of detecting it automatically by
-poking at tools especially in cross env
-
-Fixes errors like
-
-linking -mnan=2008 module with previous -mnan=legacy modules
-failed to merge target specific data of file
-
--Khem
-Upstream-Status: Inappropriate [OE-Specific]
-
-Index: ffmpeg-3.1.1/configure
-===================================================================
---- ffmpeg-3.1.1.orig/configure
-+++ ffmpeg-3.1.1/configure
-@@ -5220,12 +5220,9 @@ elif enabled mips; then
- 
-     # Enable minimum ISA based on selected options
-     if enabled mips64; then
--        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
-         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
-         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
-     else
--        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
--        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
-         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
-         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
-     fi
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 08be38ca50..19a8e58370 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -24,10 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
+SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.31.1

