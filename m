Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.4531.1588176715380173267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ju/zWpo9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id a5so960567pjh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VPD4iKUdAbsSnAiw3g5q3RFdrLDXFk0gmUyj97qekmE=;
        b=ju/zWpo9Dz3+lomJHUx5WZytjvujFnEkfsozDNVR7EHfST/RPm0qb53tfbbOWHNyjz
         yjdvOdVsyV/XJ6Gxspm1rKdv4a9joQvwP2qDNYFbWXJRdYaImJTwPiYb0fn2isrdkjdh
         SkV3JuAy4ejxvas+RNPuqsxNG2hheMR8or2T4n+/zOaxVdEdZ1YeFv+PtZTnWceGkAXF
         X6AD6Cqp85v9jY/fd1rZ2rzv2A64cb4l9Z4jSccFLyk6/fd53Jk10YhJjsouGcfsThwm
         LIvA5p69hXFbVedhwn+I8sRV0XkpiPso1+1OE/T0gl9P7h7ujRyXZedv3gPHEMsu3dw1
         OpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VPD4iKUdAbsSnAiw3g5q3RFdrLDXFk0gmUyj97qekmE=;
        b=Xswym2o3jozncpcUc3R4hZoleApZ/mfTpEcmEoDKObtk2ezQDwbZ2CIofB9sh0woDr
         uN+qqu2kQ8l3mqrHCTO5bnDaa5hIPWdKfa7J/y/sfxEMKmi30QV+ZaDYQfpFrih2iOIx
         QJlm1FQcBfDxm9LdcvYIVECc2dtQVBxD1uv9Zs0pkJRsCMDeAooqrWZK+Wm0hyFXqIEs
         OO69VBrAE1xzzp1x6Xavz0yK+iC4yU3B+54tfGPW6Zc0uZTBYONbOB1psze9V4wi2pe+
         rhcREQ/0ZwOPZGT+y6sby6QH2OZcX86QpmaK2R9lMPbykiIhLNl3elScIKynKgaBDEcS
         1DaA==
X-Gm-Message-State: AGi0PuZubxHYvWDgaWoUtU+L/lY5jk7sFa38UpEbXpNWEUgTYnqCsaxw
	5sQj+PaHkb5FmfDJSpaR4Kd76Il3q7nmmQ==
X-Google-Smtp-Source: APiQypLrnJx/aSWIdUuS1yGDHkvCNu3ZGVweeaGuRvPlIi4Ds/tw/UAjEV145KQDt54q8nIWh2YM0g==
X-Received: by 2002:a17:90a:fe9:: with SMTP id 96mr4180081pjz.13.1588176714398;
        Wed, 29 Apr 2020 09:11:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] ell: upgrade 0.30 -> 0.31
Date: Wed, 29 Apr 2020 06:10:56 -1000
Message-Id: <3c0b540a1570f8ad044e622c6d34674c8e6dd49d.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This is a bugfix release:

ver 0.31:
	Fix issue with verification of the second certificate in chain.
	Fix issue with handling trusted CA matching in verification.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.30.bb b/meta/recipes-core/ell/ell_0.31.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.30.bb
rename to meta/recipes-core/ell/ell_0.31.bb
index 17045b3ae5..1db7131ab0 100644
--- a/meta/recipes-core/ell/ell_0.30.bb
+++ b/meta/recipes-core/ell/ell_0.31.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79c757858688cc6c36087605234d87a8"
-SRC_URI[sha256sum] = "51cf8cc66a9d1038e41f7d619ea5660aa4476904496562b2d45ca79370ca4a5e"
+SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
+SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1

