Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.6588.1601504117837889851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DUbfX0u5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id w7so2356746pfi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yKkt7i4XA440w9ODlIcZLz6rmeS5sYX7su5HmK4GRsI=;
        b=DUbfX0u5wZZ7mSu7X9orYzormaif+D09T5Bza2+iWErRcDcab4WzRC8+vG6lGNANYl
         5v3rdVW2yc+GlNoUI7FbE3i6U8xXD6kzdvcG1Y0I9/HzbueEDBOLtPDomGEv3/Lnq/U9
         DnwIxSft8Qm2pr99dPDF0RjJFmQRCPOgA02xbu2mPWpY3sT+RkQFUC6t8ze25zAYDiOe
         G4coKvZKJblwDdwfOMGlWyZTOvQAcfvoM0HN1J4EIE91ZC58qES1FimMBtCSh1THPZbJ
         tvatW6p5rT9LTydfj6a77aWz0aMNoMIo+QSi9KbF9TvgCdkO8lSYvHbZW8lkzHwAHYic
         3rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yKkt7i4XA440w9ODlIcZLz6rmeS5sYX7su5HmK4GRsI=;
        b=mTy16KWbprtGFC/yD319PRD0NdospgwQuACUvc8rO2/4DL4RASKaAwNvHfEsXvwox6
         98fgBcCmsgvssn5R6JkFqNA/jicaLq+uNb3iMIBesVyM2P3R/7Y3c+bj9uA/FnKblgXJ
         CDwey0Kh+q8aVTSsQmw2dcrIgpGU9bFPX4ryUDQVRhi/yQKqA332D40OPZc+0QrcFSKD
         Mv9iEhouPp4/e+wBDR8r1lhoLuK1Zn9nyp99PHlAtwT4lvKS0p4FwSp4EBcN9SoNXVxp
         Ra7jYCnP3d4KndiUGigwESU9bHpAVgdS6tATxKUDV5aE23nE2WWZXkn93xcryAsjIYHB
         p5FQ==
X-Gm-Message-State: AOAM530suGuye2MozB3XLsDIlFWxT5dUgzBF3J/VZGbCYqsL8+0R86Y4
	3xq9O0gh9KYvCn1Uf08WKgKCi5tROWUy+upqpSk=
X-Google-Smtp-Source: ABdhPJyso6T+QnxwvgsUXQ0O83AV50IhwsW7N3f6tVPMSbSA7S2JN1A9/tT8YIY2GXeqgP47iAZMLQ==
X-Received: by 2002:aa7:9850:0:b029:142:2501:34f0 with SMTP id n16-20020aa798500000b0290142250134f0mr4117577pfq.73.1601504116984;
        Wed, 30 Sep 2020 15:15:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/41] packagegroup: rrecommend perf also for musl on ARM
Date: Wed, 30 Sep 2020 12:11:31 -1000
Message-Id: <1edbd19cea9cfaaa10b89d870787c3126b521294.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Christian Eggers <ceggers@arri.de>

The perf recipe builds fine for musl on ARM.

Fixes: d758a4445a ("packagegroup: Disable packages not available on musl")
Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a905f66d3a6d9018b18c1a8021c1cb8bf7d12ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 9fd2569a04..994e27c0a3 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -28,6 +28,7 @@ PROFILETOOLS = "\
     "
 PERF = "perf"
 PERF_libc-musl = ""
+PERF_libc-musl_arm = "perf"
 
 # systemtap needs elfutils which is not fully buildable on some arches/libcs
 SYSTEMTAP = "systemtap"
-- 
2.17.1

