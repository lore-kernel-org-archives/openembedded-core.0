Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.17333.1604951835071707867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 11:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=R7dDWfWC;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id f20so2524373ejz.4
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 11:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t08OSw5LJuyhiXVp+x7fzOohZgrDBNh/8cVljovtEf0=;
        b=R7dDWfWCYh9H30LCsK3VXnK2jpMxaGtfSTJC1BL6dYQQly4798EF7mK2ZAoGO3LluR
         72YlfK+p6+SlEPkAVJmWkt2aO+3kPyTeJab7/uUjWcF0QypGSD2u5wCFzv0azxi9rso8
         gihq1Z1zsbCOHq835ypihVcF/3DEo8U/FbI1yARpjC+b/vfw871xll0FXhJozk+o8/7g
         lKc11ZtgyN+JtURg5OncvBwOTnzAei1mq+R1awMCq0Q+ffduvde2sDvv9D1KOigFX24k
         FnWbz9vDwDLhwh+fRkDiTMHnSXjqzDPhF9qwRpumuugFuLPe1Ng8wjY0P79DX8Nsb/oq
         idEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t08OSw5LJuyhiXVp+x7fzOohZgrDBNh/8cVljovtEf0=;
        b=HZM3xeIo0v28XV1hi045u4d8EOe5ghy12XbHkCe1UqRmDITY1CxAIeD0Rov+SEHo6d
         KQW9tfCPu4Z/KG9MXTJEU9FKB4eVAHNrLxCPHEFqH1L2kwLbJNWrtnlTMC9mlGUVE5bm
         uvS81KHAPX7LCx9iK6FFKeKcqsROctciwcx1Kj+AUhzq8bMiXwe6625OliGJC2HGNCSu
         nHk8MdaRztr0JVVTW1qtPJDfk5QasTFVoIVxPlv598ddjFVqu1OObtcGAltPfl68A/zZ
         PCf3qzD/7XOO0vjB2iWbiqd2qkURBG10arJvmn5R3YtQUUtpFlHwLPg0RgyHMtqo/0In
         2jTA==
X-Gm-Message-State: AOAM5300q7c/g4rerpMib0s4TBtaTiDm6n1SIZEO1tQVeeKiVmWz4z0r
	AByKBh/HhjRQotka47dc1sgkbOjb95cjQKy6+Y4Mpg==
X-Google-Smtp-Source: ABdhPJwwVldudfMA0xvxtyoV/nmsEjIw9d+sAXMaXBls7Im3ELzFQvgNuxnzj7tUiLHoy+w/bpCTwMdc11cyPqKlRwA=
X-Received: by 2002:a17:906:280a:: with SMTP id r10mr16368115ejc.58.1604951833436;
 Mon, 09 Nov 2020 11:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20201108173417.B6D3C960213@nuc.router0800d9.com> <e4aa0ed3-53ca-fad4-2168-2395d2855c27@windriver.com>
In-Reply-To: <e4aa0ed3-53ca-fad4-2168-2395d2855c27@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 9 Nov 2020 09:57:02 -1000
Message-ID: <CAOSpxdadGrW2ntYVbVXSbvDcSZXB1bpiWZbz3XfPcrC2rGbx_w@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Nov 2020 07:30:01 AM HST
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 8:36 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
>
> On 2020-11-08 12:34 p.m., Steve Sakoman wrote:
>
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Branch: dunfell
>
> New this week:
> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
>
> Removed this week:
> CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
> CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
> CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
> CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
> CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
>
> Full list:  Found 86 unpatched CVEs
>
> I will look after the qemu CVE's from CVE-2015-8345 and onwards.

Thanks Sakib.  I appreciate all the help I can get!

Note that many of these are matching due to the CPE wildcard entry
matching all versions.

So the CVEs may be fixed in recent qemu versions and all that is
required is a request to the CPE maintainer to update the wildcard.

But some research will be required to see if this is the case.  If so
an email to the maintainer can get this corrected.

I've already done many where the fixes were somewhat easy to locate.
The remaining ones will require varying levels of effort.

If you haven't sent database update requests before let me know and
I'll send you some examples.

Steve

> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
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
> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
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
> CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
> CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
> CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
> CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
> CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
> CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
> CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
> CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
> CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
> CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
> CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
> CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
> CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
> CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
> CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
> CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
> CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
> CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
> CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
> CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
> CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
> CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
> CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
>
>
>
>
>
> 
>
