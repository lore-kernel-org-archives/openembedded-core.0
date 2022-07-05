Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD95CCA482
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.86660.1657040631781878457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=POXK1DzE;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id g26so22735239ejb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ucCs6qEi5/VLeI790jwRSC1ApRo9S/KFy7Uilmgj5MY=;
        b=POXK1DzE/Z0+ULV1FqwDF9/IOH4kkmm3jgZKdmk4oNus7NN03bYN/a7TunMrkbG1tq
         CGzJ+Hn7jmGTaHDDjbTnJdER8Pp0gF71aqSLkWIvemhdsD6DgFhUxfr8LwjsxCAboTY4
         GBkHHGJCrVy44DtIHT3/OwzkgLlcn6tdMq/YKn7G/05yYDldHrP8+2MCyDsWfQjD8Fgq
         IhGVhbTHsETJcMv2PambOe4KYu4Ny9rDzsJn2XgR1QCi7ggb8a9zUJ074yOmobLkWwH3
         XYSdDCGhAuddAnKT5xI/g47q2hx984OuygxgRIgf+zwkLdi25MaMvslqwyiS0gWrnmc3
         E6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ucCs6qEi5/VLeI790jwRSC1ApRo9S/KFy7Uilmgj5MY=;
        b=H/b/1j4WEPxKO4+w1vQevtXRpPeXSU2CTY3/2mafTKXKvxeDggffA7P5eK/fr48Sn3
         +6sfphxprhhsal/nEFg/Fru3kuBV4P6C1KX+QgLgPaEZjmB5Tp7WgEcwx/4EpDPU9pMe
         RVfV65NM7WEw5VbwsVTsmxdXQcnPKnOBEMgYOaG5Co2zjGlkRrMyzMfLDAyz+NMhXMx9
         hYRUCjvDKB8yJSN5C9AWe+wCrCsIQu15YeXcF8XGZW+JV7RMZ+mhi9DjUHmyCnQ8kl5V
         otH0YpbzD92KB8ehGG6bln1GW7PCZDRO8o8hkjQ7yE3KbQiqohINaynyHNlWI37XSNJc
         PEUg==
X-Gm-Message-State: AJIora8Cky+lw+RuyM3Hc9o9qfcji9u6AYkhuHCr5wYH/AmBqN9BPa8M
	cA41rUt9Fst0uMtbU+T39zmb07dTDNGx/A==
X-Google-Smtp-Source: 
 AGRyM1vI//FYQBPf8ZnTu95rtbAX/q2vIbtFTO2cRXjKCxx9jcfoMTTzbngvzQOAxTErws2IzCWKDw==
X-Received: by 2002:a17:907:7ea7:b0:72a:b641:d38 with SMTP id
 qb39-20020a1709077ea700b0072ab6410d38mr15300597ejc.187.1657040630170;
        Tue, 05 Jul 2022 10:03:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] wayland: update 1.20.0 -> 1.21.0
Date: Tue,  5 Jul 2022 19:03:36 +0200
Message-Id: <20220705170339.771017-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167672

Drop the patch, as it is no longer necessary
(genereated .pc defines everything as relative to the .pc path).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------
 .../{wayland_1.20.0.bb => wayland_1.21.0.bb}  |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb => wayland_1.21.0.bb} (90%)

diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
deleted file mode 100644
index e3e71925b8..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 17 Feb 2020 21:46:18 +0100
-Subject: [PATCH] Do not hardcode the path to wayland-scanner
-
-This results in host contamination during builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 15730a3..61edbc8 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -52,7 +52,7 @@ if get_option('scanner')
- 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
- 			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
- 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
--			'wayland_scanner=${bindir}/wayland-scanner'
-+			'wayland_scanner=wayland-scanner'
- 		],
- 		filebase: 'wayland-scanner'
- 	)
diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb
index dd48a29dc4..ce59e601d2 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
@@ -12,12 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://run-ptest \
-           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
+SRC_URI[sha256sum] = "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.30.2


