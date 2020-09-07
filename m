Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.6536.1599512016752230007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F3ZsNfIa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g4so16974228wrs.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Qpxai7lYiRFSYHCEx/IP+pp/tfIyfMgOkxMBDX+pQs=;
        b=F3ZsNfIan35lvcMZwPQKfhAfMVS4/ARQAUeb3YkJh+QbXjFAaNIp/rYBWcbVZa8v3b
         23RLbl/4vIje9WCNalQKxzcXssVfODAAU/45vzAR/4CrIxBuqS38+vlmyTkcp9Kw8IfL
         oyxdic0DRHPan7MYDLXn/tPC0TW0Sx4rqFS5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Qpxai7lYiRFSYHCEx/IP+pp/tfIyfMgOkxMBDX+pQs=;
        b=KrLHKShYwOISacQDNtBl9IahyH8K6EOPa0MwNBs8NRytZ6zLHco4yH3HenaBA8eTBC
         N9hHMgsvQFP8B8ihIHjYgfp+tHhkUz2RPCKoWHGoRqhqvGO4uMc7dZccoCYhYq8Lv66v
         uaPK3AkywTWZBbMpPsBVkMfBEqdpV1zBZt8UjB0bP8p86/2ZCnoEiR3s1xuwmH2+B8Jh
         4enfAQRms1chcHlV9QoFkovQ2aGG6woDvlzFz92RXTGSNzNzo4Z/dkTSlcmFndQ0O1dN
         W61mYI+Xyt+rThDqVl0VRFFF7GEu6pRkr1KUYOy1xVxfzPBRgO8nFS0MwHdWZvVacmUH
         YvJg==
X-Gm-Message-State: AOAM530iwjni7nRZWqpDyJmes4kV5tSR3GOM30k0F7vgNgguw9P7Ufm3
	i0fvR5elHN/Fuiw+PQQR4ny6PxxtZ3QM1w==
X-Google-Smtp-Source: ABdhPJwO7HJUJVxTrNP/x3ZUzWe8LlzLpyCoLV3BqSjmXaxKCUPJ2ACKu+Gxbtoxn/ui18WYutAwCw==
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr22064414wrm.147.1599512014881;
        Mon, 07 Sep 2020 13:53:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][zeus 14/19] uninative: Upgrade to 2.9
Date: Mon,  7 Sep 2020 21:53:16 +0100
Message-Id: <20200907205321.1941682-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This supports glibc upto 2.32 which is now rolling into distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 889695eae34..69b6edee5f7 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.31"
+UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
-UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
-UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
-UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
+UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
+UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
+UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
-- 
2.25.1

