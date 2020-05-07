Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.4962.1588855626907194768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 05:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KMU5/TSf;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id m12so1453629wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=KMU5/TSfHicvs/G8ebJZG8Os8u/6n0QVv6U1ZavzZ/ufL0sDNKbO9/Gfr5imBG9AlN
         EHhss2E+hFyLTXDFov0yi83sxKFuwNy6zI3pddpwcyg3/BZgxfnWTQshnrPjHX9APfQ6
         XdmL5Sh3GNzlT96j70Cgiv6H/WINI7ZgQdzLTmWt92u/O3o0p/8H83L2WNOOWSal3qZE
         QAJSH/0EIBpMu5LP91Nkzs+2f9wFpCsnuOyP1l4Y9x7Cb3myOCTQFKWBk+qmFZKsVDTE
         3T4BkwsccrFvqwkrteGs+CsM0IA6T6eKho75wtHZ9D6FgkIg+V6m0oGzsOD4pv8Nfr+4
         +tqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6wzbHLl0guFStdLsKIR8zbzySuTcFVVggYNMzR176I=;
        b=qodHuLAPDMXdU/gLxG3RKv5TEbdrdvb2wUGSkEHnd9lcMTrR5TMZcC6phXcF5X4Kyy
         RxrTRo0ke1B7jlAzuBojYF5woiT4dyZRHp5WmjS9n7bL43fvGmKASsWqy2LoScwJXONy
         1aj6vv7K8nSSXaGWy2uC1kRbnlmCTvfoX2IUdqDJZsJp4WIjsJiQTNVGnV2puabe2l+U
         w03JCxhwW1U3A8nNSEUbUPP/r+3D32tDIOeBqM4sELAWXz5O7M9fjU0+tOuG2yg+sGnV
         FQwcx65Owj1gbrJsztUgDvn+LA8OB0D4bdf0MqGmGTDgrRtQlQ8pruVSGHQiyCzx6eqH
         zFZA==
X-Gm-Message-State: AGi0PuYD0VwecZcNK13iryBDM8ydtPBZZr5IBMpNlNdWZb6V6zL3uuDJ
	WCd3fFZ+LUBJOV4/vP8/vqgcGYhY
X-Google-Smtp-Source: APiQypJrO3Z+sqN7Wq2etaqKeBuSxY/2o245NNVKsVrjpj1hUGxE4Dv5zsYw5V9J92RoXvN9v5rTbw==
X-Received: by 2002:a1c:2d02:: with SMTP id t2mr10196663wmt.98.1588855623939;
        Thu, 07 May 2020 05:47:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g10sm7507650wrx.4.2020.05.07.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:47:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/3] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
Date: Thu,  7 May 2020 14:46:32 +0200
Message-Id: <20200507124633.19377-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200507124633.19377-1-alex.kanavin@gmail.com>
References: <20200507124633.19377-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index c1c941e452..83dce86801 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.26.1

