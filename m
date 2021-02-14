Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.21067.1613329398755731499
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 11:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h2zzZ0qh;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id y199so5679631oia.4
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 11:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=Z+Ec3xlk4chvgC6qjpUnRtBYWZmTqW5oME7nTg2MAPc=;
        b=h2zzZ0qh2parSqfVk1s0W4/SLp30A9pcPN/wYpy6gFBrKjdBiv+LLJBs29BSkdx3Ka
         b4bGyPJ7uBh0mHbMtGeX7pies+0ydrGrRloVTQj6OoqKlH86/BJ7/6ocvNSt1u1AB9Jl
         hxspkSE6cp1dNW8Q3ZkmgDFg3ugH+r5cknO4fNaCVPcmU3OqA9slHTGqO7Ar5rCeGGQu
         JSMkQRbTxJhZ0OYvV4pR68VxC1n2KaL8+0vWjtATQMCzxfNLCBTT9iUminWMDWaQthF4
         ZY8KkSRI1raUt7BWqK5UBnPSR25bD6p3FSUuIDO9PrJdnijqqkPE8x5/ZoERw3eQ3F05
         xjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Z+Ec3xlk4chvgC6qjpUnRtBYWZmTqW5oME7nTg2MAPc=;
        b=KLhQOYfI45KciNCJhqxRcwVp8RDZGel1RvpOj1ug4S8Gdh2ja4w9xxjtHfMUWyZ8gm
         fj5+/WwhIIN+aBOvj3J/QIkWV2XkODGlGpAlQq9e0EVK/9Vh/LFndEUuV32hpaFhyf3h
         fLXQdxR7JdxWzs41Iz4/Om1HbBN+rH+UwQO4pXv9dwMIGNCNeJsBuZu0xPb2/iE4wxRU
         S9C9OZsUCqJLi7a0l/7g+eA1gv710tL6xJxpAXPG+DDVO2z68AAH0GnH4QBztnWTe146
         5ABOUI6pYBSyeT3N0uzwcnJr9ehaFqX5rvwtfgSuAdTlqQ0kfcrtN7q0wjvKGL3KTHGL
         va1Q==
X-Gm-Message-State: AOAM53216RdPmRLRhqaAP7ooBfZD8/7+iyD/Oj6Vgkznst3lHWyPmGV8
	snuDJs6TbXWttNgTasrdLzeIaL4Euyn6P5s1
X-Google-Smtp-Source: ABdhPJxhQhH0SMJtGhMRHbHk9qIiqf/MnHy0+2vgZNjilN+dTok4rNI0omRNscPx752hhLwQnpE+tw==
X-Received: by 2002:aca:4486:: with SMTP id r128mr3248857oia.171.1613329397643;
        Sun, 14 Feb 2021 11:03:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id v16sm3287348oia.26.2021.02.14.11.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 11:03:17 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 67171960339; Sun, 14 Feb 2021 09:03:06 -1000 (HST)
Subject: OE-core CVE metrics for gatesgarth on Sun 14 Feb 2021 09:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210214190306.67171960339@nuc.router0800d9.com>
Date: Sun, 14 Feb 2021 09:03:06 -1000 (HST)

Branch: gatesgarth

New this week:
CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *

Removed this week:
CVE-2011-4862: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4862 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *

Full list:  Found 61 unpatched CVEs
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
CVE-2018-12433: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29443: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29443 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-3114: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3114 *
CVE-2021-3115: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3115 *
CVE-2021-3326: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3326 *
