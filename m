Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.7066.1588683734336524520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YjiKeiXO;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id r26so2263094wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z4cC2pVgXUHLP36tMfg9IxAsmrKtOlHKLQOQ2d8NGFg=;
        b=YjiKeiXO0hjh3UmCqC1phZG/GpUk3D+x0S5iEDqBghxNk/hKu/CAq9OrZv4n/Pp6rV
         OeR1KqXUzQLNu0uf/HIPtLm8f3iqNf4MeHkQ+sXzvUAaqtqvB2UzZJplq3WHGqgmT7ZY
         S0YuaXytzLHR4k1y6o9+4/u1RB+knUIG0tsExTGW1bmjqMwIuLBocV1Ib7MYrSzZeQG5
         r4qHT0xF6RSVxvAOxPEhshL8sqRSWpmYVFGUkF4l2m4mAYJEwKmGlXpEDRNckW5W0deb
         1GnrV3OXVUkCwR3HwJbh+w49ejURhQxsISR0nCFg55ZtuBmSqws3DxtedG+a1H47fIjY
         3+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4cC2pVgXUHLP36tMfg9IxAsmrKtOlHKLQOQ2d8NGFg=;
        b=UwBVU7TU5gUbpjUNGjYopXXO2J6TjV1G9CpTH6h+QThwt2cfzc/GT/udPS24c0Ceju
         DEDZ8o/Dwl+ujuB2hYXwU9HmlQsVfvHIjrpTt8NFwcxwNxSenSAuRLJBBnBcbGNXLQwH
         Y85MLoMObPHVy23tIZNtiyGRJGIyAs8ryWNjOfn+hoatQ4lQDLnuv+PWilM4GLUVHhcY
         nRCFJxhSptinlaEwaC8Zg5z2YzNzwVAa++xtlP09hI8aN3BfvpZ5KpQiHjFhvXBBNENp
         EYBozpjIxCF7G3aW+vJJ3GFgj+lrfVj+RKcIboE6d3/TJy0B/3Hn2M+Me7cif3C971PU
         oANA==
X-Gm-Message-State: AGi0PubCEMfs+K0b+SqUSLpy/vdurc/ALZYh6IhgPWz0IG2GJFdM43DP
	926htYybrccN2uMMJ2lg4qgVdgsA
X-Google-Smtp-Source: APiQypLDWD5rw2YbmCM/gZ6hFGu4MoxvxSronwhbp/O4uRWFdbt40YCvOYUKrwFiWIgYRpzcJZbQAA==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr3174314wmc.161.1588683732670;
        Tue, 05 May 2020 06:02:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/24] powertop: switch to Arjan's git
Date: Tue,  5 May 2020 15:01:21 +0200
Message-Id: <20200505130133.24930-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

01.org seems unmaintained; while the tarball is still there, the
page to download it from is gone.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/powertop/powertop_2.10.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index 7b7b3929b3..f1b0e92b2b 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -6,25 +6,22 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "https://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
+SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
+SRCREV = "e8765b5475b22b7a2b6e9e8a031c68a268a0b0b3"
 
-SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
-SRC_URI[sha256sum] = "d3b7459eaba7d01c8841dd33a3b4d369416c01e9bd8951b0d88234cf18fe4a75"
-
-UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
-UPSTREAM_CHECK_REGEX = "powertop-[v]?(?P<pver>\d+(\.\d+)+)\.tar"
+S = "${WORKDIR}/git"
 
 inherit autotools gettext pkgconfig
 
-S = "${WORKDIR}/${BPN}-v${PV}"
-
 # we do not want libncursesw if we can
 do_configure_prepend() {
     # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
     sed -i -e "s/ncursesw//g" ${S}/configure.ac
     mkdir -p ${B}/src/tuning/
+    echo "${PV}" > ${S}/version-long
+    echo "${PV}" > ${S}/version-short
 }
 
 inherit update-alternatives
-- 
2.26.1

