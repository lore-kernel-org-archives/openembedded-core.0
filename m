Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.2994.1632252680131262834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 12:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=0SF4wISr;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id e15so1752444lfr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwHkotGyfy7fcuNX2Mqzw2k5eSyJBvXe7MdpA/q//9E=;
        b=0SF4wISrSUD3VF8CkXQybj8GWyILCBO2+rIZidOnMhmM4fKinLpCkZWuUKv41+WPmN
         V0k9W8z8KFA4gNpoIfB1v+gdJOdLx8zzJXMwvMuh3itWBms2frpZRsfCO3AKORoF6dw3
         UoK77nUvGeLCcK8e4SSuTOAExN1o8++9xBuqkyLD+6EBZi2yGANhrzA4kzppeNK3XPub
         ogHqI0arHaXUSFpAGp37Z/PBcN8KEPjTxJNeIzQjqB8tnhZXurGPfvA2SUte/t/ExvdF
         hoTIMlOjT8UUzpJ5rQJxqlbjcaMq28rrGq69W9ELmu15myCyrX8aou7q5LIPiRhOKSJ6
         g3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwHkotGyfy7fcuNX2Mqzw2k5eSyJBvXe7MdpA/q//9E=;
        b=Uw2S1/6+EisrFFbQ4UQjkawNnQVPMdmwLGITj78PEY3xZvxgIGjPNi/KZmA+++k4be
         g8cC4q1W4H5xw+ruT94+wbAgQGEqtUZRrZyG6KC7Rw+nxfnRPnyDq42l5aCE2tPOIG2c
         RFPkKydgdQJ93ritpTip/SXq1EiayaOWGEs/0Qh4winqa+jpkkxDIRF7cqsLxtXN0c1d
         yUqKZsZAOWRKSnYujtgs83+Ly7x7kHtrwsu8Zyrahby54Kvddgfgq9YecP4lZc9RWvld
         VRAgxxwGii1fJ65v/aEkhLnkWRTRWBHYQT5+wNBRMjMwO5S0s9Z4j4Ylz06+gOV4S6a3
         tM6w==
X-Gm-Message-State: AOAM530L1RRGYfMgPMKaS9iUn7i8nbUJ5I01zhW+GE3RbVu8+qVnfCiI
	a+aqsyaZTlCAh5IXJd3my2sXUPRgL6NbDIr0
X-Google-Smtp-Source: ABdhPJxqbdzTBkG3wnCJlflJFsN33OZXIRIsXBA8fAxtfSUhjg7N9wWTSqAPolJesufLpbC+zeqbvw==
X-Received: by 2002:a05:6512:3257:: with SMTP id c23mr24387502lfr.90.1632252677707;
        Tue, 21 Sep 2021 12:31:17 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id j24sm387713lfh.302.2021.09.21.12.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:31:17 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/2] xf86-input-libinput: update to 1.2.0
Date: Tue, 21 Sep 2021 21:31:11 +0200
Message-Id: <20210921193112.2628135-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...f86-input-libinput_1.1.0.bb => xf86-input-libinput_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_1.1.0.bb => xf86-input-libinput_1.2.0.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb
index 3b5af3fae9..b0168df8d1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.2.0.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a22925127bd3c827c384cedd23ed2309"
 
 DEPENDS += "libinput"
 
-SRC_URI[sha256sum] = "e11d2a41419124a6e9b148f1df181bf7819fc7398c8ee9a1b6390b0742c68d16"
+SRC_URI[sha256sum] = "f80da3c514fe1cbf57fa1b1bd6ff97f6b0a1f87466ad89247bac59cd0a5869f6"
 
 FILES:${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.25.1

