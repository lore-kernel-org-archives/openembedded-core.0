Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.18813.1603023031858363354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FQ3Xw+i2;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id y12so8329744wrp.6
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=FQ3Xw+i2H9XtsGJSPXRMS/bLY70f8g+iKUT+euafyY4Pme/Il4O1FwLB6TelpD49Qj
         sLHgt4nwDdyTY5R9iHGfEz6BV6NCaCwbdHZ2vxprcE1Ec3TQwAk9BAlvG3r2aQzKl8T6
         m8xGwaJcIAzhGhMmKHQXeYYx0v0SPn/fxOHmwqJpdajODWRQCzoDb5YJdLj3ENeykG8P
         nmT6Se3haBRbXXE9pLV7sjpBzQfpnLGKLJunNBpp8Huz7PXbZn0UTMmbTveAiiOyOWgu
         uquwIfrh/XzT/+G4SSBznXFzeVyufbW8FhMyS9UXoDF87yWCeOm5ZUPwwKHemwG3yeI5
         Vr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=Ywq5tlQ6aNQsHk6WXaLah/X3/h+2r6jTGP/Wye8otqP02PNkGELy8QDdEIBxOaicDB
         v9Ji7XQDJy6xQJ9isP0ypwI89kAG3HcsNk9V5uX0ekEJFFLKoB4KkbjLJu4wkUcX9cqr
         8JblhfXYc1UPmp//e5SmsiJLpoSZKuL3FAJFBJUST+0a3MSCtjQRJppilfNQZ2CFuHHC
         K+5xw3y9wK5YqWFn9wZxy/Y03QEGucBdF2uYZdnNLzJ0QNqabmortRfb534egVbUE0OY
         aEipNGznhUFAz7pF7hWX0HQVin07zK57q33ZnFBm2mGlQ8slCB/b7Fpny+iJZsN3YTs5
         bMww==
X-Gm-Message-State: AOAM530Cra1x1BPdRsARW0bPPnjjxGkXh65XZKI757nnsxu+TdqyLwis
	DZc4MG7UrxJ3IL60AWlPNgZ3U3E4bObq/w==
X-Google-Smtp-Source: ABdhPJw0u9xFvryUk+2nmMgcjzFAzp3uneOdkvC+fXfLtbDLx+GiXiFPI0wO61dtojeRGCnjGPadRg==
X-Received: by 2002:a5d:6ca6:: with SMTP id a6mr14564352wra.348.1603023030222;
        Sun, 18 Oct 2020 05:10:30 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:29 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 11/20] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:53 +0100
Message-Id: <20201018121002.1417335-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ns-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
index be10800389..d38550c352 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "01d3a24152cfd5eb27b1787d44b524c6"
+SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
@@ -32,6 +32,7 @@ PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dsidplay=disabled \
 "
 
-- 
2.28.0

