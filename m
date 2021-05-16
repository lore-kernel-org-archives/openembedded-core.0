Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.11635.1621204383968136795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KsjAos8V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id y14so2365937wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JRbrtaDjCPGMsesjcDtyBdOomrx6S7WRwAXJOHcWbjo=;
        b=KsjAos8Ve5o2FpcxnZdqpfUfi9yD8ANPgocFJcFtUPPYTFY9yWbG8OQTLARwaw4MzX
         OLUVT58QkGmk1FE1bx7/PeWZ73TSWT2+xU/jGv6eHaS2nc547BFEtof9q3fEfXIdok9W
         J1bvbcNu6fFbCfHIFCoUQ9OIh+tNbt2ph4qYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JRbrtaDjCPGMsesjcDtyBdOomrx6S7WRwAXJOHcWbjo=;
        b=IJR/uzgmPcOiGUfNb6xYDwfQkvZTAX23vP2ZPJ5WvT758M3pozLtKARpZzd25itfSv
         Dr5uU0T8QKaETPDA2seFHJ2vrj/ORSu+yr4Mk8te17odwCHXqYuWcbTX3AO93/XhYq9u
         BKf8MyKhgN4s5VYdIO5uwRk3m4DW3Oo1LKnJ/hk6SE6Y/vun2nxJMeardM1pdz+5c6gz
         5Hh0MlMEx2uYDDm0KaZoKYBWWyYz90nn6pVl3g+of0Gb3nmyzbqph7CgvgJnN+UQxsPQ
         lBJVMxNVccJ5YOGSiHpx/Yb/uaqsHNl4XtxVx0B85DKl0YqrSuA9IqxiAD4hq4lsMOKO
         NICg==
X-Gm-Message-State: AOAM5310BG4KK8ZwEGPKCuefVPBYKO7eNC9vP4TV/b0iSvCtJdjQ3VI1
	vAY1Qnkdo/6ejgzejIAmYL80vi+O2qY+Yw==
X-Google-Smtp-Source: ABdhPJyBMgRmk/m9XJ9Pcw3mO/a4c5RERXdZU1/2mq+P5pvZ/Kzhu87tYvRg98HnqdaqHsXIqaTo2Q==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr24397164wro.254.1621204382516;
        Sun, 16 May 2021 15:33:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:33:02 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/27] wpebackend-fdo: upgrade 1.8.3 -> 1.8.4
Date: Sun, 16 May 2021 23:32:47 +0100
Message-Id: <20210516223247.2401235-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../webkit/{wpebackend-fdo_1.8.3.bb => wpebackend-fdo_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.3.bb => wpebackend-fdo_1.8.4.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
index d27111a456c..28b2a927a58 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.4.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e"
+SRC_URI[sha256sum] = "def59bed5e8cdabb65ffa76ee2eef349fba7b42a75dac80f3da5954b17f4074a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.30.2

