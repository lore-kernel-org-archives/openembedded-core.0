Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.111.1603837807015138576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hNGvMwFr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id r3so1523583plo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XbfOFI2XWhxa1VwNWiMvODYcdaua9dfrYck64SjoHgY=;
        b=hNGvMwFrZbXuN73FYg8NiudxOteOlgoTTaGt/jIMJ71GqQeKJM/NvZ2OK7PN2p7yrW
         tEO028lAOV0by9+GBd7+y90WVJKd83wVdsWOCcHkGJWtr8m2Brm3LjFoPb3W3ggTDTCg
         xpcj0v2XkmNptialTXUjWRo9DUPr4etDY6RFEWgwERVPUtxX20QtVykdTHcfD776EVO8
         Yr+jP24445P8q4Yuf4CKuJiq3hhtMIRS7G7zkQqR0KYFET7Btat36kmlTGeAX83LEeKK
         Arb9e9nsXiPkV9eB8JJUrhmDYtJ1zacuflSHUkfvko6ZaSqy3OAVK9wzJwcTYxP4LzE7
         glzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XbfOFI2XWhxa1VwNWiMvODYcdaua9dfrYck64SjoHgY=;
        b=JvJhCOy8wbg0824qKpx+Bwf2jMm2eJGghUXfnahNFviA2V47x+3fLFICbYmeCvp/nk
         XB6Yjc0z560OPW3TJO5ZksMlVomHR8RyRIKoGk0WF0ZDO8AaZdRJRG6s3YFcOkzcs1WM
         bqkT3umygsoz6jv166gLQj6dSShXlTZ36lpUMXT1f/lsDfKm6KIUEva6z7kpkuGoX9kG
         cjgJkOgM5uIv3Kygr+x06LuXE1o15fpzxKztdtcCCnwWt8e+rgljdQrCWfqw+0KuCy9G
         uHVHKj0b88gk8OhBtZdyAvnoisaqB72TbAZcyl2qr7NI7ExPqny0Iz4i0h5BVatdKNR0
         5V4Q==
X-Gm-Message-State: AOAM531LcNQ2oOEOZgN4Pj8/ozfCbDZrkUMv4CLeUwVsN+ID3ntteuy2
	WJ5jCGrJ21bZof5nBK4KSML0wrBFePLr9Pfl
X-Google-Smtp-Source: ABdhPJz93S69uZa7xl30cIP9E2G3fMx595BHuvWIChu5hz8izQfPD6Cqk9SKDNKEuu9UbwvvXFT68g==
X-Received: by 2002:a17:90b:14e:: with SMTP id em14mr3998698pjb.186.1603837806190;
        Tue, 27 Oct 2020 15:30:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:30:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/16] gst-validate: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:19 -1000
Message-Id: <d0dd153b0ab3da27985a47db8cdb4e26f94b893d.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
index 35492fe861..ef42abbdd7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
-SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
+SRC_URI[md5sum] = "740a436f5b9bf17ea7de0e62c92ec264"
+SRC_URI[sha256sum] = "c2064e887324af6aa476ca669234936711f253b29042f617f1d9f2597c4bf92b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1

