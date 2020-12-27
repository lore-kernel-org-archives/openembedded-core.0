Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.34789.1609089427207968186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 09:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fFrRbj1V;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id z12so4753602pjn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=NxlQ0pyipZiKfDThXlYFC3YbMLV7F/lYwNwBU5viog0=;
        b=fFrRbj1VWibk0OK9LOxCMYsqd2BiDXvk4AWIFn1fOb+bZl3fdkmZM0IsgPzXy1KbhX
         eRMRJnOn/6vM8lAX6QTBWLe40TFU3HhHXRBxUova7XkxZoejpggBczXGnnjU7cF/zXTi
         JM82scGc8OmhG6BZeqUFG1L4GHhhunbHV/+g/+eQQmY7rOO9UfFz/PwoKPLFu0nBozhY
         il0mePz8hu/z5xYq5iOjlntTekjwrzgdhk2QkJMDgJnsIiwXB/yeqY3Y97Ot+lwDuvsP
         kg2sgyDkB7+yQMeCaMy40Jnre70fpHMPz/wLNwoxWGWoN+dKTE1tfRteHbwXrSXs78Rr
         KLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=NxlQ0pyipZiKfDThXlYFC3YbMLV7F/lYwNwBU5viog0=;
        b=fMtpwuFW59L/hxwQcIGYebrMY6/33BVSkK2h40Vd+aV6uuick276GuNPnRhQjn/vqs
         4XAxEG1wEc3by8K9X6rxB3wosstTbmASiFYafHOZG4or1QPsFe+ytX8u3M01D2a8G/O6
         85BhS7cZDKqWVZz4Dvjnqd4BTDlSmYKsfjVnz4eBhng6vLzrAbcRDcxoypEhMzopggyx
         aaWmxe69ggQeugbmhdfW6UaYLLQf9Wo8XZt58Rs2hoCTyjxU/zm7R0cetSjy+95ezjM/
         xg/A174TgyVDv6bA5QNDDpjWHaNV/isiBX0iFgvI1k3TNXcuRtpB+j0F+D/PX8IjYS8l
         vqyw==
X-Gm-Message-State: AOAM5335EPM5+70rpyLIg52Ot1hSAnBucfUaOs2A1vlITdLUkYIa7cjv
	7zZMa/eYcGl6VYEZRamMH5fwHQXkkz3xXeSbWfk=
X-Google-Smtp-Source: ABdhPJzlGulbMVsjjwT2+xjKJCOz+g6xySG75by16KbhqbY8KumHOk83RpmUDedg/ufGgxOs5xrZGA==
X-Received: by 2002:a17:90a:fb8a:: with SMTP id cp10mr17331875pjb.136.1609089426086;
        Sun, 27 Dec 2020 09:17:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c14sm35127604pfp.167.2020.12.27.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 09:17:05 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D5C18962DCA; Sun, 27 Dec 2020 07:17:02 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Dec 2020 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201227171702.D5C18962DCA@nuc.router0800d9.com>
Date: Sun, 27 Dec 2020 07:17:02 -1000 (HST)

Branch: master

New this week:
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *

Removed this week:
CVE-2007-3387: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-3387 *
CVE-2007-4045: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4045 *
CVE-2008-1033: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1033 *
CVE-2008-1374: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1374 *
CVE-2009-0032: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-0032 *
CVE-2010-3702: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-3702 *
CVE-2020-8284: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8284 *
CVE-2020-8285: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8285 *
CVE-2020-8286: curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8286 *

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
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-25723: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25723 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27821: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29361: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29361 *
CVE-2020-29362: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29362 *
CVE-2020-29363: p11-kit https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29363 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
