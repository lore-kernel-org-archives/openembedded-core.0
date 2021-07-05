Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9045.1625482294857173794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 03:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=CdWoiaTB;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id v5so21545697wrt.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 03:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRFnT5GbZgB1JsXC/fRYTo+jJdms/bUz3glop2OkvbE=;
        b=CdWoiaTBkIqHMFpycf/FJZ6FWBQJL1onZz56q7i1tiKhaAAWH39caRR3wtfxOPxLPQ
         Ia9pnyjYkk9mrWfh1ADZqhq3N+cdBv6sRDVF90+8Tyoc96oURg6Jh9SFFyYmTyaWHIrt
         rNRhJFvYhqo+FDYpZI530gJPMIZ8bPzX6FtZc6WBGeKvS1O8UW0A1phic3raxo+2rG+d
         jn62TzX9LBrJaDVTLoq4vd6vkzpEtP0M9Z9adqThcqv4gBAwUVkHSmil2gmYMaeficvm
         S4YeI3eQiHONx9ygjXdprYy1p5uV627KYIx7Xz0ehGwJrH5b5pUZ8lP2wXsOCQ56RRzz
         ugCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRFnT5GbZgB1JsXC/fRYTo+jJdms/bUz3glop2OkvbE=;
        b=jZxZqD3wupWIImzB6Mz0XqNKIimSGXLr5Pc/aVA8hgqKo0fsCM67RpVE6WZcIwxoJU
         GZwVDCYDQGl1f9IsovWFPvM6q93TgeALmET03XOUI2MBmvEokFczt0NliwBrVzthGPFo
         4j9LksZWsUOLJh9xqhufr6492SjHBczBwEPEkFjCluddqTpVy++ZinAyJyY2MBuENh/1
         swSRqFnKIebv/GsYoBeWTzvrm+y0GUQWEH2iLHcClnqRBZwjT8nEWlnv7gjUinFOErtD
         ICgmVXpQ2jEe+n/VPELc5Eef4yqiXboX4Vyw8y1u4sZs71CoNzjx5yndPBnDq0NQC9de
         sodQ==
X-Gm-Message-State: AOAM533DeSsbelyCgCyEeH1tDID03Jx/N+ifNwddQG+VJehyTatT0gb8
	YsMDENJWEkN0sf8YQn6kJG6edBRBEdAsdn/8RyP22Q==
X-Google-Smtp-Source: ABdhPJz72xci5uYQHV5yPUzyPVlCI4ht8jHsroAZoITls3X519x8by7ovpd6ND4GEyMwiFYvHwdC/andNYambu4Dh9k=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr14897753wrt.199.1625482293328;
 Mon, 05 Jul 2021 03:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210704140342.98D2F96033A@nuc.router0800d9.com>
In-Reply-To: <20210704140342.98D2F96033A@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 5 Jul 2021 11:51:22 +0100
Message-ID: <CAAnfSTvmN7mwbw5mR4=ywRK-WGa1TUgtJPZmwofjhypYuRFK5g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 04 Jul 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Jul 2021 at 15:03, Steve Sakoman <steve@sakoman.com> wrote:
> CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *

This is fixed in 4.16.1.3 which the CPE says is broken, I've requested
an update so this should be gone in the next report for master.

Ross
