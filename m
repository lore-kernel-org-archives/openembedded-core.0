Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.20851.1612113524823327067
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 09:18:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FF393VN5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id z21so10414498pgj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 09:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=yY3Co5TjDf31UD5wQappp+MOxc2Zirg9rgOe2m1h1w4=;
        b=FF393VN5nD/9hTIkN80Q79gF6r+8iIfFEmINvlqsaRsfrt1aHCQd+QU6gaWpZk4vqa
         qCgKQeGJLNQ6AqlUXBGLe8qwtoEKbLAttMReJ5TDEuLBxsdyDNQqwag1pKKFCvvHGStH
         k3pKHSCU44w0XRfQaWKPs/F0FkDFU8OHjDlXIn6YBqiqRSzY/uHuHTVFQE9o2cJ3Zim4
         F+dmx+UPLqfJH2vT/QnN8Y2A1kqD0j1ZkC3Y+tNabO+Zir1m6tPgFa7gKocjssP5eay/
         XPJMfELuvr1R0+vjDXWh/BdBft6YpKyPz5tRqZ0KFiRSDR93lb3T8r/aexPbcaGpHIr8
         vXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=yY3Co5TjDf31UD5wQappp+MOxc2Zirg9rgOe2m1h1w4=;
        b=lzhM+sran8YE3Rvfc71hOWAWF7BlZub1zTSUO0XCy7X4tZ5BOVdqcuBjNfLjEj0+UL
         /eb97CJgWI8Aq6vbu/7vv1VOrP5b63NI1bA1buJMRCk17RW4PSona7op5c/+IWzLflfC
         ib+oNBnXdKoTFnLMr+09yzwR/fD+MbZnpb4k07a/SjD6mHnMSTapCB6Z8+Kv4vyHqLgi
         O/Z4BKEVl2oNYTAwqA5TQZ88nF66SJBy688hIvNtQS95IhivXq5WQm9bwG6JZdIHzoL6
         ZlLs+87W0jcRX5Ng+JUCEHGL9N5pE3kMqzYp3UJtjVPG+Gr0CDwTsOYem45kfEKr0Xrv
         nGbg==
X-Gm-Message-State: AOAM5322i0JHwjrt4k94e1a27eIX/xHcUgXkCNTU/g1AgThjZ7rEcMBX
	3I0yrwc1t9N6FAA/OaoYJBn7qvcXajawsoUuuMU=
X-Google-Smtp-Source: ABdhPJxf/x25Wfj7s3IX2aZh+KaZBzBEJP8wJht5ZCBpyEyhDA/RVQfSoa5sJ2GIDFKz4JUUXxBnEg==
X-Received: by 2002:a63:6c85:: with SMTP id h127mr13312600pgc.158.1612113523787;
        Sun, 31 Jan 2021 09:18:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id 83sm14602392pfb.68.2021.01.31.09.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 09:18:43 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 20803962C18; Sun, 31 Jan 2021 07:18:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 31 Jan 2021 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210131171832.20803962C18@nuc.router0800d9.com>
Date: Sun, 31 Jan 2021 07:18:32 -1000 (HST)

Branch: master

New this week:

Removed this week:

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
CVE-2021-3177: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3177 *
