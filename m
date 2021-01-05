Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.5994.1609856737093940722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=htRDvDW5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 30so16675618pgr.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=McERkokuYP8yGOVZ+Y7TYg7AaeJ5WZSoCFdJBgJfydw=;
        b=htRDvDW5c+DaHCTEUo189VZhfw748vGFQYP0nAgbWvqiXjivr6ULoZEcS4G6PJ6qqZ
         1AYpS47BE/dwKSj5V5LoQ4xY1DTC3MID3y9ocflRpTtBTyoztQpJ5I/DNTvHLfTK/2sQ
         gfyd0LWJ6P8oLhPgXgbDacUfRmKkDbq1tM8MzWbRfhmwEDdRNIsLGEocxfz1tR7UCLR2
         mW2B42yTH2bkIpbs7+w+XG9M9bk9Xa9VpV2j6Gmv3hDd6olW+9YCgJ3t6FAUflbkodxC
         vKuVgp8aqYEZcFBRH0sKZewZRNICNNhtJU+/Am4EJrHJaUU3jryZXHg+dPXW3UANCHP5
         R+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=McERkokuYP8yGOVZ+Y7TYg7AaeJ5WZSoCFdJBgJfydw=;
        b=Uy3TNjabsPtOzyggyGu4E+b4HJeRYiqRBI4flFajzL1ig0fpvRPbylwza5aF9sCTtM
         Lu8CNcKDiMNU8tS9SFqN0iJiOknINMx+tZCdCDC8HgAhOYdJCmF1868KOUkz369f71N6
         eqZjsQYypWPmWVmdrW4Zf4aH95X7NRPO4tpirMiLW1Ggy3tEreWSt05iryw4x/kXG93F
         6Dp91LNBPIB+B0J8n4jDOmZ3cQJG0VEpkUGs5iY7eOFmUc50IDXbrNwSvesOOozJEfj5
         KZIEiYdfohiP3mvQ0O/dcplHl0VzFt9lIoTZFLpnMefDBWJ1BZU0P9GyglvBVl3Phe+e
         PE/A==
X-Gm-Message-State: AOAM5310UKYoHDlLGEwXaK/GZHOYopbdxjQ34doz+0FpiS9WsOb/SrIv
	rgNp0kw9Ev9A+F77qbHUk5hW9Slz3zXbAPP+22k=
X-Google-Smtp-Source: ABdhPJxg/0mEnbkYnhO79QiJaPfYG6KU9NNbhXUXopdz1bMSKS6MfUJKAJGUVDxMTJjI/wfWywMXvA==
X-Received: by 2002:a63:b18:: with SMTP id 24mr17241800pgl.160.1609856736204;
        Tue, 05 Jan 2021 06:25:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/30] pulseaudio: Remove OE_LT_RPATH_ALLOW
Date: Tue,  5 Jan 2021 04:23:41 -1000
Message-Id: <0e0b43bf902963677c03b8e3ce7b976ae81158ae.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Tanu Kaskinen <tanuk@iki.fi>

I don't know what these variables were supposed to do, but there doesn't
seem to be anything that would use these variables, so removing them
should be safe. The PulseAudio recipe is the only place where these
appear in the repository.

These lines were included already in the original PulseAudio recipe that
was added in commit d9a4c588ef24e7e4019fbe5a2314addbcd3a6bb8 in 2007,
and already at that time there didn't seem to be anything using these
variables.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a0b9209a366de7a2aed9b23a337b4ffdba61abe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index c7f3e67022..417eb1d9d3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -137,11 +137,6 @@ EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "
 
 export TARGET_PFPU = "${TARGET_FPU}"
 
-# TODO: Use more fine granular version
-#OE_LT_RPATH_ALLOW=":${libdir}/pulse-0.9:"
-OE_LT_RPATH_ALLOW = "any"
-OE_LT_RPATH_ALLOW[export]="1"
-
 set_cfg_value () {
 	sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
 	if ! grep -q "^$2 = $3\$" "$1"; then
-- 
2.17.1

