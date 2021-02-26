Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web08.9843.1614349595895589516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KsOYUmpC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id g27so8424615iox.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5ICfP28Zu0kUFZ0b8MrAFBreATMC/7au8RFJoaODrEs=;
        b=KsOYUmpCgS4LSCihZoIVxydA2iI02aBCdADri8h6MR7rTZpSWmh93OYxxtMKXMPx7q
         GqCvWjEWWY1TREMu6bslJxJX2q0FbN7zMrW2EYYVvJq36/I7PWiRsmhDLtiSxIlGoUs9
         6JvDlLCaU2OsCgPRh335W/v9JqEGNvdGYwBbwffRb7WkYKVOPAu5YIrpX6KZcusUCHKg
         iG+GT8+28g8sDGnJHfwVF7m77zB8PwxwGFceYnzt+NBR1aKfNzljiz805gyHS5FiK0Y/
         pMtLoCV5Ti0LVxa1NsxtDxno8CC+Fn1pHc55H3mVCLAKst6R9+rkrt4n1h+OBq1xRhBB
         zGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ICfP28Zu0kUFZ0b8MrAFBreATMC/7au8RFJoaODrEs=;
        b=F8vuC6WavvT1KNWJggtzjCZLY0gaWeAV6yu63ESKNRbqbBMG99xm5qgF/KzCBqjn2Q
         Ay30qFHfpmXSPUH/dTUlRLv2AYI0tP45YabxWkxrBo2bNjwAke5lvLSqFBcNaieozQ7b
         n0h8IemurGbgPQ6trA5K0aHuudwmvi2SoSeWKsnRuAYfsM1A5wmJz+cs6fY8lgIZ5XEL
         AXohTA4FRj52dE2bHJCgM+hqaCEtZWUzKpJbBQr9JjhwgYo3gUUl/jPqhCwaCCAudafu
         Z9AZr/tWeKv35zZDEL0mOTYvQ4NRdngVd0s/VYriFghog9nOucQeSv4k1ldv4lLc9QH+
         GnzQ==
X-Gm-Message-State: AOAM532uOYnFzYi16oigAoCqNw30MJyMdqvHb0Ym+dMdEXfJEYam6JKF
	WqveXnYoALeR8BAy2d2Ezy8UhSR4QlFXAvJT
X-Google-Smtp-Source: ABdhPJxYMjn3//4S3zKxMBzAzX3FLjFKJ//O+yIodCmJG7v8Eqfhtx61qFqEhcwfnzVPfRKEBj8ftg==
X-Received: by 2002:a02:7086:: with SMTP id f128mr3156200jac.104.1614349594820;
        Fri, 26 Feb 2021 06:26:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:34 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/40] cwautomacros: Ensure version is set deterministically
Date: Fri, 26 Feb 2021 04:24:02 -1000
Message-Id: <17d86d14cad09746e3c7b69f0b7fbf994db9abeb.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The makefile injects the current date into the version file. Do this
deterministically with SOURCE_DATE_EPOCH.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31f2ad739ea776a1e11b5cef5434df188007c7bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 65a99fc28d..02b016fdf1 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -13,7 +13,7 @@ do_configure() {
 }
 
 do_install() {
-	oe_runmake CWAUTOMACROSPREFIX=${D}${prefix} install
+	oe_runmake LABEL=`date -d @${SOURCE_DATE_EPOCH} +%Y%m%d` CWAUTOMACROSPREFIX=${D}${prefix} install
 
 	# cleanup buildpaths in autogen.sh
 	sed -i -e 's,${D},,g' ${D}${prefix}/share/cwautomacros/scripts/autogen.sh
-- 
2.25.1

