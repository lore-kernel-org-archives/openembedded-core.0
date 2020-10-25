Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.27301.1603635840830361834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YkZIk3No;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id h7so9615342wre.4
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2b4QjNHl5cN43YbkCuHyTIqU35iimYuRJMo+fgLwII=;
        b=YkZIk3NoIlLZ19MuMtkFquTIBkDY0ajs9ecEB50+t/0VUhQPEM4HQVps46DTU3UrPy
         6XK+ato5Ur6IaZs8VEuFJNGwZKoN40ZMLPwhLMmNS0FqGvCTTB/WXCDKjTuYQ5gf5OJd
         YBCsUxipiyi8QAiezzo4xuwvZIwaNV82b0GszpscMHFfw2Mlf6wjO7M5mkdb4rPm54Gs
         x25JrCpPtLc3xo5au7QhhYkL+Df677LoOakOEzrmzINd3jGKNIIyXB/RkhoRAosyfFwM
         gqfMztaTWuY2fskbIOCQ3M4uDaff4s7TDDHldSxaJV8cpd5wh747OiBg43NjrJu8/zGb
         y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2b4QjNHl5cN43YbkCuHyTIqU35iimYuRJMo+fgLwII=;
        b=QspXRHe0aln9LP8+uxMD1eRmxGIgdBwv6Wbbdw4QehooL0CO/wux2hHyQApsDnhse5
         bJdr1yaLG1cEQ9FZQFaLrjHgrC0lqcOPSdeeFeraBB3j2UnnGUvVwBmvseSH8rSWn34K
         qINBEM1TOSbIgKqdivWtDhLy8WfML6rfEC11ukQ+aHK/alHwTqHCdINjEUCm8fAY5kGf
         Aoi8hKM2+KIxpbgoqJjFDH6FKWo2uoB18kbEcdhiwDz5QeikbdJjUHqGemV9z0u8tkG8
         eoksGp0TOaHLDJGrlqJ7qqc9SQIUwjMBk1UC43YftwAh38/QPQMeU0u1yhz1o2CksLIo
         vGoQ==
X-Gm-Message-State: AOAM531SC/h03NBiiT94qHI4O9sq2TSZmMFNgiy39AHK9vw0Jkd1fi8u
	4KW921F3dC0RzelaK/bGYVPv+oiyyRrClQ==
X-Google-Smtp-Source: ABdhPJyQefQ8ryIKbheqN/B+HbP9yS8Fd4sreZKbAfhN2FuLGFyQjuEvqtm+CvdmmHmIXBMaKAM+tA==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr13537631wrm.423.1603635839185;
        Sun, 25 Oct 2020 07:23:59 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:58 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 05/12] gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:46 +0000
Message-Id: <20201025142353.1929717-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.29.0

