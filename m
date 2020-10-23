Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1046.1603478648805244631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vdw9XYU3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id w23so1616677wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qiKABGt8x2VWeT8C2jkrjVi86hyGcPYmwKi/AUwAX9E=;
        b=Vdw9XYU377k6Tt0a5ChKIIHGqbysH+DzC86sPYf7kQ6UgX6n8mDAxfOUiwYnnFveAs
         ERvjwOXsQ0nJCMHgh9d7gGPMvIdXXVzJehPHF7jFA/KTwjieHXjP3yCOTcKeVFSxFeJK
         1egUttG0Y5UuhAB6K7NXycue7wNinUQXk44br5pxZsT5I0Yl28j3rJjN6cj/Ykeeovnz
         LtJp82Vhn86p0NfyTvMUOkJG0Ou1MPmb2S+L1hDox7zCnIymQVIb0vIA/hGXj8CSV7Rl
         FpAN+5ELUuCdZYCv15y4FPwU7c91ryAhnT1G6OefFkDy1PjgA72uegHkhWmIfDpbAba9
         +R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qiKABGt8x2VWeT8C2jkrjVi86hyGcPYmwKi/AUwAX9E=;
        b=JfLI5X53pseYarqa2FsAmgOanCuivrTH2lCe8R9Y3b5LvfYIi2EQrC+1eHqAXhzB2P
         WFyXGpSBiWeavvgmzGwzFF00BmeLOBEEYzvSvrwm7RoM8xf8g8vtCEO73sZ6/++wI5u8
         yTC3PD9I+2TwVk0oStNBZ//HFPqRI/fwZdoISBDJtYK/VK0ZtL/l6p3sVoAE/6S2iD8N
         oQH1DP1XRVixIAmNiBLqEhHwNB5AaoivxvJuNOpG0tYKLT73W0XBFdxkOU1IOrMwg9CB
         VCUUOJs11VO1GT2FBu55wBoW/SMW1ex9a+EUKvnwk/FT7wBBw69cL/fbAAscWedYxvl0
         LDbg==
X-Gm-Message-State: AOAM531QbOR1Z08lpBsp/owobab8cT8wd36x/8CE6skDPiN2zp4/ehvA
	CHXW90nSdjYZTRtlI90sPosukEYoMgbhOQ==
X-Google-Smtp-Source: ABdhPJwv/9vCvreVyRxvM4VzVRIdVgkKLlfRDYKTngKzxeH/SkI4Z1XxGMoI/EJAbUJT0UoX4NeoNg==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr3622396wmk.88.1603478647116;
        Fri, 23 Oct 2020 11:44:07 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:44:05 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 20/21] orc: Upgrade 0.4.31 -> 0.4.32
Date: Fri, 23 Oct 2020 19:41:31 +0100
Message-Id: <20201023184132.3208737-21-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.31.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
similarity index 86%
rename from meta/recipes-devtools/orc/orc_0.4.31.bb
rename to meta/recipes-devtools/orc/orc_0.4.32.bb
index cd4dc31d70..a55b43b8ef 100644
--- a/meta/recipes-devtools/orc/orc_0.4.31.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
-SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
+SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.29.0

