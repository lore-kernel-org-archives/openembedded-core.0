Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.8558.1604191471889706464
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ia8v6ZUK;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id dk16so13085853ejb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qnhdLxA1aD0+5fkp7g35s1nqUpcvg7rQq14FzwDYX68=;
        b=ia8v6ZUKQPNHrW/htv4QSUXn51V+t68wNO8VYH6X00Kmovdt8zZfqqdnZoeea4yleQ
         0+oY6Em2e6Y5aXliVD6F6PNF8nhs5jKghf23SKsYdS6lfa6kgam+ZGwwLAIkBYB8Xdto
         fIbsUNFpSGBW48VnJaiBOzndmLoCuDAIbZ4im/BdjdJFzM2APvYgrEpD6zTanoDfStaM
         qljKouF6XLKvq4Le6udHy2QyEWYqlls8LaPfQS4JxCoZwZpWnFkOu29pf78f3kx0X9HY
         hFaCiDuOPROtkm+NjvbBXb9sukqWqoLZLOBIwte7m2bv+3ea761uOFORyvFEexo+i3H7
         BTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qnhdLxA1aD0+5fkp7g35s1nqUpcvg7rQq14FzwDYX68=;
        b=pTD56Z+FBcvKw9hbAvWCo0mVxUcibBYdNz060Xi2DDRpJ9IoXwvMMG42z31hHCy9Di
         ALz0+D9vj+XI/QFgyG87A7O3hOcWpq4+GhXSZAkOcwu/QWL7mxo4eaSYTlSXK50jltk4
         tTbdweIe0Lv8YsbbMTk3YzZaotbpcKjzVoaaIuPj2w3lF4F0jSJnULrOCsB0H4mEmU12
         +33frzs39TzJYItm3kulaIsE5yCi2l7MBWHVsY4Q8QC1WlYsLnWv2G43yK5kHeHuAJ5V
         Yu6XJs2/90R75BG92nrGNbE3tDZVPKAaphaeog5lVPQudL/Csd14DTmu/Gydc53EERxV
         mLVg==
X-Gm-Message-State: AOAM533pxsZJVf9DLMx8gpYA1Xk/VtasXiM88wg4m9c5YVaPStgV3mAL
	Ah8LydHDv/DoiU6HstAWrGcqT0UcAv4=
X-Google-Smtp-Source: ABdhPJxoo67F4vmD8lQWS6/+jAC8uO8p2OI+kknjWdt155j+kceaM31ffbSbW7Zqn8+2Zxg/MXSkKg==
X-Received: by 2002:a17:906:43c6:: with SMTP id j6mr8981675ejn.547.1604191470285;
        Sat, 31 Oct 2020 17:44:30 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id sa23sm6121899ejb.80.2020.10.31.17.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:29 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 05/12] gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:33 +0100
Message-Id: <20201101004340.4019257-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
index 99176b2571..ffbaaf425a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.3.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
 "
-SRC_URI[md5sum] = "ccc7404230afddec723bbdb63c89feec"
-SRC_URI[sha256sum] = "f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74"
+SRC_URI[md5sum] = "8969ea1aec3411c13d0e7dd27ccaaef1"
+SRC_URI[sha256sum] = "84efe57011658f0a53a5d5b20f64ef109f5105dccb0808c21e069e946673514d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.27.0

