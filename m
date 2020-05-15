Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.15868.1589556737242934834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 08:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SwEiHO6I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id g12so3124143wmh.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DIfzK+oO+NoQagkKTLvIuAVnNC7X5vq6rMSJ3dY7kvY=;
        b=SwEiHO6IeL41KCcn0k/VhlAsOVIWDafIlcSTVG6pMwLpbp2YNimMBeMTmbPzyf+q7r
         /Zhld2CCVRszR8hV7zM83+FPtnUiX5IzL3xz1N7fc0rIPMTE71rwrcXAwcxTW9Tyfus7
         kuzbitSwZEiEFsFX4cq7L6LCk7lGfSSQSn1oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DIfzK+oO+NoQagkKTLvIuAVnNC7X5vq6rMSJ3dY7kvY=;
        b=UwMFju7hmbr7u6r99aMDMnbv44qRxBVrpWnvZZHlixZVoQCXRH3xV5bP8jS8kQ/84N
         HWJv65QVVzmqaMk00eA2N9y7Hj7eRlqBXCavRJkBDnbiK2NgiSNOc2Jgc8fi9Y6EpmMe
         bQWMKqzhObT0BgdCDMOVBR56+a1z6AVR3oc/3eXUh+qzSd/en/FRXnZG02YNvqVEJK75
         6rlA2ga6NOGJzrHvLrjkxuKsumtMmxEkcUtM0c09F9M4553wPCBP/3y0RtDKOWCuQi/m
         pEBIkRLHXvdnT59pGkjgQaxUW+iwttyxhQx11saVJrzTtZkI4hdyAk7V47/EGAwgtY0L
         SEyA==
X-Gm-Message-State: AOAM531XH5n+Txah3DabPxFLzC/N5MFAHNI2ONnCOgD1LXw6FO/yGBIG
	BB44H8JKECSyG2j0HZom1AlwvyBnoaA=
X-Google-Smtp-Source: ABdhPJyH7dgZmO2UrvtNOecbpi4OyiPQRnZB/oEy6mEbyRCacLAp35rD81lxTctrv36k0rQgaLk7KA==
X-Received: by 2002:a1c:384:: with SMTP id 126mr4689665wmd.58.1589556734568;
        Fri, 15 May 2020 08:32:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p10sm4495443wra.78.2020.05.15.08.32.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 08:32:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] ghostscript: Remove leftover file
Date: Fri, 15 May 2020 16:32:11 +0100
Message-Id: <20200515153212.3171648-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should have been removed in a previous change but was accidentally
left behind and points at an invalid directory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ghostscript/ghostscript/i686 | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 meta/recipes-extended/ghostscript/ghostscript/i686

diff --git a/meta/recipes-extended/ghostscript/ghostscript/i686 b/meta/recipes-extended/ghostscript/ghostscript/i686
deleted file mode 120000
index 87aaca5903f..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/i686
+++ /dev/null
@@ -1 +0,0 @@
-i586
\ No newline at end of file
-- 
2.25.1

