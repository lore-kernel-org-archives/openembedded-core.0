Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.498.1621543745196623296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e8ZmB253;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so5987788wmh.4
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyB4WzCFvGPDeEXvldsDD+shaWX003ihvOQ9Upt/fvk=;
        b=e8ZmB2538Rz8vwc+SRbMsMrfxKwPDEy6g3gFcsMoTd0WDZwuYwNQq5kiLkVmxwN2hR
         lW/LUTdR8UczYRbuwQVjsVTegwGbPa3rnJOAaM+4+V+pBbSYJr4leaUCN71h7/D6Y84X
         cwJdzriP88cMnlet1qwE/cAOMBeeJaKOXI1CQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyB4WzCFvGPDeEXvldsDD+shaWX003ihvOQ9Upt/fvk=;
        b=DUVT5SCyeoobdASHkRaIudDQkoOO4ltTaD+5FxDfyacRYnmtBlq7QgzJ4k/X+Fg7vf
         CPuCBRaXSQ75O1YGzYBIDzhS2VM07dWyeQ4xiPUr+hqqPRpRYZCSdagyqRxVjWe3i2Gq
         uTEYQ7A8sxBx8MdfRux/+D7Cq5uMA/XrX7KkrPFIqtIBJl4a/9Z7tKZ45xVmNTsp+VpI
         DfbIgwQNpPUp8QA/Zy7qVTMlaCPOtvCx+ddCFJZ6Dy+21geN8MfJHoHSRpjmIlr6xVYg
         kPGuhsR+t1tKFDBNsjttUEJl2V/R0hKvyi2n7GlbZ0wIurbAylD30Zk86iUOi3qjOrlm
         aMHw==
X-Gm-Message-State: AOAM532++yeoBZrRBwSQbPeDrV5Pv4iDWujJn/iknvolXIF5s+iRd41A
	4J2GjbqlR3sg+meIONrtAsWi828qqqWeiw==
X-Google-Smtp-Source: ABdhPJwL8MRoatYTs53VpxJ/ziAXVZS+J1iPEtVxsCoyikUD5ukJ0+meQRpvuXxdxYn+zz4gmpmL0Q==
X-Received: by 2002:a1c:5582:: with SMTP id j124mr5497246wmb.0.1621543743492;
        Thu, 20 May 2021 13:49:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [hardknott] [PATCH 01/28] uninative: Upgrade to 3.2 (gcc11 support)
Date: Thu, 20 May 2021 21:48:35 +0100
Message-Id: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

This upgrade builds unnative with gcc11 allowing it to work with newer distros
using gcc 11.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 05b79d14c3f..740cca0ecfd 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
-UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
+UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
+UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
+UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
-- 
2.30.2

