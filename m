Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.8506.1604191474030018349
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZIHzsz/l;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id p5so13710714ejj.2
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xkon13AzfcOLtgc8AUppK+dDfVdlb38GpvUu3ENhGa8=;
        b=ZIHzsz/ll1/KL0ok4zaCXFqm1gYig/j5eMmN/M6K7Qvp9IMcyNFJjlFtYYPJWpvgGU
         sWqZQGUdTQc2uoL4kOdnHvqrlEdiHvuZYNnMfjY71enQCF5TWdm0OawQ0yGloxni9zkc
         /f3AQqLfUjBJUBpbSVjcNU8RJ+gRZvl3/gpC3l8HMM5TqYnGPqTgLRhh0As3cb72/ieG
         JP/kxFI1CP3YoFUxd2z2p/u4LPq2ldaZVa+bSK+jTpnETw2KMinaD0NiD2bx8Q6hirO8
         0TprwcxzS1hHPnrOsXqQiUZ0G1ue6HEe+LSNkCdhiqXTjDvW6OxkHTxk5XSTa14MR0kr
         cqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xkon13AzfcOLtgc8AUppK+dDfVdlb38GpvUu3ENhGa8=;
        b=cNL6d1UjTRHX5FBn1xzl422Q/LSNSzgfYtxLSiPGJDBT0qBIjQbmO1+CvlwEB39a65
         ehLRLnymbo+RZ6Tebh0j4ucWLQxTsEiIDUzPZQ1VzW6MwpliExgiVj0JfDLjL1osvvtP
         d+lKvEx9ESTkEgbtTniRT9nN/b6/9mEabEE5BtVzcDZDPT5EgRzOlbDhGlB1aQdNK9xq
         3xM3XvEdUcMN0V1PY1bniAa3B6X14lIV5mVr1Eo3jDgz/hBI6UC+IwHw0hl9+kZFzx1Z
         mDolA4WE4uu6i4JEhJEwdcRJjCw5Bs4GTnIF+lU/NQ3zEA17O4JWC82BO1Av7BJ/aiQZ
         YxrQ==
X-Gm-Message-State: AOAM531ZG/W7b8nGRjLIh0PIxn5mPn8FHAwjyJPNviVDKDOeBDvqB9A6
	R9oimqcqy6i9QoTbkqaA2MGoPwMVkuI=
X-Google-Smtp-Source: ABdhPJyAoX1r71GasqqVa84sqsZM8FVNF74FUmcjlflblzhQyrZgtjrJnspqKLcFrNWF4zZPL4HGUQ==
X-Received: by 2002:a17:906:3582:: with SMTP id o2mr8933035ejb.518.1604191472263;
        Sat, 31 Oct 2020 17:44:32 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dp1sm6134768ejc.74.2020.10.31.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 07/12] gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:35 +0100
Message-Id: <20201101004340.4019257-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
index 2fdefc925e..98355a1b75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "eacebd0136ede3a9bd3672eeb338806b"
-SRC_URI[sha256sum] = "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2"
+SRC_URI[md5sum] = "d08fb5429f102d5a3f1eca3dee2a0add"
+SRC_URI[sha256sum] = "d10c5eb1a00a91de97c85c0956c663aa6e99d268195cdec4534c179b831538ec"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.27.0

