Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.99.1603837790458400510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hKGjhW6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id w21so1750153pfc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DueCCfzQ47JOSAJXF4FXyJI02X9UZIaQY0CyObn9Ry0=;
        b=hKGjhW6ikHyx29X+AoS0DIoLMR+GlDcM/mlvQn8x1s1JV6g6I7XvZhSk5n8A9q8dQf
         y9MBjblfiNUEiF+x7RrmqCw7GswtzyzmiIXVfLNTxvVJRkao4vXBe8i5vCs15xo6WB6x
         BE9i2QpY004+E1cIM5H3rec/A7wH9RORKXr86uYyh1pTNnON5iwbkBGFD5PetR4P/0MC
         gpEGhg0najwCLkxgHESGi75HkjFw0LVV+lxj9X1LerFKkymionNtFDxuiunnKrLMgFSz
         4LbsIJ8j7IVdoLPZMF60HFBcoLhqGhE/p4sBGRqSi7yDYBe25dYv584PXLMTJd2O3rI6
         2OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DueCCfzQ47JOSAJXF4FXyJI02X9UZIaQY0CyObn9Ry0=;
        b=c97iewlgcD8CX/R06vL0s9SsAQsDOWyA4qivj5uC6hKk7LYdZA8twcvEBE7N725dbF
         gl52kDspHemG/gbz8m937p7h5ZJetDN8pZc/JOmMkbVqg2h2vkhkJ0tkZWhBZU39TzD7
         3VDAM7EH1QoWbw3WfCJOO+kVaP6nmq/1+6GdBg43JVsNUlfMxR40JCM2zo8Q8lJ0Znlb
         FcK5TcahETmqzSGxOh90hKmUULfPIH/e3EMx+LXgZJT4djHTgxsa4BmjpLA9Rn3bj1cO
         qFvQzm+bnaGLs45V/7+103WC9+A94iN1XJF+Ht+fSSSs8TM6bOqef3lrLIVwSbU5Mxtw
         Wuiw==
X-Gm-Message-State: AOAM532FLInxyexfmzIjIkRxe/5yZDxzpP9KDk0vPCt5Jy7OODc6lFAN
	mQCW+yl9rbDhhGrAvYgEoSIie9ek66QrB692
X-Google-Smtp-Source: ABdhPJze0vjlYIBt07ij4kTEjZ9BNzj4Y6INnXVae2MQWtdK4PlA4otydjyb9Pxh7ln8BWESp2O3PQ==
X-Received: by 2002:a62:ddd4:0:b029:155:af54:3000 with SMTP id w203-20020a62ddd40000b0290155af543000mr4530190pff.64.1603837789465;
        Tue, 27 Oct 2020 15:29:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:12 -1000
Message-Id: <8ef5803a8591ab2104d35f5d3143c9b43b6a741a.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

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
2.17.1

