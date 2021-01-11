Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.27425.1610325979114185461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Vt8fUNW7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id n3so7458259pjm.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8zJ1UN3AWvLBSyQd6esHt579Y95Xp3tBzayXnXSyrPI=;
        b=Vt8fUNW7l46m3yM4oN/Ln5IRUzEEuTj8PavZ5iGiw9sdZ3eQZRZtBnaCMXkM9f7bsk
         1kMLMNnZhNKakDJmRAhE5LVERGw8GAYr2slpdw1OgGJblIavb6PdX3WXVG2eBddasUZA
         +0gaQtCfHqQ5+RVSnK5gAIFJ8/A1PDdJNg8DO49AGG9XRhu9oPQJk4+Q7tp4QTnF7991
         y+eD43sAHlL3+xGeA0oOMd2Ob2Cc70Fx4U6plAi9axX2mk48nwxTJDC2Gkm821UBM2wB
         L+mqtUc0fW74T3rxe1RSJ4S9F4KkYoP3TTXXIBBVjpi1HD7oaBD/e5L4Hrbjq1GPFqrS
         GQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8zJ1UN3AWvLBSyQd6esHt579Y95Xp3tBzayXnXSyrPI=;
        b=CzANcwKddwR7RK/gUYKO/8/qTDPSzUcwlspuYfqMBcUDvzgRSbZUWES5uW8AuRU3no
         OgROSaiMJiXDw5olBKKLuV0jYjQxiSJNxPB0f0ikKFA5Uv3aWESggYHwG8kJqM9Tah16
         rhKg12xNPY6sx85n0W6uAz/KmNiu7opQ8ep5KA6rvlcdiNo8g+1pvU/52coXAG1MaAdI
         dV7CZAhNiAE9XkIp7CtgexSJNh1yjGHNSA7Lgc9GXCMAcLzfdZ/vOfHZwpx5WX5b7bw+
         MVqt3CITxmZUVMeKrgjRPK0G1MFrbNQHcOJgWKyTBiDg+Ka44QDkSe2m0C6bOxbRiUd4
         wcBA==
X-Gm-Message-State: AOAM532L+mxSdSSwRha2C8Ziffua5BgZduoI0XZ3UKgE22KTqgBgYrAH
	fyBdq96fKMe8UOWOtQ9fup7DsO1vWphTpEx3LCk=
X-Google-Smtp-Source: ABdhPJw8dGL2LHw4sipu/f0BFFX9MkmqmnFJdZ+vWHCBRE8mZ9aJLoXv1G3YZf1oQgg2gygR371xTA==
X-Received: by 2002:a17:90a:b38d:: with SMTP id e13mr15580191pjr.214.1610325978328;
        Sun, 10 Jan 2021 16:46:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] timezone: upgrade to 2020f
Date: Sun, 10 Jan 2021 14:45:44 -1000
Message-Id: <4b976db13cfbd27a39e98902bd4699f4e43e5598.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Release 2020f - 2020-12-29 00:17:46 -0800

  Change to build procedure

    'make rearguard_tarballs' no longer generates a bad rearguard.zi,
    fixing a 2020e bug.  (Problem reported by Deborah Goldsmith.)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7efa4d28d632d415ca574140586570ca376caf6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d175f0d4a0..9a19093e24 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020e"
+PV = "2020f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
-SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
+SRC_URI[tzcode.sha256sum] = "cfeeea2a7745164f64bd9f6d76e47916f4ac820c4434493674adbbd4324329c5"
+SRC_URI[tzdata.sha256sum] = "121131918c3ae6dc5d40f0eb87563a2be920b71a76e2392c09519a5e4a666881"
-- 
2.17.1

