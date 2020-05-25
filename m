Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.40876.1590446281330546953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 15:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UGHWYN/E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id t8so407935pju.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X9HCznmNTUv7SunH0nwSNZnoUWp4tsaEEdAL2q6i7X8=;
        b=UGHWYN/EcOvz067vLwS+bJXd+Shzf0tVN4Emu5iYAoRFFjbEKxKJiNb9aYnbLNKFc6
         JhYMBrl3Oh5Uj42O0t8w8zMIJciFKCWSI7+t5GNtlQttkhLAWuW0tPPT5GbG1CTN36+r
         9wf+y5BLKoNPSMRqvsey/12wPalSglrFhhATHAeFCB4nwCPoRX+BCv2iCUkUCRvV46wH
         ohMUszDAQleCbvTEOBynB9yYpkkZzv5iLkPojtcLPFgbV+IXrBWz//uZpjdEpKPZuqAc
         eZcR5B3xbNsnUTztqFHIGRKaqyb1EAgD0mVk7jhBbCAcqgeakmBLmPiwBjQrR7pBJ2hu
         HYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X9HCznmNTUv7SunH0nwSNZnoUWp4tsaEEdAL2q6i7X8=;
        b=Dn/M7vf6lniL1meJdhojzcEO3GdVFSyH/cfhMtuT4um59YD1LQCO/Sjvp6IRV1X0AP
         GCzIHLPYbYwNaUVcprACBwdvneAo/VYHn5xIG8GFO+HVTGRyNoj2yoMOZLhPbnzcX0HX
         UToeTG7DjECPdBVJCQtrf/ejNDJLyO1ljIVXQ6eqb31HU5S6XybkdGKSLi8XAmgyKWav
         YaEDrruUHFdDqi4w76kkeZvYsg4l7oX8hLHG4Nv5UucaEUPVv8HdiDQxn0UzSqf32ICc
         +sMogY90nroHJTUfVQCHFzTcVLR3aW53QOuiepNafWr7skCeXYnB7xxBzU51WtxKlNf5
         evcw==
X-Gm-Message-State: AOAM532ZvgHVdPaSQjXUGOj4J0NfxwBSDBMGJq+/dvRTUdmxTork8Ps1
	u7yNyS1ZRO+VCiaj3w1IG7inDxlUWe0=
X-Google-Smtp-Source: ABdhPJwOSsBKx9TA0PQ6/BEYtyXeZNxBLWrQLpvXGjoSe9tS1E+nOcxpW1nmXKC7TmIY+Cd4KkqLBw==
X-Received: by 2002:a17:90a:8c01:: with SMTP id a1mr23530140pjo.127.1590446280444;
        Mon, 25 May 2020 15:38:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y23sm1990432pje.3.2020.05.25.15.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 15:37:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/17] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Mon, 25 May 2020 12:37:02 -1000
Message-Id: <5c12150b86f8fb7e6c7cd6945cd6699dd53059c6.1590445868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590445868.git.steve@sakoman.com>
References: <cover.1590445868.git.steve@sakoman.com>

From: Adrian Bunk <bunk@kernel.org>

(From OE-Core rev: 5b71a3f3d1bca6b52f53b97971131a6771618420)

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
similarity index 91%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
index 9076d94601..a5827b9ef0 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
@@ -5,8 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
-SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
+SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
 
 inherit bin_package allarch
 
-- 
2.17.1

