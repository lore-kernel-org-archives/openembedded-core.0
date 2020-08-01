Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.4445.1596317027699860549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bFZBD6S1;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g19so21030826ejc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z6aGq3ejpvo+syUU7MrwOov0kksHsbmZ0nhiz8aAr0I=;
        b=bFZBD6S1mQVsLJYZfYLI+XtDHe8clK1TQY+iT2b5/w9SysX3lfRzyko+Eyc19bVZa+
         egi32FHfQDzA4qCsVn8bEXcDGqnFw4k5UTnBmHk3u2X4OTok1XTDPNWOHK4esBgMpZaR
         i8Cac8z54r39NjicJaO6reOXzujsmY6e8tYFkfMg90PWqB3XP5N1HdOwUZtpnkI9xsnQ
         UJ5DvUKzY3TYMqghtGjPWz+NSIr7Zhy3ZU0XD5eyrAl5NFQm5rW9DoseibCVo4X6B+Lf
         f9EsEqeo126svutVkq5dYWeXTPWpeKatw1G0/4ovQs52YwPiKFYqPmMIGm+eXWSeDBB2
         GKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z6aGq3ejpvo+syUU7MrwOov0kksHsbmZ0nhiz8aAr0I=;
        b=RVS8mbtpHk6LkEfQjxQ+Z8Y7E+pSoYfa8HBu1ygQtsCkSzYGZcwpWuaA90upTrH87K
         LLCD3XP8aaga7N1Zchs+fGJj1u90HGIctpRCfW3Bkly3G/1UAnD/1UGiuY16+Pq+sWrY
         I9Wny4BjMvXi0zuP5sRAYgnkT4/KfjBeXtdbSt5S5YZ0XUtiy+4nsz0DT4Z/aq+/o5I9
         1O47kKy9OkBirJBmwgkOtwzxI/Fv1tS5UKn1L86NocLUlQODirFL34BXWCdyfZED1VPP
         D/+wnARi+hP1tGoiMPcvNGthMhOME9YJlJFFXS6ZOO59+CNKwIm8eDBSly7GhmZIIyPB
         3Ydw==
X-Gm-Message-State: AOAM531ar+INg/31ANQDOFh4FU8nWQrULJouYvm+zUKIznt2rO6BUgE5
	huDzxOUIUEM23LcHIhGaDtyfdiQzYSM=
X-Google-Smtp-Source: ABdhPJzSwYwg720s4Wgwut7AcKZTctFxh/4L+6ZbbiOJYwNwpGpm7nBaoaSTHDD5CJNnpgpaY/gvPQ==
X-Received: by 2002:a17:906:4341:: with SMTP id z1mr9777042ejm.392.1596317026005;
        Sat, 01 Aug 2020 14:23:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/13] gnu-config: update to latest revision
Date: Sat,  1 Aug 2020 23:23:25 +0200
Message-Id: <20200801212335.14922-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 54eb5e48a1..200b1f1856 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,8 +8,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "696cd4a4eab1ee9fefbb7e38dbab291d741d0c5a"
-PV = "20200621+git${SRCPV}"
+SRCREV = "2593751ef276497e312d7c4ce7fd049614c7bf80"
+PV = "20200721+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.27.0

