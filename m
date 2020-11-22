Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.22647.1606069239652092802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 10:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b25w6Yaa;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id w4so12077257pgg.13
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2020 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=A01H6Lq56t0h4lgevBeIKTj+UmelkIrD3/eh96krMQM=;
        b=b25w6YaaPM85lLzPCVT+f5JugAceWr7FOM08dV/QfgZpsgkdUlCyCyuKevySA7oGwy
         x1MFtBMeCgEkkKPJXOfgoGpAlzwEt966sjFw+cAU3qU6zemHQPA+JKupUzLljGtIMkfe
         IdlVc6l3XTtrXTfWeAsROvx4RCrPKZ5O+pLCwhXK/vq5a8k+ybz+S7z+5VY6mGtcUPc8
         tB9TuNJW9GVJ3k6P3Dl8vqgZkjEq33L+JuOAqicIQppmKfmqDC0ey5FKeA1kg60T+GaG
         ByECt+HhHNi6XWH2TtMxdzdNphpwUgQbGA/k9Qquz8Sin09gB3fiu5FYUHVGcDkYtCik
         z8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=A01H6Lq56t0h4lgevBeIKTj+UmelkIrD3/eh96krMQM=;
        b=uIAGZlYx6i+9XHmTLkwIBDEXZhn0DC+bJrcUm50sE5Oxltm/QmPO5i+WQbZomhCoOQ
         6Ks4bx2ppQuY1KbBi1cq5R0s78pBwKkuy3W5YL6KZoIvblWmaJQtNyM++CURp22wAdgT
         DOIYCBEwRjsE6Yu/xCdDsQGMPCYjG0qFQiLgXyDb5ZBYDQndQ5uynDPO+RU4E+Ps///S
         GH9XAjR04wXlkxzLO9DD8CKfq/4B345keD0n25MYL8Sqda+PTQwUWhuOpy5aJAHwH1l8
         5Bg8yRIg4uYue+G16LzEBelXulDwWFrWO3eGL8Ij5WXQPSBAdZAqxVQ9gL9XL22/wmRW
         azLw==
X-Gm-Message-State: AOAM532jteBGkgyMaPrALEOlyj506gIYbNJOgQErNWPjyQlWfvAeBirq
	wN9JqLU6hYeuSEB8GNJKnklWKRJqcTipSwN9
X-Google-Smtp-Source: ABdhPJydjJcpjDdrE4xS60ibjPSHA7FGjY8/VD4bKCSUb2ZdVTHjOAfaHZiX4EVfUO970F9iSHfvUw==
X-Received: by 2002:a63:eb11:: with SMTP id t17mr25283404pgh.286.1606069238788;
        Sun, 22 Nov 2020 10:20:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([75.104.55.184])
        by smtp.gmail.com with ESMTPSA id gp16sm10135869pjb.1.2020.11.22.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 10:20:37 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 62E199601F1; Sun, 22 Nov 2020 08:20:26 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 22 Nov 2020 08:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201122182026.62E199601F1@nuc.router0800d9.com>
Date: Sun, 22 Nov 2020 08:20:26 -1000 (HST)

Branch: gatesgarth

New this week:

Removed this week:
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *

Full list:  Found 52 unpatched CVEs
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
CVE-2020-28362: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
