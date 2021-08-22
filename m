Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10940.1629644599096206608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 08:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OcBZxyA1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id f1so1832482plg.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=B+EKcsP6jPFFi1bAy21RsMxj7ql8VguLBgSozxnTZs4=;
        b=OcBZxyA1TsHSm7+hAKcIzPsoPUNWTkFJmsXJrwdgEASqLCuPe72yYCNFCerI1mVlkp
         9UNf0X1G37hNSuM/Pel6iMyEWyMJzgd8SiRrgwQn46FYlaDxQtJrBFJa1FOQLjYMUvFP
         gVuw65z+2XV6/0F1WoA3ztob8M4ljiomFTdCW1IPqu6y/vvCqVaQ27ndZ4S1sqNgspq0
         +foVXHLrJOK1CqWRP/Gal7KhTA9BGg3op2W6Boi5FkD7vESPpTR72js3PFqX9l9NTMdH
         UZT25joFfPBw6tSQavEwLNvbVVBj3tVMvBJwGfWYCljDfix4XrNgqFK7CbAJP82eKGsj
         FI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=B+EKcsP6jPFFi1bAy21RsMxj7ql8VguLBgSozxnTZs4=;
        b=AI9F3KSrwdot+gDKaU2bnfQ52bYZfh2kPKR6tfag/1IBj5iIVtk1h6b6TserUjxLic
         Tk+Sw6+hSYrp17UG59jwURfw7ns2uB+VG2DMqVqdPHKr5zY06EsmcFt8E0517ycFYopq
         4r8gR4e6MoH3xHngCHG9LC/DAsdDDqbJSeaDE/THpRRWb++TeFrc2ZRZNwKBKFD6QDc6
         Zri+5P11EAY60G70eRtRGETW389XmbM4jKN9/dNUrKXre2FNhhEr59Tdwa/ft91buDt3
         2Ub5t+Wh/ZzfI95y5B59nNa+KAvUCobX87olAugyzevnb0PSDugzC3enUAkFDDDNZVsY
         T0Aw==
X-Gm-Message-State: AOAM531e/YdJxRU1TLCiIAuHIjiQWf0FZE9no7wJuXMxNWXNKP9xYPuA
	UPgm1mJbeCxtXJP+/0g86L5sdgr2HClnPKxp
X-Google-Smtp-Source: ABdhPJxf2auaQGq2ZWeXurfE1CNOVBrOMLDru9TdhDGTSpvmf1WKlpD7GV+dKC/BLMPLVoedPZwMEg==
X-Received: by 2002:a17:90a:428f:: with SMTP id p15mr15492445pjg.75.1629644598008;
        Sun, 22 Aug 2021 08:03:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 66sm13130013pfu.67.2021.08.22.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 08:03:17 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 891CD9602DC; Sun, 22 Aug 2021 05:03:07 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 22 Aug 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210822150307.891CD9602DC@nuc.router0800d9.com>
Date: Sun, 22 Aug 2021 05:03:07 -1000 (HST)

Branch: hardknott

New this week: 4 CVEs
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *

Removed this week: 1 CVEs
CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *

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
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
