Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.9673.1631282880305299935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EzqGEv6Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so2395418otf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q4DMix1nsWtQgxBDSSXEuIGVy14yWC3WLF2emCLPg70=;
        b=EzqGEv6QPYKMzdLYzC8iyHo6mcV5tPQTm7RPZJZkT6HIl3uryevaND3RD7+0v+GLiv
         9JYr2j+FcjPWnvEWPP+i432dy9z0aPOqo2LPVrpb43+ccJje6Gfhv5rqN5Je//VVwks0
         osUcwPh/4dLSTIbdND50MZnYP5YbXsKAxdtDYbj5Li8BqYohvWy52a8x+e64HpxenMtB
         jbRORkBi2mUmllf2/4Y7pJe9a5xSKJcxVvn3RtCc8flzagAB2xnsMhmWKHoB8Ot/icPZ
         T1a8XpGdOw91ZEMHemJOulV8uimhZSik0V9DtwzrZk7RT8X1kmqR8V4Ffwv3cNPwoU1s
         s76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q4DMix1nsWtQgxBDSSXEuIGVy14yWC3WLF2emCLPg70=;
        b=3ZzSnvByJAKWX7aetau/tJZ6jsJmDWc385rnzWQR1xeZT5Ze9lSzhz2xBDVtKYfPgg
         FTZVKSMcgtyaLqxWyhtJa0Meo9yFdSH345Sbv2HYiHwARcq+OaQUioDNJT7OpJbwtj9u
         we0WdgM3mSQTYoLIeDrYLOjrbCZDaTDILrT8NQBu9xf0nEMT+sc+hmHHZYA5ISSS5pen
         /fPlIuhcqueMKHKrQkrYQj/hX87HA78N4hCqUDlWdTysZMJPD6inFVwIrDN3U2LrDXcE
         dUCrx6iRy/ayU39BH7xFqd/OeY+zkVMAUjvavBcYF030TCXmwoitSLyZb4UepHsR/Fqx
         sLEg==
X-Gm-Message-State: AOAM533pL7C6MM8zQ+hrCSykiC6kfB4wUdWtnxJgn6njINeds7XnfemS
	e1GXZ5B6LgjNnDOygZxJ02m5u/VSWA3BkVKv
X-Google-Smtp-Source: ABdhPJzRFtGZfzqjjkQ34UVbyyzIjyxJAbQWuSgJePgmDG+mHEt5GPEea7AQeW4Y9LM9UkhFwXGHIQ==
X-Received: by 2002:a05:6830:43a0:: with SMTP id s32mr4865654otv.284.1631282879133;
        Fri, 10 Sep 2021 07:07:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:07:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] dbus-test: Remove EXTRA_OECONF_X configs
Date: Fri, 10 Sep 2021 04:07:14 -1000
Message-Id: <200b071b03bcf73ed68d744893826039fa178b9f.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

X specific configs are already handled through PACKAGECONFIG:
PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
...
PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x
                      --disable-x11-autolaunch, virtual/libx11 libsm"

Remove duplicated EXTRA_OECONF_X args.

(From OE-Core rev: 7dc107b05a29f8a3e8903d73f84ef8069f68af6f)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 036e3436e51a44de3fc9b4b8e5b1ff149e3aaa9d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.18.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.18.bb b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
index 0063dcce67..68fcdc847f 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.18.bb
@@ -24,9 +24,6 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
 
 inherit autotools pkgconfig gettext ptest upstream-version-is-even
 
-EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
-EXTRA_OECONF_X_class-native = "--without-x"
-
 EXTRA_OECONF = "--enable-tests \
                 --enable-modular-tests \
                 --enable-installed-tests \
@@ -37,7 +34,6 @@ EXTRA_OECONF = "--enable-tests \
                 --disable-doxygen-docs \
                 --disable-libaudit \
                 --with-dbus-test-dir=${PTEST_PATH} \
-                ${EXTRA_OECONF_X} \
                 --enable-embedded-tests \
              "
 
-- 
2.25.1

