Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.19356.1621260869583243293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Tw5MJWuh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id s19so2784153pfe.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MlyjT2FBgZNLbtIAcZtKQgg6EQjOcBR6i5bpOP+J9TI=;
        b=Tw5MJWuhh/Cw3kMDV+2SEhva1y5w+mt30O75Aj+sLbBdoDQaE44RrllXTN7BW99WBe
         MnZXruGhfmumtNxYcEZl1NpgArPg1h/1PUH5ONCDu3+1/aF5DvjwBxmPIJApb2Ad7C/o
         z46WUMaplVBKyKIOzx3GDfKyX3xUfURvkAEHb+Swy42XJuMWo2/uXXCNyfuzVDCdIUhl
         V208dUnjqWe38CLBhJ3gqg68BG9kkqn8rhJC7Xjdo5dqu6zg7PuC70G+Cajo+WqCfnd3
         QxxiA+0XclR0oiVnpPs4pOiVD9YZ4i4nyNz2kuv1D2hz5M2TtBlzxuWYarmhlOaSeykw
         i3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MlyjT2FBgZNLbtIAcZtKQgg6EQjOcBR6i5bpOP+J9TI=;
        b=T3ZnwtkQO77WCCrI4hVOXm0m1MXv8afHLljTrMJp//ulYkbcBW+036SYmGSmk17wh4
         NRpp0RIu5FqJTdBnefMpbk+srkDiHNA2w5mFQcRiVEOwGeV5UGSWKOY6NcJYmeeHsz0Q
         ts1HwLtnsxfcfpV5eFobl9kAoF5oS5qWmBO4O/eJNkDPSL7b3a/35qgQKkIIR6TTaG93
         T97sRWfoCtidImJqQ+xXh+Zeyo/6GhFgUryHovsEsJGcAoXvQ5Fie5DMscEDdYCf2E08
         JGNSRp4zGXL/qhsnjsv6Gqkc9qLtUEY5OH8WFSC30c8z7ROfAQNZk2NiLRlP8UjAtL+q
         tibQ==
X-Gm-Message-State: AOAM5318E/uq7aL1f82NyHKsyYpldC0ToXtkYgJMcQXOsFY9l787ucIb
	BNfeT/H+0HYNU3C3a1WYHiil5o4QSjEWhAWx874=
X-Google-Smtp-Source: ABdhPJzLN6mElQBJaPb2TJYYQYepgoOGdq3G+c8hPy2WazKGJ/jKFWQhTJ5zT7QkoDOuJzU0DOXaFw==
X-Received: by 2002:a63:79c3:: with SMTP id u186mr58240124pgc.203.1621260868676;
        Mon, 17 May 2021 07:14:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/35] logrotate: Exclude CVE-2011-1548,1549,1550 from cve-check
Date: Mon, 17 May 2021 04:13:19 -1000
Message-Id: <99cb9534902717e637f1460c1d1c10d290bbebf2.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These CVEs apply to the way logrotate was installed on Gentoo, Debian
and SUSE, exclude from cve-check as they don't apply to OE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23643016f3b8794db772e333ff0b8f598571b628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/logrotate/logrotate_3.15.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
index 503a0622b1..7c1b77add8 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 SRC_URI[md5sum] = "afe109afea749c306ff489203fde6beb"
 SRC_URI[sha256sum] = "491fec9e89f1372f02a0ab66579aa2e9d63cac5178dfa672c204c88e693a908b"
 
+# These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
+CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
 PACKAGECONFIG[acl] = ",,acl"
-- 
2.25.1

