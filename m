Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.27405.1603635847163729059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zg+c6hfc;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id q5so10053324wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1I032rKbpk/F4JpZ2yQWXR/3dxU6lFUSlH9zPxUpI0=;
        b=Zg+c6hfc8QGEWM0UUX2lbNG808KNX5Dt60JsavpiBENaQdtpRA9HTFTmstgcXkaZb5
         K7fjAdEh6nWdaS60erUjdFWxbXkKoExFUHdXA0v1lHSNyusmo/80JLTrG/ZkQAh7Hu9w
         J5jra6CPH0PuWph7q8V2JXe+x7f8l/xxfD1RXsKpzen/MfrrHtyrCS3C3tT/1udasPTL
         zNhXrCRTW4Gn6s2IbJ6bg095NLpXfy2ubrrHWJEPqtu4rsPseObVEqO+Ydr3701BeKBI
         H85btjF3FitJ4SY5gu3aW/a2zG6KS+9RTbluCjl0ZrdZil71HYsfmKGqhGqqw3SRa/gJ
         hTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1I032rKbpk/F4JpZ2yQWXR/3dxU6lFUSlH9zPxUpI0=;
        b=cbjE44IstNrK8I/s6et7vN7/gyTcdIVgzR/ctNo9dcw7CubarmVCJDg8VaOlwGyF44
         HsgX3zCYlP+kAPKS0k9hSmGi0YnghHng5iwsEruPmTyNxga6/+b2RmmDaFIZXmzus+0a
         gc7cBtQvcd6Mkv1hDKDk03hKMkuStZrqrCfL5xEEbuHUk7UuK3/8hOwbNP/ET8kRlPoI
         coqOA7omgk++u2ST2qIyRrGZQxBUhfCtLnBRC21qgh0oh5flecuqidxu54wTbicuiHaK
         N9ldGk6owFbBcErJLfIYwMVjEx47wiYlCS15nszyHWKrYQ0aE2VojLVZBLstEss6xIlP
         YRlA==
X-Gm-Message-State: AOAM532GkcyYg4Vzb292PZy163atQ/9RY+Di0ozwRmaOYbPy7usfI6kx
	Pq7w9Q2wKJskY2KefWf/Kp8f0tcn2tDAlw==
X-Google-Smtp-Source: ABdhPJwe1lx9pkZHiXcpCs3hTllKARsjnnLwJdiXTTHgepS6Ob5n8LhKHzoX4jAIL7uFFVz5xO1zOA==
X-Received: by 2002:a1c:1f41:: with SMTP id f62mr11692508wmf.21.1603635845502;
        Sun, 25 Oct 2020 07:24:05 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:04 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 10/12] gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:51 +0000
Message-Id: <20201025142353.1929717-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
index f1bdbd235d..1aa13cf73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "d4d89dd44362c1d262186c60437cdbee"
+SRC_URI[sha256sum] = "60603b7889528ef8539d36cb3284b648c46aa0cf980a28cba4d3fe3a44988ff9"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.29.0

