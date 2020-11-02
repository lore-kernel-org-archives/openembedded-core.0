Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.1231.1604335818319256405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryvKoZMu;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id p93so15017112edd.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ynzZt3qjaNgeKBQlF/V/FXEh8nbGIEsaTA3seAiGyUE=;
        b=ryvKoZMuk6biTq0pRkcwtLUM0u4eXXGMrT9e+hBNdp3xQmyUKDA6xDLDCjwDbx3oGw
         5RKaSIKiZrWGnFzuUFBNYzjpiCmLvzjFnu9TPpt3jinbeaADGMomulAzFMAwgbTks5OO
         sWnbEHOj64fMZ9Yk7eQn0CdLpBLbBMmB6Tsk+njaHSwTJqglIisEXucEV/wjlknU3qpj
         LdT+HcIHZMRThdAndwP0ovtkSgTrTymPtSF0wLFi1/YxqmqU92JJMb5Yw60BlfR34hhA
         G7EZWJ28NNTGPEZnRwyU8M2uhF5rY/+LUbqOu2GxkVgh3TCfv+oSokyvR5eZTtOAp5DK
         CwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ynzZt3qjaNgeKBQlF/V/FXEh8nbGIEsaTA3seAiGyUE=;
        b=drFLcjKYBxi15xApfqq21o8Er89VBUJknHVQgETPS8OREPt+SE97tIcQ/v7HKa/aJO
         Df6ufLuyLujDCVfS8LZpF8RREh0vuadfaR6uRa42aiYfRvtbMmaRxdwfw3ir6P5oe2U6
         xbrbp8ROcThEqglhXlZk3kZaJieYY2ZWHl0lXghRKk4p4Vo0ahe+olIbezA+dWKQE0iT
         wi3vbtGu9QVVIDDpPn93kzbZ2GQ4FBMwUgT7T22XIOBptgUudyIlJyBnB23p16or9uu4
         MoV3my+DfRVtW9jyRc0W/1L2as2FRdj/CgUu4uEYWybMurMzLVVAj7x1u8ryXl3sXusv
         96Kw==
X-Gm-Message-State: AOAM5314pgORKqOAKqa1/i6e2ZWukCG7tUJUpF/iHvGMWDWSABpT4HxV
	1t5+B8XJhECNlhpsmow7tip1cQnzINCtqQ==
X-Google-Smtp-Source: ABdhPJyECt/QwMTkj6Q/g0RcUESIoWU/eayT0uk0Pu4XW+0ot9f2OHo8Wtn8qBgyaa25wPMFxhJStQ==
X-Received: by 2002:aa7:c2c4:: with SMTP id m4mr8776238edp.66.1604335816661;
        Mon, 02 Nov 2020 08:50:16 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 66/80] linux-firmware: upgrade 20200817 -> 20201022
Date: Mon,  2 Nov 2020 17:48:53 +0100
Message-Id: <20201102164907.27572-66-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: WHENCE file names updates
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{linux-firmware_20200817.bb => linux-firmware_20201022.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200817.bb => linux-firmware_20201022.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
index 0abd28c9fa..045f2647e0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201022.bb
@@ -126,7 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=4d229f79f8770b5b2c4aac655b9fabef \
+                    file://WHENCE;md5=daf28db5d6353de0a886f08106cffa22 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -198,7 +198,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "76d05d5f1eff268d3b80675245fa596f557bd55ee2e16ddd54d18ffeae943887"
+SRC_URI[sha256sum] = "bf586e0beb4c65f22bf0a79811f259aa0a5a7cc9f70eebecb260525b6914cef7"
 
 inherit allarch
 
-- 
2.29.0

