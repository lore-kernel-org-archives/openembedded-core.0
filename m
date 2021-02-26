Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.9982.1614349616474390353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=10H0w9QC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id z18so8128708ile.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0oUerbNJ6L9NSOwcFCtnoPbSTVO6B5Mj1AQJK5tdwhM=;
        b=10H0w9QC2YVmi5OYeGb4L9vp8NK65mEZTOksBi0fwQ4yCbVXe8LAnv6YtLl9Bbf53f
         qwpbg2BFof485Bf+H4lH1JFmLXeOPkXkmXzSt4DdUT7KFbJ9XTglDrYabdbzUuApOsNH
         d32N90bLyzsDVSLEqX3UsWor7v6RUOlP5X7mw3fdAjO5dKjQDniHok0aZnF+1VURZn2t
         WcEPmwXr1KW0T/tNldsbY4hiCnMXUAW+Rp6sYuNk1shgHmdutKVBn9FM3+nmbt8/ycci
         wOrSMiSW51olTR7GDcEt4Ky9QvjrtJA6HA0gGTk4ZAPE62q3Hp1vaCQGiR9YXlcwGNXR
         3zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0oUerbNJ6L9NSOwcFCtnoPbSTVO6B5Mj1AQJK5tdwhM=;
        b=lUNJkk7HLVeD1bmU6WuYNTaOuFKwpC6/tdc3W/Mt5mEsSnxFwZRreobLCGqm5Vui3T
         58F6AcPoLTY6pzv1nV4AK1CNn7wMkUAsSm2+z1PFhdMT4fW7Q+uq9v2neRGW37wCEauX
         GT/ZUpA9eg5qGnQt4m3hfdu5jsSMdM5AfIj65BpLeOw2QimxolWHgDGrVj5ChSa9Z02B
         868oUlojvpD8pc5J1iKf51BGtQThrNi1orDWe5vtYpUG9gM+m1knDnCaj+xoQav9Yf8L
         UtoolZjYNxY1RcVsOb2K12phQUeZpr/473gJ2vEv7xSY3hCRAeVsfodSrtBOQOwdm4fO
         LvtQ==
X-Gm-Message-State: AOAM530zW9clY1hmXwzGvoCuevQkAyhRU5SNJqWt+OyMUh162HOXe37Q
	/U7vFurhceKQA+mG1y0Q4KnnYgHDGYK2wnxc
X-Google-Smtp-Source: ABdhPJzZupw8lkm2eBsG+gkt16m5lsPoLeGz4gK4RM+dj7RzyfEhAa2KCda/3CgucDMp767ro7ktJg==
X-Received: by 2002:a92:c26f:: with SMTP id h15mr2531268ild.65.1614349615150;
        Fri, 26 Feb 2021 06:26:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/40] watchdog: Avoid reproducibility failures after fixing build
Date: Fri, 26 Feb 2021 04:24:06 -1000
Message-Id: <a6e878f3347d593ff4bf0b0f2083ed56709b981d.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add some temporary bumps to versions to change the output hash so
the fix applies correctly. Can be dropped next time we update the
recipe and the output changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69205edcdff865048e55a6b7feaf82064ebc10c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 8b326dfcc4..beebb5b004 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -18,6 +18,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 SRC_URI[md5sum] = "678c32f6f35a0492c9c1b76b4aa88828"
 SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c18947c"
 
+# Can be dropped when the output next changes, avoids failures after
+# reproducibility issues
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.25.1

