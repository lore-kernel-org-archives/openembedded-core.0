Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.180999.1598214075915386059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fAJOPEVr;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id l63so3211543edl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Rs2IF6vhfGYHR9ddRjRQvfD2NvKKmK17GOYePL8jSw=;
        b=fAJOPEVr/YF+b7F1iTLxWfXt5vZAWkmiAInQpbnfQmeDPP95bW5Nsc2fIEuyACZ1Hw
         MhR4IH4pSFKSI3zlZTMishuyYx6NAOryYebBIW/IW1ALFmn5/JpUFDO9HPBmK6bspIwS
         FoFwDGA5GVwU7mR0JIAe+LwRdoWRDiRk6xR+gXzHYLvIbtidMrdg1MajDn6PuSxm6t4y
         pzu18pMjlVRJ4JlFknggj7DOhdHFQHWNygx6i8xVSSQ2CuThN29qpuT9idwhnjoVubKD
         BzX9mQ6GsyiSQMYlYxf3JSmF9NhL3xbVmGgEuHsQGTBK7aBxvbbDYz7YCK9b2UKxNC8W
         vuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Rs2IF6vhfGYHR9ddRjRQvfD2NvKKmK17GOYePL8jSw=;
        b=roDYXITd17PtlghIMiXhgq8u1BxgdcNBqBFWMW35Ku0yr3/g1ly68OduaulnY2/ZmM
         7TjE9vn95uAf4NhCEClQp54yPdiM4DNohSY9BWzmtDjjE9Da00rGDGxeLRFovkCn4y1k
         MRuZJBLb5oP2payO8BfR/RgvpnpCkDBSBBSOYn8Po/frM/88ugnXk/e24QOVoBZ5mIfx
         o43/2sD/CFqzCptdhrFNKnUNaHoY7gmvk7pwH8E7GYAxByPjE1iBcvUlXIdqn26oaV9N
         A+7soodlpJjr1y2gRX4KAds8eBo4V4u1F2Mw8/+Zz/NPw1zBbEYgto6FVVhV9VIAbq9M
         Wvqw==
X-Gm-Message-State: AOAM533/gaC5yO4yBG3TkxkhMT+/kUQ2VU60aVqr99UgXMgRU74Dt+hr
	vOpIAlcOaRx+7guOF1IG0zkC4ilrqVY=
X-Google-Smtp-Source: ABdhPJz2eaVy2iem1vF6FRDRmEL5miw4bCRPXVN25vq1SjRQOSyjjDnQcoK0lagYGQor6fFwgPsCjQ==
X-Received: by 2002:aa7:d6c2:: with SMTP id x2mr2559553edr.332.1598214073751;
        Sun, 23 Aug 2020 13:21:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/37] diffoscope: upgrade 153 -> 156
Date: Sun, 23 Aug 2020 22:20:04 +0200
Message-Id: <20200823202031.24686-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_153.bb => diffoscope_156.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_153.bb => diffoscope_156.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_153.bb b/meta/recipes-support/diffoscope/diffoscope_156.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_153.bb
rename to meta/recipes-support/diffoscope/diffoscope_156.bb
index 77f5254aec..94e6e56d41 100644
--- a/meta/recipes-support/diffoscope/diffoscope_153.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_156.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b5104b5e72252df45ba6b7cbb0169e2e3407715b6b063fa5b38a2649b0d719a2"
+SRC_URI[sha256sum] = "428f5d75197c3d9449ffbac52f8d79dd782a7ed67aba759e0452515b2d8e1441"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.28.0

