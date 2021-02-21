Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.23482.1613931129671398375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 10:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PO6r0rQj;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id p3so1351484wmc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=XlUerOA5MO1PZVvI8/DnzSBMFAzfPa/ADLZQcdkE7ls=;
        b=PO6r0rQjF9Bsvd4YvtFfsLcNSOFIlkvoM/5hi2LrKsLUeigR/SFzQ0bCVAEqGl8NvN
         MpjWTIdPTUkto6VJudviZBBZ1xigPyGLTOlwwmveOuBuyir9pFgotZYxKNSL7RHatjZS
         nRScDONfaIDJStU55PxWSzFmJ1jqDusEnvRZY64f3rKDc8mtAanumA9sCCELFfge6g1g
         IjEwkBTw+x6hiNXnthqCJ026QCCdpb6Abi7RHjDzWA58JLiwkkqIJchIX3PkvTSmDr5L
         28smx3etOyzaiTjmG59dR5r2ml7eRuWslqu+kBSGLUd7HmMnC3beUKyzwEAEqf9z7ly8
         OVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=XlUerOA5MO1PZVvI8/DnzSBMFAzfPa/ADLZQcdkE7ls=;
        b=D3xsTWco4nK6a62qByi0n381JnkTby3ZRdtL/m+VcAVXAyDsXeMrNv5KLZ9alxbzzv
         JEBImI/MA8dWBap6XQFJcpQu4Nj3gdRb+1VAR0rjTVa47vRaGFqlMzDeeNctFsAWb6O0
         AM9/lru9NgZ5HCxG6PsHtplSj7Q3hPh//gTj6UdrskjRlmV19OVJrccQtT3RejERUIUh
         2bewVq6rbMvT5jSft20mjI1/nH4P7DOefzItSYqEKs9NE71ixw7BdOdwIA7TShJ5Ih5Q
         NUnBA6rStpXOUgg6Hm6RP6bNn7jTQDo0esrd5c0PD0ku0ooa91rQJQ+HDPvzhPWhzoHK
         QqDg==
X-Gm-Message-State: AOAM533EvMAxyyEd7rCd4CbXibnURno7Hrz3M+TuTRgjec4Q3YKyjrRI
	Bh1SoT12kE75FAco0dij/1YfIoBcQ8FJwoxw2/MFvw==
X-Google-Smtp-Source: ABdhPJxVcVEhY9dNRJ3ASUvEe0BcLBCxxYafSS50xOOSXNsvDHOiFSfocNa0SnY7AWZs7EyGM0MygmOjwypPudqvUv8=
X-Received: by 2002:a05:600c:4f85:: with SMTP id n5mr16855217wmq.3.1613931128110;
 Sun, 21 Feb 2021 10:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20210221180225.0219A96036C@nuc.router0800d9.com>
In-Reply-To: <20210221180225.0219A96036C@nuc.router0800d9.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 21 Feb 2021 08:11:56 -1000
Message-ID: <CAOSpxdaQKjpEWd2sbLBCHQWqtN+s4t93Xa3KPMKS-qbCbdBqdg@mail.gmail.com>
Subject: Re: OE-core CVE metrics for master on Sun 21 Feb 2021 08:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Note that the New and Removed sections are empty this week on purpose.
I've updated the script and wanted to avoid a bunch of confusing noise
in these sections.  The Full list is valid of course.

The old script only associated a single package with each CVE (and
somewhat randomly depending on how it traversed the cve results
directory - in the case of multiple hits per cve whichever package was
encountered last was the one reported).

I've fixed this bug and the script now reports all hits on each CVE,
most often -native and/or -system-native in addition to the target
package.

Next week the New and Removed sections should once again be valid.

Steve

On Sun, Feb 21, 2021 at 8:02 AM <steve@sakoman.com> wrote:
>
> Branch: master
>
> New this week:
>
> Removed this week:
>
> Full list:  Found 50 unpatched CVEs
> CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
> CVE-2000-0803: groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
> CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
> CVE-2007-0998: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-0998 *
> CVE-2007-2379: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2379 *
> CVE-2007-2768: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-2768 *
> CVE-2007-4476: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4476 *
> CVE-2008-0888: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
> CVE-2008-3188: libxcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3188 *
> CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
> CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
> CVE-2008-4539: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
> CVE-2010-4226: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4226 *
> CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
> CVE-2011-1548: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1548 *
> CVE-2011-1549: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1549 *
> CVE-2011-1550: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1550 *
> CVE-2013-0221: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0221 *
> CVE-2013-0222: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0222 *
> CVE-2013-0223: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0223 *
> CVE-2013-0800: pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
> CVE-2013-4235: shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
> CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
> CVE-2013-6629: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
> CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
> CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
> CVE-2016-2781: coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
> CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
> CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
> CVE-2017-5957: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
> CVE-2018-1000041: librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
> CVE-2018-12433: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
> CVE-2018-12437: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
> CVE-2018-12438: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
> CVE-2018-18438: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
> CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
> CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
> CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
> CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
> CVE-2019-14865: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
> CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
> CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
> CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
> CVE-2020-15705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-24490: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24490 *
> CVE-2020-29509: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509 *
> CVE-2020-29511: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511 *
> CVE-2020-35517: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35517 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2021-26937: screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-26937 *
