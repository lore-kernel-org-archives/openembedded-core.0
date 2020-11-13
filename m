Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.5324.1605279167314507803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rJJN1i9C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id z3so7792141pfb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2om/8/ojjd5hvWv1RTodDt1QWR8CCmjVsOfdbnTMfiM=;
        b=rJJN1i9CEhC/OtNl+AewWoZse7VAkyO95erljAdwq+KAJJ62A4XwqmnbrCLKsghehR
         t0J3lpTaPOMNG2pC6Lh/M3k5rRCIcgGkn8wi/bIa9ZAkbI8efeoDRrEHGqaYGV3GrH4J
         wzWA64RnAzr9HtqstsCfOd4R/91rV96E2vsOf0RTYI4IS+OeaFMaqUXfvTTAjPryj3dv
         BKWivpbKXA3hGzgQ1eHcUHt/LgGZabkPjasg0U4qF4NCdAVlKVi51f68Fh7MYmSuhsf0
         PasDDBKdOEccPsGdkAssNW3xiiYs6jPtWALVVazy61cj1hzsxEZxLLAqJMFzU/qMRQ/u
         eg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2om/8/ojjd5hvWv1RTodDt1QWR8CCmjVsOfdbnTMfiM=;
        b=Rv+Jl2CSUA5z1LUoYIHZ0sJjgE96GtF8Q5oOjvju3R3V9SCt/W5NMUzjLRwgjVsWgr
         dtMrAzS6V9y1X3O7K5jnQ6PhD0c8GPXzqpKpTbF1ebNAxwLHDbUTa1PL9R8mPzcZPcgB
         +o3t7j7xgdrdw85nsKLqemnGxGHdQD3W4HpOwC0jQ5FxUbTc1f5oc/LchLbAwFLZSNmI
         jvWhkX9dQpU/FZT/ydmXXWSRwChXtBABJonx8w2qUhXS4+c4TGEe7dxPIE3Tpoqq5oh4
         lTTWfZHdLfbjTBMllm+K2NwdFgdv3oZMUuUixsgxB2R1sH+ppDge+O2NzqSUTC/UaESV
         0wZg==
X-Gm-Message-State: AOAM5324N2d4at941ap31S89wxhKi+1qZCFq5tok9RNH0XjJu1qrSYYL
	DZ0APlnIqJX2brFFrJXoYawYwJDmCbaY2p6K
X-Google-Smtp-Source: ABdhPJwtEl3nmsyeQIuJiXVXgo3In8BWrwG28EbSRL64ZvEnxCASPj5rYu8kS/jKltBtqa+6kTSNow==
X-Received: by 2002:a17:90b:f07:: with SMTP id br7mr3619238pjb.178.1605279166417;
        Fri, 13 Nov 2020 06:52:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:45 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] alsa-utils: Fix license to GPLv2 only
Date: Fri, 13 Nov 2020 04:52:08 -1000
Message-Id: <23f482ba5e6f2b0ab093ad73c4b22978f4bde543.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Parts of alsa-utils are v2 only, parts are v2 or later. The effect is
the end result is GPLv2 and there seems little value in marking everything
as being a mixture of both. Fix LICENSE to match reality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9a17a991174b732597e21045763ea851f486a01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
index 9144af628a..1dc30f377b 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
@@ -2,7 +2,8 @@ SUMMARY = "ALSA sound utilities"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
-LICENSE = "GPLv2+"
+# Some parts are GPLv2+, some are only GPLv2 (e.g. axfer, alsactl) so result is GPLv2
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3;endline=18;md5=96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS = "alsa-lib ncurses libsamplerate0"
-- 
2.17.1

