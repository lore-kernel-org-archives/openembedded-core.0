Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.34756.1631016651420441805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 05:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=eeVnn+y2;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id v10so14101353wrd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TXfXdjUUQVLr9s2bwtV4GbgxH98qiJjPi1LYnKAV2Y=;
        b=eeVnn+y2FOoeCjND++JIdoSGZUF1X1GEIEPg/aiPTwkbEZEYN4lebbUHyAucVygy8i
         721z3DqLv6370tOBb372KGRbubvfOeLy60AtxfT6EAd0TTgCIr9b6+5+c6UyI4cXC0Ag
         X9l60jfC7M5tyg6Mc9wgs0MUXPtEL4YyrD+Z6BcXzIY++xSIt1TJxLbBNGyCKbQ5gRYs
         lqupwmgmUkMSkVq+G3WT8PaWJff/J8aagjBtft/2JBh5yKw0iBw5ketlar/z8efTqJXI
         3Q2u1cD2WbpZ5xLVIY3eKEF+LwC4Yykx1f2eKU/odqcF9yh+SL5DaaReVQXu8s2gfPWB
         U1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TXfXdjUUQVLr9s2bwtV4GbgxH98qiJjPi1LYnKAV2Y=;
        b=oxAytB7dJZ5BkGbB5kb5duL9SlB/lgPrvPDmFvwZHQJuz2WiogLr6powBJY1281Kkm
         4AoBG9NNxnwMiVZfJzm4LygyaeLhZJHlqgUsPQ4v2C3eMr0UA8qWKW+F3SidyIxysAuf
         y0t2kCNf+0bmklxlgCFqhpLNORhQ2m5+H0egWhVX8pHMyOUIXPICfj0/8z6ed2MBS/4X
         xe22b4J8JKUuR6gUdWTgc+hkZQdudg4u+fuo1fNMKu6ky9UvvefirHHqTvzJxZsOL+PE
         Vz2X6GZTdgX3l0wzBFoVsAFHeyDbnQ+IE5r2+OATI5Z4GC/D0Edu/RE79Ok2Oy2qvURE
         q7+A==
X-Gm-Message-State: AOAM531ZxdYyj5JlC5Go3xfSuY1lytBxeTddCnY+DYvs+9Bfy0B+0Ywe
	UQmgIKFk1I88I57bxZs+V8zQVnNiJmSaRGygu4yVJA==
X-Google-Smtp-Source: ABdhPJwXC59zvqfFSZ26/vmyJMX/nKmZ7+A/xQD+F2Mdd/e752J2MVqMDvrLtKjTU5Rf3D/5iD7qtBLMED+P9dEPdiI=
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr18226014wrq.174.1631016649476;
 Tue, 07 Sep 2021 05:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
In-Reply-To: <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 7 Sep 2021 13:10:38 +0100
Message-ID: <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Sept 2021 at 13:04, Randy MacLeod <randy.macleod@windriver.com> wrote:
> I'll look at the sections that you have pointed out later today.

Debian is always worth looking at when there's license issues.

https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source

Specifically:

https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source#L81

They strip non-free components from the tarball before importing into
their git repository.  We can delete the same files during the build
so they don't get redistributed.

Ross
