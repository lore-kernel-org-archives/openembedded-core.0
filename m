Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.21832.1612117119592368600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 10:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ksgdXg8T;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id i7so10467153pgc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 10:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=vplrNpU60cnYwaKusUhYRU8/KHC4yN6k1thBB2j7hVo=;
        b=ksgdXg8T3i1M8+/Cpkh0HV+3bvUHlSHHgBj92QJJnplWrMC+VFShGhS68MG4NjgZ40
         33S9jQTHZYG9S7GPNZ2Vt9uwtJEmP3mNLVVBdScnQQo+X7g+/BkcHldm7yn8LddrTYr1
         xHQVtQO4aNlEV7lq3WfnK7BcGSR0JpCAIMpNJhQ5s0hzZG5wJpp1YgSgEt3FdpKWU745
         42g9SlUF58OYDHvc8shmnSylwN9QPTUflnBR6O7PmMxfO/TpzLDsMp1wb2HGR/RkNSY8
         jXUvbfaOaXCbMGYyE43cv0m9nEWA0vecMMWXabSB/es+n6oICQGq3Oou1VwieayI1AZ3
         L2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=vplrNpU60cnYwaKusUhYRU8/KHC4yN6k1thBB2j7hVo=;
        b=Wlt7GNto29Fzds6+p1XQb1h4jkQtNDoRKRYsfaC93vrjZflxLMAzRUMhkDOV4vIr3C
         sErg45MqXhqHFhfyBtlqvs7cx0oYd4H02sadoyUV3SDqBev4qmeaRPrBGJefoXgGZ8jw
         fttrBWOAJFcvgs3I3n4PlY0eyuBqWvZU8nCfIH0tfsFlYg/0QHxtjurG6hWzayLjdP1b
         iBfeJUiNVlHlAWq5XVdcm48Ev+TDML8VbM/ekpm4z+YJ5QEfWBWTGObttyK80el6r64U
         jVD/fqABG1iSeN3wG3ZDwoUXc5SI0JzlzT11XfDBtoQL+bVxfKjttQRgaGUSTLYLd21B
         7NPg==
X-Gm-Message-State: AOAM533VnAmINjUOGIHfcSqatvQfahnvvMI/m2xgVfNhSHIdyjgHhe/Z
	W6wcDLnAXhNXEkTbRIJosNmjWdkugX3gR4m0R7Q=
X-Google-Smtp-Source: ABdhPJz7/mymF2RlIczU+LUTGXkye/Q6b+pFhWFFywvidSRJ2FbpXWZaFZPqaSFgGEPPn+SNWh8m+A==
X-Received: by 2002:a63:e101:: with SMTP id z1mr13348604pgh.190.1612117118597;
        Sun, 31 Jan 2021 10:18:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c4sm13774289pfd.160.2021.01.31.10.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 10:18:38 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 03BA1962C18; Sun, 31 Jan 2021 08:18:28 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 31 Jan 2021 08:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210131181828.03BA1962C18@nuc.router0800d9.com>
Date: Sun, 31 Jan 2021 08:18:28 -1000 (HST)

Branch: gatesgarth

New this week:
CVE-2021-3177: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3177 *

Removed this week:
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-35448: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35448 *

Full list:  Found 63 unpatched CVEs
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
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29385: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29385 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-23239: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23239 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *
CVE-2021-3177: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3177 *
