Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.26553.1592249792842100519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ILC6T2aF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id u8so266049pje.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PplKEubNRXE5n+xUY0vcFc/iSR1pRndO9ofFG2qEIwE=;
        b=ILC6T2aFmML+UYb5LoGVSWj4aOtRgWfL1e0mG3DZPnkEmAWmYa7pTXi8+VAag7Ch5E
         Y6jfqmqufefk6ZKAj9xLgE5BxwkJ0FA4l15e4oc/jMukKC6NqwbqnLxLkwLdsiKyCHsh
         CotEV0of7y/hkgSv247WozfLjebqmD7fAwCEpz5cx+9WAYm0hD6tRq3rMm58k4uBrmsC
         ANuNCTAWyalsw7sxeB7YL17Jyh28uJBJ7I9bfKNiWZMh+wd+NdqBQGqD2tSHfDenXn/P
         fGNzYmXRN590tX6AnApM/Z6Mk1Sbaet2IZiOEWB2KatkQdGJqrGrseGZ7WrwVHRvZE8v
         Bd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PplKEubNRXE5n+xUY0vcFc/iSR1pRndO9ofFG2qEIwE=;
        b=thT/kklvsCNCrgy3vPCREJ1qxrM2JCVB/IbnD1mllHy0FTaL6q2SCj+NZgQ0IUQCr6
         4FGXI1KaSKNVih4CsUrPhfKjFHX+9wYAEUMsjjGO9K4b6oZ6JLMv2GtSb5nHHf29RypU
         1AJheq0hBHaV+YXVLk/RoQZTwP7035NgbHtzwrBCnZmWXsK+63tKQ8XVSDq+0QBqHAI2
         TLcpgQhPiGkYjtVeNbvviO4FZNJN1J4tTU5Lv0bij3LJXK34+1lCRGI1f5g9jWapX4vG
         ct6p0fjUILFw7QucRJSYipB9tPafW3eEFYViHVPtt8sHm3ocLdtrm03YLVSti2futoXN
         9JNA==
X-Gm-Message-State: AOAM532Sl4jUNXyIhPvNJUD2eHP6iSsYuSosy/76e8sSW3wfw/jVi45G
	Wyj89pX+BKFV0OTXT2lUcYsHfumZz+Q=
X-Google-Smtp-Source: ABdhPJxGs+NbedaTSOwcd3PhKgK4hCe9KBbqecq4DWfs/+nln06VDlxrM87oc3+VTFKNKtQVbq/iWQ==
X-Received: by 2002:a17:90a:c5:: with SMTP id v5mr827262pjd.192.1592249791462;
        Mon, 15 Jun 2020 12:36:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/21] ca-certificates: upgrade 20190110 -> 20200601
Date: Mon, 15 Jun 2020 09:35:31 -1000
Message-Id: <8f71ed4ff9743433abc16f84a4c21ad506d18bd9.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

-License-Update: format changed

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0007f38b03bcb0bd561bd9181fbffc7dec47fe9a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...a-certificates_20190110.bb => ca-certificates_20200601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20190110.bb => ca-certificates_20200601.bb} (95%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
similarity index 95%
rename from meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
index ce3cb217a1..37ba51ce6a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0+ & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "c28799b138b044c963d24c4a69659b6e5486e3be"
+SRCREV = "b3a8980b781bc9a370e42714a605cd4191bb6c0b"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.17.1

