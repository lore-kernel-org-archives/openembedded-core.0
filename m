Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.26541.1592249770826895715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rP/S2pM1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id 23so8241088pfw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5WtF1m429HrKlXqKgmwGem/AB0an0LbbnC22jIKcawY=;
        b=rP/S2pM17Pz0lYDqKK9iOwyarwVdzWLdPYzACZfrZ4AGhaw7PxtcUKxwgEym9ZymmS
         m0POKGfAwDrqKl3rcVVVAw+jUGd94QuTBFLpCtf0hSLSc/t99RGdJIkmvPJTRGVIPqRJ
         gHwz+Xz4nwbIVilME/sScN1/Tr2aPk30BacWSbTySx+RROONUsMusqk+8ddn8eQKGFyz
         UE93JGvmL+A/5x9qe92O1bbm80cxXgoYZB9sIzvlJUtUzzKMtjOynLga2DhsfBoGbhVo
         N71WSx7BdlCROKbD3HnRajIqZSAZQ9ZNHLCnEid9wS3S3zaHnQ581dqJmDG6BxHRH5Qj
         4NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5WtF1m429HrKlXqKgmwGem/AB0an0LbbnC22jIKcawY=;
        b=er8ipF3hffrIxwgsRq5O+wHRTLZVI3UsJQy9DwcUFJB5kMCbviXCYTRGsKrut2LsBC
         1qlfpHhh5a+kZ+Lbizk2liruQLV7GgoRr86t7dxEIUBqAA14vpQMJOJZaK0caFtaI25G
         CNSjzzMJBNgDzzyKpGhPY7yNt865+jycyZUgclQ9VYUcTks527rIEupu58FcuepSnnZm
         2c1etG0DI69QmbA/CLWDQEeOTCw9g08sFU4+I31MmHxnVBakHHxSL8gWCBvj5CmIe4xw
         MEf3Q/zMH1HheyOi/wQmRgyDa5gxDcHjr3k/B7UioWAZZSrD6Iy2ItKP9ncMjacIu2qW
         1y2Q==
X-Gm-Message-State: AOAM5307XUtjPb5cm850GpH5uMMKs42ylRerFZkG2K4ZTmdgR39L5CL6
	IJ5CH3KoKFtGRqYMONnjbYRVnqrlntg=
X-Google-Smtp-Source: ABdhPJzcgCS03cRSUGfosZ7OqiZZApYtEgGskmyLpYm147NEDO/rin1E+3P+tevP6utWtTzul5xDsg==
X-Received: by 2002:aa7:9f11:: with SMTP id g17mr24637643pfr.278.1592249769774;
        Mon, 15 Jun 2020 12:36:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/21] sysfsutils: rem leftover settings for libsysfs-dev
Date: Mon, 15 Jun 2020 09:35:23 -1000
Message-Id: <7c3eb092392e3ae76408c8ad4cb0f3f18dc42a96.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

22af6a2595dbec98ce4a2e3b1324ad8d400390ad removed the PACKAGES
setting, but left the FILES-assignments of libsysfs-dev and -staticdev.
As these have no use anymore they can be safely removed

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 941cc0cd0a69e95ca571a9a8cb0732bb06fa2b3a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index f9f067dcad..34bf431f40 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -27,7 +27,5 @@ inherit autotools
 
 PACKAGES =+ "libsysfs"
 FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
-FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
-FILES_libsysfs-staticdev = "${libdir}/lib*.a"
 
 export libdir = "${base_libdir}"
-- 
2.17.1

