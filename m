Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.21069.1607879882860393584
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 09:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WsgkYnSB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id t8so10523887pfg.8
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 09:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=rRr2Ms/bGrpubQ8j3UkQZRlBC1cSKJfNMiDf89fTqHU=;
        b=WsgkYnSB9LLYi2dZgbis8L0/QzarS0MZ68bmAwjR7eJ4kp4h2mZvODWcOEaYs6X6/c
         6aqsCcm33wedTKCYesc/OFRrNoL0Qcu1kCTwwrP+lR3VT6KCwxcXJtoH4NNgMm1LnD9s
         n5OiFTk6VqWn5oEo8Kf553MApleYXRO1CewT6tXumtbwp20ajTUfZ7qu1amoPcngJk0B
         lheVFrRdcdmgq1vYNlTtsCSNgHtSJaS//TMHnILI+Hf0llTZN0ls5WK/Cj3dfs920t+7
         0MRcXp9CNvPpSGkhci2F4m1frtY0nMLeSHh4r2Qfm10xWnEr+J5xnqzmBNKTBqlaG4UN
         okuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=rRr2Ms/bGrpubQ8j3UkQZRlBC1cSKJfNMiDf89fTqHU=;
        b=S1LTyoGcq5LO2XifGY240supRNCw2NiNKB3NdL4hqUNijYylMk7ytJ6IuU6D4ZpwBk
         GcTJKjUF9Imbcr0802ak+ymbptKVXTYa2ugysRZSxxTHlEODF/Szh3UbwQVpNtIJ7P2B
         altVbbYkhuYZteM9ml3YyPvrpP60O7cDSMWwaiD9PxJnV+gvUcPyS8jntHpq3PutH0Zl
         uEQs6QL1WKQNmrtiUtTTtA/R6m3/6BLcXqpEP+xV96soIbA9dBOCQvaxuOnLXyGZNjen
         YFFI8Er6oiP7whZMz5EhoaJxSlpivhuFiL3Zv0HJthww+CAZuwfwmOiKgBcNG/xl6+eq
         tYJg==
X-Gm-Message-State: AOAM532Jv5LnTyQsL+aZg5e9NlukmrJxmY06i024hn8iRevqiNCFT6sG
	5eHkDtZSil5PmKKme8txfd7j79PElDvIwQfG
X-Google-Smtp-Source: ABdhPJwEWBNrDs1MSz4GOvvAYgJXRO5C93tS2T7iZc0RIdRs+/93MKAygDrokOSz7bPYRC1TfjNKfQ==
X-Received: by 2002:a63:ff5d:: with SMTP id s29mr21171124pgk.290.1607879881835;
        Sun, 13 Dec 2020 09:18:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h32sm18162276pgl.36.2020.12.13.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 09:18:00 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8B26F96021A; Sun, 13 Dec 2020 07:17:57 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Dec 2020 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201213171757.8B26F96021A@nuc.router0800d9.com>
Date: Sun, 13 Dec 2020 07:17:57 -1000 (HST)

Branch: master

New this week:
CVE-2007-0720: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0720 *
CVE-2007-0998: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-3387: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-3387 *
CVE-2007-4045: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4045 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-25723: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25723 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29562: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29562 *

Removed this week:
CVE-2011-2766: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-2766 *
CVE-2014-9471: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9471 *

Full list:  Found 78 unpatched CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-0720: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0720 *
CVE-2007-0998: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-3387: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-3387 *
CVE-2007-4045: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4045 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2008-0888: unzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
CVE-2008-1033: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1033 *
CVE-2008-1374: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1374 *
CVE-2008-3188: libxcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3188 *
CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
CVE-2008-4539: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
CVE-2009-0032: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-0032 *
CVE-2010-3702: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-3702 *
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
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2016-2781: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15710: pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15710 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-1971: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1971 *
CVE-2020-25723: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25723 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29562: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29562 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
