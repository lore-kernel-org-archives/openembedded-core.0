Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.6471.1601503938551553241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EdWAa3UH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id kk9so645905pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=J9ETkpxAOr8a5WbVaCsIHrOXE70ryP6LZ9NOgqJMn/s=;
        b=EdWAa3UHmeUOGLfPsc0IvvDllcU+VqzmaK5+xtlDf7c8GA6CjFnebrZfAHNVvW3UOU
         lFrEZxoVgmFIjFCsfrmbao+ry5/ocI9SWpnl/Z3BlNVufXhWA1Q18NC0dKTXP5pxkqg5
         rp47TuQo6zyA03NMoYpIW3jUrT7ZWexvI1J/UFZbCktJYI7v/Eor/vsCQ6SleqgSSL9T
         ulZ8EZcue+RwEKYtYx+ctvScfFeQQGj5o8fRxKMf2bcR+lgNZBSeYFutscnItoPuFTNW
         yyV7dh3C/rZIQHr/IqdQWMyrET+G7dKKgQHiIKARt8I88Gq6Fa/kJENoELoDdegp3ofR
         poMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=J9ETkpxAOr8a5WbVaCsIHrOXE70ryP6LZ9NOgqJMn/s=;
        b=dqutczufGVFfU/8x2Xy05aAJj8mG9clqM8unANvkMamgs9qx8ka7x5wUr81GsfNx1i
         RKPU/NQAf1yVvb73jLJFka0zQvXS9Z0+K/sCILEsBQZY7/GfcX2BlSZ1I17d379sGLZ1
         iJE8uFB2Mi4hejQtknfOr/NApkIcOlsdhWQOlx6EO3rUSb8HR9+LsOW9nLTkx+mRKMlb
         XR5wZyvrxU8T1IRHUvyI8ntVB3g9jxDzFnN6Qxsd0vw61O/NtX7OdGIlGR4Z1s0AA6JS
         ClcOy8EQQdWvo8AgpFxjz1GspchI2sDZrPlSso4l0VfHxgjPtRZm9jUC3whSlH/9jftl
         4clA==
X-Gm-Message-State: AOAM531x4/98lf+rT1lwjw4KvqehaLNCIWTAwNY4+tH3pHXzEc06kWyk
	O7nRxzDc37WtRE7O9Sk6ihy2AlVDhoionS7X6Pg=
X-Google-Smtp-Source: ABdhPJxQrxv+yTt8lPVnlOoRE6PHBFwU12X8yRvpx5gE66NjCaVaxJiOj6TVTFYjbB0ZFAOp7kzt1g==
X-Received: by 2002:a17:90a:8e82:: with SMTP id f2mr4261984pjo.142.1601503937618;
        Wed, 30 Sep 2020 15:12:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/41] bash : inlcude patch 17 & 18
Date: Wed, 30 Sep 2020 12:11:08 -1000
Message-Id: <bf8f33c62f6fe98777248fb05ce3105e9f63d03a.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash_5.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index 8ff9e6edaf..12d472be57 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-014;apply=yes;striplevel=0;name=patch014 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-015;apply=yes;striplevel=0;name=patch015 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-016;apply=yes;striplevel=0;name=patch016 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-017;apply=yes;striplevel=0;name=patch017 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-018;apply=yes;striplevel=0;name=patch018 \
            file://execute_cmd.patch \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -65,6 +67,11 @@ SRC_URI[patch015.md5sum] = "c4c6ea23d09a74eaa9385438e48fdf02"
 SRC_URI[patch015.sha256sum] = "a517df2dda93b26d5cbf00effefea93e3a4ccd6652f152f4109170544ebfa05e"
 SRC_URI[patch016.md5sum] = "a682ed6fa2c2e7a7c3ba6bdeada07fb5"
 SRC_URI[patch016.sha256sum] = "ffd1d7a54a99fa7f5b1825e4f7e95d8c8876bc2ca151f150e751d429c650b06d"
+SRC_URI[patch017.md5sum] = "d9dcaa1d8e7a24850449a1aac43a12a9"
+SRC_URI[patch017.sha256sum] = "4cf3b9fafb8a66d411dd5fc9120032533a4012df1dc6ee024c7833373e2ddc31"
+SRC_URI[patch018.md5sum] = "a64d950d5de72ae590455b13e6afefcb"
+SRC_URI[patch018.sha256sum] = "7c314e375a105a6642e8ed44f3808b9def89d15f7492fe2029a21ba9c0de81d3"
+
 
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.17.1

