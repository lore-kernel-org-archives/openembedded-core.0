Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.32847.1618236252561684417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fAd7AyBT;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id i3so13507971oik.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=kNv0t4psQn9tDVZB4+5GPTbtzQks1bT2x0Ma0cyqzSg=;
        b=fAd7AyBTVwIF1ys1gdOui4C0lXqMJvDjEznK0V6z0mmVzmLw/PJPxlUgbG5kNOALvu
         IZRH+1KwPLGKIRssOITuqisH1h/Y3gG4SsLxysN1y5XEIaccd5pXDl8WJJeSjTtj6BRF
         aGhYOh8MUYN8UBEpmMtkbPry+i56rVsDXgdvdR1rvLiADpw2R3WvLh92LRsVlwTv6CGS
         Ne2A3FJ4dbEhBc0GDLyk2QlMd0fbru6RbXXTdqwViwnMdMtvEwLqV2JCe5O49oKP2pSD
         Uk279t9QxJNh1D83eA1vl2pJqq9BLoGs9zwGqWcNriZJxFhxVy5qAkVGDXAPzY6J7/iX
         XTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=kNv0t4psQn9tDVZB4+5GPTbtzQks1bT2x0Ma0cyqzSg=;
        b=XYipM1akgm+izXt7gYu/nKIT1VxrIpHxwXZhxmWYAN3KzS/LN2cgZs2BMbGPQ/8QJy
         g1lO+Ma4nfQGVx4pc9ruPGCHE/9ENyQh1yLUBGzVG6kh5xIYAfpntQikm0bwKAUNz1wk
         avBQUU7FOrUGxz6es+Fr4MhW5oHU/hC9payKwQB7t5l9oTn+L0pC3chxPbSf/CRyoWAg
         tal0CZFHCEiBD7cjhDrBwPwtaxoDfVoAMqC4C8CL/v1AvSlUtICsL65uniBIeks9sfoo
         HBN7Y4U5maGz0wp784he51370BeYYIYfTzgdg7S8zXq+gtNQxnRKaGpdcehSFFNehxDQ
         l35A==
X-Gm-Message-State: AOAM531zVGtNumfPkwIh1OeOakznJMTOA/pKpdZTT5Dw+7nZwVCLUaIV
	aWEYZqwZ8GBaA5Bjp3sYv8Deh7YfVFYszjawck0=
X-Google-Smtp-Source: ABdhPJw7Pzpf8PcoobQtfnqSqBdSh7IdCKBQsTWRa1HCQ+PWJWqNhCJ2Cu1F/+5Rt2UyArjxyc8i2w==
X-Received: by 2002:a54:4e96:: with SMTP id c22mr19076564oiy.176.1618236251316;
        Mon, 12 Apr 2021 07:04:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i4sm2667695otj.56.2021.04.12.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 07:04:10 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 12410960310; Mon, 12 Apr 2021 04:03:59 -1000 (HST)
Subject: OE-core CVE metrics for master on Mon 12 Apr 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210412140359.12410960310@nuc.router0800d9.com>
Date: Mon, 12 Apr 2021 04:03:59 -1000 (HST)

Branch: master

New this week:
CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-30004: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-30004 *

Removed this week:

Full list:  Found 71 unpatched CVEs
CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
CVE-2007-0998: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
CVE-2008-0888: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
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
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-9390: libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9390 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2016-2781: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-18438: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-10713: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
CVE-2020-14308: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14372: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
CVE-2020-25632: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-27749: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27779: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
CVE-2020-35492: cairo:cairo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35492 *
CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
CVE-2021-20225: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20263: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20263 *
CVE-2021-20271: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20271 *
CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-26720: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26720 *
CVE-2021-28153: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28153 *
CVE-2021-30004: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-30004 *
CVE-2021-3392: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3392 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3416: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3416 *
CVE-2021-3418: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
