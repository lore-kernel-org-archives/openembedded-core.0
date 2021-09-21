Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.407.1632237600207274685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 08:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zpImtFo9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id t11so3066886plq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6159NJ3KUhoo+OF6E+R9/ftyVmG3vxesZrDpA6Z7ycc=;
        b=zpImtFo9rQzkSmYS89ICPF8ywbofBP4raVrt7BHWZ6JGZ3A7a88gfoe1fs1cPG1tGL
         HpHp9i8zFM+dKEFvlmxOFBXxC4Ea8MYqpM8Ff/UKF1Sq4zgW4Ev+XKKkmxAbwjeIC5Rl
         i1cMQ872+BFc63F06dV/r9ZzhOChDXFszLnF/+qsfVNUYSXcsV2JdI7MTFPyYkgse19C
         kDISODl/Bk36t3A8uxzqB6C3IddGChx6CwE6W9O392PfGD7IaBWyKo7Bj5G62QymIKXg
         F/KYpIGEC4BG87KVVhwed1F6k8BXo6hbHRk0RNjbMWPp0cmpNBxos7F2mroGLL+wQQuU
         dmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6159NJ3KUhoo+OF6E+R9/ftyVmG3vxesZrDpA6Z7ycc=;
        b=qMGn+PjH5c1vAlGxdXo4nqYia/ApqzICHrm6n8mSf4pmI3JNOvszrgLdyF/6h97Mr9
         0cXCPftx6Mb/nDsut4lawgQ5FI31HQscNqnW0S2rwwBo3wCs/L0DtB2eNIU9WCV84Q1r
         3QPkzj2Z8orZ6w8jFU8C+9WRY4k1nW88NZOBKo1LeTjpvKBYhPeMKF3bDsYX7d7EBy+G
         P30cEWckr/5F3787W/VFE8FFZV6qgg9gXsFObfShSDZz9VFsrh0BjWkk7vtDHxZIU/Wn
         EpnjMaPZEW13d/GQjIltVtQKkpH8t8J4xnno+d5UNaq4alrBuOsj/Pao7AHm/az8dqrb
         xnEw==
X-Gm-Message-State: AOAM533/LC09eVisLd0ONC2I9Z5c03ftOUYt+8P2oYHdE3iRSwIl1tcq
	nkuVMQrolu9skyYno2EIy8CxI21J63+7+tboCFY=
X-Google-Smtp-Source: ABdhPJzvbWUWXGMvwPYGBaJbCyt3sIcEqwgDqI/DWDfDNV2NYiBeB4Wp2S6jlUQ3521YZ2kJfQU67Q==
X-Received: by 2002:a17:902:bcc6:b0:138:d3ca:c356 with SMTP id o6-20020a170902bcc600b00138d3cac356mr27678594pls.6.1632237598906;
        Tue, 21 Sep 2021 08:19:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id t13sm3051823pjj.1.2021.09.21.08.19.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 08:19:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][master][dunfell][hardknott]connman: add CVE_PRODUCT
Date: Tue, 21 Sep 2021 05:19:37 -1000
Message-Id: <20210921151937.1471470-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream database uses both "connman" and "connection_manager" to report CVEs

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 342a512f45..748eefa748 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
+CVE_PRODUCT = "connman connection_manager"
+
 DEPENDS  = "dbus glib-2.0 ppp"
 
 EXTRA_OECONF += "\
-- 
2.25.1

