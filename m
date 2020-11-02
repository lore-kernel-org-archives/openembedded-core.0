Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1250.1604335817034151628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pfzxnVXo;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dk16so19221848ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W31DwhX2NhdkzYYXA10yNbUt3eJb/L3hhoKeqeCvHwg=;
        b=pfzxnVXoAVUbmhfVvjPVxJqQKr+sUfBgiC2mAYnpJ8AAOTtvpTC8/46u4yJJI6ioW7
         xhtPpwkyUgpJXOd3aR+u2GenCmGNXyah7ooGiXB+bkD/VYUH8QRR2i6yx0+r+RuzW6hk
         7KFQ8Cr+IB9qiCjdQHav7KHZ7R7lqcv8lmHi0KHBqB6X2qE5IsNH5yF63W5nPNy19b8a
         jM5kDTfgm4W+Ij+P0K1A2mC/ymhIUGE16FRNbuEi19o7+0LW4tqoHzmPDW5lgQZ+GvN6
         MyEV6tteK04iFm+2d1f/psdnzxLbS09Z/LPwT1gNuW/Il9C4txLs3cEGuN62ym3+2mSY
         ceRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W31DwhX2NhdkzYYXA10yNbUt3eJb/L3hhoKeqeCvHwg=;
        b=IZcgEuppIK7roAiS9fk+jWrDwIPqJxI3B1mZ2cfwwGGB3uoowjy+isdFa/pkloaleA
         usxGS/Pyv3pC3f32+r5vabSjvhDonzz1Rum8c3sdTSvyqQvKnIssX/y9jvD4gyOK0uq1
         qGcA5BU2DFqT4/Tt6H/nBbpJwuVBEGSslyOkFOiA8dpp6RnOcaTPR/vR3PYSbAugEOgE
         NhuT4Sc/wlmVayW8XYgD9/JEBxt4qvKl5E+JKArtodCoFTOpP/8V8IJr1kKixpNIbAnz
         5ufiOWA9bje/NvKNcUz/OpRQ1Gmt84c5bfEBqTjaktcQ7eGmwFKqcBZRI8emKURtJ3Af
         epkA==
X-Gm-Message-State: AOAM533QPle9VZ5b9DDupGYrGHIEYswKuue9GaLUFIvLq28brvKnNceQ
	4IS/JllGPzRHp3d5XYeTefWWx+GEzwK5+A==
X-Google-Smtp-Source: ABdhPJxdj728QYN/MWhgu6d+5HzbfANO4Wwn/yo1DjKrX9BMWvt/6VJYJxliW/jerFpRnABewnsCaQ==
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr14328968ejz.3.1604335815382;
        Mon, 02 Nov 2020 08:50:15 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:14 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 65/80] freetype: upgrade 2.10.2 -> 2.10.4
Date: Mon,  2 Nov 2020 17:48:52 +0100
Message-Id: <20201102164907.27572-65-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../freetype/{freetype_2.10.2.bb => freetype_2.10.4.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.10.2.bb => freetype_2.10.4.bb} (92%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.10.2.bb b/meta/recipes-graphics/freetype/freetype_2.10.4.bb
similarity index 92%
rename from meta/recipes-graphics/freetype/freetype_2.10.2.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.4.bb
index 1034ddc0d7..8462cd3511 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.4.bb
@@ -15,8 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
           "
-SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
-SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
+SRC_URI[sha256sum] = "86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.29.0

