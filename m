Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.9786.1620227956123659891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dNKSQrMW;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id u13so2506495edd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JNBSW7YhvETa5mtAzFRyacQ+pLI/7pGIvAUPK9O5/4o=;
        b=dNKSQrMWr4Ox7Eg6+stEN3DhVC9ROlaSEInCcFkV7ZWfb4lTGXa5XmZLp+J96rKfiH
         e7cit6r2g0rMzY7hU4W5Xp31Huvlgpgu1VLUJzj/JJS2OgmOtZ+IcoGbROENu4m7sL5J
         THif7NZZFxdN6WxRXv3ixmaXKrrk0bmY4pzyiaS0I0IEMl8BTPn/Nq/Atjvcd9qgqsWH
         iWE4ralmazvO1zn5KEN8V4Zqi72XQ0eWTYRVm2O3WNoNJs5jFvG2IiCjRt/QJcuJpJX3
         MeAknCx3GZsTb5nPKSKSXvFgQ+H9tiY+Jcx9Hcv1LMaCKB17HM4GOiS2Zqgp7Ne9p6P9
         zvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNBSW7YhvETa5mtAzFRyacQ+pLI/7pGIvAUPK9O5/4o=;
        b=dRnMZU5V2PWi/J5bvaIhPiRX0VJXdvQO17QLmt4uNVpLNPS69ka7pBGeRzAER+10pE
         WJy/93oWl3z89IhvudNspdoe6LNvJxvQff6H/gOLAszWugSCx0SnMjmWlwvKwbTCQmDh
         ehAeJwj5TI4BcqLsFL5ZySP3bA3y42A7l3G6Oio1yf7+IJ6N5azz+hQkSTvb/5hTDTJ9
         mX5LxKiMiHU5HsmRGM9fSwH6ykAXaqOxa6r82IOG5egvp+Mp+c+BAQ5u7KDbUPT5YfT+
         yl33s0e1WAqB8RLYpC7fxAwCgS0M11k6BQ0//ixn6IN+T6zyfrgJwpoXCslHP8CQmynX
         Ie9Q==
X-Gm-Message-State: AOAM532HVprvox4rtKk5VPOwRMeHSM3VT7JsRpAWZmclwbBZlY8BNlXa
	q8XpEXKzhZJljIZoTyMxItv3LrYr5sX18w==
X-Google-Smtp-Source: ABdhPJzhXVp78O9GWkkes01xQGniVKH6/hMRHLoe/h61s2xp69bhvguPItWbzb2RkT5q8ZLTTF+Rgw==
X-Received: by 2002:a05:6402:d05:: with SMTP id eb5mr11922045edb.6.1620227954791;
        Wed, 05 May 2021 08:19:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/61] powertop: update 2.13 -> 2.14
Date: Wed,  5 May 2021 17:18:12 +0200
Message-Id: <20210505151850.660512-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop awful ncurses hack; please make a proper patch with a configure
option and PACKAGECONFIG.

Adjust LDFLAGS as somehow -pthread isn't there --> link failures.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{powertop_2.13.bb => powertop_2.14.bb}         | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.13.bb => powertop_2.14.bb} (64%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.13.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
similarity index 64%
rename from meta/recipes-kernel/powertop/powertop_2.13.bb
rename to meta/recipes-kernel/powertop/powertop_2.14.bb
index 8c7e78fd94..cb7f3c4dc1 100644
--- a/meta/recipes-kernel/powertop/powertop_2.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -9,21 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
-SRCREV = "184cee06b2d64679bae5f806fe0a218827fdde99"
+SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext pkgconfig bash-completion
+LDFLAGS_append = " -pthread"
 
-# we do not want libncursesw if we can
-do_configure_prepend() {
-    # configure.ac checks for delwin() in "ncursesw ncurses" so let's drop first one
-    sed -i -e "s/ncursesw//g" ${S}/configure.ac
-    mkdir -p ${B}/src/tuning/
-    echo "${PV}" > ${S}/version-long
-    echo "${PV}" > ${S}/version-short
-    cp ${STAGING_DATADIR}/aclocal/ax_require_defined.m4 ${S}/m4/
-}
+inherit autotools gettext pkgconfig bash-completion
 
 inherit update-alternatives
 ALTERNATIVE_${PN} = "powertop"
-- 
2.31.1

