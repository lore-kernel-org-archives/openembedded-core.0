Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.35412.1607956664096131418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fp6C9aAW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id c12so12088051pgm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oTZeSaFjW6Qg9j7ebCm9L2GXg8/IOYjWlz5/pgQNCPU=;
        b=fp6C9aAWQEU4uY49SU2aYX9KzJeIU23mx1nVPwy5JrIMR+qDIQWgkb1bRm9LgRLY/n
         R3Qt6tDixcIbukp3NUsUcr/JKUYVdGoiScnDWTMjO7bDMIMy+GvRFggjPyTWJtik+3Mk
         nb6JOmJIvsaTfijku+DrQy2mjrxb1I/+u+z68tX3VObHFHf03/7prLcL+GdW0e6DzwK3
         j4yyMeRLRhsD/db95pfz/UA75nT5qmIT4w9wgIQtCFxEzz13XEjHEkovD8wwaqlC6i1R
         DI+qoRIqY9frdUbtCq2yCnPWUIDjDDon4Ecy2Mr8d+Fmsm0upWoOEETGLqDWCPuV81ad
         I3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oTZeSaFjW6Qg9j7ebCm9L2GXg8/IOYjWlz5/pgQNCPU=;
        b=OeuXhCH0ey1h5fTbf5b5hlfWJV/JPGFbCS3I1ZSWq9oQyD7+pg7+zbGk4ICV/e56zo
         nlf+WxDdqeU3ATMDz+e5kWcq8WVarjSNf57TyXJsdNHzWM1EubEoSUgRmNNGtUGdxgx3
         ZK3SQQQlJ6m1wyOMUxafFDWaSDtP7VlRu8r5TS7qmFwS0gUx7H+TXScFyurhxIHFh6kP
         UUDL13zo+HHE9gxVV/Bpd/fehygR/f+ADKRVaXX5fAa3NLLe+U4dX/enZ0FYZUVysphB
         ez3Z7uLxkuc4D7PMWMrx8Z5gzwXcb8KvCApz9wcMrMDdxhbQ0qFIR4hugzSr2ESr5kih
         iBJw==
X-Gm-Message-State: AOAM530vN0bhiIyZ9rDQ1zVSOV32q91HaHbp9k5A/QVhiFlBbL5k8kf9
	72XkDZBeamU8fvOE0FZ6Lllzm52xr168YcOs
X-Google-Smtp-Source: ABdhPJxhKqzIxUSbIizoV8mxQmxkZMMIwwh+Frrv5tRO+ER1kqJKc1ZTslXkFPtg2wJlqOffNSAM+g==
X-Received: by 2002:a63:e94f:: with SMTP id q15mr24690545pgj.401.1607956663024;
        Mon, 14 Dec 2020 06:37:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/25] coreutils: add SUSE-specific issues to CVE whitelist
Date: Mon, 14 Dec 2020 04:36:41 -1000
Message-Id: <886a8c4e9a749216c0427dffe552c7b2ad087593.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

CVE-2013-0221 through -223 are all SUSE-specific, so add them to the
whitelist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59f2120de3b6d53bbfb9db858ffb8b7b20c8d1ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 0c8452da98..bd7a8a2f35 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -199,3 +199,6 @@ do_install_ptest () {
 }
 
 FILES_${PN}-ptest += "${bindir}/getlimits"
+
+# These are specific to Opensuse
+CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
-- 
2.17.1

