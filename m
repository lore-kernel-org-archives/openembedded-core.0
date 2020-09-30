Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.6504.1601503945673663007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iFPlalUB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id h23so636671pjv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f+xEtlKkbRsF98n6g30C0EUbjmQop7TWQ/OFPLAnRrM=;
        b=iFPlalUB0VVvxd02utX48qKkeUe53BXes2gLlEchJaEfkep87KBoCmjho5spgJRrp+
         V8chR40gby88hgMpwEAP8vYDIWdl8L7hkFXqjiMz6pvOIf7s/duKwctfojz6n1X0qBvi
         AX9efdY8qf+BoKokGnYCeQpi8G2nM+JSgBiwE6IZaySk/RoLjla7z0pvtYOGwWDnwgG7
         NU6XtTRPEUTVvyK9LTQGT9hHh7IN7mc7qjNzjpPFDI4Tb1afvOM7noTj+POUEVYlE3Dt
         0hoFLiZW5/rXirch6iVP12CHXHOH3lK4DtZrQrskyCJPp4F2PQspONfXlLl19FxcG/ng
         tJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f+xEtlKkbRsF98n6g30C0EUbjmQop7TWQ/OFPLAnRrM=;
        b=bc990BwGuK6y5cJ7hx+S5Zv3rVsw5ZdSjjKLbgmTMWEXd+PT7Yedjf/mE3hkdO0Hr9
         YYjJfgjOTY4Nwu3vNflWwC9SYli/j5I9AAPrDyi6U32rR/d4Gn9Z5mYJuH2RmpbpCpzo
         UskB7geFpTBCQ1OkkQiA7wce6FkIBSa2LJ3dQy9BCdH2jKkzvB/Zz+3d/dwttK4reyDC
         sKT7M4Onp9pseYsxG/f2Yb+1rOdh9kHqV5iMF0IWH716G6ji7PVJSSWSSf8nTVrPgZku
         9k5D2W5qPzKwWbcKhWohMSaLJZ1XMqUEUXSZynJ5vwfFvIRCcLHsT9TurfL5DFGEp2x4
         UexA==
X-Gm-Message-State: AOAM530XfzJOi3ZhfmiZq+zI9f1V+Pki4iCI3Qs62jRpdlRX2JRjTmEm
	2Gpe1EO2pRaEX4/G6xEV/gaXlRErzV+wPJ0MHAE=
X-Google-Smtp-Source: ABdhPJylfEfyDgCJyKiTf8vF0eaJAfSlBpvHNUDY+Ud09BYW2hpFokk3HYmEV+f8ZOLLDKVswBFWdQ==
X-Received: by 2002:a17:90a:c20f:: with SMTP id e15mr4114061pjt.163.1601503944617;
        Wed, 30 Sep 2020 15:12:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/41] cve-update-db-native: be less magical about checking whether the cve-check class is enabled
Date: Wed, 30 Sep 2020 12:11:11 -1000
Message-Id: <ec2a17001a2a0180ecdb0b946ff8f7673e14ba24.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cbc717350b21fb417fa6f83621022ac633a26124)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 328f6ab364..2c0e508e32 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,8 +13,7 @@ deltask do_install
 deltask do_populate_sysroot
 
 python () {
-    cve_check_db_file = d.getVar("CVE_CHECK_DB_FILE")
-    if not cve_check_db_file:
+    if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
 
     if os.path.exists("%s-journal" % cve_check_db_file ):
-- 
2.17.1

