Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D521C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.6908.1645799218119254731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cajMCTJU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so4925188pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KprXCRO2fjv0h2CRObxw3tHmqhYHA3j63UkDX++/NaU=;
        b=cajMCTJURfcVYEhlabBvKRQ6RF46VSHrf4y+kDpyhUYgjW7CyAlaZIL1G3RFFpXurO
         wNc0cJqoZsj6WTEcPw0RAaJID0LLbbSqaOv7wakxhTOhqCgkZE8ofzqCxO+fGTgyPXZN
         PxVoeeM5x9dyBsBXK2LV9czAA+MGl4aido2g4j0fq89igmCHha3WwD5zPW1zRjk0z61M
         oTA7khVJwi8QhorVzRdpibD9X2NLq1+UJrVYBXkRe0cMII7JTD8pZY4lilr1qiHVNzLC
         5z3P/VH+t/R9O8JegkhGvfncPByEe4H8Bddh7KG01Ron8VjX3cXk9f4k5bUutfpBAwDB
         g+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KprXCRO2fjv0h2CRObxw3tHmqhYHA3j63UkDX++/NaU=;
        b=S7ct4TzmPfqAHpByLpbJ+DigDS+Ev06v78ZxZVOOcoK3ta8g9Pp2zTvV3Z3pPJKBQ4
         G52NEUb1uNgTrBgspltzT9kmFndRfsmmLye9dDGXGgL0MWOCBO+RioGFnJsWm4covFSa
         50o0DtXcElnER1m1bl2P0/03Tw+BmcJ1Qk4izQhRKpIYURZ7TwVF1Ab/IE93TV8P3aS6
         EeXgQ6MfLfIwYhTrZKwNcrdW+zaD2l1y3eo67lUIfX4GEu7tZUhlSTPN/1BcaTeSK0EP
         GC7DiKX1SOWZU4mMLr87LGm6PHTGJgOQ+5wCrHdMrgVIUbzkut3rbJe+y21Bqi1siRG4
         VUcA==
X-Gm-Message-State: AOAM530f8SgPsGWCLNYLzNeu6JL+yth4Avz112QdHQKWKJP+udksDDph
	lYoipo3ShbLS7FA5/EVHGcwEInF411NQo9JA
X-Google-Smtp-Source: 
 ABdhPJxK8zbc69FUVDE3y/NIi06WlKm62QvZSmoujvd4brToyJpoIh+uati+4tIzbl1Vt4uOGx0rkA==
X-Received: by 2002:a17:902:ef4c:b0:14f:7548:dae3 with SMTP id
 e12-20020a170902ef4c00b0014f7548dae3mr7706430plx.92.1645799217191;
        Fri, 25 Feb 2022 06:26:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/50] puzzles: Upstream changed to main branch for
 development
Date: Fri, 25 Feb 2022 04:25:44 -1000
Message-Id: 
 <930f097ef9e40fd4631a24ce79b99a4eb166319b.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162350

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 2edc9ada2e..3ee441998d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxt"
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=master \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
-- 
2.25.1


