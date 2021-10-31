Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A7DC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:41 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.33170.1635699520610901185
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ML9wR/9q;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id n23so4399306pgh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z/N81aqeGxONjexaLMb12GOh62gSk7ip9eVrHVvD4EE=;
        b=ML9wR/9qNnDFYKiYOoK38ozBDb+JJG1XZNMOZGTH8QemTlw29kWR+YJ02Y4T67Ricj
         QRdRffrPZY7bqz5b9WBigiPpjfRQ6JI7ZxRk1KGeAhy+KVjRIgK8JpDuM8aDdgjJ6LF8
         PxoQ+OoZycNuqxslgxqNi8B5jjKO0XHSGNzXVUR/VsbiT4H99qhRBDOcmjjiCzdVPL6X
         bl3SLFUOFDEFL8XVSVC2T2K8ybf9heniB9LYWg/Uazrk6LTndxdSYY2kTAvRqGJgr7Y5
         3QyXmrqQ0DYqzLQvxhTFOZC5lRxb1k22lTMGOO32ulD0nvToDdhKkxHtbB/Wd88l4xC1
         Z/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z/N81aqeGxONjexaLMb12GOh62gSk7ip9eVrHVvD4EE=;
        b=sfp731CZtVh6/8S/fFiActH+5q4m/zQ5HsIOJCNaC5daR/gNbTZdVMD3vi2A97NJLZ
         XCS0Hn8nhMNJDLhZpBm6wu8L1TwowtkKvb3tIRmxOBkE6u8y3QLDvxwk4gPeLH1Fpcr/
         hXa2u41NCsea/XFEsKhu2xndQW2oTTeUK54TDc/oLes4H/Vn70EsbDJISAAF0JRoYjLG
         uz8TNuA/8VyidLi72RrMAcWtbW5usYnSfQ+y9p3zegUnCy+usJdMGKT4TPPLTHWGWyGQ
         2A3pr6lN1lud7uBtvL2t7pHxiQTNtCLdhIFm36kOePiJRZOBEOSVY0C4b5Kp3tDPO2b3
         I2qg==
X-Gm-Message-State: AOAM530spC0Vkj69oPrrog5F+886ZmFfymMGc4X9m3ddEq4irvyHNuYK
	EEBaaTcl+3thbuteYvO8HLUqSZhfLInlkE9FHAg=
X-Google-Smtp-Source: 
 ABdhPJwZDpmY+/z6GiZricUWNa7th4TW8urOCwPeTtvVH586XyWs6CPUCh033lDc96g4cgm3d9j0pw==
X-Received: by 2002:a05:6a00:d63:b0:481:3d8:6f32 with SMTP id
 n35-20020a056a000d6300b0048103d86f32mr2909375pfv.76.1635699519745;
        Sun, 31 Oct 2021 09:58:39 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/29] waffle: old website is down,
 update to new project URLs
Date: Sun, 31 Oct 2021 06:57:38 -1000
Message-Id: 
 <4fed1eb1ea15372bcd6422f84c7e01fecacb69db.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157677

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/waffle/waffle_1.6.0.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
index 14d6a61525..f0dc780ca1 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
@@ -3,17 +3,19 @@ DESCRIPTION = "A cross-platform C library that allows one to defer selection \
 of an OpenGL API and window system until runtime. For example, on Linux, Waffle \
 enables an application to select X11/EGL with an OpenGL 3.3 core profile, \
 Wayland with OpenGL ES2, and other window system / API combinations."
-HOMEPAGE = "http://www.waffle-gl.org/"
+HOMEPAGE = "https://gitlab.freedesktop.org/mesa/waffle"
 BUGTRACKER = "https://gitlab.freedesktop.org/mesa/waffle"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "http://waffle-gl.org/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "61bfc1a478e840825f33ddb4057115e7"
-SRC_URI[sha256sum] = "d9c899f710c50cfdd00f5f4cdfeaef0687d8497362239bdde93bed6c909c81d7"
+SRC_URI = "https://gitlab.freedesktop.org/mesa/waffle/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
+SRC_URI[md5sum] = "9eaef03c8220dc8d64e2e42ae1b8c942"
+SRC_URI[sha256sum] = "38ef38fefbda605ba905ce00435a63fe45e9bf17a5eff096c3a47b5006a619cb"
 
-UPSTREAM_CHECK_URI = "http://www.waffle-gl.org/releases.html"
+S = "${WORKDIR}/${BPN}-v${PV}"
+
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/mesa/waffle/-/releases"
 
 inherit meson features_check lib_package bash-completion
 
-- 
2.25.1


