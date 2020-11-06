Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.12292.1604673409710148565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bB99TvjP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id x13so1074018pgp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=l9Q1EPI4HqVh41x+ITnNjlKJGEBxbcZihcNhTJPfuKk=;
        b=bB99TvjPygpC4jn3Ea+MXKCCESqctLIb7akD6bTVTt0ThOZ2r3ckrvjKtG0Eft5QoB
         QULqqZrLJvS34BV0O3O0PR1oFK4d+YVtOI718sq+opxvFmgxLunAKZqZN98Mm62Y7tZF
         VJ98wYGNHCY62MhnOhs6ZeqO0R/bDIVfXkmcIam0FeY3Fgx1xr9ueglkjlVpTTdRsNWl
         7LKykw/Ew5EDNfgV0FCaq67YnFuu84zaJZG19YVZS7pgFr0iXnBCVBzGYsUT5MPQ8XAH
         KzgAX1CbKZzzMXPNC9jG3y6Gfv4dBEuznosTfr6q4nlfFEAkQ7VXxuMZMZDgb7ySWsNS
         1udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=l9Q1EPI4HqVh41x+ITnNjlKJGEBxbcZihcNhTJPfuKk=;
        b=Zq7KF5NhLf3VCDjv4vYrgviXdKUuTA+XqxzlGznioAi2tiFIk4/wexQQn1hwVP1kVa
         Kt3+G4Qngxwt1cYMGTk1ocWbcvUxYaDkQHV6hHY2ME63//cWdePXvUKHOY/QL2HOLuKb
         KQth3zbQSzgp2ofvgkQAf3mTID1BaSIFcre9ruALtVfybw53yDR8WwVQgtf0faiWiYka
         Uhet5DgnTl9seYAUG8zo4G7If1pjz4CoutQF4VKFowRRKh1Er5EHA5qoEu7yGdexhQUD
         b7l7i1AoVkC/FUqsdI08wH2n5r4qSQPozB3vFipUqkdGgak++29zDQF0A6XQO5Qc2Csq
         yKhw==
X-Gm-Message-State: AOAM533qRthWgy685xizl1Q6XAOH8FtxEeVJeWPGanmEMBT5s0o/BwVt
	3ntL+Z1ECUnSiIKXk0/dZXceT5uJ5NDEyCEu
X-Google-Smtp-Source: ABdhPJzLOfPFgQxPVB26rnLs8BYN2FTF+DHq/2qpFqKw72Hrd9OFUXhHQVYa06HR6vMM/3VQh1DxRw==
X-Received: by 2002:a17:90a:7886:: with SMTP id x6mr2751353pjk.21.1604673408892;
        Fri, 06 Nov 2020 06:36:48 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/20] Map license names PSF and PSFv2 to PSF-2.0
Date: Fri,  6 Nov 2020 04:35:26 -1000
Message-Id: <0898bd34fa79c34704b63d21806d7738af06abb8.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

According to SDPX.org "Python License 2.0" is the overall Python
license, which is comprised of several licenses. "Python Software
Foundation License 2.0" is part of the complete Python license, but is
also used independently by some projects.

So far the license names PSF and PSFv2 found in LICENSE are mapped to
to Python-2.0. This patch maps PSF and PSFv2 to PSF-2.0 und thus
corrects the impression that Python-2.0 and PSF-2.0 are synonymous.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef89f176d10ee82738aa050282d93b68dd2c4eb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/licenses.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 751424d1b6..5b309eb385 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -45,9 +45,11 @@ SPDXLICENSEMAP[MIT-style] = "MIT"
 #Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
+#PSF variations
+SPDXLICENSEMAP[PSF] = "PSF-2.0"
+SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
+
 #Python variations
-SPDXLICENSEMAP[PSF] = "Python-2.0"
-SPDXLICENSEMAP[PSFv2] = "Python-2.0"
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
 
 #Apache variations
-- 
2.17.1

