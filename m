Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1125.1588011757576530258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 11:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GRVip/xC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id y24so711696wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gFC2gppm15KhrmPDCb7mFk4p9zqj8vowQUeKp/zbIGI=;
        b=GRVip/xCyd6D7Kb53rTpgwU+PSBf7AnxeKkEXrjkKanZmjX5oeY3MSj97rRT/Qg/eH
         8TvhkHjleTn4GD/e9XGnIUjkccmyqfZC7edYOMrMUvJVBKszIGVHZuWrcL/87fOjR3lD
         RVvsfSB9q2cPx0R4N3iYOuKxAd+hP3QEafKdTvy5nW3dI5yTBgtrk1xKeMy4oiZwono2
         fdWSOIqpDMXM6RkQbUqmNbZ5VamywIcPVEtKh7HLIqMfG4M7VmShke4HTWanuZSATRgs
         VS3T/xg2jzRKgRzY5FszcD+uxRqpd+e9gqFWVll2pps0ezF0mrfOM83ESD9Ra5WRSd/A
         xXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gFC2gppm15KhrmPDCb7mFk4p9zqj8vowQUeKp/zbIGI=;
        b=DA57n17tWidu6Jw2M9tqa4dQJGQkYSAmn91v3KLhPIfvcHta206kALE+fa6vWJe0Kh
         RJwYdeXHhmMmlUJZg23j2e5Ik5Sm7gbZM7BgpQRZdcpQdFlsw3lN7bo11hzDbYw3PlR5
         Bkmo/LZSE3Vu+brMkf5iOLeCVnMVxnQefKM7o/OcxFYnQSgxcXi65/E6XnR9zNsC5nN8
         wKJYIKWBaDhtcqzyfad12r3v+M2uWjUFvXLAuOAZlrH14F1bl9Qx9CnGW3DRjR2SjRVD
         LfMNb2sfYRV081tlpDUo3bqVnf1hfN8NPD1u/2p5PenoVFhRyhnowY9/H45ysMZUjuWB
         WZGQ==
X-Gm-Message-State: AGi0PuYCx/mCI3FK41A2jIa6PFv6LU+T4L4eONGe4P60AP6SOpCTV4ml
	F8+Yy6KXrE99uZfbw4+3eRTyeUYK
X-Google-Smtp-Source: APiQypIDeHAgoSKsg6qnz2zkPdLS71fFOSv/gXb35v91QaJdiW1cz1HXZUEfbkdenO5KGe8RDcGkIw==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr748210wmg.113.1588011755743;
        Mon, 27 Apr 2020 11:22:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h1sm17413938wme.42.2020.04.27.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 11:22:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] buildtools-extended-tarball: add libgomp-dev
Date: Mon, 27 Apr 2020 20:22:23 +0200
Message-Id: <20200427182223.8449-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed in particular for newer versions of rpm
which would otherwise fail to build due to absence of omp.h header.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index e38967af3f..c32d0107c3 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-gettext \
     nativesdk-libatomic \
     nativesdk-libgcc \
+    nativesdk-libgomp-dev \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
     nativesdk-libstdc++-staticdev \
-- 
2.26.1

