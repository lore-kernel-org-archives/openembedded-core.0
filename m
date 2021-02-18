Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.10068.1613667130330757787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=lxzkSONp;
 spf=pass (domain: burtonini.com, ip: 209.85.208.170, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f170.google.com with SMTP id u4so6187821ljh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llpPnm/lYhXTjGWKH5opeAgtG4QCMfknFBnqM0ZTPa0=;
        b=lxzkSONpMFg7j4bWI6raWwtvL+rB5lJSiMdGhqYbEEHY5XP83qLUXorggHRfkQeBro
         znvsnyWxURBD6Eh29/nEHGVnsCenxp6k68BqZ++PFYQH2kqpQyhKlUdCbOFVJn/b+6GL
         rFPQ+6Bu4/qlX370arh+WOhABN7Pq3mQeeeXv+YlYAzLr5VPJgjcDYLlyomKFsk8QVKT
         LRdyHzY9awq3H5RdCg3zLGOXJ5dMivFDC3mae+wsvDsHMhZozeezZO9Ck5gTWACBPmdF
         2mcp3IiPQs12XRUGL8gb9iy+cgWzOu36UQiyZImPIDgOWrSuhVmntcLDie2DPX9kfqyb
         x3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llpPnm/lYhXTjGWKH5opeAgtG4QCMfknFBnqM0ZTPa0=;
        b=IQxJ+H83vegTNFt2q8GoUrv/35oG7iFOMoZT/pOqintFOaCpAfMkWdGvzf94dbaMM3
         ksfuGNzFNXA9rPJNbzsQWVFjFQck8AEOCnP46ImQ2LkGGauO08ZBKP4JqHBosHOwoTYe
         PQflNrkBgq/V2VbhvlrNI0NhjMdT7C844Nt6ijG3fwiyKL0EwRYKS8+vA053KyTtM1pg
         oI3tMa26vPVJnJIfVlQVnzRv6kDIiwEeKWe/tbfltDNGccIWFAf2YT91YXrcQh8l735Z
         +e7SC9URqznia3T+z22TJb6RRSYdt/Sbjhhy/DtCWz8n2VwLjq00nVU/iFxAD/UWSXlQ
         eJDw==
X-Gm-Message-State: AOAM530/1OK3mMBa5D+anZwDbKAr37jKjmF+sJIasmVmA8hxOV+6q9Qt
	XIawux3CLIm2yaEMlMpigOuWewGfendpqzWvAyIkOA==
X-Google-Smtp-Source: ABdhPJyv4sqOgUekJ4YRwtWT9N758MiM4MjWFnHEwDX2JsA/PMCFDBj95Op52Gqmn9NqLoansX/nQin/znJz6y1QbbY=
X-Received: by 2002:ac2:4144:: with SMTP id c4mr2861220lfi.549.1613667128098;
 Thu, 18 Feb 2021 08:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20210215224254.2550264-1-akuster808@gmail.com>
In-Reply-To: <20210215224254.2550264-1-akuster808@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 18 Feb 2021 16:51:57 +0000
Message-ID: <CAAnfSTtkk-kE38aSmYGcPF--Y_E-Z63fmMDMDqjkxi2w6VAxxQ@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] cve-check.bbclass: allow skiping non pbn
To: akuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Feb 2021 at 22:43, akuster <akuster808@gmail.com> wrote:
> I don't see the point in logging native, nativesdk etc.
> The bottom line is the BPN has the issue.

Unless the base recipe doesn't exist, for example it's nativesdk or
native specific.

Whilst native is build tool and so arguably not as relevant, nativesdk
very much is a deployed artefact.

Ross
