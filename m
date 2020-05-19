Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.3190.1589912472331818733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 11:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HIPY76ct;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id l18so473450wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMClYdINLKk8Zr156NLyyDMLr0aFL8h8yDpDnFhvstQ=;
        b=HIPY76ct9kNmuG00V6ExkWkWSlAzzUh4U84v2HinMbPIWo+4N1+xz6RJ1BQRL1J4Zd
         5B8f9AEYsNEMrR/eA+xzcTA3/EOD2pXPJJGIDATJCUAjfyNKAjAtvfbovHCX7FxAdgE9
         MapQBbmf3BGplDd0hGQOaqinT7N6iNA9UFh9Q+a33oJDYYpnOJ7AfcmoZpCgwe4f9DsH
         aYs/lgMq6Ho4EyHw81vUWijaut232zfjLerIB0icqEF6RDcEuzy6jyv0A39K1r7tNt4v
         M5WvjWGL3yzSHMKaM+Yz/GQQq1HXop80aqvC8yG4x7mip79dXk3gyo1e2WkapSm8dBw1
         hz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMClYdINLKk8Zr156NLyyDMLr0aFL8h8yDpDnFhvstQ=;
        b=YoiPWzz+5Usexz7PTMYSpXi4STuVS23cb4MAPm9fDHQlDRT6T6fTP3NgyfspQu+Jlt
         g9Tvsljew2rS5jKYJookVCKB3brRy5grmfb+S4y/qE283UngkafpSJ9JmMs9VtUhg2sC
         JUbb482hUuvJn/F0z0gJgDjggxHXtD7CxIv15jUjYfGI7qa8EEpOZVIFRoiStu368BND
         e81G9/0qoBARmzjCIRG4iX1fws/kLtvNxnkRdVWj6RbHCL+GFk236u4trR9U4HHB0Yvt
         X4zmDpJVGPPziLeDylJj+7NtuhrKg9Jx0I/evr6yD/dbJQymJ81+C36D682TcWiQ17nv
         Bf7A==
X-Gm-Message-State: AOAM531MgfhsJsm3pLB9sPWx2eDJRJGdFRMum4BwQ8HEkd8a1CLG97m3
	Cnh6k/wLNslVcvmkPjFYYcvDaAjHDeUEbtc1Xaw=
X-Google-Smtp-Source: ABdhPJyl4pPCTa+MD33QwWKFzjRbStdMin8eLSBJ8dVLS131jLmj3lJsYkobw/KMkRURdHIpcHKIZSYv/9z+i1YkMWc=
X-Received: by 2002:a5d:5445:: with SMTP id w5mr182630wrv.422.1589912470840;
 Tue, 19 May 2020 11:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost> <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost> <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
In-Reply-To: <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 19 May 2020 08:20:59 -1000
Message-ID: <CAGDS+nkfNwuePOPSJ3JdRVqbzz=XTAvxMK_pjoeAX8vGnSS0HA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, Martin Jansa <martin.jansa@gmail.com>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 17, 2020 at 1:47 PM Khem Raj <raj.khem@gmail.com> wrote:

> On 5/17/20 9:14 AM, Adrian Bunk wrote:

> > IMHO moving recipes from meta-openembedded (or other layers) to oe-core
> > in a released stable series is not a good idea.
>
> I think in current form in this situation it certainly seems a bit
> complex sadly, however, we also need to explore if there is some "good"
> way of doing such changes without breaking distro builders.

It seems we don't have a clear consensus that backporting these
patches to dunfell is a good idea.

So for now I'm going to take the conservative approach and refrain
from taking these patches in LTS.

We can always revisit this later if the situation changes.

Steve
