Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.20874.1610903900082912906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GUYyn4+o;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id q7so9457654pgm.5
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Jan 2021 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=12bwqjXSoa2cG/D024t82QGYQdkjIOrbfn1Ew9jyYeg=;
        b=GUYyn4+oTnEeMbmA5DD1s2a/wM40ABvZ7mn7MvW+qWv53Zju9bFH5uDwnTpSXFgkF2
         5HN4brYOa0sgSxjF6kHJ5V8J9iNWM9NW7GMWcsooTSqXE8dwT8ccE9CLFlPngE+iWYa3
         RHSi6TdTW6kzM6OpxlFz78eU/UT5YH71b+oGbL4X/iRggk6/HuSJ9Y3uQQS8EuC7K55d
         YPCuY3riRdq2UrpigD1IPzMV55zHsj26JbROm0xjJLLCSRgkZe4DHVc+BGyF727Xpqb1
         07qQmVR2cZq8OOcQW3TG7Ll4oWSyTQe5MhvaBEkO2OhpgcUeLjpFs69VdAg6qhjVCRmx
         77yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=12bwqjXSoa2cG/D024t82QGYQdkjIOrbfn1Ew9jyYeg=;
        b=TLqp7iLLyNMG8uqJVSH+fo+bB6WidR0pkEsepvCMMiww0FmxoBWRBoPPZr4UjR6rug
         R4iEb/c9ZB+VpgyD3zOEezup1+24OjfZhFI9wIw8r0S8GygHO4l8SgaGksgc/xRY38hv
         flR5BIPA643vzsW0iJ2XeYOMqiIEPAmJKJrc0/KIgTctzA+351ljX66zoa/VtqG9kgBu
         MuKQn3BsvI5jgl91Aasnqvir22IxoHGBZq2NEt3VgSacQ57iQmg+6i1Wm+UxLb2mycSU
         c495ID39azf1GfOapcqBuLiWbdI4qYrXQUuTfnKWxTC9FJ4qdVGHvmU/XKOGPrv9aXjg
         Pi0g==
X-Gm-Message-State: AOAM532yymhfyAAkCiym3+rumOJSGIkY2vVPJPCOG1pQxdV6zpSrVXQt
	iVcugFxYfPqdpPe8hJCrzOFmsXBQW3NpjA3QYN0=
X-Google-Smtp-Source: ABdhPJwVufgNjppYDXXEwE9pXrkEu6rFEpN5pt9XTmfloauR6fa5RoLnYaSLI0tsJvEpcRt0/mALpA==
X-Received: by 2002:a63:c64f:: with SMTP id x15mr22292658pgg.196.1610903898660;
        Sun, 17 Jan 2021 09:18:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id k128sm2288899pfd.137.2021.01.17.09.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:18:17 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CB3F8960348; Sun, 17 Jan 2021 07:18:06 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Jan 2021 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210117171806.CB3F8960348@nuc.router0800d9.com>
Date: Sun, 17 Jan 2021 07:18:06 -1000 (HST)

Branch: master

New this week:
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *

Removed this week:
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2019-25013: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25013 *

Full list:  Found 54 unpatched CVEs
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
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
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
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *
