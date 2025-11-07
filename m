Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B64CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6162.1762499304954847741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D8YxoEHh;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34088fbd65aso418218a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 23:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762499304; x=1763104104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYWgBpH38Dw9mPeBk5/jZGbv3Ca9KwlDs6b4gl+UClc=;
        b=D8YxoEHhPPOpoZt0ThHDzeY854xjpJ1PG1YfsJTjLjhCGNio4AABR/pw+7nkccx7ps
         nfn2qXd9eHWy+KTgah6b1N7MRSAtEsbWSeWlpYAshlTIblHs8bZIOWnRDN3kwTijYc5Q
         w/ATN+YGnEbPIzEx7VOAGosLOqkokK9z5IoCahLdejuL4JMv8p0YWf8GlXJCpXy6o+dV
         bsrY+FWgqYXWRxzd2AzIF7eonEWIkd3VoX8prsfs7mHKrjiGIfVB+L5SAiwblyCoM7Zf
         G5kiarwmd19np91odM46Ic5lME5yxs7LaluyRkYt2R+ab9/aOTeKGuyR0vGrBe0Bx0UM
         OmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499304; x=1763104104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kYWgBpH38Dw9mPeBk5/jZGbv3Ca9KwlDs6b4gl+UClc=;
        b=EvOdI7JuGKgd00vfmQyx57MmAsX/J4Y7SDZDTYGaGrNrAJGOfBPlDyufdFyIBUoRWn
         2DzRwhN/O2F2ML4E7FAXwBFHiTjpA1kNdfl8OA511+BseNomr7QR3c0mP00FoEFdP2iZ
         tL46x6Ej4bvIXZ5fGlUVC7FyJ1VIbEBN8TrzF+wJTPerlw6AbiYzW2e1yOjzNfUjEanL
         k8TxRGiWnxg2+sldMz2neFjWV2teUztX3dH7d4ejr09cuPOzCpNvSTt6y0kD1p39oHPB
         +o5Uk9CSTd0qhHAQ6kcioEkmG3wvnxWF/zk3KEGkPkdFele3aqRUEUqUyhhHx2bO2jWV
         /9OA==
X-Gm-Message-State: AOJu0Yw6xIw/iO/QkWpyovbT3sc1iVRZjlMiOCDtPkkUVTZgHonzK/2q
	AxA+Yz0yW7y7Za6pBenCiOOgUKcdCvK3cvY8jxiACFYSV2v4FjnSKJCq2696bmkHsDU=
X-Gm-Gg: ASbGncuBvytVmJPRIc0iPumD/d7ADYQ77u+vaYo8GlLD2VThVvSTiphyFacrPNIOR1B
	DnGuxtnWE8mmGk293Pi9WeKqclXL5HXnlYA5lkWhUQcljMSv5rmLDObFYuVLkQdMXsYpL1KDup/
	WIPltr8jCrUHAoOsTIkwvH1NxYa+wtWT73wlTFzgDV/hAmL0+kf1jE3tVxmaC6VxSrOLk4jIFVv
	Kj+D/M7rTMgNEso92FeWO/B3SSXfR7Z+hy52YXH3rJSwEr9melK+C75+YVcywmtHLuzQgqclOir
	PzbQDopx/jm3JfvsR7nf//0KoD9IjpplISuba4d3W1qB21WHfLU0j8uuKuBocLeGI00rvmX8kW1
	jAxZrDY0EePR2nIWJQoAOad+zsPDbXXwb1T6MPrP+hlUpAUkld4eogMt+vbCDpT7AEGoIXpKZJI
	noWnBjPi2IyNA/bNkFSAd44U8BhU6aNJa+asrRsrfpaRiladAM/sC0C5U9ytcsfg==
X-Google-Smtp-Source: AGHT+IFu5ct4E14y7sQtkw8Ne9Y0pJ1dCcGgYPxv+JPRhp62V3raUBxhAUVZIRmUv3CH9K0+6H60Hw==
X-Received: by 2002:a17:90b:4fcc:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-3434c4e4369mr2616406a91.6.1762499303906;
        Thu, 06 Nov 2025 23:08:23 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm8561625a91.0.2025.11.06.23.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:08:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38 -> 4.5.0
Date: Thu,  6 Nov 2025 23:08:17 -0800
Message-ID: <20251107070819.3751599-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107070819.3751599-1-raj.khem@gmail.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226010

Remove branch variable and add tag in SRC_URI

License-Update: New source files added under 0-BSD and BSD-3-Clause licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bxcrypt-compat_4.4.38.bb => libxcrypt-compat_4.5.0.bb} | 1 -
 meta/recipes-core/libxcrypt/libxcrypt.inc                 | 8 +++-----
 .../libxcrypt/{libxcrypt_4.4.38.bb => libxcrypt_4.5.0.bb} | 0
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.38.bb => libxcrypt-compat_4.5.0.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.38.bb => libxcrypt_4.5.0.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
index bb4e2032dd6..30ec6a4674e 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
@@ -16,4 +16,3 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
-
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da515d19270..47961fbbdb8 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,16 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
-           "
-SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
-SRCBRANCH ?= "master"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "096296cb6fbecd9ad46c93a410d76c752a5d6206"
 
 PROVIDES = "virtual/crypt"
 
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb

