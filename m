Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.35210.1612792384898026371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XFAnohYf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id h6so15652243oie.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=brSiyEW+ZoxQ2fWkI7V0xQgjrLwLUsk66b012V4FGYs=;
        b=XFAnohYfGaWDdn1GYCmEj1Ev5knzV53bT9dtexKv063bk04c4FA2cHM1ltbtglA2Oo
         yGUzWuiAUc2tyofgV/RGHqxTuOHuLuMI9T4j7WYV9V0oWN3D8kY+T+RidSngdhuwCEdx
         96Db9645wCjxlebjDHvSQxNKkyKpA3CLlGkmvlSImivJzta4Zk7x/m+8h+rHef5rZN5Y
         YVe4jz0Wj3y8Tv+ktmoUhSIt8ZykpPlDVP5lxcicfoWlQ1803ThkNqUa/7tMAdvQzMMy
         QUE7I7ORoCWkyL7YdJqxlNVijDtUkcNPN3NSDKANR3VZfyZalcJUVl5aq0W6Ltumta+l
         wNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=brSiyEW+ZoxQ2fWkI7V0xQgjrLwLUsk66b012V4FGYs=;
        b=gNskGOp8lOfk2eMjYfy9A8OE3dB6DMlokZM18xEdrnvju/mCnx+0IXFgmYF5ob0KUk
         Gh0HD8GOL40zyiV8D1Ej6LbWL1ZUrk6rHDbC/5FbZra9jBRDG5ZXWVMRprGl7e3r+/Y2
         TjvX1qJi5TppCXVLSHx6yKwRh3aCjnUoh0cLWSSD4JPQB4P9G47kvj8qgn0h3XWtomFl
         +SYpRfZBRrtHyhOvCxEFfGjvXd1WoUDeqvnBj5XM4hHaxAwGw2tE56T861yD2kS5MAu5
         Cfnnqo2CivNkugAFXKDvDvCvN7Ldagsw9HXwyIDkdOpaXPhI9rhSCiMjdn/xlnFG+kCq
         WqdA==
X-Gm-Message-State: AOAM533mOjKjAKa2nDsn25zPWlo2948dGWohfe8JniW+6uJQhj60qt5a
	iG9ojJhnvaF8PqDzTEGfyViyG4hsP6txjOoFtTk=
X-Google-Smtp-Source: ABdhPJydBgWnQ2WO+xP2mB1XTthfh+odPgtYWsz4CP46CAFk2I7Sr4PgnaxzWjiJLPG+V2p72yzJ2A==
X-Received: by 2002:aca:4085:: with SMTP id n127mr11294258oia.8.1612792383717;
        Mon, 08 Feb 2021 05:53:03 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.52.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/28] ca-certificates: upgrade 20190110 -> 20200601
Date: Mon,  8 Feb 2021 03:51:55 -1000
Message-Id: <fd8ffc7cfc14be9cf620da0d392db73272b2398d.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.25.1

