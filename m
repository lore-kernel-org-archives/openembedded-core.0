Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.8028.1627830170899969359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 08:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0xHNOlJE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id a20so16797285plm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=auTteKo1UY/C8vaaCjlXD6FLl0FIGZMZyI8n8QBSV/U=;
        b=0xHNOlJE/qoLEvZNv+ChKLnWtMDm7O6nlroAv65Z4sA8AMV7Y9bAm1V8G30TQi8SOl
         qZWoZ6rlX+8pBOLtYNVeEX2lG6tXlTLJzMBqs1tOJ5AsRLCAN7NvQmtTv+YSeoPCpThc
         +tsjdpR/ntxIVLS4OEQCB6uOf8Ap9vJ804gfx/Xlz4+QMQNuNzhy96g9oXP+obifx6oo
         r8A8+CUh14PGnJM+Q+XGiyBliDs1ltORE+RLPlhxz832jR7kF9uOkdMJIP10jaIupZFN
         0sZ0ijYBacoWrfqXyPQUWyzEicLx0MM5VXD/JGUzb5sR+vTtu95HHVETCuUHwt8g2IYE
         aPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=auTteKo1UY/C8vaaCjlXD6FLl0FIGZMZyI8n8QBSV/U=;
        b=EMj/9ovs3J0srP3aYf8h2edKvr5WfGQG1Uq0wkvtNi0eAYBbOVbGodxmDetXshR/x5
         NFMdcuwoePN7kY4FhryANj2f+RW1uvpy4mvs6+nBXCIl/DTTAiXfHRlowr45l2gE+BY0
         TnM81xue3aZmQryqYv0YKjHHDuTMZ6EbebG+zBYY0BfBvd6AyBSr5glxC5FJu6/325jG
         qPeiiLEIawx9g2iW23vKvjGzAoty9T+YGnVOxQKXQVATLjwxAJgzau1vwfclE6T4Ru0Z
         C8wwvllO+qj15wBsNxdFiqDqD4JQjMUeRWfChkMjrFFrnAOqr0LpMVkRgDE+CE9WMfl4
         LfuA==
X-Gm-Message-State: AOAM532LqtzVm2kvPqXQ3Gi7BZGzQBX53Larqads3u8p850/Ec0d0Ewc
	n1rImWQQ8ToHW19vG76NGSlJfNgj2vS2QaBb
X-Google-Smtp-Source: ABdhPJxPUYTbY6pbRgamlAmLRMvYOlxl0Wd7bjxia+TnX/HZ5L+Mw4KMCmSVjOr5UjrRSbLvcafLGw==
X-Received: by 2002:a17:90a:8b0e:: with SMTP id y14mr12928700pjn.82.1627830169798;
        Sun, 01 Aug 2021 08:02:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f1sm1438293pfk.115.2021.08.01.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 08:02:49 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3C8B4960321; Sun,  1 Aug 2021 05:02:47 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 01 Aug 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210801150247.3C8B4960321@nuc.router0800d9.com>
Date: Sun,  1 Aug 2021 05:02:47 -1000 (HST)

Branch: hardknott

New this week: 3 CVEs
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22901: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22901 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
