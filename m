Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.25612.1615143842302525033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 11:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eb3LbFjf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id b8so7111590oti.7
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Mar 2021 11:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=3C8om0RivmADMnOpEljiZQPy2BQVp7Wti2OnSmFu6EI=;
        b=eb3LbFjfryfiVD5lO6+DgRKmsJmhJk1uJm9Fk3Zimk+JJw0MwR6FTLpj2LFvZLSqGb
         xsonHs7WTadhXEO1VlM9YDrjKbDt/+FE/Qqoc6hIiXsrYG+52VAMCQ3pS6Fop/MoEFhw
         vipKiirBDggBoGWrFVnFSY2+GdYboGuCPofTItyt0uY26W93ViCtpcm2fiASeMZBe2mv
         5f8eS7fxe59I9VdTyg/5RN7sGgZJtXzYiGtZzqMMgoONvFrEFt47FgeWSvKuW5/HAqZy
         d1ynx5aVEdXHUoPni9wqvx1v2jVJTRaVLQ64Hyf7Z0Se185mrW3KCUlpBlV3BJqgJFYJ
         CBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=3C8om0RivmADMnOpEljiZQPy2BQVp7Wti2OnSmFu6EI=;
        b=HZdWb7+u30Zt5Fod6sBcJ2fkGTyyL5vQ5K9QRHy/qEzDkH16LNoedg6rU9Etc4FPdW
         H5ml8HlemKv0GN4YAnpkS/+2P/Qmg8VOHYx6DMBoFYsv2W9M1Xkd1p86uMjXbebmkqU6
         V74QAozWa8g6x5h4NdAbVEZ7ybDdGXfGTd8OBuLD3hggONC18e+BxTOFZYBXR3fPWrla
         JwYN8Qrq+2nVgGurXzCq4l/JhWc3YlR9GyN4EWDvvHBm+6gOaFBw7SpxSzAjLR1DSrMT
         LS3ePooTxetNYbJjdahIXUdZ8f2O3aTovQ37R1Mi/UMU31PII+8U2yQj4L3Gz5ArEeMc
         F7eg==
X-Gm-Message-State: AOAM533JemJ4bD22HP/ypOByzwfIcS9PGu1zzjQwhbH3+K0RiDRcj9qy
	WZx8fSOaFxcMQCojCRm45mTC357q2EsgI1mx
X-Google-Smtp-Source: ABdhPJwbncVbzAa0coDraC/BMrxc3t1/z2aQGwMrspsHpauMLvPRolmGc4dVSMmq9RCL+HWWoTHvVQ==
X-Received: by 2002:a9d:3c8:: with SMTP id f66mr16296546otf.246.1615143841005;
        Sun, 07 Mar 2021 11:04:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c20sm2173704otf.76.2021.03.07.11.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 11:04:00 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 41FBA96238B; Sun,  7 Mar 2021 09:03:51 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 07 Mar 2021 09:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210307190351.41FBA96238B@nuc.router0800d9.com>
Date: Sun,  7 Mar 2021 09:03:51 -1000 (HST)

Branch: master

New this week:

Removed this week:

Full list:  Found 55 unpatched CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-0998: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2008-0888: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
CVE-2008-3188: libxcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3188 *
CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
CVE-2008-4539: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
CVE-2010-4226: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4226 *
CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
CVE-2011-1548: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1548 *
CVE-2011-1549: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1549 *
CVE-2011-1550: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1550 *
CVE-2013-0221: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0221 *
CVE-2013-0222: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0222 *
CVE-2013-0223: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0223 *
CVE-2013-0800: pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-9390: libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9390 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2016-2781: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-18438: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-8625: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8625 *
CVE-2021-20203: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20203 *
CVE-2021-26720: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26720 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
