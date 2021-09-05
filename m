Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.10671.1630854215284797969
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 08:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jHi5oKbP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 17so4098450pgp.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Sep 2021 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=YXHDGbfMrorehhKdwGmYsEu5LstGe+E2mo3vg/UTy5U=;
        b=jHi5oKbPQ9NLBB0BMnGweaXOAmBLS5YKqRJUi3AZJOeY7t3YcmzoTziduwtsS89dTS
         l8oHJLPNHZV1BsLBAJQBH75HxoI+ghzoY2qmppgm73qv5q+nQHc76KSMTZKw558VLgCF
         OI+LNKhl6fgbuLd+hVPy2KoTQVbYreaihqZvZhvAoL8sz203KbUvwLTaAsdsSFsYVwNI
         4u8w7CPSY25NJZxohZqajcwQTbmRDQy5DRsZys7EdnD80oyehEZEMW2vuKFnzuEENGUu
         meNfpzauHhYaBzKiWqDcXOlYHOUgamnoFuWKVFiy7e1eiS9KL1pdBV/Fp7JqnwdenxFG
         mMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=YXHDGbfMrorehhKdwGmYsEu5LstGe+E2mo3vg/UTy5U=;
        b=Z4Gs8ky8NvjezOAleVzj12vJEq/43hzF5bjPAih0Dz9JdYqbZnv6NLKg1Po+vZ21F4
         O7Dhjf89OrrFGKLqbaCnCFXBj2fNSx5wURS+DzQHPSVC3jpRI6rdh0DpcqMAlZQUMmIv
         LKanOSXIeGp3fA03372vCaVYovp2PMZJs4N4L/HclrWIZ2Bo5BC/SQpIgziGirVFXTtj
         PFUgE1OuD8HOgEizpRFyyUXJdxQ5O57s0g+YOuc/YxKYOQ5razkb3z8pApeBTNjlTEap
         otju/RNhmiTLoIf/uHBQEMM5zEYluya+lxYGk9sgzRLWtiZbccu2+MXLQFWwBv4nxPeL
         cByA==
X-Gm-Message-State: AOAM531fmKQe46Vh/7N5+nzEqynIwWVyGejUdBHffyBEcwpw5kUWlzSu
	OiEGKivKaXkiZ1/04TcYt+RXGPVo+ja26CqF
X-Google-Smtp-Source: ABdhPJy8JQWlYtQT8stS+zomoHpyCPdF8PElsUUrdNsISC0o2cTZBwxioa9Zd7uta9zZoBGIDQoJ6Q==
X-Received: by 2002:a63:480b:: with SMTP id v11mr8017663pga.413.1630854214020;
        Sun, 05 Sep 2021 08:03:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g17sm4872300pfi.168.2021.09.05.08.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 08:03:33 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5DFD396025F; Sun,  5 Sep 2021 05:03:24 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 05 Sep 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210905150324.5DFD396025F@nuc.router0800d9.com>
Date: Sun,  5 Sep 2021 05:03:24 -1000 (HST)

Branch: hardknott

New this week: 2 CVEs
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
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
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
