Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.15750.1626620590689617187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 08:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UCarj5iw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id p36so13833570pfw.11
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=wiWHg9Q3wmo8DB+83no51QF2XA/hbOv9+HbRffONiR4=;
        b=UCarj5iwikxxvtx7CG46o/dkJPL8cVFjB08TCqCxVvloj1nYiaFtiHGFqxfXmhDevD
         aH6DBYdX9SPbHh3dXIWxBw3yf4GQ9hawXGypmueY5XQdf9bR3njuEBTMhnPfNivX5Cnp
         o1eAmnblH9DtzwcvghkG2Hiv02NBM3u4rUG3jt3Yf6+IPepHUswfUEMp6CBUPH86LBfh
         +NmxFwZZqANzuBdboZuIvChZVjXToTEQlXDKwDSzeloWq+he8IBh4bCpnQZXM/+qYffB
         xdXOYqL3Jw8W30hy7ah0Dfnduur8qagZm2oDpDYBkQGuhPq9Khe1nJjEh/IAPBKSkqV1
         OvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=wiWHg9Q3wmo8DB+83no51QF2XA/hbOv9+HbRffONiR4=;
        b=Cln3bil+MxIhr1KVX69RswK9mqAubwaio/nYqDGVQq1uphd9XRPtrXDE/oKNCKPpwM
         KVm0dq9rBYHbD4fcvoCv7/EC6/7LqsOpi0PW5C00Z3SXoKYf3J9zrLH/T6p51HqZhxOb
         zJoeVYU53QhW7ZGPzLK7oGlUEb7XA5bdh/9YrS2x/ildpT6Sb0T2vP7J1oqDpjo0ZvA9
         y40F8TfFvVUwp9ZYKmXytpwH4ImeTZA/rYNSPCGGa2YjammDzzH60Vxq2dUMb8gHxWTC
         XwEvPuH0k7xTxN0holM/nt6hL39PjR4WLYX4VBGkps5lKlUIg9eOYWoyAW/t8f3ei9ls
         8Tfg==
X-Gm-Message-State: AOAM5337lxelzZyLuft9c9GsCcp6bkZHbFe53CfuDphZmsxqx83HegGo
	RV7UasZSAAhRcC9UIXqGa6WO+3Ce8P0DmY8W
X-Google-Smtp-Source: ABdhPJwaXyzoe8Ok2nJxkEeKTT1fYJLmTjMXLkzQ1m1rPsGrNnXB8NI1wtHhaVjHAgjpTLOPXnMx/g==
X-Received: by 2002:a05:6a00:24c2:b029:32e:424c:53ac with SMTP id d2-20020a056a0024c2b029032e424c53acmr21058759pfv.17.1626620589648;
        Sun, 18 Jul 2021 08:03:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n123sm17992980pga.69.2021.07.18.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 08:03:09 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2029B960325; Sun, 18 Jul 2021 05:03:07 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 18 Jul 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210718150307.2029B960325@nuc.router0800d9.com>
Date: Sun, 18 Jul 2021 05:03:07 -1000 (HST)

Branch: hardknott

New this week: 1 CVEs
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *

Removed this week: 0 CVEs

Full list:  Found 31 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
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
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
CVE-2021-22901: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22901 *
CVE-2021-31525: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *
