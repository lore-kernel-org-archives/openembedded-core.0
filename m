Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web09.24324.1622991849835493248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 08:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d2K5k7Ht;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id j11-20020a9d738b0000b02903ea3c02ded8so544995otk.5
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=ROQEnc9FFe1VvB97U2ehxI2704/mne2NKnXxKEnbWuk=;
        b=d2K5k7Ht69I/HJ184/iiSljyRe7CdV0LexcmizqS/HPLvK1PJA5T+D55eJMOZLw3XW
         4zGZOiz9ItkgpyuR0fl2DRrBR+YEDpBn7uUyNj6+Luap8fG0jE4L06b5bFwiD/Yu1Xjq
         WMmtV+UlE2omugbuBPuOTOIcJ+qGID3rl1inBHe2kWsYecZ3u2kwkZskhuZ2JMEp0+Nd
         7a8Xy7januwFxdjAIZUoIf+D3YlnVqZrqdCn2ZwjJKj0zTkTEJlzMztKzr56D/K/3pwk
         8oNFqcZPcfsc9i8mzR8yeP98n1GTHD9tNUPUsBYjuHpgj58x3QO/f4eCatPSS/C1jSHE
         ZXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ROQEnc9FFe1VvB97U2ehxI2704/mne2NKnXxKEnbWuk=;
        b=Lntu8TFACWv7tyJ1PFdvOdtcqmeX7E6TStrSekCyJIbu0tNYsZ5TFGKkHWGGfCFFj7
         4Qt2NK4PTruVm7oVJAqVd517kfZUFgTfEySEB0V3qQtlanMXDniWB+4Nqlvs6t+S/GDj
         wnsQZzOadfjX2QwkPnw2ljLJzJ9Iw713RrsaPGKagjEdV8KpReVcIVHJKzAYHw7bEA2q
         p7WEiFe//OL/qZq1avQLABsrtIF7P5/nHE7F8kPjgBfHCOozMU4NAH/5+231HE1zp49x
         ahTs4Ob5QhVtj7gi/ULsSkc1vpkm4x8atY7KjQOMR0Phu6ZnCl9hkOGWpPFZwkM5BmSq
         GIag==
X-Gm-Message-State: AOAM532Ox1pqqfh3vYb9o0x9FR222n0tkFW6rebkIZs9tLu1ZdPkYfCP
	V32TEEayeRZUxKG6xgU8eCOIpN1RsgKt6Onayzc=
X-Google-Smtp-Source: ABdhPJzRtoq20v4g2MF5DebNOrH/Y7m0wrp8k63Ag0sfyt8UNyDEhD6eMxl4EQhynhXOdJsERqzliQ==
X-Received: by 2002:a9d:4c83:: with SMTP id m3mr3685325otf.77.1622991848579;
        Sun, 06 Jun 2021 08:04:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1740058otl.11.2021.06.06.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 08:04:08 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 52350960334; Sun,  6 Jun 2021 05:03:59 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 06 Jun 2021 05:00:02 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210606150359.52350960334@nuc.router0800d9.com>
Date: Sun,  6 Jun 2021 05:03:59 -1000 (HST)

Branch: hardknott

New this week: 12 CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *

Removed this week: 5 CVEs
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2021-20231: gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20231 *
CVE-2021-25214: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25214 *
CVE-2021-25215: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25215 *
CVE-2021-25216: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25216 *

Full list:  Found 21 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
