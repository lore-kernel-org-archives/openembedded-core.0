Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.18818.1603023038936052631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s7k5tpTa;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id t9so8293408wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=s7k5tpTaCnlGbJX5s7TAQtfoHMZGj2p9SvH9vFGa2pRq/IBZJ7ugJs99rjsmQt/JyP
         7vnMQFca1Cwj009m+x6fH2FaS8e9/xGweLe4XXeOSLzqJUMouiaZbEH2cYZ4kaeKYdTc
         eyFlfnfbGzBKS7tUB2Qso/h9tzVhsKVo5HhQ3Oam5v3mC9Vy28mFPCXtTo+gVuiNL6ey
         YGG39ycji/NnMklSLvfm6cCUSocDpDCrrXddTcDTFklLholLCWBW1k7JsCIw7Rt+UttI
         AmiPNhpiEoS+QNjX+0x20VImCGWDSmVW1XCgz863W0C2hkDTw25ESbZoYMjiDv5LyUl+
         jR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=TwqOASPVxBY5wXy4i+2A8jWx5PEsa3qvPwoZKs7f4nkFgaGOpQzu/47cwnA1HXlOcR
         MtwXHIqrVSNRxbcW+1qfmMI3283isHygQd4RWMizV8dbuR1lcv+BfX4EP28K99W+EAxV
         ONBjkn+PWLeFX8O4Dh+SxMszwUhTKh5URH7LoklzoWwW5nqLY4VkCKNkQSzRNKU2dBq0
         iHzsApbsKGMmQp531v+IUa0ueM8Ohoox8giLGIbvbEwN2qnGITb1TUODVpeKmlTTpSsO
         cDIFqHi/G0+hkcWgUgJM+DLeyUvJXHGrIhOsC2hewiGnygJAqjL0r/eQyBiJ855ff+ke
         VP9g==
X-Gm-Message-State: AOAM53151T2TaGHlK2V+WS0uJ0j/Gmpcr2sXBRruNztMT3Rj5ZxRauBf
	UqpHvaLcMsht836le386SbWc7/o28bl/6A==
X-Google-Smtp-Source: ABdhPJz+q76GrGm7CuGdNLYXLR3kuZF0zgFMTEyEkmxsQM7cmxAoTw+vCooB1wrywjtrk/2s6aBFbg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr14784934wrp.413.1603023037263;
        Sun, 18 Oct 2020 05:10:37 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:36 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 17/20] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:59 +0100
Message-Id: <20201018121002.1417335-18-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..c4855034e0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.28.0

