Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.24576.1612724664109340991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=t7EKV8CB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id gb24so544086pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 11:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=szD/IMyYsa1U+uVmO3cCpsYy3rf7a0tvpX5XT+CRusw=;
        b=t7EKV8CBbZkA5fPoV72qIVCKJzsJfQgayosQp1acRAyuQtdqx7NAweiRddKuk/LgN/
         v4P+fXnIW2RnKauV2wzys/fm+RRkdeIQQkAlLiF1E9+9W5HNbrPE18QagPLeCXSUBC0r
         XqsHDaAJ9tH+iMe1RFgiVgRqY2SJEpagvdNNz6ljHpsNqZodgBSOoP5LxweJMU4WvclG
         VN0SF4dHtn77MYT5jugS48rRWmVMuTO5OBhTTbuByfEuEHj+qH9z9zVU8rHegIGxQQBY
         rHBKwQy0zRXvyzf+kqLAsB7hsKepVDo5YpCLcKwZj1X58Z/7nz5NscNRXUg4i7iglu13
         h7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=szD/IMyYsa1U+uVmO3cCpsYy3rf7a0tvpX5XT+CRusw=;
        b=WKu1cEMOdA0LBZh9rL3r0pGrO6Gb1rqlHuaZaEsC43vht2AeBx4xvfgwqPpjrn5MvH
         iTgkx4ODsKwxPGI8tTQeqWBXoV8DFfjnOBPbg5XDRoGyxCaBWh/KAtQpmorww5ZZ8s7U
         pWULTyfENmiC/9vBHdQCIkHegxAVeGUkt91PbUmwaAJEkD4Uj+OJ7hat7aTX7BnLc5e9
         ndHnlIcHzIU1naWoFns1t79XLS3g/LHun2oFRx6f0aOaGfR8OjZ2zwdONoBgtNLUufkb
         bUg/x35C1W5S+FxbcglgH0c2gnpzsDb4+7YdgMwaZCvfWJOwgajZLu5LbjloGpmgMzC5
         HRPw==
X-Gm-Message-State: AOAM532RF7ZorQwMBD/p5Nb6fclh1bsbYbCpmjeAblL/IiUNJOHvd55N
	2W7RCHzqPsnS3m1VC4Ew1psbHYJEoXTnHfcSEvY=
X-Google-Smtp-Source: ABdhPJzAIvoWEJtPspX6UvZJTr/af2GVF80U793gSU6A8QuffRQ82LfFO8KOqmV8lE/z821/75Kjcg==
X-Received: by 2002:a17:90a:ae01:: with SMTP id t1mr13912347pjq.198.1612724662985;
        Sun, 07 Feb 2021 11:04:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id l14sm13685005pjq.27.2021.02.07.11.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:04:22 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 229A9960302; Sun,  7 Feb 2021 09:04:12 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 07 Feb 2021 09:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210207190412.229A9960302@nuc.router0800d9.com>
Date: Sun,  7 Feb 2021 09:04:12 -1000 (HST)

Branch: gatesgarth

New this week:
CVE-2011-4862: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4862 *
CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-29443: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29443 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2021-3114: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *

Removed this week:
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29385: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29385 *
CVE-2021-23239: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23239 *
CVE-2021-3177: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3177 *

Full list:  Found 72 unpatched CVEs
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
CVE-2011-4862: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4862 *
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
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29443: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29443 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *
CVE-2021-3114: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *
