Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.393.1600445738617983766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FFDr5lnp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id l71so3761847pge.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6JDdWUEEVSIlJ5wRmCry9N1nZooDA/Acv2ocF7L2XBg=;
        b=FFDr5lnpqCOkVM+AlM3SEXzhzva9OFUJelrPE5qn77mr0MIyLt2/eh9MDqn+l31ceI
         iUXYGF/qsuKsVXU5wHJ5kXONdXvUoVZtVGw1faTesD68M++xOY1tKysiUxkjVjGKSoBk
         CYkX9EEk71cWE1cyLeiKdzDMTdgW6lHIY8xp7J3Ma37hXWAZzs3CkHA+4YwWKSVxcU3A
         DOzQFPQCEItexY3THPf4n4sjM4L3DAATF7ylAsBtoWz6ZyRCm8UyBdz6JdZaUigkjDWH
         VCli8Ey/GkLlt7zgF8mWf0JMqg6i2AeU4WFTNNLYt1xha8btocMAczUqOpI3H+9286Sy
         Hjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6JDdWUEEVSIlJ5wRmCry9N1nZooDA/Acv2ocF7L2XBg=;
        b=Ud2PvmGP0++pWbWpfqErMMI2MyVLMtDZnNumM8l8+kk+leIxc6C4MYzSxcAORKNtBq
         bZcX12Gu2RnjvFL+GE7tmkNps/XKhMH7AB6TMuHovizZFvQzW17J+P9c7g7cyNP1bpoE
         6XaaBAXCBKQJ9po+ev8r14MUAkbzQwHRdr72/GrFbTpPMBxwLM+HdHulfAdrLpZxLw7n
         eaPaZMMrBa6ApVudSYd2ZFBIwGcneb+ZdMZtpIYif/uOdLfhis9pFEguldkGJX+eOsO6
         eIFMtGAzOHc5rhhpgKPzV4F9dVC3m2137He9lEB3USzbqkmgZ4gyeHtShRkAfDiPzt+I
         foHA==
X-Gm-Message-State: AOAM5334XPXoLZ9AsiUycbvPPKOhwrStDx2Ehg+1fqPpY6rkVvAEX+uM
	ijIrLsKfYHz0RID3LOJcxJJnQOUWBpgXfm/DPcM=
X-Google-Smtp-Source: ABdhPJz24H/EVUT41n8yJb9ju8r+Abn7cbmtKYyufFku5IpQgKgEdhk4z/OrxpwJqkW7y+zzJ+qhPQ==
X-Received: by 2002:a05:6a00:14cb:b029:142:2501:34eb with SMTP id w11-20020a056a0014cbb0290142250134ebmr16417240pfu.68.1600445737680;
        Fri, 18 Sep 2020 09:15:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] libubootenv: upgrade 0.3 -> 0.3.1
Date: Fri, 18 Sep 2020 06:15:12 -1000
Message-Id: <2e646f0aca9a0af7e308590117c220c940996d86.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600445624.git.steve@sakoman.com>
References: <cover.1600445624.git.steve@sakoman.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This is a bugfix release which includes the following changes:

824551a Prepare 0.3.1
ca6aaa1 Fix file reading/writing when the environment is in EEPROM
a031dea Fix regression in UBI volume support
c91c150 Define SOVERSION to indicate API version

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 447eb941ef43cd5af19aed650fb7da718cedda61)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} (94%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
similarity index 94%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
index 07711484ac..613e3161fb 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
+SRCREV = "824551ac77bab1d0f7ae34d7a7c77b155240e754"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

