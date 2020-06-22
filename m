Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.376.1592848768623031037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I5euwDyu;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.193, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f193.google.com with SMTP id a3so16440967oid.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FL7q7bO0sOYPIHURsDHorVXmkNMstiLHET4wEajemP8=;
        b=I5euwDyub0/qDQN7+AC45AjwrO0VcIwWwe66qTZRmgfiNbokQ0O95uWHPcbuwlPbgG
         IG2s06Zl7OqPDFlbOk/wwL3l9lLYDuATMEO4IHslBd7TlEInrA1/2YFUbSyzriB9V3y3
         cQe5e6FjXHoDyz1CwMVbViw5y/u9XZd0QJthwYgmber9A/Oqb98Ap5xGEZu4l8qJyE2g
         rddmyEM5Ilua+uJNloBID29wVndfYxiVY9YnawZUAGZ0V1FzvR0Z10b0BxdRbQLJ0BH3
         by0PTPPA/Mf8eXiUxWUYG6tHYmeGKcDLtaBhBRdiaXjjzVIHYWnw0iauzYyLE5MGxuPG
         FcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FL7q7bO0sOYPIHURsDHorVXmkNMstiLHET4wEajemP8=;
        b=I+XjZqLQzQRwNiwRPMyOaP4a7u6FupK2jG5MTbSMnWO0MU5zAERobdqDqc4t3vlBji
         X183NGJgd7hAp4YSCcsaepkRv9extwXZMD/SZhroPkoLRthOlrVJgc1ASI2ZauFeXNQa
         tvEutUdN9AZzzMHr2uZcWtGhFuM3PIvnqqeHsEVy6J5xg9tKYKypX5S7nMn4SXIcOt5e
         iHqcX6yi5hceQbpX434qHNZ5fchaX4Q59ktUzJBqdUVJr69r3DvksltpnawJAGRprwzH
         GLiGICap7ak6ZJ+VJueBxJRfi5mkUXnGMvwOp3itBYc7i+0/GW19QcxvzSfDAzHIOjld
         eVRA==
X-Gm-Message-State: AOAM530FhJpOXvSTGVAH5NzWd6Fcf/S8NrcbeUq9MX4ij4ubPKM8vc6a
	Qh4CJukYSeVal9WCUcriqnqngST+Vc+b4Q==
X-Google-Smtp-Source: ABdhPJwKmMANRcN4FCwzVilbgd44xAvP+TlAIPQxNELJsb1G5Xu4zSRUCFysvacfzlzRLWPOPzjfCQ==
X-Received: by 2002:a05:6808:b14:: with SMTP id s20mr14017342oij.155.1592848767598;
        Mon, 22 Jun 2020 10:59:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/33] powertop: switch to Arjan's git
Date: Mon, 22 Jun 2020 07:57:56 -1000
Message-Id: <ca815f2d6f354bd025f25abe2b28a57f7a3363d7.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

01.org seems unmaintained; while the tarball is still there, the
page to download it from is gone.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcd6475928dba0a46d196d905cfd449ba7a3ada5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

