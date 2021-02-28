Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1908.1614539174580273480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2L/iUgC8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id q20so10001510pfu.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=/5wY5pZGY9EXpS6qQxRCU1+MGHo+6KzDcTSq7fVEIX4=;
        b=2L/iUgC8eY9i8HaRySU0z3PUBvKKxm2Fg7caIehyRRggkrMOPnjSc5609CFpodWaya
         Dtv9+WOnMUora7TcfClPkGHSrwxE93qoiSbcfI9W2qb3+vup2FzerNumd/DLRM5EQ0Ld
         hpSIqgpwGy35YvJY3JsIYM0v9utx0HaED1T/C+q7BWo+nrQaj1RFT0fg2dhIku+Cgmrr
         qld3NJUOHgok8E+MBQpFxWWxlUcup3a65E5sir55DlxYZMhgk4o4vLQlngEUhX4+QRd1
         jIYg8krsUaY9xvAzN5Ks6+nczgQkIX5WFBifaQWKGngupU6pzFDqMMs9uWONBApKQcm5
         ArpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=/5wY5pZGY9EXpS6qQxRCU1+MGHo+6KzDcTSq7fVEIX4=;
        b=IQaZylCWsQCu/wZ5qnziTSa/ZEQbsaFwFppKM63L7kdtwNTF4ugInwRiEty4/xfqc4
         /fuCrGxxUMOJH+GdTIYnYJzHdquqCn/Q+4kKG58xkc43+rBav0J3wUqE6cpJQjiHpetL
         HoTg2m9NugVbWVy1AfuhHgFXNMF/fEqjd+D2MkKR58g7IfLSm+lEfoxhHNoWF1+ZQiua
         Mc0InV/vZND1Cx+c5zPkfnhv/A7KVV0xYvhzUski3QrZbw27Gi101sooyJjFHO39VTn7
         HKYjMD6jkxuu3B7V6Z6jZbEPehbbM0lOjOAono+Fxc9LR9GXBi64ztmz6kbP0ITgcA00
         YvUQ==
X-Gm-Message-State: AOAM530sbhflZa3atTDSagRwhUQzDcK5atsS7zPogQOm2FImkJpN/7zv
	1smSUOL+hIPPYFjXrwGDUQt+ue9YbLdqAkMPTyI=
X-Google-Smtp-Source: ABdhPJxt1ZcXMuQ6Q6ClcUSv3qcycPkoLy6QPWlUnBApPqyKcu2rXPJdeGuCAzGX7e/SOuXQXkIsxQ==
X-Received: by 2002:a62:1b53:0:b029:1ee:8ff8:c706 with SMTP id b80-20020a621b530000b02901ee8ff8c706mr2826376pfb.76.1614539173409;
        Sun, 28 Feb 2021 11:06:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m6sm14840130pfc.56.2021.02.28.11.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 11:06:12 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 83D8C96042C; Sun, 28 Feb 2021 09:06:10 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Feb 2021 09:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210228190610.83D8C96042C@nuc.router0800d9.com>
Date: Sun, 28 Feb 2021 09:06:10 -1000 (HST)

Branch: master

New this week:
CVE-2014-9390: libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9390 *
CVE-2020-8625: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8625 *
CVE-2021-26720: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26720 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *

Removed this week:
CVE-2021-26937: screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26937 *

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
CVE-2013-4235: shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
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
CVE-2021-26720: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26720 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
