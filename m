Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9050.1624633660854573893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A7L9tXZt;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.50, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f50.google.com with SMTP id n23so6487636wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NT3rWWi2pcGsov6rEj11eAXNt/HZHoZlWQyftQukZHA=;
        b=A7L9tXZt3C9mNdsGi6yUkcBrqNcHK/w4ZRcZDfV0pWFfExvB2m47eByTTzbDfgGbD5
         kF9BMl7pjrArJSviPh7aiF/m4EykWvNL3HiCclHQAYgVv0gpNQpm1XS2O1kXNOho98B4
         qTEZWwDZ0z7x/zbrkceDbbm85d6NbWU6Q07Ce98FlhiPgyWtv79oPg/vWcvT/T6zsG+H
         eFyb2Lc2Yliu4z5TQsk2kpbXtFanCWAkr8EWnS6+LMiS8Nx0Ceg+czqMVVb4w9bCH/wq
         Rtvcq/szOfBcecmgPRys/F8cfr8kScptryZqbt/VTgYSjHq44mw6Cny0zTd6+jGoJmso
         gXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NT3rWWi2pcGsov6rEj11eAXNt/HZHoZlWQyftQukZHA=;
        b=hbDlG1Iy0Yf46miK1QOuWQ6cPm6tdIxdQ9J02hYcbdpT9qq95/CWBFZT/JJlANlOL5
         8Hbb5ZBtEfyunhjjSTmVomMyN9lD/dWLOK+Bapclhc0JI0Xd7dMsLVoO2gk0BsnbD1I4
         pJJu5Xcz+Fzp4jTke0+mAan1W+xUTMq5YIoWj3ystSfNG9M+Iy1Iz+zpZa/s9peQISSi
         QovGAQ/aCJpMAFuVxNgAPb+byYOro3soN7k5ijMFAq4oT0hP3efBAfR+ALagsmU2zM90
         lSz4R9DXzvH6kWu9Fv1Kj1NLhG65yYLeVBA8opfgxACNTTeH5BkZPTlRBoB+hst+Iswv
         Um5Q==
X-Gm-Message-State: AOAM532CPajFJ8tkBLxr0rFEQ83ITxRkpamTD270DutaDZGljSGjaZwC
	SZP95SmNCUSYd548Wxx64lBumsJ1DcPGaLSn/SZTIw==
X-Google-Smtp-Source: ABdhPJxmlgrZ8xUUxtOWpQSkH0x/Snq45ryHf8X5urJP9NwsfHpmDr9MJxsBDqNRDSDTVlHP0ke/eKxxbo0YQqtRR+4=
X-Received: by 2002:a05:600c:3504:: with SMTP id h4mr11439709wmq.118.1624633659207;
 Fri, 25 Jun 2021 08:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <cc3503555b1342edbb4ec76dc7595fcf@intel.com> <10727.1624599031550021387@lists.openembedded.org>
In-Reply-To: <10727.1624599031550021387@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 25 Jun 2021 05:07:27 -1000
Message-ID: <CAOSpxdYdU_jVCSMDW572b_C2UeOpHiDtb2aQJ+tbP=R+NAOqEw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] rpm: fix CVE-2021-3421
To: Minjae Kim <flowergom@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 7:30 PM Minjae Kim <flowergom@gmail.com> wrote:
>
> In order to fix CVE-2021-3421, I added RPMSIGTAG_FILESIGNATURES and RPMSIGTAG_FILESIGNATURELENGTH in lib/rpmtag.h.
> So It is possible to build. but I cannot test on target yet.

FWIW, a-full test on the autobuilder passed with this patch included.

I'm not sure that is sufficient testing, so I won't include this patch
in a pull request until I hear back about the result of your testing.

Steve

> 
>
