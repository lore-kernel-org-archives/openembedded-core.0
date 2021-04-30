Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.13586.1619796894849432752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FVmn8f3q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id md17so9222739pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3nv+h5/pekw8BHEFBeuiPYuRbibLOiFdTEiHDuW9ICA=;
        b=FVmn8f3q2GPJ8TZdlqCFsrDF5UUr0NLX6NPbBJrBifkNq5bhf4S8mvv7hrFxL4T+AU
         EpMThFr/bSejZLJnIEglMGTXRnuQ0peZZ1nIS++qvibfrsM6GkwnZ9jz3TbggPqjKHVA
         at3/SvVALCbCWSW2O9W5r+/dNn9lNKG99jLaObYDRHK3Y1VSFR+/0H7nAZjDC+wEZswO
         r3BMUPLqwdAs36vflHAXdYnM+0hhacHUVtubxIVBuUT8FYxG+KFaA8bYROleFc5IuUgU
         wB+4m3XoK2rdjoZDLgR5qoeXVxE2kLDzHktWTRd52+XAJ9xGXMgPwiVsHtDmOI9ajkur
         nMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3nv+h5/pekw8BHEFBeuiPYuRbibLOiFdTEiHDuW9ICA=;
        b=qFjlAoNnSvEzGYr/lrUTeYsqVFqkL//xVFPVOuXYlOLTuYWi50/hzgk3zGulygRTBh
         Ti0ZSGKoixKTkbMXroQKN4Xl7ObYA0nZuA9nEgJvlGbSiUcp6gZuDfMbQgon1F/M+fHk
         SlU8qRjru+3ElC68LDPCde9+Dyn+iw4JglFh+420J/37hXbCveLTA9Fhdaa/BSVFWGSY
         tIGYq1YJqHosS7V8IrvgEqihBpmtcDbPaYkiajgPRwkuxUGittBJ+1Tgz7T/dYoK4wnY
         9kYzHFjnwbk5RH34km91w6vn9nbHWas12t7f1//4iTVfglgrYiSHhHyLnMvMnwVxIWBO
         XZ2w==
X-Gm-Message-State: AOAM532LsVuSOEVCJ/0i2YRWxNfDIo32+a31zlRCt1A3r7RhcXpmhYW2
	kL3TFLL25AchSqJsa8tx4x4WuB2N6AizIYdL
X-Google-Smtp-Source: ABdhPJwPz6UmTa9Z3g2ZypRnz903NWra1OG1nrgH6gC99TRK2gWHb88oc0ly7RDL76xRIjlOLNhGRg==
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id p6-20020a170902a406b02900e678c471c8mr5756568plq.17.1619796894018;
        Fri, 30 Apr 2021 08:34:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x9sm2900386pfq.197.2021.04.30.08.34.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:34:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] go: update SRC_URI to use https protocol
Date: Fri, 30 Apr 2021 05:33:45 -1000
Message-Id: <d660f75542f502f5d53f57abe600507a8a1f6f78.1619796615.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619796615.git.steve@sakoman.com>
References: <cover.1619796615.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a1eb731ed3bcb049192550e362b771c3a9ea6eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f18d928c70..39a681a712 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.25.1

