Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.93.1603837797796614101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Rkry6icV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id z1so74732plo.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3tOiUEFXt9pyKNH4VJAlOwMNo0kqs2xaE+b4C2QrNDc=;
        b=Rkry6icVkMylPHLHSjcapE4ksQfoQNaJZo2quL59H4gnBWE925OPgTw3mOnLNuUQ9l
         cmqy497aokigktTy9ORkQfdCyxbDKjT/tNPkHWPF2JSIpK9rBrONWAJTEi8SqPw1c+Vq
         gh1oFbxIlNXwuw8oZmS8VYWE/4ehl/iuh+DsfeRhS8xN3pPNJ2rFxtj0nVUTmeBnhVQ4
         17t7qufUw8PdR+8GjSEY/jzTKLqxvaS1lpHkGXqvPhn2mkXB20EVzuHqlKbo41u9XW7p
         9UFkUUv/a0kkXePY4fkFwhlTyoL37AiL4wRgJW8pa2fmIBFfdz4Af+QofRFtBO2LvuCe
         WuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3tOiUEFXt9pyKNH4VJAlOwMNo0kqs2xaE+b4C2QrNDc=;
        b=dE3dBedegv+0XBeBo7x4A49AwniIdfiPtzgY6v29bQCvFimdnG2hq3jBuie64KWysf
         makONbXW7NfbjxlqqpChv5JJ2BkuXpMc/UYFAHElBuhg3gFf4YI9ImOvnBw90AkVU16h
         bsgxGt4hEqj8x7VIYt/Gk0c2OP5D5zAlOpM46oC2sj7us2B2pp+UTGjjpcLsZCtHlfpR
         aD4U6oFOU3bL3yAkKqlxjhJyqw5chT6A+7eGhTkHvGlJPHm7/El1QoFIkHiPvL7uPw7p
         T7NZlYagrh9mW5zEzHFtsXl4rX9h3AQq8IACrUWG1u6lA3AEiZWbRWzQBgcQjmITcCcK
         qsoA==
X-Gm-Message-State: AOAM532sJeJzc6XUBoCThze/FHQI4aI6FBmtldnzL2KG4659/9mzMkuL
	dRWkczIgYGyiGHNymnj2a6y85DCCXid9CJU2
X-Google-Smtp-Source: ABdhPJxahE7G92CKAWpofCiiRV/k89xPzQkjNa9y4fSWoiOGDKgzCDVr4li2o3wWoofrP4GMC9lKSA==
X-Received: by 2002:a17:902:56e:b029:d5:d861:6b17 with SMTP id 101-20020a170902056eb02900d5d8616b17mr4321685plf.17.1603837796932;
        Tue, 27 Oct 2020 15:29:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:56 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:15 -1000
Message-Id: <38954536906616663b446cb5074c2db2bf3246f0.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
index 1bedf25128..9d9b1b8757 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "13f7cb6a64bde24e67f563377487dcce"
-SRC_URI[sha256sum] = "191de7b0ab64a85dd0875c990721e7be95518f60e2a9106beca162004ed7c601"
+SRC_URI[md5sum] = "8c9b5a4d20afc04bc5e1536e81511f27"
+SRC_URI[sha256sum] = "77200b3c183fe97cd987deb5544e615873cff5e98ec87573583771e5f1fb9ebe"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.1

