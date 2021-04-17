Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.2961.1618690742113483960
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 13:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Y2bL92hr;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id o16so34886041ljp.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O19skYmm1T4EhQG1gQ6tw7kvzDucqyq471vGHR+9R4U=;
        b=Y2bL92hr5UdyhHN+PR+LGPkJLCyc9bz20QflwL5NjUv3C245lnVGKolvkP6XEExr8o
         cQymIcdtnXoKapes/Y3UWgxY3xf6AV738RGF1MMGhU4ApmSyvPrynMzvgm0K8zjX9Pfs
         +/cLNVONriuF6JKbDZtJJ7mePnQPTeebKA0UyE0v6ELziGcIIaO6fG1rPBP9vwcm6TAY
         wsanqvQDp94RuiFU5WRNCSyXXavmygKIELF8r43KZenudi69SpbWM81BW9RFyiFw2Jqg
         JPkr08CVxyCCrvtw+ypJtdeIxGgrC8CU3sv4kMB3PDU3V+LWZjBd1FuzHFp7K8OqbdIr
         UaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O19skYmm1T4EhQG1gQ6tw7kvzDucqyq471vGHR+9R4U=;
        b=GamZjk0Jmv4Pah9TW4Rvy4OMoclaj4hi+QX3qQTUDn4kb62u1aXk2LgRs05RuURyPB
         Jl6dcfjyIliEYvFWXfkCCy1KrwKEBm87PbVB0w4HhwpIe9LTHOLHNXO5dhaZHeUQNux6
         ajpEFTgz/wDuXiV7KgA19VEVMM1RN3H5yyie7a0xkxv9D25s5LZjr63T2hhFbjScaIva
         n0H0NssyDD8ubxif8dBEmRI/X8ftD1EyJfIOrcvOhruZQjhjelxM/BXojO6pGDUwX3iA
         mE0c8p14fw/cEHhVfF7Ll4D9hhk5PxDIirvEGwtg0eu43Qa0ypdyzkSFEAmyMaGjj5qI
         fB3A==
X-Gm-Message-State: AOAM533b7SgnTPj25/Rmv4dyyehANFvTW4j5TiiFO/gV8XJ3ylk/IME3
	VerjJ0fAmVEwBk8b9o5igCIDcSVLpIYL4JEA
X-Google-Smtp-Source: ABdhPJzV78YctzTyisjgMuBL0z1usKeTVpqt1gioIb54WljOHJAqryO/XHU/ywf8L5lOik+vJw2dEA==
X-Received: by 2002:a05:651c:325:: with SMTP id b5mr6233950ljp.214.1618690739863;
        Sat, 17 Apr 2021 13:18:59 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q187sm373310ljq.7.2021.04.17.13.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 13:18:59 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-dbusmock: update to 0.23.0
Date: Sat, 17 Apr 2021 22:18:57 +0200
Message-Id: <20210417201857.353253-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.22.0.bb => python3-dbusmock_0.23.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
index 0b87ab0380..80990d8fbb 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.23.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "2191919cc411fb94953b36e46bfd55ee5ad4162432ee0d0892bc2c4770ff5d7c"
+SRC_URI[sha256sum] = "8c0b873a3f23869b416b51deeec39b3d5ab4c9875b705fc90ae917e4969c2574"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1

