Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E50C6FA90
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:22 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.20499.1664133491918643867
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xGC/NG8q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id fv3so4524524pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=khbut7xInCvzZSJClVRJ1PJ5rn+7H+N7dL/aRNco6Yc=;
        b=xGC/NG8q3lO4HaZdRH6RiJq5EdgOr8QwoqXpNckh93Lr80FaWfDkCRjNin/9TBEcqB
         vQCn0IB54/0XLfbGf/4KqDP/iHHSRx9l9IluC6yFEC45xWLh5XHv8rEU7CNqRAHY7seM
         pOtLC482n2fOk3RwWul08x9FMqvFmo1Kj9StRoaQEimvUz4pQm/PQ3eHJcsfhGGIPeb3
         T9wXa1YMqjJItXgmaPZmbD+s/a2JgoADs/OQOBsZOZ3/YR2GvwvsZgLif3IdrFVH4Sly
         4rPc7qWbRLKqE6tPw/aWGT7JyX0n4N9sxLu6CAwk5YYbwlZf1qZfQlYr3xKc7pF8mdHH
         zXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=khbut7xInCvzZSJClVRJ1PJ5rn+7H+N7dL/aRNco6Yc=;
        b=Av1ZTW/oapVZ/DEEDeRsRoiSIhtoBLmfrAClDvpvNXU8uNHppaeqTiyiX4g6Hoz+Iy
         O18i30Fp1D4a/lx/2UyQOgahyCDZc/CukbdgG6mTx3DqUREqJnkOgIX/BHEHPWgGumC8
         wVXPe3ou/d5QPdHGA5xBsWutFiZwfxF61PiNcejFGeTpqcEjipfrMbWL14rHwwG0NOyr
         GpCm5C/BaZBNAZ/esJl42QGVEoVil5kuVhPuPKJhv4wue8RCgyKsofXkFdm2PFF2nBu6
         26phmQqAAfVCERkcPClB3pYggoeamBlNvOCfSAnOvAqsbBOZgDd++KMlZ0Svf1V7Qa8R
         LxNg==
X-Gm-Message-State: ACrzQf2/z9ZEAEem5VBxVlQkbZjypFsFWir/QbUTxPRXbu/oY/s2ASK4
	vkAZNAxnvxnHP3UqTaTv+zmQTWtz/dzmD2Ha
X-Google-Smtp-Source: 
 AMsMyM6+u90b4Zq7SsbVmxWCCFiu08L6gz422N/rsvx1WZT/ENgazC1y9O+pzqv497LcsoaAeJ6svQ==
X-Received: by 2002:a17:90a:5993:b0:202:be54:1689 with SMTP id
 l19-20020a17090a599300b00202be541689mr31658922pji.207.1664133490943;
        Sun, 25 Sep 2022 12:18:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/33] libpng: upgrade 1.6.37 -> 1.6.38
Date: Sun, 25 Sep 2022 09:17:18 -1000
Message-Id: 
 <5aeaace87675789a51f3ebb8814c390069dfd3be.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171021

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Changes since the previous public release (version 1.6.37)
----------------------------------------------------------

 * Added configurations and scripts for continuous integration.
 * Fixed various errors in the handling of tRNS, hIST and eXIf.
 * Implemented many stability improvements across all platforms.
 * Updated the internal documentation.

License checksum changed to to copyright year changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47719f3195156aadc23dd4abdba38acfa3f77a1f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb} (83%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
similarity index 83%
rename from meta/recipes-multimedia/libpng/libpng_1.6.37.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.38.bb
index 61e3d92e95..dc627203ef 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
@@ -5,14 +5,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c900cc124ba35a274073b5de7639b13"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
-SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
+SRC_URI[sha256sum] = "b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.25.1


