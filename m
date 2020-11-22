Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.22395.1606067287174032399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2020 09:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x6NJ2NTS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id k5so1216217plt.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2020 09:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=X0HU5roaTpIVFWH+pmy8gmMKOX+ZpA6apUf5NNi9xaY=;
        b=x6NJ2NTSf/rSFs/oP4u8PQbc3UiF3o2TeWMzBWjR8bo0lK55rA6ceDnWY55fXvyN2p
         nxn8DTcbaUobghWWmJ0uEM81d7YmfBXIH0uZw9eVtMF379WSWDFKcSz7WV6E8GOKg2CS
         cHYhEokhr3bKT2pUkxPlEtw0nIlXfq4TCq9c8hqaYM0W9jZ0CLzj2buJq9GV8ykpPsF+
         jV87I3rrhMlQbV//Mgf61l/nOY8Yh0HFOmivPohskAer4RGXVYCyKUz6CpSeKtEcZO0V
         BPy29VDC2jnhaJ+jNpgUzreSgK1ho+xDe3uv3YkwvILyNvQHiMWm680CnyrKfzX+mMtG
         pSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=X0HU5roaTpIVFWH+pmy8gmMKOX+ZpA6apUf5NNi9xaY=;
        b=CGalYeIVbJvwql8M5a+tXmGRK3gy+cdADa6UICXL0b5i/YTjXBXBNkAxhLMsdmGO1p
         1gxY8DYXlFOWWT3kQedpI7AGieEekCvu6kX+YYLagI93c1TqXkqnonzBBP1Dv4KUM3fi
         fZEgfwu7OeN1+oN7IPyu41DHNa/aUsgatGMezFzibAvMjoYLY05vu8VRxajGkYrPRwdq
         gvdB4ONfP+9XW5NYGXOz2F9cyEA+/p2pJrOBNb69jVgbVid0FbIWD7C6XwrmhtvfFQmh
         jY1LLov2pCBsHgX+xJcc2mEODJ4AHyNhv/QzlBwVrUfAAS4PFOiHbI0k0DjIEKu0Yfe9
         kNNQ==
X-Gm-Message-State: AOAM531LMNjMKbiGptKq2A5PISxVWKXVqPnrk9jhdQ8PmYyacs2pdq8K
	mzyfHtOJwh0effdUgNqPIUtEHX7GnoG1LNaZ
X-Google-Smtp-Source: ABdhPJwosN94ZQ3O2hXJjPXMMHkRAfPqddHt98f0tsmpF606IZUWU39kDejUmnJ2NruAZugXel0+5Q==
X-Received: by 2002:a17:902:56e:b029:d5:d861:6b17 with SMTP id 101-20020a170902056eb02900d5d8616b17mr21334207plf.17.1606067286099;
        Sun, 22 Nov 2020 09:48:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([75.104.55.184])
        by smtp.gmail.com with ESMTPSA id e21sm904280pfd.107.2020.11.22.09.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 09:48:05 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8A2019601F1; Sun, 22 Nov 2020 07:47:55 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 22 Nov 2020 07:45:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201122174755.8A2019601F1@nuc.router0800d9.com>
Date: Sun, 22 Nov 2020 07:47:55 -1000 (HST)

Branch: dunfell

New this week:
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2020-28362: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *

Removed this week:
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *

Full list:  Found 64 unpatched CVEs
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
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
CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14352: librepo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14352 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
CVE-2020-28362: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
