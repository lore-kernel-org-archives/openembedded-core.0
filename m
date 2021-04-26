Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.1181.1619400025529747980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 18:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PJPLIBzX;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y1so12393442plg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 18:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s71XJln5oXO3ZN/SmuFiodYzXw3jSIFtsO40QIr6moQ=;
        b=PJPLIBzXw/OJbMsraECILGZl0J2DpRiuLShrgNinM+KkOpGScLND1qfxNFdFuek4ZM
         GaZEaMlr89w9R9XzOe4lc7sn04DmWxcEpZVRmcYCujlSg0WukMxh5lz5CQxQ9s/KEo+K
         UVZX4QhMEvZ77lsnXbmkMgOZnPavuNDaHt4wQQhCHFnpb4uX29oGIgncJ96NQWHwLkuj
         y06/7qhtShAKPygtTPRtS1lr43dl+OaoaW8SDmVwI2ZIDtWzLX34hZ9HE74mmdnNb6pB
         2ik2tOpeEMmLthjGeO/lANLf7YN0+ltMFFaZRtxGi2bp9Gfo+lJ/mi26x4I6L0HwPYQL
         ZGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s71XJln5oXO3ZN/SmuFiodYzXw3jSIFtsO40QIr6moQ=;
        b=BGyEPMZ7xiVmnDTy754YYrstEbuYdqI8gayORPP5Vzih0MKKZLMwGgU2UC9gFn5XoK
         LEQrKK4DOX6T1z1TS1KbY7VxYs7pB1fkyxdyhu8EVOoK+hL4WTwi5AJw0sVZJxNH3N/Z
         5UGu/IcNqlfb2fGJC77oQDldxue8z8FxF15xx/TCzW1wX76ecS3lUt7Ik0NKNZVcRjV8
         vJbsxgc91PuqbNZRMT5eQ1gi/Yug9+dLh62eYvM2WrERsAjaps+5Re4QS0CEGcEwAT1y
         gPvGx1wY8CXP+6XchMh+NeeOyM+iW3FSUpkvFM13e0+pGFi6nBp349ajPJZ2/TB08NsA
         34yg==
X-Gm-Message-State: AOAM530wXNjxWv3YJgeRt7OC/0rPZ30uiUE/St+/kPsK/xDvRUgzipxU
	lBPRd1wQfHBUd1Kjgux1k9Ex/+TGAgJLLQ==
X-Google-Smtp-Source: ABdhPJylerouwaHoMaMjhVacfxi5F/k3plGKway2+VONvmxzMukViN0I2u+ZTGCNc6G/RP/MxObIoA==
X-Received: by 2002:a17:90b:1486:: with SMTP id js6mr11272639pjb.210.1619400024663;
        Sun, 25 Apr 2021 18:20:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id 140sm2432112pgg.6.2021.04.25.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 18:20:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] default-distrovars.inc: Remove seccomp for riscv32
Date: Sun, 25 Apr 2021 18:20:22 -0700
Message-Id: <20210426012022.424092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libseccomp needs too be ported to rv32 first

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 45f4633c35..ac10245767 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,6 +10,9 @@ LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 
+# seccomp is not yet ported to rv32
+DISTRO_FEATURES_DEFAULT_remove_riscv32 = "seccomp"
+
 DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
-- 
2.31.1

