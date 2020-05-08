Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.1773.1588896822770416374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 17:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VG7SVctM;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id w29so6552678qtv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/0mvYHR1omAGQFvci3vnZgVF5qRV4MNuTWgg24QIhM=;
        b=VG7SVctMtq6MeJ39JXgUHPYKmpNekQPlF5ERhWmtPSlzYFYVvk70hclRDIg28g6/4F
         ULVDHCxlnjyCFR/n6dbWRvj0C4kxoQZCBlY0xW3Q2rK0Ydsv7O+C9e1uEblyDDv2Fwef
         pYJMwkKf5PLCj9ZV+mBx5ezrAm4a0zUSxnC7WKVXFAFRy/de2W83szdTj87APYVkqU8z
         02OYovcbiboF11rGvZYrvBpuzfc69ez6cixJjaMmtFutUfEBBSYAFlNoOvp/NVcCDpJ5
         cXo7l6ByiSbbzQhfbxtOafEru9BnGLPJvF7NOuKReazqnt1c3IdlBLnDyRbjqIrFGFqT
         e0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/0mvYHR1omAGQFvci3vnZgVF5qRV4MNuTWgg24QIhM=;
        b=Ci1V7IRnkXTJ5qdBLza5c+p9IFUn/aFJJY9JyP86Ni2hed4i+8JTFJjXbzq9MaZ+Tq
         HyB9liZGmp+zKLWxFyqhmdvkUlDztV2s4gRZ5ZseFXMzDVhTm4DU79WIte3H1ZR95cfU
         m7RwVkCfxNRj0x9+At6MfkgkpRn41TSMKZkw+zoeQqXQG0uTQ8pRk0gkCx+VpE0cajO4
         LRKoDbCXRkTkC0CBgHLQo3toPXpjh5rt0NKL4Cz1e7i6O8XyeDKETxz9trgoIzz1Fa9m
         OAG/F3YfgycZYze+gZUp1HWc3dKGzrHzBnbAHIlA9J/RcwEQ4nZ0whtmTQ8r+cX2Juz7
         5whw==
X-Gm-Message-State: AGi0PubXzZ4YhLtXMWG35Pmf73mC6tbmXdqpgXwgcooCc/kew2t4gnMm
	GIWBlumFhoaL/dETWh/XHkiqUFKSIkW//twWOEc=
X-Google-Smtp-Source: APiQypIyNgyqZ224lzRaWYP5JZcMh5tWEs/Zvz7nmGOGZvFslDS5m2ZCXcKjHnrHKZyNbh37PoJ9OYrB31JTiEw95wQ=
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr72290qtp.293.1588896821787;
 Thu, 07 May 2020 17:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
 <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com> <20200507195709.GD11927@denix.org>
 <32b9edf2-a77a-65d5-8c1e-e7cb03a7d29a@gmail.com> <20200507202959.GE11927@denix.org>
 <CAGDS+nkkjXC52G6O=9kGN4nJhNqWW69aZsbGxYUx0NL4jT-bPg@mail.gmail.com>
In-Reply-To: <CAGDS+nkkjXC52G6O=9kGN4nJhNqWW69aZsbGxYUx0NL4jT-bPg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 7 May 2020 17:13:15 -0700
Message-ID: <CAMKF1sr1z_Gc+wJ7c+cngRjdBr-sLtxA5UcbgnDCNs2zY5buNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
To: Steve Sakoman <sakoman@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ovidiu Panait <ovidiu.panait@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 7, 2020 at 4:02 PM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Thu, May 7, 2020 at 10:30 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, May 07, 2020 at 01:20:40PM -0700, Khem Raj wrote:
> > >
> > >
> > > On 5/7/20 12:57 PM, Denys Dmytriyenko wrote:
> > > > On Thu, May 07, 2020 at 12:44:15PM -0700, Khem Raj wrote:
> > > >>
> > > >>
> > > >> On 5/3/20 3:51 PM, Steve Sakoman wrote:
> > > >>> Should I consider these two patches for dunfell LTS?
> > > >>>
> > > >>
> > > >> Yes I think they are fixing a problem and are safe.
> > > >
> > > > I don't think it is safe though!
> > > >
> > > > The code has been moved to create_sdk_files() which is a POSTPROCESS command
> > > > for SDK creation. What if SDK already provides own /etc/ld.so.conf? The code
> > > > just simply overwrites it.
> > > >
> > >
> > > but are there such usecases ? looking closely if SDK is extending the
> > > ld.so.conf then they should be appending to it instead of overwriting
> > > and same is true for this patch for master.
> >
> > Exactly my point - should probably append, not overwrite.
> > As of usecases - I can think of a non-standard nativesdk tool that adjusts
> > /etc/ld.so.conf during install...
>
> I think you've convinced me to pass on this for dunfell (at least in
> the short term)
>
> If a patch is submitted that appends rather than overwrites I'll
> consider the series again once it makes it into master.
>

yes, I think that will be right thing to do although I think it fills
in a good gap in dunfell
but as it is might not work as expected.

> If you submit such a patch please tag it with [dunfell] too.
>
> Thanks for the comments!
>
> Steve
> > 
