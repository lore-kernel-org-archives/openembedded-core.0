Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.21216.1610300880624369115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 09:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BIsL2QYM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id r4so8268848pls.11
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=CCJXpVep2Y8cg7VkcjQW2ROhLxNN9pVXkqVFfL/6N54=;
        b=BIsL2QYMFa+m6iOSIh9DFo9zi2axPY/9J0RVbsKSAlv19ZKpbEJ+lVtAeGV3S4LLfx
         G6233ubg76DQ2RqLO3G6sPz4YwZYSGKOkJeNZK8BXAkXpxYv3yS2kv4QmmSYMIdLLzTj
         Bgvr5JO5u+ln74wcRTi2L1LOqXR9x6HE/b9rBlut+T1B7OPZ41/o0hAH9yN82i669VoK
         f8v9p26oWeQBliecryd+MDZK9iPuiSfqwHI6g61jDKAM5MTZWGNbaxoSoai6hDROshvw
         mo92WLyzqchYTsFKl+bR5ceqIr83/au8EXgZjYnN2TCQfKBn2kdSEe0nx5sqVopcX67R
         zDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=CCJXpVep2Y8cg7VkcjQW2ROhLxNN9pVXkqVFfL/6N54=;
        b=dhzK2x6sLj5RJrF4MNi8IGr6KMEtqYakfk5oIr0HcU7x9ZtB1o4XlQ02V/tk4ckQVc
         8ib8H8FrbkZBkBeLQcJXsGKhx2cNR0d2lnTAPY5HyP+Od58/aQkUJhw+jZYGsKgFVjdR
         g1NEyEQvA0IOPB2I4/NrsAf/74obaBfoU9OD4iAlAKlXtncuDg/CuEv67rpymLLXjIC/
         rmuNIF/lhPoIx8rIsqkZ0Zx7llTY3nB2uy9SE7LjRxZT1UP8ycM1zW+nRVCBlS7SfXBJ
         aX4c/WZJQFXGLGbgNiz4o+yU1rEuqKhs5xS+9oF7lKKVAsTtwv0veWbfs1bsnDOr5z3u
         3uag==
X-Gm-Message-State: AOAM531cMFhPO8WXX30v5Zp02xaDF93mtuqSWwE9YdRC2AQNIqPJH8l8
	CotdGtViznN6fV/Qe54wCGpcJVSwt2qG2nOTY8Y=
X-Google-Smtp-Source: ABdhPJxXd+tMR9L1NNApPio0O//z6y4n57QIXCz6GMO5lVpMI+fBSpXSS8DVNmlorsIBGk7QAojLKA==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id fa5mr14243784pjb.174.1610300879198;
        Sun, 10 Jan 2021 09:47:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m77sm15692001pfd.105.2021.01.10.09.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 09:47:58 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 03E8B962E14; Sun, 10 Jan 2021 07:47:56 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 10 Jan 2021 07:45:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210110174756.03E8B962E14@nuc.router0800d9.com>
Date: Sun, 10 Jan 2021 07:47:56 -1000 (HST)

Branch: dunfell

New this week:
CVE-2019-25013: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25013 *

Removed this week:
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-29385: gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29385 *

Full list:  Found 77 unpatched CVEs
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
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-25013: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25013 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14352: librepo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14352 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-16590: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
CVE-2020-16591: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
CVE-2020-16593: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16593 *
CVE-2020-16599: binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29509: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29510: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29511: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35457: glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35457 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-8231: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8231 *
CVE-2020-8284: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8284 *
CVE-2020-8285: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8285 *
CVE-2020-8286: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8286 *
CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
