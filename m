Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.9542.1603981702396389427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MzXUu3qh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 13so69012wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=61BC/Tqr/yzgNIo0QJSajrJ44Thprds/WW5GFwEa8KY=;
        b=MzXUu3qhwqaGHxtDYTD0vmHwlHeTtoKeWnqsTiAC9oRJ4Oo0OktHYn0O8+nJ922way
         o5Dpy6dadXesMC0VQ7n+MnKeUvZ6WD6ZCw6O5knKOXBx758aVew83PoaxJzw+pNZ4W3G
         l7R8vySt1miJVkx070Z7fxqtZx/WcDzN64wK/WkbkMBEwABHVyQW1WmwtuUShuMwMAuO
         hTBct5+AHN4LdY7YvID3AdEQGPzmiOHlBMLv4jVVXB9+gDA98/yPPpQEJceN7I4gILrK
         dxlufju5mEPcks5HC67DEpJrmFmoUVPU6np1a3JkxZtxsMFSdH5vVdr4ofJ3ilwG35Pa
         OQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=61BC/Tqr/yzgNIo0QJSajrJ44Thprds/WW5GFwEa8KY=;
        b=fvWlGc1NzZU8UJjvCp2oe3RWQo055TWfenp5jc4uMsEpFuTfrRwJRN/7iRoboc5e5c
         YHmPSdlEXqYoPbIsnemopRp+/X1U2EMoKu55Br+vQhpo/TyTxTBthMBWvn8AwIdhwl1I
         KIRwuhZh58ZPgEKAk4/L8rrAfp/UEs8xhjUUSBCvbQ0YgikS9mqHa1I8DUJjzL+hi0AT
         RBXw4cci2jU98QAqF4BXKPdG9muVrEH5hPIAKTIHZ9+LqwLEaOyxLGoWoMS8pQ6ipRFz
         xCKdB2cAe5yUyEuh0kmK66c/nGl1IyyYuRC6w/luU104a6VXaCozJ0AdOGWtucGnTdt3
         7eKQ==
X-Gm-Message-State: AOAM532Rv5AHAcA9GdMSZzoZCQzdhf5GI/1oEAF4Ay9olF/Mf087dHml
	3GE05m4XHUzAcZAb73PBdwxKQmRXbWFuvw==
X-Google-Smtp-Source: ABdhPJysfWS0BHlPHKYMWQMESPLdYiBcQLa+UbplJqtfCrzsiNX0GxnbtZ/Ipf5WEtiO3OyNsuW9gg==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr138483wme.18.1603981700788;
        Thu, 29 Oct 2020 07:28:20 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:20 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 11/22] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Thu, 29 Oct 2020 14:27:55 +0000
Message-Id: <20201029142806.1830504-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
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
2.29.1

