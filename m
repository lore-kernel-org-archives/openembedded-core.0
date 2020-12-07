Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.8156.1607356363512783881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 07:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=0oRX2UsU;
 spf=pass (domain: burtonini.com, ip: 209.85.167.46, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f46.google.com with SMTP id r24so18774705lfm.8
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vxba9EiYNgST4WJijqNUMrlQeazumWYXg6NyedUaLk8=;
        b=0oRX2UsUFtVQk+WlVXV7eDUWT2Y9c8kbx5gqnV6LY4jhVW+dUmSYjeroTJnqapTkJc
         5954sMMbcW+B5+TZaoVBPCqRHy1fyp2B6RRA1BdjCwUy/zk6sCZfyrL5SRsZ8YNWkXgO
         cFS4RE1mcU7c4hV8y+wLSe7+k2L1Yi6/vJ8p3rksnuqAo2O9V1i0HPSBeSR8kkGZSrA2
         x4g8/ciWTFMx0Qrl6o9uUEWc4JjhLmarTj12rBSszEes7fTgQeKIDZZHkpqQVc13ofgt
         3gYf2C/6HokhVKMPryDR0nZf/R0bbrlTgwfXHJhsRCvF5u/8gKyFFrqvi/gSgUgwER2V
         ik2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vxba9EiYNgST4WJijqNUMrlQeazumWYXg6NyedUaLk8=;
        b=Uk7V2lFbSAgyLFtLdBX2OH9Qm1kUTwsGHv3/oBFqGHWdMWrMLsuNnm+XlsnyQSlGia
         Z0XU1P+ZJdR2urL6391llZH6oIx5EX3eiL7uTKn+tAfKnDesqo0g2VOTpDQs65dr/mKm
         m2D/ObgeGaMrxBO8b+BUhfzrzGb71ZgtbN6ksYb1msLQv2Ztkk9KE0OJjzleShAFOI1O
         Ngbz/7xV1WgAwIrjF7VHYotmBge2xWV0FMymNi+P9mrE/dryoFhnb0icyb3H4t/AlFrL
         WeSuq5quDJkglAnVF9XVHQliX/LMQJsS2PhUeNS3tfXSweYlUloaM2jUfWIfDoRUfti2
         31eA==
X-Gm-Message-State: AOAM533kXUTaBucFQE64bdShZDT5MXh0LiEPExBF2dGYBA4ePEX7FJs4
	wrk9jc+fPLci5G0tWQbVZZpA3OA/+bS/KzM+y/qrRA==
X-Google-Smtp-Source: ABdhPJw+ZXisXuXupKM3lOCZCterEFam9hukhwH1lnMdC5IdYNWp+bed/158n4NyaIVfN6LsKqcWb4YQdiNEfJGEN5Y=
X-Received: by 2002:a19:ac07:: with SMTP id g7mr8633529lfc.125.1607356361570;
 Mon, 07 Dec 2020 07:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20201206171806.2095C96024F@nuc.router0800d9.com>
In-Reply-To: <20201206171806.2095C96024F@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 7 Dec 2020 15:52:30 +0000
Message-ID: <CAAnfSTuB2PGgFn4eonhUuxbMdmwoThG6YNq2y3SYTa_QjKtUUw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 06 Dec 2020 07:15:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Dec 2020 at 17:18, Steve Sakoman <steve@sakoman.com> wrote:
> New this week:
> CVE-2000-0006: strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006 *
> CVE-2000-0803: groff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803 *
> CVE-2005-0238: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238 *
> CVE-2008-0888: unzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-0888 *
> CVE-2008-1033: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1033 *
> CVE-2008-1374: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-1374 *
> CVE-2008-3188: libxcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3188 *
> CVE-2008-3844: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-3844 *
> CVE-2008-4178: builder https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4178 *
> CVE-2008-4539: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2008-4539 *
> CVE-2009-0032: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-0032 *
> CVE-2010-3702: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-3702 *
> CVE-2010-4226: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4226 *
> CVE-2010-4756: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756 *
> CVE-2011-1548: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1548 *
> CVE-2011-1549: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1549 *
> CVE-2011-1550: logrotate https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-1550 *
> CVE-2011-2766: perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-2766 *
> CVE-2013-0221: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0221 *
> CVE-2013-0222: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0222 *
> CVE-2013-0223: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0223 *
> CVE-2014-9471: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9471 *
> CVE-2016-2781: coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2781 *
> CVE-2020-12351: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12351 *
> CVE-2020-12352: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12352 *
> CVE-2020-15710: pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15710 *

So a lot of these are basically my fault, by fixing a small bug in the
CVE parsing which was ignoring issues marked up a specific way.

I've a local patch that knocks another three off that didn't get sent,
I'll sort that in a second.

Ross
