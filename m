Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1014.1586282758935851206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 11:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hwwibfQD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id h2so2655757wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcKBEFRfzjAhpwUuM6MvCxdvYz4LlQsTrVZsKEU+Z4o=;
        b=hwwibfQDZ1qqG4wFcvZbvG/d1d542z00H99IN6JdXjoDwXEo08eg65j4i1I/M9rBCv
         lc7+8OGfa6zqyaKcU8IkUR5k6ly3QiJJ+LD18Quy07vBzr2zdfiQCpcfH9NI8PUoCn0z
         pTMZ8xL5xX1/0ZUwkXhVrR0PA+krJ1x0Vf9FMAPocfL+XO+chqoOqdHfLdYCIWY2+9Ww
         TWGX+qpxsrVMWDZdQWFYNM2UolvsmTs8jSiJadeseEXkzhdM02rojRRDAlcMZGhNUU6N
         cwqfkaW7NlxLLxVDRHJYD7IeIh+Dns0phI8Uw2cwNagMdFJoEYCbqBwEsZzUs059Phes
         E5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TcKBEFRfzjAhpwUuM6MvCxdvYz4LlQsTrVZsKEU+Z4o=;
        b=mAq4CvaK1VT6E1ImfYXqXvtdDcL2/bKGfpN5woAeBt3JGmwLE8Zdw3n8J5Cw0sWTOi
         pPcneOIg1D+oQl2RBaRAlY+9AkVBjKc1pLnqALVrFTMiRdOLGbugJFRyFo8fq85Md9yu
         R7KaGMSoDLQc9lbge04d42YaUvDFQ2mNL8J+eKPEJcllLpOtgE2cbLwRysBWj7uLs/f3
         MUl9GDVyLlAZicpk9weotGAOwSAye5Stme6lqocc9yPFsecpRbu3sJOZJSBFQBtpyEHM
         TByEBSugwVEXJ3SItRrP3shkJl/N8j3X1CdNqMFmHi6DpNb9GmJEXT4Fqp43R2gXc9OP
         0chQ==
X-Gm-Message-State: AGi0Pubc8kZnsSxTMIW4pRwzlSvSQA/E6Tbv7EoP2IyoEDrTdUkIPPQ3
	qRLRzeCG8icOuDffJevMaTlj8IcW
X-Google-Smtp-Source: APiQypKRaI2DYA1IVeULYNW6YbK9x02XQx/+8CnilyOeI7m+Gw88fKh376tYA7TDMIF6B0xBJ2Yjxg==
X-Received: by 2002:a7b:c94b:: with SMTP id i11mr436840wml.113.1586282757228;
        Tue, 07 Apr 2020 11:05:57 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id f25sm3307554wml.11.2020.04.07.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:05:56 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch] libubootenv: update to latest git hash
Date: Tue,  7 Apr 2020 20:05:01 +0200
Message-Id: <20200407180501.9505-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the missing feature 'negative offsets' which was present
in the orginal U-Boot based tools.

git change log:
* f4b9cde Allow negative offsets
* 45bf92a Detect sector size if not found in config
* 9f59db6 uboot_env: remove unused variables
* 65d243e README: libubootenv is now in oe-core

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 7a7ec4c885..3251d0f05b 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 
 PV = "0.2+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "ba952d05ec9ab16029816a06d956bac7fb4e9832"
+SRCREV = "f4b9cde3815abe84a98079cedd515283ea08c16b"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1

