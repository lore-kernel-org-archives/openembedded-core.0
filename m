Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.7555.1605200817724891429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tS8Kcgzs;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id 7so8948469ejm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yCZbGiAVLaTr0sC+CRfddnKmpTCSe+ZK8gHLLkr41L8=;
        b=tS8Kcgzshis89IFpzrhACkO5hoxMGTE3bfPwOGMRX8J2nKVHU89TojQ/KXA635Ci3r
         AKCLVm4MGdg19C1aEep2vDcKWHQYCLKQYBU2MYBb//yKUikGp5KybpsGS/GlbeQdskPb
         tkpgFqA5xnSJNL9nyL5gtEMleYYXu0S2tXf7DF82nTN8VGl9Ck9hADx1wdaoPoXwX5q2
         8Imi5KnGx242o9RPyQcduA1yJWNuVgVAi3abWelo8dL7XFKJZ0biMfCo6mxSbZoi9GdO
         wdeDbb6nKI5fz06bIwfksWdffBSf4dW356BIG3tbyFhLiIQqJfxXRQUnN6Cd6RUHotNc
         1oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yCZbGiAVLaTr0sC+CRfddnKmpTCSe+ZK8gHLLkr41L8=;
        b=Pk2Z7WpGtumhPPcHFz6od9eHVKwInCt7fc5XyyLmIoS2A4B0YPD9XhgZj67qJOXY7o
         ilmA1mN9sXIk0nkwbvUrAxFtFteC4D/GufV3S6la1VA+/abDrtnSMSMkjVnxpdib6JBe
         kTvtJO0/cLS4shz/zSCGYyi0fs4UrCaFkuBwoJbPfH6PEPe2/Vsx6MTKAYTm22zv4quF
         p1JXSahB3KO7ekA3uWGJBefr7cfqVTC/jlW8y3083V64VLV6PsmQn9gdrdqP49TncnDy
         kjav/k+5YdA+ATEg98tIkSNlsM2P8GsRSCCxYRknxQHWwFxMgaUfO7nOCQTjVATzPrYO
         8uqg==
X-Gm-Message-State: AOAM533tOhyPjfhqgLCWcwO0xkDWSPSEjViUNIGK9mU1jG8iVV5/b3pI
	zEn/ohsrxPIJGKKESMihQrj+9J8/IJ7oBJys3SPZ1g==
X-Google-Smtp-Source: ABdhPJzq21ez2tyL4qc+rkcBoWGDiGZnQHu1OLkw7NxSrbmkdf/JNNCh9zPSru7jOOc0LmZqUg/CyI4a27ozoaBChgg=
X-Received: by 2002:a17:906:cb0f:: with SMTP id lk15mr188929ejb.431.1605200815815;
 Thu, 12 Nov 2020 09:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20201108173417.B6D3C960213@nuc.router0800d9.com>
 <e4aa0ed3-53ca-fad4-2168-2395d2855c27@windriver.com> <CAOSpxdadGrW2ntYVbVXSbvDcSZXB1bpiWZbz3XfPcrC2rGbx_w@mail.gmail.com>
 <afb354cc-5ee6-6e06-66a9-88f7af538a98@windriver.com>
In-Reply-To: <afb354cc-5ee6-6e06-66a9-88f7af538a98@windriver.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 12 Nov 2020 07:06:44 -1000
Message-ID: <CAOSpxdYhe9JjG98XVDFMdOjcoeZycP1p6Bc-bgObpg=bjT88AA@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Nov 2020 07:30:01 AM HST
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 6:49 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:

> I've triaged the qemu CVE's mentioned below, summary as follows:
>
> CVE-2015-8345 - CVE-2017-5957 all have fixes that are in qemu 4.2 used
> by dunfell.
>
> CVE-2018-12617 onwards have fixes but are introduced in qemu 5.[0 | 1]

Good to hear!  So a database update request for these CVE's would be
the next step.

I'll forward some sample update request emails off-list since you
haven't done this before.

> CVE's with proposed fixes are as follows:
>
> https://nvd.nist.gov/vuln/detail/CVE-2018-18438
> v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02294.html
> v2: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02396.html
>
> https://nvd.nist.gov/vuln/detail/CVE-2020-15859
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg05304.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg05341.html
>
> https://nvd.nist.gov/vuln/detail/CVE-2020-25742
> https://nvd.nist.gov/vuln/detail/CVE-2020-25743
> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg07779.html
> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg01568.html

Thanks for tracking down these fixes.  Do you plan to submit patches for them?

Thanks again for helping with CVE reduction!  I really appreciate the help.

Steve

> I have never sent database update requests, some examples will
> definitely be helpful.
>
> Sakib
>
> >> CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
> >> CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
> >> CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> >> CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
> >> CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
> >> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
> >> CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
> >> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
> >> CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
> >> CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
> >> CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
> >> CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
> >> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
> >> CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
> >> CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
> >> CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
> >> CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
> >> CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
> >> CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
> >> CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
> >> CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
> >> CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
> >> CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
> >> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
> >> CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
> >> CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
> >> CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> >> CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
> >> CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> >> CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
> >> CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
> >> CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
> >> CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
> >> CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
> >> CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
> >> CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
> >> CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
> >> CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
> >> CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
> >> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
> >> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
> >> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
> >> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
> >> CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
> >> CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
> >> CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
> >> CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> >> CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
> >> CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
> >> CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
> >> CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
> >> CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
> >> CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> >> CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
> >> CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
> >> CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
> >> CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
> >> CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
> >> CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
> >> CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> >> CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> >> CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
> >> CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
> >> CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
> >> CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
> >> CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
> >> CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
> >> CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> >> CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
> >> CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
> >> CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> >> CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
> >> CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
> >> CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
> >> CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> >> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> >> CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
> >> CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
> >> CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
> >> CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> >> CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> >> CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
> >> CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
> >> CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
> >> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> >> CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
> >>
> >>
> >>
> >>
> >>
> >> 
> >>
