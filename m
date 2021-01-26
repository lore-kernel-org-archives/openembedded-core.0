Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.12957.1611672182278746598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jVVz+2sE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id o16so1940873pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=snnoSIngspfsu0nrxKzxxV6NpJFG0xl2cFy9M6VFWY0=;
        b=jVVz+2sEeuNESsXd0EK8yGA0lu1U8iK4Gsz4gopmSs+EPPT9ycYMJrLQKhDvvG3C/Y
         U68zN1hyY3F8Y0W8XLGU6xrlRpuTgvW4p3ef64BSYoq3Sg9xGUz9+0Zc2Nw2ab0iIIdI
         oCo2nQDUXhMN5r90qVdPFapVe1o8+qRUPEBySijDIzc4jPQ2vq+YEIeRkxGrigzAlOmI
         ojGEc/f4CGsOdXft7Cd0kgreOvGrOspvR1ZAVoPdwzhu2p8O+Tj6a5fH/PH3uS3ZRoIY
         b1VNcjGP7ZfGvkHMEffQpsMZa88BqHKIkJZHZ7azFCfwaIeviQFhckBCqQM5DZ+wQP+Y
         wVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snnoSIngspfsu0nrxKzxxV6NpJFG0xl2cFy9M6VFWY0=;
        b=W54Ic1pW7lBD1dPHPIlT+3ajkJ3sKZ+i896tozyc6jKmJJlp256GnNxtPswH09JZYt
         hm3OcmXS/fC6Rhf56GpeKTrNCFESEsdtvkXnMcTNHvhLktH4RRbe4+/FpT5aKvHZaepT
         8jCu3XIzPpAQ4y4EGTWmGdwlTMrbkOT2mhzRpW9/5qA/nOswVZKhKdhMc4cljgL3DZZ5
         v/57CFBaQ7e3mAB+MQ9Dg921os+CXQFAWnoLSnEkW0QwdxfwZJmtEne+GzqLuP5tQo75
         V6i9N9R0DWH6pzzGAL0yNjlX0BVAeH9pEX4hg/gVI8Z+kwm3T5Jn9l90ym+0J7iLisZ2
         hhpQ==
X-Gm-Message-State: AOAM531DBqZdWa4+n94YZ8kEc1WbtiMJNkyfWLTqGlC5Z4ulC+eWz+vT
	nEY3MfS2tKN4EXQaa/nZPPwhg7BK7z+XrZkEEsU=
X-Google-Smtp-Source: ABdhPJwj9Epya6LlcMDKJA+2x5KpzTBho6332ODYJx7kGODj4Blrqjl3bGprm+juIsOatG6Su6JaYQ==
X-Received: by 2002:a62:f943:0:b029:1a5:43f9:9023 with SMTP id g3-20020a62f9430000b02901a543f99023mr5526244pfm.75.1611672181378;
        Tue, 26 Jan 2021 06:43:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 18/46] bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
Date: Tue, 26 Jan 2021 04:41:29 -1000
Message-Id: <cc2130323eb6ce7f37010cd5eb4290ebdc1b9d64.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Unfortunately, .pyc files can be generated in meta/lib/oe which corrupt the pseudo
database so we need to extend the ignore list to cover this as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e0cb6dd689a362d8433caa14cc5a9fdd5eb44923)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9cdadb1269..a2fb9e2c6f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -686,7 +686,7 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts"
+PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.25.1

