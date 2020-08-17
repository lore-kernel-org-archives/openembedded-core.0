Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.45471.1597677134065413397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VRssXEQq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id l60so7968775pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=s1u6ifwy4mesyqEfrdDbFr35qrArHxZKq0zhxaHsBOs=;
        b=VRssXEQqaA6PK/KTRVNMVdtyycdKxVRsyjVi10UPVGClbQlhPp0Jy61Adi6QTb+FVD
         INLHxi3f8Wy303B3pSNTJNyKUOR4Fl3d1989nddUVfr5McDSdY8b4KOlA9x8Y7gu5Ew4
         YH8bvMnV8Nxd8AbOuFtvEOxbD2+sWdapIK7qBxFbt27SPzaDC0E5kIkyjs8YimEARl21
         1ryBQPTdBVUKGeC7/axw1UwO2irD5DKWlkku8dWGi9UN9Z1APG2JYrM/5yr0x8Djf+oU
         hwwKXcoXGS0/5QHEdzi7cAlzxzAIEDQg14DXoZtwH3NwLQwokvzZ92RRlF4BZxc1ZnNp
         I2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=s1u6ifwy4mesyqEfrdDbFr35qrArHxZKq0zhxaHsBOs=;
        b=ppioNfCIT8UIQIePcOgbWA2tnX9sIGwAdsWEK8xk4KWsflYTCpjk5XlinEvGIii3nG
         Ilta+Z3kJixU2PShMvjwG/ARQiCEsA/j39XxZH0qHtaNckL9Bi51zN0sNTRelEl4vTPo
         YNSWLL2aOJZargHsoMaPys9eTs42SZ++nC0WplTqmrU6vUD8J8wJbVo181JclZulCa+g
         xpfqieewsJ2vtXGlMH/lbmaiUaSFqNnohQ0dvsGL3eycxbqiIkLm0udNZ/YHdy2zeyBb
         9fdkchSETwbGVpOVLzTbQek4bSGHjiPKSx0sGi6H8fqVizrxUHZWw2mMLJg2Zv6UhVTX
         GkzA==
X-Gm-Message-State: AOAM530a2OIYcgwtWugeLQMksGow4A743fKSnUZuyodHTo6naPnnJ0xy
	uVRkKnTiPSh+brFKdUBAYnOj90nh1l6yyeEfyuo=
X-Google-Smtp-Source: ABdhPJxYQHXm5eSA1QwhTkQR76cqLBeLIx0wcLUZ+cDWuN0Qhx9+QNKtjWnIQuMtOnCq0tUJJ/65hg==
X-Received: by 2002:a17:90a:f40c:: with SMTP id ch12mr12760253pjb.0.1597677133151;
        Mon, 17 Aug 2020 08:12:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] gcc-9.3.inc: Mark CVE-2019-15847 as fixed
Date: Mon, 17 Aug 2020 05:11:46 -1000
Message-Id: <17c654c34d59b1491f41fc328222697f407c23b1.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

We do not have explicit patch to mark it and cve checker gets confused,
so help it out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index b0411078d3..38dee001d4 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -23,6 +23,8 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
+CVE_CHECK_WHITELIST += "CVE-2019-15847"
+
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 #RELEASE ?= "5a5ca2d"
 #BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz"
-- 
2.17.1

