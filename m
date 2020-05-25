Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.40982.1590446259586526708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xI1Qx8JE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 5so412034pjd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JAhnH3fmefehTOrWJe5gaN2fDpZ3fsUZhWqRUh4xOk4=;
        b=xI1Qx8JEMbiOGWT4oUc5BdDw0mT7b5c6WF4SmPjZ6O6RJ1fEzzMVBYmL8S5nzsQ08G
         P+8BebHrt3LGftTf8rXuuJmyHX/823ia+xZSeFs+FTTnyNsGpZJwl8xEVajWaEIqVW+X
         wC+5Iaz9woQ+9C9QIqolYDaU57ppu6UgW6ocI6ZifzTtrxTAXcACU1lUNQQBtS+SffVS
         HX1XU8INa+eVkqIsHkOThzFtlegTfk4kBoGZ1cZZpT03xjYOM9pDEbwduggC9fIlQGTy
         jJxYYx2KPp0/GbQabCir0vbNClTeROPX1o3q/uyei1lK1oJXX+Ze9B5Wk+IcIsR22iv6
         r+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JAhnH3fmefehTOrWJe5gaN2fDpZ3fsUZhWqRUh4xOk4=;
        b=g0ToRFpO4+wTOw1um6HWyFUPMh7IPaCDzO99jgseSde1hVDXZsCqO7QwNGcR3eM48A
         hklgdPukNg/zpNR+rqFsGJWSqcFvZqdPJjghnbT1QjES71btakntzx4ywLp57R3VChRp
         nyp2JQsbmxkPlveYK9U19aWgd/J8bN9zCVdqffHIdFWV3JYBnl4CCaLIxtV28StHsCd3
         4JjJrFF3MVzpSQg2HwDT99McsQoRA1eEXPsnuwRqg2SyCckcw6Q750IgcdrVyyr9oAfM
         jdcOuLPPYtUqoINilWWe/UHAn0Rk0pbH91KKEs826kLxYkY6ttAft2eKM1ZxJfziorYo
         xY7A==
X-Gm-Message-State: AOAM531LbzSDySHMF1V1V4X14bIp4RxO9JC04GUGXhzgKJk67jsOgmpM
	RHIXtrHojCJ+iFB1Vh3cufvTfk7x+ak=
X-Google-Smtp-Source: ABdhPJzATGT9fbFU1F59D/NkPKv5VSUWf92lPofT/MoMotUfgnQ/pjxzUAhQmFIhSicc1/i6up+StA==
X-Received: by 2002:a17:90a:734b:: with SMTP id j11mr15488623pjs.114.1590446258739;
        Mon, 25 May 2020 15:37:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/17] make-mod-scripts: Fix dependence error.
Date: Mon, 25 May 2020 12:36:54 -1000
Message-Id: <354adf441ac880fe3759af594f9669c3a7eb3308.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

Error:
 Problem: conflicting requests
  - nothing provides make-mod-scripts = 1.0-r0 needed by
make-mod-scripts-dev-1.0-r0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 41fff377b921070f371c0aa639e37c27c113ccb9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 460e05a445..0be1422a24 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}"
 do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
+RDEPENDS_${PN}-dev = ""
+
 DEPENDS += "bc-native bison-native"
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
-- 
2.17.1

