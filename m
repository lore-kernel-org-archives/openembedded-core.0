Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.20726.1621847658825371420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODK0XuAF;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id f18so10509431ejq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vFKu/vzpRgWvsFmSCDB1d+tdKiYczLblnSKo1I5zbqY=;
        b=ODK0XuAFJ1oM/Eix8/Bg996Zet1bDMUjwEsohwG4JOWR6pmqBRbuYgsHwpCBX/Taed
         OzNib3LIRY6MpID5qscCyNuBW2LCCp5mVdCx+TzqfkEBBeLx1UUYUbeOC3p3yEkhvU9X
         saoZEW3fCGd+IlJsVdlOBIlwEXeg347KSXei+Rt06uubgtZzfHm9iQPSDzgvbObkKE9x
         63WMnFfUJPUo2qecw7AQi3K8+/QS1UE3753733dr+ACKeKOvSzIOGMlpkPWz5AHLuH+d
         iqfDyIyxiYtIhx7QzwrpOnMl/mMREB4As853NNvwOqhgYqnHImNXUku2t74MQ3w6dhRA
         VoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vFKu/vzpRgWvsFmSCDB1d+tdKiYczLblnSKo1I5zbqY=;
        b=i4ak5V0urdfDSK2TMXlvZUbIJRUmJZ5FX+oYG4H2MfqY4+d6F93dDvchmc1Jy2a0n3
         FpGKODhE5ZFf1BhJ0zxQRF0mHdy540FlrYTJs77uWbdNHGLPEUbeWDbfsiDi3RvusJIf
         f4LL4QMhpHF6AQeSRFava+1mog+dzB/H+F3JWFjp6w3GS7rd12HQbOMqZEg2hUGF3RTW
         Ia6U2xyOOIXQLjaTnODjleyIK8hpZxb3k8cL/w4BJnJxyWkyc+iGcDoJuK8szvPbTBxk
         qYFnPWaKbufdIuOGLHjCZqX3i1jIvDYoyeJOJcTPgrP861qnOxpc6qNBrppjvuiY2KKl
         NbKw==
X-Gm-Message-State: AOAM531VkI81E+BYRewJVSmjU6WCa1v1sUrXXVyJjwTQNycNwDC/jhP4
	6siH3Uo+vulKe+S6jGd1X5FTNCpSVJI=
X-Google-Smtp-Source: ABdhPJw4Z2XAa8jaFNzesP+8PdBLfzHtNsipsiC7XHVaYaFEUOO3PyNoZr3M3IOBWVBO/PNxgAcEpw==
X-Received: by 2002:a17:906:1cda:: with SMTP id i26mr22783660ejh.412.1621847657505;
        Mon, 24 May 2021 02:14:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/21] harfbuzz: update 2.8.0 -> 2.8.1
Date: Mon, 24 May 2021 11:13:45 +0200
Message-Id: <20210524091347.419253-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fontconfig option has been removed upstream as fontconfig
hasn't been used for anything.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.8.0.bb => harfbuzz_2.8.1.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.8.0.bb => harfbuzz_2.8.1.bb} (89%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
similarity index 89%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
index 6e3fed7357..2353633071 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a1079fd021adaf5683351f34587a255975cc3bcadba31246ae40ebebb95ecd42"
+SRC_URI[sha256sum] = "4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
@@ -21,9 +21,8 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-PACKAGECONFIG ??= "cairo fontconfig freetype glib icu"
+PACKAGECONFIG ??= "cairo freetype glib icu"
 PACKAGECONFIG[cairo] = "-Dcairo=enabled,-Dcairo=disabled,cairo"
-PACKAGECONFIG[fontconfig] = "-Dfontconfig=enabled,-Dfontconfig=disabled,fontconfig"
 PACKAGECONFIG[freetype] = "-Dfreetype=enabled,-Dfreetype=disabled,freetype"
 PACKAGECONFIG[glib] = "-Dglib=enabled,-Dglib=disabled,glib-2.0"
 PACKAGECONFIG[graphite] = "-Dgraphite=enabled,-Dgraphite=disabled,graphite2"
-- 
2.31.1

