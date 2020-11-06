Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.12506.1604673396712386341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IlpGd1R3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 13so1506390pfy.4
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HwU0Dn8gEq0RpWtSJXNTHMF8JPVx33gEH64eBvXDYJ8=;
        b=IlpGd1R3MmCXwVDSd/x/CskfisASKL20wjhEbU+ZOPyPtmsY5G9jn/Ul9J6C30wdeJ
         upYbiumXGG4Cv11IXOw4yV+VfpgCF5e3j9Asu3XVkzRlG2Sa8DFpGeBUE0GpDGE/RoxU
         JrPbHwDZCweL+ihrrIWe8fH0XTxOFTO8eFOHOeLU9mqNn9YB8jqcwDEjyX9qOJX/TbSd
         D1I/JFqLVcXma/xBawO2cz2j6zpyQzn7piSCDAEG7EH2G6hQ5cfbYJPgZ41l1evsj5vF
         Sklb8ND0jtcgCyufFbOojrC/r+Q2UV+8T5K+OgXMxjq7elbjEad2pGmPgl8ljuztEJ2J
         +YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HwU0Dn8gEq0RpWtSJXNTHMF8JPVx33gEH64eBvXDYJ8=;
        b=sXZtiROuCEV2O8Z5Hn6boZUCnLyAhAtKbnNwrcW5qoe37A9jf4Ad93W++ZwCg882lf
         4bHM92WSl0AtfmqX4DYY233No6eID4aA5t2ZVpbd33frGTqmKhfaSG9Q6vilO3VyuvHU
         EYMOy8CweaitFvRx0u2kzA4Tq3nK6EBoCUzyE2LceRqBYW4g/a21nj23uQcjSq5h+q+s
         nJinwQEJccA7p0BLF/rfzP/BZ6lSygkTCtVKS95uD3EtG6vuqvqBgKw6uKyNQkFHV+8M
         HLMSlPemrLZEO0lYNGpiwZN4YGL1QRkS3tB/6L+ep5Z9K9wmnNTrKIwiOenQToZ0csQ/
         Co2w==
X-Gm-Message-State: AOAM531xrbZpO/PGkZt3prwi0XFLMazlBbt1q0ZP3XZx/75slORx8Uh/
	JZJI4ocb8qlixDO2E7Zw1juSjHD6JDlFPZfb
X-Google-Smtp-Source: ABdhPJyyzsat5S7hSpjL7LIh7EoAjSby0L+Vrlej2LqYLL7yfXVTKv5ClFMToislnVbt0SggsSE74w==
X-Received: by 2002:a62:17c8:0:b029:18b:5a97:a8d1 with SMTP id 191-20020a6217c80000b029018b5a97a8d1mr2149455pfx.15.1604673395817;
        Fri, 06 Nov 2020 06:36:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/20] timezone: upgrade to 2020d
Date: Fri,  6 Nov 2020 04:35:21 -1000
Message-Id: <e40068578ec403df84527cd4ac7acd336cce6a08.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 365787658cffc3b2dedb88db311a33012be9d70d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8eb17c5eaf..5368464f30 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020b"
+PV = "2020d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "47eff8944de4a64f7629b851e4a32338ab12c9b73edd62063795167ff1fe43da"
-SRC_URI[tzdata.sha256sum] = "9b053f951d245ce89d850b96ee4711d82d833559b1fc96ba19f90bc4d745e809"
+SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
+SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
-- 
2.17.1

