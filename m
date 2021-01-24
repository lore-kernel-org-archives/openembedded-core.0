Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.23668.1611508701670351958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Gm9MWQqG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id c132so7346918pga.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 09:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=udyVfY/e7k8j2Hj/NStV80BE6P1vZ7qP3wYo+irf7/8=;
        b=Gm9MWQqGvnwt0pPE9FjBsOP8o9TA4DFf91v6uyPngs+Wq5sxPuoFEOlvY5TLomLO/W
         GJ2irFQEfCX6q88bNpM4kfNr1dlwZdrxYm0Rb5pKMLlWih2V3k1Xz0hJHCngc7NLsXEq
         49ps/CMpNiSe+WTVkNa98A8JM1dmjYqaKYgubA8d//QqZhg9kjoLSaVL2N+LsQoG4tbY
         dTRMtV18iWZwmmuGamsGsfeh0kKV2K/U9Ywk9Y31uHB8HPygCBhX49gkxfuq7r7GnqDl
         W0vVYDEDTU4Nk0VVgh5t6tUoW0Y+HMb0QN6fSf2CQCr6GB82QfXT/b0zHHpvzbDGRZXO
         X1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=udyVfY/e7k8j2Hj/NStV80BE6P1vZ7qP3wYo+irf7/8=;
        b=WeeCFDhXekxBCLXGyeAG+qK5mDDCdrhwSg4JoJWnrsn7VopCXk4X2U3SYlrmIKfx8O
         5TVCZtF7RPzMac5TN7fruN6jtyYfZbaTqTCn1jktHjxNs4rq80LXgI6lvtWNEkP7p4IE
         nuqOc2UKiYS+naarvd++mRyLYt8C+Wr5hIv9zJIkCnFUHYhyI9Os0CDI0ysLlcg4LlqR
         9JKXsvmXCo5Mgo2L2eYHwY/hekzotI/3adwc6KdxJZJNbh0GkSs9GQMeywSjOALkKcDx
         OJ4WnWuXQDP0yQNHhVKhl6wnNgluBlXIWRhIK/97oiI2yogp08yaTyRCJ47JOle/vIE/
         QeHA==
X-Gm-Message-State: AOAM530ZoQpuz+9cSSEXhH/SjnMKBZKquxaA4aSHYzezTiIbmfOkUc0U
	pETXntAd7bKsQffO7VyFCkgPFG73bl5JGsbjEQQ=
X-Google-Smtp-Source: ABdhPJz2ouSwulaJtSgOyRspyed0gr+P4B0i6lpVNRa5sFYkOD2HnrVFEaUB+a2AMbBKgYfZ8SnOGQ==
X-Received: by 2002:a62:b415:0:b029:1a6:8b06:68f4 with SMTP id h21-20020a62b4150000b02901a68b0668f4mr14835526pfn.43.1611508700343;
        Sun, 24 Jan 2021 09:18:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id s24sm1816257pfd.118.2021.01.24.09.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 09:18:19 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D838F960256; Sun, 24 Jan 2021 07:18:09 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210124171809.D838F960256@nuc.router0800d9.com>
Date: Sun, 24 Jan 2021 07:18:09 -1000 (HST)

Branch: master

New this week:
CVE-2013-0800: pixman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *

Removed this week:
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2021-23240: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23240 *

Full list:  Found 59 unpatched CVEs
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
CVE-2019-1543: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1543 *
CVE-2019-1547: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1547 *
CVE-2019-1549: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1549 *
CVE-2019-1551: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1551 *
CVE-2019-1552: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1552 *
CVE-2019-1563: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1563 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14409: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410: libsdl2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-1967: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1967 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
