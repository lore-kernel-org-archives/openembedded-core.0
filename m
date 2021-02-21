Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.23722.1613930548745883456
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 10:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cv2GbuV4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id f8so6183943plg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=SzW5FV+5My69Vx9EOhRh4JqA7oUTMlfioNwcGxD8cXc=;
        b=cv2GbuV4qJZ1J7uknhB+ERJwwuHH8PedL75VUUq/SCdxwlUiSHv7JEzkvYAJYt3o9X
         jR03iCDshajPRt9LJ2MwBaT2q5KTptaiOFBFm8GYOAjw63l2ZWqyQfFztdvMsFKSMMlz
         Zf55IeJX+PHKuDSVxiTz8Iv9/Jlu9BVQNuXasrRZM9eV2d6p/RTbIQs8kBzQ+59fti+4
         S5GanHJL9vaoS5nX9GgEGIeqHD11Z5lRklJ4P0ncvZWGtLKn4WLtR5EBjHzfBOcfZXHd
         AN0MPzAw5JyFEYOzWuhrYfkbLge9ypcypWps0aN5pVwV94Fh3zA321dMqZLghdQaKamQ
         4BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=SzW5FV+5My69Vx9EOhRh4JqA7oUTMlfioNwcGxD8cXc=;
        b=G9EqR6r/v1sKqzn5Wps3BDnS2NSTqy0P/uxx/z3bOTmI9SZbEUlxok6ioKgFKKGldB
         liqYAj45G4w9L+FfmoMQKye6LblV8h5vJLkvdBv5SaGRzU3qg/RzhZknvfA86RFq64i9
         5Y5MnkRHXKfU7V9qZX2TJcmcHQWp5uFRUyf5OzHoEQfJ35ykeZP8gPKTSONzNe1Qdz83
         MohrddQn5L82JfScjLDeG2kzVoKXHkpblJy7TFg3vasU7WGIfWPef7knkm/ARRI6nvZY
         VwKsBASdGmE9AnT83v7oI8/+kGAULuR0U4VBw3aT9LieblFZfzySFXtBzjNWZZaCqNGz
         uqAQ==
X-Gm-Message-State: AOAM533lQs8aPwen073P8zetZiD/58v77PS3jX8PYhdha10CxoFH2GmW
	mqyVpNFrAXHD90fuRjqwY6F4NrFelh0zn2XZtL8=
X-Google-Smtp-Source: ABdhPJxOwDTBOpKgihJ7VymRTcY7AIR6GaEJuXPcWYptYEv8UjxyxkHdyP2G1mQqcpUEdxpcazGp7g==
X-Received: by 2002:a17:902:a585:b029:e3:7962:c0ac with SMTP id az5-20020a170902a585b02900e37962c0acmr18267607plb.3.1613930547657;
        Sun, 21 Feb 2021 10:02:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d24sm17094631pfn.54.2021.02.21.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 10:02:27 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0219A96036C; Sun, 21 Feb 2021 08:02:25 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Feb 2021 08:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210221180225.0219A96036C@nuc.router0800d9.com>
Date: Sun, 21 Feb 2021 08:02:25 -1000 (HST)

Branch: master

New this week:

Removed this week:

Full list:  Found 50 unpatched CVEs
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
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-26937: screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26937 *
