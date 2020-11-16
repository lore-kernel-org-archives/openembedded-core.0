Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.138.1605567452082898434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 14:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sAveruzb;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id q3so20432884edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 14:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tl21FN0i2gj6caoI1i1nJEGZcMVp8fOgMbjQKMHhP0c=;
        b=sAveruzbotEPgGwDGg1tcDXUz+IwraWJRVszLvOYnBtXCJPETGocGg1BpvOyBiJ4mN
         iyVduSY6Ztq3yIEWQ89Z54BR/cz28Y47S1GB0aBY3zNE1Ymsk84WclTclRL1oGqQ5xx3
         7sFPIGT+HijxclG42BtAQU/ntduw61ItSDtOdw9PcnAhnZXu2RabiucRKAY01gzJsuSz
         LwsI/jaukVtRnVByEJtorYgQ2re+uUL82CmPlW7+jLSVMZGR8ihLcTLLKRCR85YJPZ1t
         rTTZVD2I+B1LSaT3b8+626mIMOaEaDCIo6YAe3hrbiHY5Fe+SM2XfzbEqxdJOe7DDUfY
         YMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tl21FN0i2gj6caoI1i1nJEGZcMVp8fOgMbjQKMHhP0c=;
        b=kUPowhwqJyjw2albbOmulCnd+2N0Ri1K06um7rGXAM6bmqqu850q/51NjS+IIMDJqV
         jARQ/EbMYYfWo9+LWdOCnXIU5kig9IZp4iWbebUsqwGJ4qfljsdS3kcBPqDFT4crIk1v
         ZZsY+HUezrBcZSme8tqLXtZ7fk7wgK6ZnXIXJ2cmCBLN3yDykAzGM2go9Jp+srFBYZgq
         85Nye1aHjMY033uP8TG9AHeJNO6buCN+J1OvrsF4lJydk214pHiWkxDfNc/ytS54ls8R
         m77eZ+ilnnoL3NGyDafqkcD6zfUpbvMI+I0DsrKFCz6O+DOP/Ui6GZ3WRyTqGIlldwYd
         YY5Q==
X-Gm-Message-State: AOAM530qmtyu2J+s4EYHf9jy2d3NvWl8z+Zml4Q3jJrMORaRzp0IW2Qq
	j2BLTVHjKQr2lywuInCa8OrNWN95ug3AyeGb2+boNA==
X-Google-Smtp-Source: ABdhPJwg2wu6qQ/vcaKyqIuNDPAnmpzJ5OneBkV+GK78wMs8ufkEqOo1kC/G2b1Fsem1fCBZKQFFugDHS/0xdq/OmT0=
X-Received: by 2002:a05:6402:154b:: with SMTP id p11mr18190762edx.217.1605567450289;
 Mon, 16 Nov 2020 14:57:30 -0800 (PST)
MIME-Version: 1.0
References: <1647BED07B3D5BA1.30187@lists.openembedded.org>
In-Reply-To: <1647BED07B3D5BA1.30187@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 16 Nov 2020 12:57:17 -1000
Message-ID: <CAOSpxdZ3jWzJAN+ha=ZA732CNYUtwR2Uea=HprCu2pTDtrb10w@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 15 Nov 2020 07:30:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

For those who haven't been following that closely, here's what the
dunfell CVE count has looked like over the past three months:

08/16 202
08/23 201
08/30 180
09/06 181
09/13 152
09/20 149
10/04 148
10/11 145
10/18 111
10/25 93
11/01 90
11/08 86
11/15 71

Onward to zero!

Steve

On Sun, Nov 15, 2020 at 7:36 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Branch: dunfell
>
> New this week:
> CVE-2020-14352: librepo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14352 *
>
> Removed this week:
> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
> CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
> CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
> CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
> CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
> CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
> CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
> CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
> CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
> CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
> CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
> CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
> CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
> CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
> CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
>
> Full list:  Found 71 unpatched CVEs
> CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
> CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
> CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
> CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
> CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
> CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
> CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
> CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
> CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
> CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
> CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
> CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
> CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
> CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
> CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
> CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
> CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
> CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
> CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
> CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
> CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
> CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
> CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
> CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
> CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
> CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
> CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
> CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
> CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
> CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
> CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
> CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
> CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
> CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
> CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
> CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
> CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
> CVE-2020-14352: librepo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14352 *
> CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
> CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
> CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
> CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
> CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
>
> 
>
