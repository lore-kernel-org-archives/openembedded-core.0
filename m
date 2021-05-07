Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.112.1620428497531289414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 16:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MGdvdvQ1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: romain.naour@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so5690630wmn.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 May 2021 16:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHRvv032to+1tqgxCouOi0/waVYlM+NPZ+3kkF/fCEs=;
        b=MGdvdvQ1AteoIENyM6FIhFcDXy9dzpgJGL+YjwEmh+iWnD51pRh6ADLcLE3GpM8hVZ
         r0NWLjQoZ1Is/zACih87NSemp052CQgIdp5Pcb29JIiM6M/bLxCPL57fcdAVcSw/1y2t
         FZWik0LYsCYEc0pOlgTREpfvF/dGBwix23UMAhqjRlgKERx0BPu3iqRmxeMLsfnnQK5F
         S7eP8P3ur64eWh9cDHblD3csy4nqTSEZnCTaFstBJB74PmajY8yQ4n5TKwJkTozZvpQx
         EhvGZm3ak6yjIITmxH5tzo3l9S6pldfQziSeLT2L2wplxuYRxd4kpGC8oZ74+k6pjdJX
         HxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RHRvv032to+1tqgxCouOi0/waVYlM+NPZ+3kkF/fCEs=;
        b=i9A5DqN3/xksKsyRVUSXFTLAzylkysSDX0uBVPt/jJPgYh4evQzSurG5ao0cGLT8Gd
         GJcb/QobEj7CZc1p/pePQWoDzAmQfZo8StNgzFsT5u7hqVuuQdAyLjCJOvd1gfb5Uqqk
         BYKQfwJ/9lpHIwyaE+B7Z3SNK+JHBMSsEQktJKjcmmw3XyuJgZjys+RKo1wb1e+VGeC2
         JOg8W/qiLtDn1AezB210+GQtOBYLO8fBLyJ8PFUClSQY9sqahtmf+Amvkr9XnrXlGT5W
         III1ajKe7fCBbli4PZgR5WSHc1VbYHerXXe1RENfZ7pl2VNuMAvPjPgNSiGZS+DDpaZZ
         3GNQ==
X-Gm-Message-State: AOAM532kfjouj0hDdKKkOTsNEtvojbJpyQBhiGL+C2Z7gLMnFphgD1qV
	lpOZsXrb573KCPsTGl/I9Lb+LnL3l4M=
X-Google-Smtp-Source: ABdhPJytEMQbOdmPtAUDXXuKl/qFRwLolZEf/YUAW6RtHNC/rI6x41saOaqufPAqWvfS5870/4VHsA==
X-Received: by 2002:a1c:dd46:: with SMTP id u67mr12603985wmg.73.1620428495706;
        Fri, 07 May 2021 16:01:35 -0700 (PDT)
Return-Path: <romain.naour@gmail.com>
Received: from localhost.localdomain (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
        by smtp.gmail.com with ESMTPSA id i3sm6963725wmq.28.2021.05.07.16.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 16:01:35 -0700 (PDT)
From: "Romain Naour" <romain.naour@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Romain Naour <romain.naour@gmail.com>
Subject: [oe][PATCH] dejagnu: needs expect at runtime
Date: Sat,  8 May 2021 01:01:29 +0200
Message-Id: <20210507230129.734881-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

runtest return an error due to missing expect on the target.
Add expect as runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 0a007bb2cd..ce242c3593 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
 DEPENDS += "expect-native"
+RDEPENDS_${PN} = "expect"
 
 inherit autotools
 
-- 
2.30.2

