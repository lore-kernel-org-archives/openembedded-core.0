Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.21617.1628509287864342865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 04:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=r+u4qUah;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id m36-20020a05600c3b24b02902e67543e17aso2842463wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHx3/DOKyJbTckaPWWRHyS9bPlngfRIe+0sejR1Qyh0=;
        b=r+u4qUahU40Z3oybSpRiKR0huX7a/xRZvLEg+96NNngcfQIslm3l03Hpc86rwcYldF
         70Cf3NDHoZfsI/OkLjWB41S/AnyaZCBuHpUJEY9iLV5vzTn2IuZFFWV/hpQkQVPkS8/b
         dLqi4NAuOhunDeLmnkXtqkCAyzdgxxi5b0KS6OOhjaLj2hxVgXzlX++BsVLp+YmGHHwG
         Nf5cDHub7gFoV5Xwr6FJuvdTtuhrX0vhlbOhi4GoK5tcVvz67O9xGXXfGaVGDaDrgIt+
         Or7/nrMvx9Wd4E9It5b4AC8OOmPPWuX7lKykU7NeH5xff1/SYmIhX01OjSNidhxuAoN7
         d+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHx3/DOKyJbTckaPWWRHyS9bPlngfRIe+0sejR1Qyh0=;
        b=CuQNVEtjvjZDGUe7pxys+FBpNSAwDpSO5O1kaYdzSLiRSoVsQte/FCzZLHT7pMO81V
         HbNyrCvS1aTSU9ePu5O6GbeMWzpnS21NCxF6poF/6xnof335tj0vm3jA4HeySY8EqvoA
         fCe4UjKyoQYrquRk/SIFgnhRRzVnQR8AmdF6NjyVvyG8YleqU/KChkA4a0ltnzeGvLSz
         IenFK3ODqv1cubPuI7D/ZajEUDanWzmvCHKi0Rnj6wFuIrhQL4ded7WVnyc7BL5c9sd6
         69OyU50yJmXTBxc97zre6+OkuIzTYcf+SvfI99iowrouzqj0IZFrRESPOrlUbW+rp1hE
         JiGg==
X-Gm-Message-State: AOAM5305OZGsEAKIyv7UeNu+RI/f9uH63Xnj1eRl5IZQBNzIMvVSd6u9
	TRXuM9mDtgLsFDn9rAVlDIKrVvGIQ4KYuNVgXDnfoA==
X-Google-Smtp-Source: ABdhPJw6SqEmuryOI1Kmrk5kWD00XOIS4SwpAO1En/3m8wHnEMM5dLy9vwpDv2ErRjiK1IXnxSp/V0fvAGU9scgTrKE=
X-Received: by 2002:a05:600c:3782:: with SMTP id o2mr33453924wmr.137.1628509286367;
 Mon, 09 Aug 2021 04:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210808140406.2C0CF9602DA@nuc.router0800d9.com>
In-Reply-To: <20210808140406.2C0CF9602DA@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 9 Aug 2021 12:41:15 +0100
Message-ID: <CAAnfSTt-ThYCVrh6X_kwFNdVwm1pp=j2Gg5L4tyurBLGRViBBA@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 08 Aug 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Did ten minutes digging into some recent issues:

> CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *

No fixes in flight for this.

> CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *

Disputed as the issue is in build-time tooling.

> CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *

Fixed in the upstream 2.33 branch, so easily merged.

> CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *

https://github.com/libarchive/libarchive/issues/1554.  Patches in flight.

Ross
