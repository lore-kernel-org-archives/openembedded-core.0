Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.786.1589820547068487685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iG0POEeD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id x10so4455878plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8JVMIMTCdLsw9fSaHnIsN94XPBKqUC/14a3zRIjxPpY=;
        b=iG0POEeDbYeqNZydFD5yC2gIxyCVVc6cpYDB9OIcaxd0/vDlG9XQQCv2ns9tOR/Es1
         JYmfND4jxfb9GyR/UA34pSQrRkTbcKIvn6vFJYUtInq5Z5QgrKUSUl85YAGS9ey6vDxS
         8Y6cUZV+tpJET6gny64Itt5vMgAm9qsWTo7A9pdmvHoZEE1858QwT4Mo73l/wLmXWP2K
         MgSvFN+ATanD54ZWzuE63oBv2XhYDhgwV5vZKTW/Lkxciz/hmykrmC30isVlhST4/3sK
         hlxYPSy7/oeAuc5wEkntSSOfLEQ74zZt4s7ZQByia0+zwUMG8kfZV/TNtNo5iurupqMx
         42mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8JVMIMTCdLsw9fSaHnIsN94XPBKqUC/14a3zRIjxPpY=;
        b=SkeVdKcHhfux4rISRHZ4RIYVwGfJZiqHIUP6T9qRVheecbC/khPwwAllk2DjQVLI59
         imPtqZqlhTnnFaYm2gj+4+/babFYX5eDrhy9JqZlPmfPokvK+IpKL8xgof+3HKRkKc/g
         woymbxdmGi8C3Q+lJ8Pk94qgLgjlLw2n5WvDoo+bz93W7WLfEsMIsvnbmjAJQy6fm0ci
         Q2KXdgczfgHTacXJQJoEGAJr184Wawufw0r5dcxYv6nPK7X8L2nGK/DuVp3vVJdgiaHy
         mzoRpZ3C1AHlEPJloGCaR0D343ywOfyFiL/x8UF2WYHjDnTU/+GNzBVACIjyVkiqU7lZ
         m/pA==
X-Gm-Message-State: AOAM532w+c+O3k0wyXjyG0tgtGo56Oef0APFHmxFvOKXF40ArlK9bFon
	33gRHuo2yOR6alnYUUc2zVxxegGslvqZ2w==
X-Google-Smtp-Source: ABdhPJzqiG+NC/reJqM1Unq+4wQ+fvJnM7dyB5iPTohbVvZebHx11RWgfgZEyXsNZ0A6pOLOemAaCQ==
X-Received: by 2002:a17:902:7c01:: with SMTP id x1mr17360947pll.258.1589820546214;
        Mon, 18 May 2020 09:49:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/19] re2c: correct upstream location
Date: Mon, 18 May 2020 06:48:22 -1000
Message-Id: <89afb271b32ed3dbe9c899fbfd30f9a80af161da.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/re2c/re2c_1.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-support/re2c/re2c_1.0.1.bb
index 4ed8d257ac..35200ecde8 100644
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
@@ -5,9 +5,10 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "e2c6cf52fc6a21595f21bc82db5324f8"
 SRC_URI[sha256sum] = "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c90843afab2c66c7c"
+UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native"
 
-- 
2.17.1

