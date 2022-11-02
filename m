Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4599C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1935.1667356963204736946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qGuplRaN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id l2so15280618pld.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YCTkz77jmxscDl9bQmf/2qSgTO2PD4gWd6UmHpX9Bo=;
        b=qGuplRaNEPPVGhfHbUsuB8h+drb1yse0wDoyL85ZqVgNV5C/p+k8M5uqWL/XTemIZ1
         iUDYGpS1f4zUSaPgzUyZh53uaotizQGL7fdKWN5vcNSOtYN98UX0jL5rHHZ3NhFX1/0h
         8U9HNooEhGG4kNrp6q/t+SNhihZCtDHjLqwYYWAbRgc1Ghx7Yi8K0N+Wu+J/kW6YkD0j
         Av3XIm35qOht2gnsRWFOH4wa+a9Xa3khGwfE/USEkaPIsnEO0jQUmxchLaudq38z77ve
         7qqcfXT7sMpt95Vnqa0n7xF8Et/QwgIzuAeZEwb45vfePCpIqzhT/4cvw0UELOXC1yVM
         qGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YCTkz77jmxscDl9bQmf/2qSgTO2PD4gWd6UmHpX9Bo=;
        b=W5o18L4Nae7c4Bfdc3ZbWYIDr2ghc+EGtTKjSN9AJ3v3Bk/T7cb8YIYiB/wiGE0DKA
         TEc6XDbcLFZp/0ebY07/r57DOwYtRXykZgZv8qLIhNa9mt5KnENWCEcb/e+hRsGIUUgQ
         O983iXzdtqe3+sDTjRdhsyJWcbrzMasxl7FiddbIusF7IUeCyF9fSdD2i4vYLrlFh86l
         fLQgID3owxXlzyWs3j5tRGgEjN9Pn+kXeEJKNosKqF99FP5E4fmOLsMC+qLqabuzp8rD
         siWQMQ+F7YoC02nTJO/xt6dEFqplqs3Z9ndLskjVrEvILAhTnPz/DdOggJCQ/wYetGzq
         4O0A==
X-Gm-Message-State: ACrzQf11eM/GzA9cfSOIB41HRneTacwYQgzAvDiCfMFpv3rm0UQoeLtu
	QuOJwTmXWn5uUS0iQa7VAn0iD0EpERvB9B1j
X-Google-Smtp-Source: AMsMyM6Jm2U6PsSi9NVaDKoo4p1YRVMtQltQrXXKGbWKy0eNN/4jGVyY/QreLRI1Se/yOAj/k8zdoA==
X-Received: by 2002:a17:90b:378a:b0:213:803d:3389 with SMTP id mz10-20020a17090b378a00b00213803d3389mr31701962pjb.115.1667356962180;
        Tue, 01 Nov 2022 19:42:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/20] meson: upgrade 0.63.2 -> 0.63.3
Date: Tue,  1 Nov 2022 16:41:59 -1000
Message-Id: <fe33134efbe109b9f3bffa1b05fd6fed8860129c.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172549

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3c87597dcde7676858f76c1066cd87195ecc8aef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/meson/{meson_0.63.2.bb => meson_0.63.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.63.2.bb => meson_0.63.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.63.2.bb b/meta/recipes-devtools/meson/meson_0.63.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.63.2.bb
rename to meta/recipes-devtools/meson/meson_0.63.3.bb
index 890faacec9..9267077422 100644
--- a/meta/recipes-devtools/meson/meson_0.63.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.3.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf"
+SRC_URI[sha256sum] = "519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.25.1


