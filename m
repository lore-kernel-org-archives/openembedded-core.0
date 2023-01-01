Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A38C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.16000.1672594691078816412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7HenbiQ4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id x26so11205237pfq.10
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qW6XDcaQJJ17p78TksxoCUjeEd9uzmarVgnJKaKKQaI=;
        b=7HenbiQ4zcBlefb/YfIXAU094SevrFD/kFkV0OZ9FhHnN/VB9ZFdXOWmH+vuRJe8Ze
         vgNaaTi1RmvI8B0HZy7ivBjDsenRpz1czfln0jf2Y2rirAEARrpFW9t2T2PZUDiDBEq6
         deVlwnxbdIa5DMt/MzCIVuoL0sLJFkY8X2ieSS8Lh3SVvO8wKUUW+2+nVT7NV74YZr9+
         6q3BHdnlsQPRRayOs/a5ngfTvO4QsObUHYllRTvM71iB34tKRYd9hqlfkvCrFZl5s06U
         JzmczSiS/hBVqhvOm9W1NJ1mI8lgiHN9xU3MJePIjMIp4BiJ5fqiNpEoq/8oOOtfa/Zq
         c5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW6XDcaQJJ17p78TksxoCUjeEd9uzmarVgnJKaKKQaI=;
        b=1bTGtp7xoadBu8wpn4WTtdlbJ3sTUOWnYBX9PAqd3Ym509JoEGjIQKZN0XsagAb3Uf
         D33KMcS4HnoHaHIQaV7ewv2S5WnscX1E0xEVc2K0waudn3cOL64YJmnuMZEhyeGc4nMu
         V62vSu3tbPH2dHyd7FMQXssUiRx5l5E4kFLA/kFMjwxjE7wkjEYwpgtB2MJ6L3rX8yx7
         nSM6mu8Im4XBITKKLQz5OVzuAmwZHXkMXsM1LGA8xFOK4N3ZqP0ZHXnCV3Oqz+hp6hg3
         JiIenZNajsQSnx2tn7EGw6PkDaYYO64MdWclSVJ3QnvWX3jemhF0Bx7H8cjQvW/KaDWB
         kTKA==
X-Gm-Message-State: AFqh2kq2Dm8JA4xKwEwF/IuerxA9V5kLNT9ZW9y82FqlIxa/bZl1KEbq
	b023nM7B7dEfSzA5XsS3XR1kWL1YlI1qY28Un0g=
X-Google-Smtp-Source: AMrXdXvhiDjULb2GpC3VGgAYxu4z9KG773/+UIbFoV+Zf0VWozoyIr1UObcb/H8cPUM1oE5SuAqX0w==
X-Received: by 2002:a62:2545:0:b0:581:fc19:4aa3 with SMTP id l66-20020a622545000000b00581fc194aa3mr10146458pfl.0.1672594703162;
        Sun, 01 Jan 2023 09:38:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/29] webkitgtk: 2.36.7 -> 2.36.8
Date: Sun,  1 Jan 2023 07:37:35 -1000
Message-Id: <83d09d69802647fa51d0ab00423bfc10c31996c8.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175201

From: Kai Kang <kai.kang@windriver.com>

webkitgtk 2.36.8 is a bug fix release in the stable 2.36 series.

What’s new in the WebKitGTK 2.36.8 release?
* Fix jumpy elements when scrolling GitLab and other web sites.
* Fix WebKitWebView:web-process-terminated signal not being emitted for
  the first web view when sandboxing is enabled.
* Fix hang when opening HTML <select> elements in GTK4 builds.
* Fix kinetic scrolling with elements that use overflow scrolling.
* Fix several crashes and rendering issues.

It fixes CVES:
CVE: CVE-2022-32886
CVE: CVE-2022-32891
CVE: CVE-2022-32912

Refs:
* https://webkitgtk.org/2022/09/16/webkitgtk2.36.8-released.html
* https://webkitgtk.org/security/WSA-2022-0009.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index 026e24ae39..7b2c5c6e36 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -9,14 +9,14 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
                     file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
                     "
 
-SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
-SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
+SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


