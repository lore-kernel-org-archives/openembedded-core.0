Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.11577.1632063779013989454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=w19Hli7G;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id m21-20020a17090a859500b00197688449c4so10884462pjn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=F23rMXcBiT3YyrdrxfqZZcEGMe5neP9MAfqV4dNS2xM=;
        b=w19Hli7Gs1EUB0C/SfGrFlcS/5ZSr2NhvWbwvLRlD7FMSfuL9dp9n+DFE8hjaSRX54
         olI/098f9ToZX+7Nw8wW6vRkkhD0YDRh99dSMaJ5FUBRyCMtL3HzZw3HagbMOnhN6Z5z
         QXZOQ4akw3qhd0dymhkC1E6s16967lELMB3ZQ9z2DplT9LQf3ELoZrYrvxIfwWrLrKG9
         O1G5wXJoOAVhXX4eYUrNZ27FiBMqWMKNNWhq76Ji5IjkkNTuQYlLISOtNmSXhvZYz5us
         tXvQRgkGZQZ+iZEjO8RIUtQU1KckGmEfKiRZfuyW1Q8OK8yh64UD2JbMw5D8jixrQAYQ
         fhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=F23rMXcBiT3YyrdrxfqZZcEGMe5neP9MAfqV4dNS2xM=;
        b=rFAZWAhmtvk0Y3wOP/XM4eFZ24dlZ20z9Men1Ohkg9cvNLi/6kcoForAHOkEFMzrFw
         J3ncbjdM9mx7LV2AUk9jOawqz1if0KFkahvPvIA/Ht3Y70AWUBQAG3EhmHw54WAa96bT
         eVeDg6UYEEg5neMht7mqJdavfZa0yC2PQIYHtTah7TiGSrM0XepEbanMnv+FowaoC4dh
         CJmFqUlzNf+wNQfjrBwZLiY2qiq7E1FdivvA2YlENoNFqB6TSAuhDd6CiAaN1wgCUEbh
         FfvmvJZkKl2mH8PQ0OYwg40hdFOZgCSxvNwKk9DmFx94UG0Km8RKfv6a9SIfXSnQ0JKO
         7mrQ==
X-Gm-Message-State: AOAM533VCZECW/QU4KeH+vq1/qBzS9gaqmMIcaBAStNzXdK3uNS2E61/
	mXtPFh/lfRbI8KZ/KLT+pRDZaqDyGEGWPDbOjwA=
X-Google-Smtp-Source: ABdhPJz1uqSI8PTqKKYTSHym6Xe5H2a7IhVsQk52iMgwKtsprdu4hI3csu8k3sHMgnYWcEXVuR0rTA==
X-Received: by 2002:a17:90a:7185:: with SMTP id i5mr24096656pjk.236.1632063777919;
        Sun, 19 Sep 2021 08:02:57 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p4sm12333683pgc.15.2021.09.19.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 08:02:57 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 13F149602E4; Sun, 19 Sep 2021 05:02:55 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 19 Sep 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210919150255.13F149602E4@nuc.router0800d9.com>
Date: Sun, 19 Sep 2021 05:02:55 -1000 (HST)

Branch: hardknott

New this week: 10 CVEs
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *

Removed this week: 6 CVEs
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *

Full list:  Found 31 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
