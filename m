Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.668.1588892542456470455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 16:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C/54fdj1;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id l18so8383281wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 16:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B6v9NRElCpPQmwVG94m6h5OqbwwhdqZm+eANvvvbsdw=;
        b=C/54fdj1m9PkIZg1m5tYMSJ6OAeS6eCbfks2/gqOGffBuTzxmNrMJ2DrxdA+bjLnbV
         4PF0w9A7flTXrrPqjux+AWSCnaZtokxTFMFuTf2CKpUYpowBJSn1BVV3MklDTjedEvtA
         AVIcTiDeeyWkJcFDgiFij+pS7j32im01gnmWOszcvj4G/M9tIwwOwo3D/SvVs59sGoed
         sgZKsvGt+Gjf1WSPpmbRPDc+4KTaHTd5uA7feSLJfptzpK+qCGSnxjHz+aOWutbiioBx
         aBovudGmSjtBkIjLoyK56z/uZJ1eY4zFA7+Nr6RfxHd5CSxOn3/FviFa2EFE3wRBX2UV
         F2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B6v9NRElCpPQmwVG94m6h5OqbwwhdqZm+eANvvvbsdw=;
        b=t9HyKZjM/f5xMqD+kNWNx9VAk+gXt+deZi0zB6ypVOFpgvaZG9iCUk4+G7GPRuiMmE
         NPXF5Ex6L3PGhTRomyI6hx8D6SsvpxKbc7+/9KbMJxbMbDzOi5vegZev5qMIi12SVHmL
         ktDl2zR3oQHWK8pyc5T2OKk9463bOD5ulclo1majWvRo5yIVSgNZmLwZkAP2ht3Jv75y
         sZXQYwwcmu71EC2KdMZrkZawnWo28+aZv8jRcGQQsHVLL48P+Wxs+n96+tHIIuWc6sKO
         6gAyZqOUM8DI/ddbACMU5roFlq1vIhVVrU2N9OpK3M9kKsyt9+3Yg7qE0ZqSrKfnMNrU
         RIow==
X-Gm-Message-State: AGi0PuZpn2Jm9THKl1M3/y9GScMQ5vyOuYUCM3TPP96UyXmldn9aEugZ
	MSUWuf0iTcfMP4uR0ErmVrHYl0JtL0aqB+s7XuA=
X-Google-Smtp-Source: APiQypIGS1Nwp0y6UzGP80mAqv4o3y9xxV+iCnx+A/6vbJLKlvT16LhQQ2yKy8s+CoWrqqoXr8RzUE08Uf8GPToX8MM=
X-Received: by 2002:a5d:438e:: with SMTP id i14mr17871197wrq.413.1588892540806;
 Thu, 07 May 2020 16:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
 <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com> <20200507195709.GD11927@denix.org>
 <32b9edf2-a77a-65d5-8c1e-e7cb03a7d29a@gmail.com> <20200507202959.GE11927@denix.org>
In-Reply-To: <20200507202959.GE11927@denix.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 7 May 2020 13:02:09 -1000
Message-ID: <CAGDS+nkkjXC52G6O=9kGN4nJhNqWW69aZsbGxYUx0NL4jT-bPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
To: Denys Dmytriyenko <denis@denix.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ovidiu Panait <ovidiu.panait@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 10:30 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, May 07, 2020 at 01:20:40PM -0700, Khem Raj wrote:
> >
> >
> > On 5/7/20 12:57 PM, Denys Dmytriyenko wrote:
> > > On Thu, May 07, 2020 at 12:44:15PM -0700, Khem Raj wrote:
> > >>
> > >>
> > >> On 5/3/20 3:51 PM, Steve Sakoman wrote:
> > >>> Should I consider these two patches for dunfell LTS?
> > >>>
> > >>
> > >> Yes I think they are fixing a problem and are safe.
> > >
> > > I don't think it is safe though!
> > >
> > > The code has been moved to create_sdk_files() which is a POSTPROCESS command
> > > for SDK creation. What if SDK already provides own /etc/ld.so.conf? The code
> > > just simply overwrites it.
> > >
> >
> > but are there such usecases ? looking closely if SDK is extending the
> > ld.so.conf then they should be appending to it instead of overwriting
> > and same is true for this patch for master.
>
> Exactly my point - should probably append, not overwrite.
> As of usecases - I can think of a non-standard nativesdk tool that adjusts
> /etc/ld.so.conf during install...

I think you've convinced me to pass on this for dunfell (at least in
the short term)

If a patch is submitted that appends rather than overwrites I'll
consider the series again once it makes it into master.

If you submit such a patch please tag it with [dunfell] too.

Thanks for the comments!

Steve
> 
