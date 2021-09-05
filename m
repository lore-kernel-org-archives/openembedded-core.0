Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.16186.1630886244743581786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 16:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXx5Hvqz;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id v10so7147781wrd.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Sep 2021 16:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWgJyiWLMsB4Og25aBaQ4RzocwqD5nuNlIjgfhXhGFI=;
        b=UXx5HvqzE2VGcUrz5yFcbOcj69yRgD4FXBJvmL2JLY4VQXMrk2YKoqGNB0viEFAFO+
         MUs6sPoHkJzW4SrNAizSJm04KdwJi+1jLMLk5kd9N7Omg0aoCCsBTeIX/iWTSIXxuvxF
         0g++X5RWUKqPUPONYKUkCo2h9rPaGe/oD6nx1BnOxnOPUyF6LjS5QYGZWQlCkGX2Fs2S
         bZY2GnWKptYUT1we2EI29yNuWTalFpjFu7Swd1oIwVfwf+3P43zOjq7WXwc1hgIE2imj
         CmeF1aOep6s6fG3AlVCGS4ZbsiTWGcFDnMtcb5LS0c/egdum7QPgu5qbhFBXNWII39yn
         eTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tWgJyiWLMsB4Og25aBaQ4RzocwqD5nuNlIjgfhXhGFI=;
        b=HF4gMyNCh+diYtIEujYMXfbg4HRrpl+Vs35h1VYcJYrdBe4I+VympeH1EOm3eieqbS
         0AITPQQS2ULBPLMMtZuCGCREum9D5vFkmCrMqrRTQPEA+ozxDCUUBL+DTUPrfuu5EO9d
         X/cl3R86pxs3DHSsU3KNSR1MZl0vQbcyfOqZIoJWZEaExBqsk4KjRuj5pavUwNjFHI2J
         cE0fQ6+6HU9i3SvWl0eu6YcT8xmRFOi1uRYdVpSPOeU2iNZ2VHCtYy7ONm3buqcafhVe
         tM8F7+MdACH9OATb7+yj8JAdXOpNCiBHQwJn06VOOZjKgDmpZcy6I1fs6RZZx5D/5Lbf
         hhWg==
X-Gm-Message-State: AOAM533DD5rR+5OU5C3/N5J2cfWZK+w9svFSzW1SMx7WIFdKLAAM2wxt
	UAc4EX86M8QeBxH3TiMH3ad09QhAD606ug==
X-Google-Smtp-Source: ABdhPJzGrrenzzcElr1djFSY0oEjq73WnX4SBjAIbeiN2lWvvZwD7zHiBkMAj1eEPbzfAVs2xHBLBQ==
X-Received: by 2002:adf:e712:: with SMTP id c18mr10202101wrm.438.1630886242728;
        Sun, 05 Sep 2021 16:57:22 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from localhost.localdomain ([2a02:8109:b5bf:e890:3839:7e25:952c:f217])
        by smtp.gmail.com with ESMTPSA id s12sm6231071wru.41.2021.09.05.16.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 16:57:22 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH] iproute2: update to 5.14.0
Date: Mon,  6 Sep 2021 01:57:07 +0200
Message-Id: <20210905235707.861-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_5.13.0.bb => iproute2_5.14.0} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.14.0
index 44575bd50c..27fb5c8866 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.13.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.14.0
@@ -4,7 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36"
+SRC_URI[sha256sum] = "210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.32.0.windows.2

