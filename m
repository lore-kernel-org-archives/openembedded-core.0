Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.5850.1609856713448657374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Iuza9Grl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id z12so1779308pjn.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=C65oe+YQUL/cqYRcrDqcQHtv5UzINsrf4A+rnlRyrts=;
        b=Iuza9GrlzjdX1QF7MI3KF5CSnbUEzZrzZBRSw8MYTPK832lhaYUj6NJ2sVwDSz4H1X
         unvHFP/Nf+/q2EsSl1TA4N77KwhOGKmUxnHOOUOBDiNbhwiFao3CmDgGhx2pAfhBjK4d
         /A6M4zak0fmocoy+dSsFHI49K+DQf19BeAQZ+iNDlCXoccz+L1+XxQmN2pg4ldwi3KOO
         MwCy9nOURENVzOl/BNM6+ueD+poKZfy8DFkKdZDeN9v8Yta23oIYwQCdDW9G69xj8/US
         MeEB6sIeoPPmWiQ1ePQGmzfC/qwArE9VaZwpLHoBsWNOSj+2Cu4zCzvIhXXurD3mbvgT
         KY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=C65oe+YQUL/cqYRcrDqcQHtv5UzINsrf4A+rnlRyrts=;
        b=HvDstrvQvY/IF+8lDgycfNBT+bVsszQ11moWM7O+9Vp+GbccBp8OX/CUnaH6bmqvYS
         LHENWXMhAHtMl8oCIMTWH0cuhbX0m3ci574vc6g1MXr0NrEPZNSzeYwiYQM162bM1Chy
         0wOiQ/CGhrqhxWx6zZIObNgEh5XasTiKW8WD3y2RU7/9Qhdb5SRp8dKPs4AHvvFgbYgr
         tpD2ppWgdLWOmLKDfFpX8XeXxEWl58Vg40FOWnqEdo3asFulqA/xCrO4Kx6AET9i3KwT
         MrczbS6yn4se5YbSli+VqmQMYfFF6a+6tvR5FkF5bQ/Ev04Xjo1FrSsuz1jmwmuxkewc
         FGAg==
X-Gm-Message-State: AOAM531kqCAr1T0XOHCnybtA7H7YVqeV76+Vtpp6p3kpRE1XtMGC2aRn
	pEFCQsPqcj0MCu4gfx+fvm9e973C6sipRjL/vR4=
X-Google-Smtp-Source: ABdhPJxVnWZetw7zbNqaJ+hBye+TH6Fv6UJychg2X/l7n0dvWgxWMynxRkkvt37D8cHzbdCcSXG2EQ==
X-Received: by 2002:a17:90a:be17:: with SMTP id a23mr4278843pjs.236.1609856712681;
        Tue, 05 Jan 2021 06:25:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/30] wic-image-minimal: only depend on syslinux on x86 targets
Date: Tue,  5 Jan 2021 04:23:37 -1000
Message-Id: <4d4b907554ab964e6b68f3d588d398174b5d5459.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Following other examples, only depend on syslinux when targetting x86.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c58fcc1379ca5755a5b670f79b75e94370d4943c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index e1da203b59..1cb019898d 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -6,7 +6,10 @@ IMAGE_INSTALL = "packagegroup-core-boot"
 
 IMAGE_FSTYPES = "wic"
 
-WKS_FILE_DEPENDS = "syslinux syslinux-native dosfstools-native mtools-native gptfdisk-native"
+WKS_FILE_DEPENDS = "dosfstools-native mtools-native gptfdisk-native"
+WKS_FILE_DEPENDS_append_x86 = " syslinux-native syslinux"
+WKS_FILE_DEPENDS_append_x86-64 = " syslinux-native syslinux"
+WKS_FILE_DEPENDS_append_x86-x32 = " syslinux-native syslinux"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-- 
2.17.1

