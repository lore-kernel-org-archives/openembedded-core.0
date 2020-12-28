Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.4116.1609193802796268472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WHrfJLN0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id x12so6251151plr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gEQ53dTXAzRPabxvLN4WCn4tq4J3jqIcb+jf082Z8sI=;
        b=WHrfJLN0dPbtrJMKpVGrZaB79cUbDfkis7l4DxKWsLTS0hFG/j5dZ6t/DqCJSIBRcq
         6iQPDsoUIyZSrFJt/PBexMVnSbJYpEX+Q6bVm6YiBKOw2tv0RkV+6NJJtOVCjIXMeOJ/
         8yLJWtbS4+BcCxwNkb6+WeV/ngZTn61hH1934G3k2mhEwaCJVNipf5qtcD30sxkfy6QU
         UxHX1wigas7oae5IH1+jWh+fAE4WUAum7EhkfcA12Px7Th4l6BEIgI6N02xu1IX0bFF1
         SmL8/4+C6iGZl6HahRwvxNAt5XCdohMPCFj0OL51dIBU/16nv1beFobXsaJGVSgSwnsb
         clYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gEQ53dTXAzRPabxvLN4WCn4tq4J3jqIcb+jf082Z8sI=;
        b=RIDBWBUHPF8XPMNZJEuTnh++c8qMA7y/MpwUyeGUrU+BNdTssfJNPy/Pz9C2CXSdS3
         IKsRqI0fTlZ16T45mDH3ptsfrrLjKjcM9cqbAapdDZ8rdrMaiykBLfwiM28x8hSJvfzB
         qCFeGVfAtfqn2sTZOZJG7/d3SeTh1i3QloNglXmwFvZuG4DvNjt+YeAMCK6lKMfHjaV1
         qc3bGfNRCmjqLRMfAPF/62DYWWWawZot9CciLUveDo+VrOGAZJDnTMBBPc3hrWCTcU57
         ZtPx7oYwTnbbrh7JPamDuJb8fFRVnQGEShehOv8fn43pqJ3kFzQu063mWBQTgWIDPHfZ
         ljbQ==
X-Gm-Message-State: AOAM532lVJKC+nyQp4CRvLL3Y5Vhs2GC9nlAdFTbr5IRE2VYiU3X3B7p
	zQf5SmckdybsYgL3+mb7t8w/eJOsmr3JnEn/2A4=
X-Google-Smtp-Source: ABdhPJx7By813EcH2foaptLqUlc4BKvtPponmqDHBf3nGhp2yPdn0pWkd8A2D/8Q4BywcvRqQFNZfA==
X-Received: by 2002:a17:902:8d97:b029:dc:313:ee70 with SMTP id v23-20020a1709028d97b02900dc0313ee70mr46408862plo.82.1609193801965;
        Mon, 28 Dec 2020 14:16:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/17] cups: whitelist CVE-2018-6553
Date: Mon, 28 Dec 2020 12:15:51 -1000
Message-Id: <8a1cc8da3a357a0cf7282c3bc600ff7abf67e848.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

This an Ububtu specific issue:

The CUPS AppArmor profile incorrectly confined the dnssd backend
due to use of hard links. A local attacker could possibly use this
issue to escape confinement. This flaw affects versions prior to
2.2.7-1ubuntu2.1 in Ubuntu 18.04 LTS, prior to 2.2.4-7ubuntu3.1
in Ubuntu 17.10, prior to 2.1.3-4ubuntu0.5 in Ubuntu 16.04 LTS,
 and prior to 1.7.2-0ubuntu1.10 in Ubuntu 14.04 LTS

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22e89983a8f83a369d83bc67e4f3492bc50db648)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index c5a60bde12..9b4b2a9b13 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -18,6 +18,9 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# This is an Ubuntu only issue.
+CVE_CHECK_WHITELIST += "CVE-2018-6553"
+
 LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
-- 
2.17.1

