Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.1214.1604335788352378337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=na6udDO1;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id dg9so14986725edb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bpcu0vIwtLSpBs3s0lAR9aDlkxk6qMTbU4nOR9owA44=;
        b=na6udDO1SoQ2OZXdFbUHDHOZE9M8gTiAONJd/Yazc0G4CM5AhOpvqP29gAg3s/omjv
         +mnDkN6w3KBvrSMFfildn0oO7XYStezcxBnzWQhZfyqXLvB92LW4ldklwEyPcK+KQc/V
         u2hnxrZWN+PdRbWCGoLWRihGWosSQH7sJsa/TC+i39NriV3csmnPjQnfCRvQg1GoM6ZG
         W2bEtrygJped+Kt4YRYGX3FJrNg08YCVSFvCbB2Te5TBuk0W6+yZy16T3p6PoZBGCU8E
         j1lrT3bK155UuOgx/zhy7S0joXgz0hV445L7lg0ajffbD16HLGw/MN56pWKD/9p9AQ80
         /IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bpcu0vIwtLSpBs3s0lAR9aDlkxk6qMTbU4nOR9owA44=;
        b=AJli0yQqIK/IX4gVNE2y0N89u2p7CDwaIgWahJcuLOvcY5Mjceft3ZB9DgTwiwtxPc
         YCtc644Qf36mEfIAzTttCiG/t2MgFpeEggY4HO6TS3k3spTz7uqypVv3ueFsNxLRiGUX
         CVxQj/eVcgwigLcVIDh+FNpvd5IFrrL51127pdeGxlCB/cDPejA8b5KZQ5Y12alhZnDM
         uXxDxD0YPLzoFK1F5Nk0P//B7eLde6roO8QAmTIbxRbm0d7C4gr3E02ZhwKzCh1jUgL4
         cqF1NZsirSp5EAsEUJ3XbWOcJEKo/E2no7xoQhJ4Cr4sVFrYKMFr8hguQqrSyQp0E+lU
         fbtw==
X-Gm-Message-State: AOAM530cWwgeltOc+iTakKAQBFcitV0ISlvljB5uYnoG7om3Qq6+OQ+X
	Ac42Y7z/Iow241aU25HAoo+n8NaE10ZF6A==
X-Google-Smtp-Source: ABdhPJx9rJeb8AlvjmxODjcCBZKXfPNQDpKLm8zS5m4U1/PRLLeshi4EpHdke6CTsuWk/ijt+E81BQ==
X-Received: by 2002:a50:a6d0:: with SMTP id f16mr16905332edc.135.1604335786675;
        Mon, 02 Nov 2020 08:49:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/80] libinput: upgrade 1.16.1 -> 1.16.2
Date: Mon,  2 Nov 2020 17:48:20 +0100
Message-Id: <20201102164907.27572-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.16.1.bb => libinput_1.16.2.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.16.1.bb b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.16.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.2.bb
index 1497609183..f4b1b4ddc2 100644
--- a/meta/recipes-graphics/wayland/libinput_1.16.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "7ba7d1aeedd15168bb21d17e9e628aa1c27957963a423a3fea3938a501758539"
+SRC_URI[sha256sum] = "fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.29.0

