Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.20286.1613325815423364984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 10:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Sv6jskTS;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id h17so1671735oih.5
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 10:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=HLj9mi+AADvKQ8EpWsLd9wO9XYMAmBm8rANu6W1U5HI=;
        b=Sv6jskTSTgDYdhvfi7viYH4z8u0yImjYIt846erqgfNR/Asx8/7G6vjNuCGeqX5lUd
         laNV7/Cy+Y9atsnGzYgq0y48GLsoZVh2e0nhGlj1LYBihc1ei+BLuGzgcCNm0wtvPRpC
         eCxcfF1uziCnMWpdFH6Oqk3p9hjSaiKJaU24Uerg/FvGwe452GskqtmAAzdnYwMOtzvJ
         VSvfHBrAzD5jr88xV/Dksh6XNC/nFBhYDadHW39LOAmIPhv/mOQqSfpznxpXSfBUy9+1
         QyFDkkTq3dBGKjnJH33gsRc8htcbRaZAaZPnc9z3uZQDFgW3zut264c8MpCthxLKTfPa
         j+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=HLj9mi+AADvKQ8EpWsLd9wO9XYMAmBm8rANu6W1U5HI=;
        b=hXWkT9c+K1mtF9Ef0xNv1VqlOyC+J6qySwr67lzEJZmEmTilZFcLvAtLzPVilyitd0
         76RCseCetguu9Y+1kUVLNz3mWqyZfvDnp4dbKzZlGrwRDDOshhIiXylAa5iOjbKkhtsE
         GSGgmNxjq8BCI+ReuLN4eMw0imjm1DRdstM/9JJIaXEQE0UDgy8wdvmRsXosOlqP9/O6
         CBe/3DKEXdZvu4dT+94VXRAAdK/v77s7QlLQjy0saIaMXk/cDV5rpK1h6V8YC+ZNIeln
         AHln1Rdrf9nu/bzC1o2RmXPG+c/rBpLQ2t+MfTFFGHJ3USShbL3n3HwK1L4VtEMvoyou
         /1nQ==
X-Gm-Message-State: AOAM530ImU3ivUVRHETF2ItKZ4mZDID9mLQ8bciYqaUp9OFv33Q614N1
	Ny9KCLbsYn6mo5ozls97U0yB+poi5NCXf6YL
X-Google-Smtp-Source: ABdhPJzuTQ+vE0aPBR5tlJM3q0NN7dY5wEfDJyAK71v3IM/kdJDV4iOaOYSWAk0XzjHPNFoCDkhzsA==
X-Received: by 2002:a05:6808:3d2:: with SMTP id o18mr6205401oie.66.1613325814227;
        Sun, 14 Feb 2021 10:03:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o18sm2798603ooi.16.2021.02.14.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 10:03:33 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A75B6960339; Sun, 14 Feb 2021 08:03:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 Feb 2021 08:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210214180323.A75B6960339@nuc.router0800d9.com>
Date: Sun, 14 Feb 2021 08:03:23 -1000 (HST)

Branch: master

New this week:

Removed this week:

Full list:  Found 51 unpatched CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-0998: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2008-0888: unzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
CVE-2008-3188: libxcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3188 *
CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
CVE-2008-4539: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
CVE-2010-4226: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4226 *
CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
CVE-2011-1548: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1548 *
CVE-2011-1549: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1549 *
CVE-2011-1550: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1550 *
CVE-2013-0221: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0221 *
CVE-2013-0222: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0222 *
CVE-2013-0223: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0223 *
CVE-2013-0800: pixman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2016-2781: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-3114: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
