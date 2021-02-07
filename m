Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.23985.1612722867045505606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zGGY/Rz6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id j2so8834044pgl.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 10:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=PgS/juN9mrM4x9AGRFF3850zbfDPRR0f2Bwf94QuVFQ=;
        b=zGGY/Rz6RWAY4GyFGb02CXtWJPgQiyb+GOzLpGiVCeUwvRa/gjXU3j3dtdbmf6nEOq
         /aqPG+Wkc5o5yX3VEAjj4dJWB4S130+UZmmQ32mx2rCMoP6aDZi3SKmvTT3h0t57hNSx
         taKkzOqVY9DvQ6kkW2Xa9Iy7Mj9lTO4JsgnpAsISlvxVIe3bShMsPp+3ajDttCh4OgVr
         ZrbSgn/AMSfPJOFBnB5iwIkK41pSd0fPSxjEkTgfFu8VhOCHmRUOoTONloI0n7sXNtuh
         YPFvMsh1YJXY7zd9c2qvOXZDPu7xjE/KomBgeuINEHNQFRT8t4429jSG898Z8kV9v/4c
         idEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=PgS/juN9mrM4x9AGRFF3850zbfDPRR0f2Bwf94QuVFQ=;
        b=YaT8eNT9dM6UWsau8pzQD8n5SEtDb9ZU1yDCP3Yg6Gxen4ZdlD/Xmd7YllEE98FL6k
         2fQB5uwese8Q0iIfPBwJLiPuMiHfEJO8zt26OWkwWGIWba+oCJJDIksFFmWHLs9aoELr
         EDHRBbsfz80vyorKoM2Qx4x9M7QTYyHCwVPHm/0yaIuLNSJqKjLa4HFZsLAK7i5mUX6F
         lEBucnlXvwN7sks7IYJ9nLfMpuqWy5OwqUQccoDnA+4jTzEE0AwhD2Capzx2GL4kuRVT
         kh2k7a8xyAIDgO6UfQWuQIvrEkweVwkbQcJAs+rbozauZyBG7t0bwWQ/SNMPzMABnBg2
         sVGw==
X-Gm-Message-State: AOAM533nWTqeJ7c8KleGDGfL0s88lGd31lOCVV5s25JWpyftDZz6hZWw
	nfDUv+9+EKzIOWo5OuDJPxvTx/89JxKdCjD2HZI=
X-Google-Smtp-Source: ABdhPJw0lE7swJliANpl3Mg6/59HuySuJCb68K+SddDrPs6BqRqrvUDNZk5+Teg5KFubQrhSSygMqw==
X-Received: by 2002:a62:e205:0:b029:1dd:b063:8872 with SMTP id a5-20020a62e2050000b02901ddb0638872mr1057000pfi.44.1612722865829;
        Sun, 07 Feb 2021 10:34:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id x11sm1627910pfr.24.2021.02.07.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:34:25 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2B2E7960302; Sun,  7 Feb 2021 08:34:14 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 07 Feb 2021 08:30:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210207183414.2B2E7960302@nuc.router0800d9.com>
Date: Sun,  7 Feb 2021 08:34:14 -1000 (HST)

Branch: dunfell

New this week:
CVE-2011-4862: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4862 *
CVE-2020-17380: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2021-3114: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *

Removed this week:

Full list:  Found 83 unpatched CVEs
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
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14352: librepo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14352 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-16590: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
CVE-2020-16591: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
CVE-2020-16593: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16593 *
CVE-2020-16599: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
CVE-2020-17380: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29509: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29510: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29511: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-5260: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-5260 *
CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
CVE-2021-23239: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23239 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *
CVE-2021-3114: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-3177: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3177 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *
