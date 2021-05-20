Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.821.1621536453643660550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 11:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IPHLthat;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t30so12478483pgl.8
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 11:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSTSdmcRIdNiXXHufX1dSEipUWg6cn6NLmWJSNobz6A=;
        b=IPHLthatw1/koW7JT57cesnlFyPYS18cc7Ba3iGslRB98445Gaql6w5vw65kImpXh8
         o/KGSEpdE55iLLrVf55vR9gUwREEZytc1sAC4+86ggbczNFzRCq7qgcRAv1hq9bpXXia
         oryblbT6IcE2TmXRvQOZa614Dk2bJUHgeREPDjv5i5Jj/HUfV8W4lyd5LSU8Ip+ni9UY
         Pa7wif7OS8KaTmpxRX/Hixa2weXjZe+DXCpcA4hUvwp15KKWJXjcH9ZRQK0qKVMI1USL
         aFK46VB0ygjLl5LQ6K/U7IYLbqrsyfr4hU0KuwyDsJ3wvrNZnmZVMn1tzO74zRTCqR+g
         nz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSTSdmcRIdNiXXHufX1dSEipUWg6cn6NLmWJSNobz6A=;
        b=KnCoHf/IgCJ5Z0D37DSGzloLA6R+dOUsM4LnV0MPzNUIJ2bnpcDzpIIOla1wXSBWMb
         D/MNsofkigRklIkbddtJhd04ej/7HF5WUUqgC3Q2w16quVAnTntyplk2/MHHNY+ggyZQ
         kxMOsnSpzGRdfkVQGRTnSfolCguQ5jrgRknfLqxLoApFDABC0FU6kNw4jYY0+lNq543I
         Vx73ugg/0OT7fPOjQB6DBeuj2GtscT6XMZ5rn+VkMhnT78bxUhu6SG0r/yUDHw+iQ2ZK
         AlS8rANxBWizStB2TKgwiqQ2C6NnnGIgwuAtrmu00PIffBvczF0uDXR45u2y847GDZB9
         uM8Q==
X-Gm-Message-State: AOAM530ofY7W8fM6xgZGk0XfNpiPmuZUDrIKUSICkBIx4SNLJILwB3gv
	qdWD26lbhCMmtnT18ARTAmbjVRBW1HS7uA==
X-Google-Smtp-Source: ABdhPJzJPg9koxS3OLr16kg/yP5qcKQx80wRUtx9ZAZxxQGlnqI9/Re2pIqd7B+/6CF8ArKkbxLi3w==
X-Received: by 2002:a05:6a00:2308:b029:28e:d370:d435 with SMTP id h8-20020a056a002308b029028ed370d435mr5872991pfh.31.1621536452599;
        Thu, 20 May 2021 11:47:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a746])
        by smtp.gmail.com with ESMTPSA id n12sm2450844pjk.48.2021.05.20.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 11:47:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libxfixes: Update to 6.0.0 release
Date: Thu, 20 May 2021 11:47:29 -0700
Message-Id: <20210520184730.2957974-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-lib/{libxfixes_5.0.3.bb => libxfixes_6.0.0.bb}      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.3.bb => libxfixes_6.0.0.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
index f0e2f606ce..af7426f7bf 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
@@ -6,6 +6,7 @@ provide the minimal server-side support necessary to eliminate problems \
 caused by these workarounds."
 
 require xorg-lib-common.inc
+SRC_URI[sha256sum] = "a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c"
 
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
@@ -17,7 +18,3 @@ PE = "1"
 XORG_PN = "libXfixes"
 
 BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "07e01e046a0215574f36a3aacb148be0"
-SRC_URI[sha256sum] = "de1cd33aff226e08cefd0e6759341c2c8e8c9faf8ce9ac6ec38d43e287b22ad6"
-
-- 
2.31.1

