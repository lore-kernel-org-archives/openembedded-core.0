Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.8582.1604191475821904047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G1VJoj1l;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id o21so6641042ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GYzBbNnq2I/6ZbDEy60vunGDCB8WpIYuuSwpVmntPO0=;
        b=G1VJoj1lH2c9jefENw34WUKv1LgcQ12kWhaPxXx+XwMKfAufivyLtwqyFFvbYS6avp
         TyllURaaauNZ/MBIXBdpkobkURf/DA067den6lx7u/o6ndLKekYQO9TIxJqOeIDfaS3W
         IzCviRc2U/qnfL+qVsVgPECkyxduO3Mu0YQHeMWfaHq6XFpO7EZxYEvF024cxtAEwufA
         15sDseprcxqKAProZjY/koJp1zq4zkOA53F3JxOrf3luggy/6jnoRpjLtndmUBjqBC6n
         dujLrqdPhTqQbypPgMfvwpiAecgsEr9DEhvDRMRcMRaTGCd3KmeZFOhL9GRh7jYnnGxf
         1JGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GYzBbNnq2I/6ZbDEy60vunGDCB8WpIYuuSwpVmntPO0=;
        b=fFF33k5d5viWzL+Chdq2tfd/6Eq6TvRIqr72o2oUW5kKaepD+2L995jdqGYMNuC1jT
         xKxn+SwKQ5HYiRSS0x1uQgphwVI+HiyDW/n5fvdPlcJw2ydkOt99e+u7aywy4ytwFbhy
         eys7enUpVJRnGI/0la9MT1rrX1Gd2IfD/Ucps620SwPINIquhHXeTe5r93IhA3vSND0b
         ENfYWFUBGKs3n2LBYKaIKyyP/ZzzDJowLLDOnv+aGH6z2Mc6Zf0RBQ8naeZAT7pd8kmn
         C0iFJrHWc2FvpM7QMBugooiPGk4b4tPT6r78i20CYc+ntOyoXtsZKksLWj2NE/mGrW/B
         d3BA==
X-Gm-Message-State: AOAM530QN6Ec9Y4Bob4WoNVIOhW1/cggRufJy2tk6uMxIWGJlPfEO0Y+
	3Hu9P9ALO//c9QoD65meA+IJSy7JC8s=
X-Google-Smtp-Source: ABdhPJyDZ9YGyNqi8+D/4aVn7ET5feNz0CZPNgYoVuBZ0v//SkH/bbzQv+XVVDgzfkzSoKS4rx3Hyg==
X-Received: by 2002:a17:906:2cc5:: with SMTP id r5mr9198036ejr.328.1604191474187;
        Sat, 31 Oct 2020 17:44:34 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s21sm6256054edc.42.2020.10.31.17.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:33 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 09/12] gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:37 +0100
Message-Id: <20201101004340.4019257-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...sp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
index 02c3c83840..5f1b1d44fa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
            file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
            "
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[md5sum] = "f0d8263c9d61f6f05b59ae0f676a6406"
+SRC_URI[sha256sum] = "67886b872826d513c58f88d559d4dc4aa63382d03fb64ceac91a09537fe6fea0"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.27.0

