Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.435.1606848760938314099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DaQtVTOy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id b23so1634646pls.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5PVO4ZwlYbstqv+Dzy6ZuHj1THkxht0lA4GdZYpAZGE=;
        b=DaQtVTOyQ+IeEIQDdaKgwTZEGq96OLMaz/fbelDk1PHHOUsaAKef689pR9X6KKpvhB
         QVJkvmUxZVfe7OW5GSEFFpMnnUIv+l+c/0+wVSyAeXw2qx34WdpLJCqajARYA3xXFicR
         EAozOtnEe5oSv1Q1eTJyB8np63hQ0b70jNd51BBv9QmanSshVJiXoecCpIN2Q4+T2Bs/
         D9UIdQHGgUTZUCsgDNt52cr9VUoLZj5EQOhDdk1HfNUcBaLNYh3fTI0GxPYIv5+5RrO4
         XebL6pPoMkfYOQPvdjNPolSsgnJud6qqxOgLmCPm4hvyzjsOZEj+JGOeymwcZWHtS8GZ
         ZORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5PVO4ZwlYbstqv+Dzy6ZuHj1THkxht0lA4GdZYpAZGE=;
        b=UaINwI3rselIERuSmdKFnvVZZWBrRzpkBlotEI38NPpHqKopQsciVBTmd3iXhadmKc
         8ZX3gmw81DxLPcgmc+ybcK5DyQEnbRrIB9BM1afYp2GJiRl1PFEd+g8HDrCr6YTRduBD
         yPbQGguMIyrz+IZlPmtUniD4o7GuymQ9ftrslpjFT/cE9MDujumQv88kUWYeugnnnhYs
         c3gHEcvbaanZ+9UgrcLHmKCzGOft07/LhTEjKPdetuf4242bo2JzsiWbuGdYr1u6OLX9
         YRKzEnLmOStvB6XOJUDbOLCvlVAK1oUZPrs+EdWQHmEdhiK3y/PnX/Bwm391nsSj3lDM
         I+xQ==
X-Gm-Message-State: AOAM530hXjMJ6O325GMY1PE0kFyna5LHfJF0OPzVtjiCY6hqyzIw2YfY
	cN66A3D5fNs0at08vf8n4zyPRVsm99P9vU98
X-Google-Smtp-Source: ABdhPJxZjvNjTSg6x6eQi/CfaeIZsHWMRixiRbrvxc0MBwFq9AbII6iMfRIkLPFz6JiL8R2m1UA+8w==
X-Received: by 2002:a17:90a:2b0b:: with SMTP id x11mr4166616pjc.65.1606848760084;
        Tue, 01 Dec 2020 10:52:40 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/16] python3: add CVE-2007-4559 to whitelist
Date: Tue,  1 Dec 2020 08:51:51 -1000
Message-Id: <267130c66dde462a0a1043ab5dffdb86781389a0.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

This issue describes expected behaviour, do not use tarfile with
untrusted data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f4c22e83f2e68ff157da5ea1303acc2931d63f5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 1d0b4cdb77..b4cce88e87 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -52,6 +52,8 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# Upstream consider this expected behaviour
+CVE_CHECK_WHITELIST += "CVE-2007-4559"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
-- 
2.17.1

