Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.24159.1613934129670440065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 11:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OWeeovpg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id e9so6236288plh.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 11:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=rQE+NiBI3DmaNVdqQT21up5oGvRMH4cZqYA+bbP9MIw=;
        b=OWeeovpgt3vmw9+fFtKMTeOdjqbCGEz1h10f5Je78C23IWLhpsnV4aqdr5MHl35JVL
         2Jrha31vZPLXwQAkhzMJj0EEBXWHKPipB0PYM6NbUfx6G8Ly5qPDH4tK4ZT3X4wXZHdq
         wz3h9nWk2zIBGUgOUwZmXVcwzQVZgIhmg00DQDvLCG9FbQA95Dc5ZntankePC5NJaE4y
         g5I1QfB0XUIemKxo0sckkKqKAhsbxYAwIhmTwW2o+vzJqrUymV5y50Wx0p3uoQ9qh8nk
         cTCRWpAD9JlfPWQe6Cw8kNShMr0s2GaVK8oL8a2bjdkFhrTb+DFyi3qeI2Ug99/KFiaM
         O98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=rQE+NiBI3DmaNVdqQT21up5oGvRMH4cZqYA+bbP9MIw=;
        b=ue28KNcoOb63CfNLey1AkOQZZOMGlBARTAXSJblLBfQemCDnKSzgxE82ysHBCBJ4tC
         1XIW/rs+VXwbE+j5xa1nbquhLQtpJjbQWAxJ2ZRvDl+dWHFPx19hD0u4xC+V/PTRy1KC
         j1Orro1P7Di+zCOrwIp4RgHOoertC11p00ITvum1r/UFn1YRrtcOu71gTB/Sla6yFv/3
         qLvmxDRF//AXx9pKLImx3PA2LFZwh3ZHqMN/OF51jx9KWVxJQ6K+pCK2yZ5wKRW/94/H
         ZDK3fm552DAHW6jFMVdK42eym9Vk7Db4qNdh6Kgs8TfRXb77tst84O8Yob+3/2xKTA2Y
         87ng==
X-Gm-Message-State: AOAM533sCHtAWzCFG7HOzyZGfRsqOdGncytfGpi73po6yN7/tX4Hl2UX
	e2khN7xh+YE4a7kbWR9vlvulvNmewKJ6O43Ovck=
X-Google-Smtp-Source: ABdhPJw8pX5vuOQWp9Sz+kWNTNG7F4qLbZZeneS3UYgqWysnRCd++HYbc59fjjAECpmwSBxYt92LyQ==
X-Received: by 2002:a17:902:b609:b029:e3:4b8d:994 with SMTP id b9-20020a170902b609b02900e34b8d0994mr18481524pls.44.1613934128678;
        Sun, 21 Feb 2021 11:02:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k9sm14597383pji.8.2021.02.21.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 11:02:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0EE4296036C; Sun, 21 Feb 2021 09:02:06 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 21 Feb 2021 09:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210221190206.0EE4296036C@nuc.router0800d9.com>
Date: Sun, 21 Feb 2021 09:02:06 -1000 (HST)

Branch: gatesgarth

New this week:

Removed this week:

Full list:  Found 64 unpatched CVEs
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
CVE-2013-4235: shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
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
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14409: libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29443: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29443 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-26675: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26675 *
CVE-2021-26676: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26676 *
CVE-2021-26937: screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26937 *
CVE-2021-3114: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *
