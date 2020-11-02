Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.1235.1604335828050576872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Exriyll7;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id b9so4829010edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7mnMHXKhygS6AH/d4vu+EqDNcJ7bjCF0MYK+At2tX0Q=;
        b=Exriyll77ZoIHDVato7kUXvlP3JchSwrLM0lCn4ivCf5A+/ZXB1hidnTuV+5CLnw1Y
         MFxpPvKzrShL+k+Q5mlPYt6chszDlv3l1ewJRRTPMswy4CJD0RsmLJTokPdhHvKmli0k
         T+skSAdd6L919VPNypVOi8fEMPnkoGqf0g5LsMbB85PXlyf0ZQ9tsLBmQU4qyWkfBpNr
         D9WzzNRJqraV5PNnOYNqeU7DHVgR2MPi5Li35Kdn+xsHq8GWkPqRxnx/vGC0w+9ovu/M
         a34p/IFSvKfYL67CQvd800N6AFQ5R+lhTyLdzGfWNKq8w6eRTQcUvC7RfHDF36YHzSSi
         Gexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7mnMHXKhygS6AH/d4vu+EqDNcJ7bjCF0MYK+At2tX0Q=;
        b=JhQQ+dv1AsNpsWIpktDcmk8DBg6cRnv45TNJYxhneMuZz2ICaVo/ET6zGK+8oSpZdE
         0RyTWkHxJ8efbdZ8oiW1x8JuD4AjpGfzFx7vHnOWBWJKK819hE+3SEqXe3R0c6Cus2be
         WojR8JKcB349knXmnx7KytLglrjr2XJrR3q/t63sZyOk2P98K0sT2gP5iL5IYYoPV0+f
         yvdivnud4yH8Zr5/dUYU2FsHon4P8LmwnAUSjQKqxZ+/BymedKy78WYk4O7IrE/V9stp
         nyB7pFR6gKja1UxXL/d3YUly+H9wItmSEvpiHuQ7tC11W/JdTssINe/yqkLmAcPGL7H9
         qMaw==
X-Gm-Message-State: AOAM5303frN6NgX1hQH+Y4uUlV3+mN3S4fp3YyPoI8ZN34YLFjDSuNKl
	DHcRQ8MaI1p8WHDx/Ez5roRm2gSeEiZ3fQ==
X-Google-Smtp-Source: ABdhPJyxsQvkAaoT1eAmwWzInx+uIMWLmf1ROsZwr52jXmPBBm90UvOLppMi78Jfd0A7RCG83IN5Aw==
X-Received: by 2002:aa7:c694:: with SMTP id n20mr17947972edq.160.1604335826436;
        Mon, 02 Nov 2020 08:50:26 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:26 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 78/80] libmpc: upgrade 1.2.0 -> 1.2.1
Date: Mon,  2 Nov 2020 17:49:05 +0100
Message-Id: <20201102164907.27572-78-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-support/libmpc/{libmpc_1.2.0.bb => libmpc_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmpc/{libmpc_1.2.0.bb => libmpc_1.2.1.bb} (72%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.2.0.bb b/meta/recipes-support/libmpc/libmpc_1.2.1.bb
similarity index 72%
rename from meta/recipes-support/libmpc/libmpc_1.2.0.bb
rename to meta/recipes-support/libmpc/libmpc_1.2.1.bb
index b51ec6ad14..15d382c4ad 100644
--- a/meta/recipes-support/libmpc/libmpc_1.2.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.2.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e90f2d99553a9c19911abdb4305bf8217106a957e3994436428572c8dfe8fda6"
+SRC_URI[sha256sum] = "17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.0

