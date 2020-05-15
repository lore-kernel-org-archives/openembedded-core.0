Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.21740.1589572628461767364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 12:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BE5rTuxR;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: andrey.z@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id i15so4824466wrx.10
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNNaHMDSqqsAgy/KufEjBtW9tmN7Y9xh8WXoizd6Vzg=;
        b=BE5rTuxRJUdedIo+9AvZFHKwkqYVFwnKkEzp9R5fOpYXMXriH+c780uooNG3xgmnTH
         kR6C2bRr+KqscyzoISrT0GRZMQKFNsv2aGzQCLkIeZlmjQMHILGzVQGlTG61wiTZjmd6
         CnoHIP0jdAJgU1VZvPeRF8RIdzJQb1I9SufpaHnzZYAy6C5RxTz6t0J1MfnFylsN/FjA
         QEs9lrkyOMQKcntv9J0ZsinrcUjK2kwXth7QsXnvWHOykpK77dOyjSg5ozf5gbs4eWjP
         QZZR2s7DpF/cVGAZCy6LFhN7xNA5RW3jtESA2ChTC9Oi2VTa3Wc2xqlehh33854slhIQ
         ZmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNNaHMDSqqsAgy/KufEjBtW9tmN7Y9xh8WXoizd6Vzg=;
        b=WfSd1utXxC8Sa5EUu6CoAn0zK0QeyMUxzrNKk2mCtJ+FGbR+Nl3EqiXfqq78pqy/l2
         TBxrVzyaKzen4JvcnCupkJaSJjH/czUpyQ+5lEhCSKUDdp6aOJVDoyZo5ZpBPwe9VSgZ
         4gJQjbUkc5/j3tFenBXxFvOsKKG5yJdN8DbeVB9Xf5QujQmYxBvgcWFKscB6HOOKoqnM
         nS+/k02qiYiYZzlLy1z4E1H/wJMhFPzp3f6dq3UJ41Fmv/I13r+hvE1AooNn0CxN/B80
         5xr0hX8vvbPAtlMrGMyyc0BdrV3tEq3Uzx7kDIhGDL/392DThGySwXdsgeWSreK4aEBS
         15/g==
X-Gm-Message-State: AOAM532qFgErZXwkv53XKW5X/pzwSgCV2bvVbe93Z/IVGvIdY3eALnO1
	fG9rcHis6H1uy9BHfhzaPCCU5LSBaLjxnvPpFnM=
X-Google-Smtp-Source: ABdhPJyO+QISDjNqTCJRjm9UqrjD/0iKR/WP8Q/a9/CXrqJCSMabObYzzM0HYUbDeyexU2XFsgkkChd8AMECYgfxKfo=
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr6029148wrx.42.1589572626893;
 Fri, 15 May 2020 12:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com> <20200515192616.GF11927@denix.org>
In-Reply-To: <20200515192616.GF11927@denix.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Fri, 15 May 2020 21:56:56 +0200
Message-ID: <CAHtQpK4-GaEXa4T=+SP99s_9dxUJFTTHX1_qKCSHWvOQMbabLA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Denys Dmytriyenko <denis@denix.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, jdmason@kudzu.us, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 9:26 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, May 15, 2020 at 02:12:55PM -0500, Joshua Watt wrote:
> >
> > On 5/15/20 2:05 PM, Richard Purdie wrote:
> > >On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
> > >>I see Richard has merged these to master-next, thanks!
> > >>And thanks Joshua for volunteering to maintain these recipes :)
> > >>I submitted removal patches to meta-python.
> > >>
> > >>So, it is good we are getting this extra dependency resolved in master. The
> > >>question is - can we get these backported to dunfell, does it qualify?
> > >>
> > >>Otherwise Jon wanted to finally branch off meta-arm into dunfell today and
> > >>we'll have to live with it until gatesgarth.
> > >I put them into -next so we could test them, see if the autobuilder had
> > >any surprises. Good news is there weren't any.
> > >
> > >The question still remains whether this is the best approach or not and
> > >some people I talked to were not convinced that a consensus had been
> > >reached.
> > >
> > >The question I guess is how widely used is optee and does it warrant
> > >adding this? Its a little ironic the thing people want is trusted-
> > >firmware...
> >
> > FWIW, after having gone through the exercise of pulling in TF-A into
> > qemuarm64, I think I've been convinced that op-tee and TF-A belong
> > together since they are sometimes tightly integrated together
> > (something I didn't realize before). As such, having both in the
> > same layer makes sense. Even if TF-A was in oe-core, you'd probably
> > want op-tee also, which means the python modules would have to be
> > there anyway. I think we can still have the discussion about moving
> > the whole lot over there, but we don't need to do that now, and
> > moving the python recipes at least cuts out the meta-python
> > dependency.
> >
> > My last concern was testing of optee, since there was no platform
> > that could build it by default,
>
> Many TI platforms do. All our recent Aarch64 platforms (K3 family) use
> TF-A and OP-TEE by default and require them both to boot.

Just FYI: NXP i.MX8[M] series uses OP-TEE and it is also required to
boot the SoC.

>
> Even many of our Armv7 platforms use OP-TEE, but you'd need a special "secure"
> version of the platform, and those are not available to the broad-market.
>
>
> > but I fixed that by implemented
> > support for a qemuarm64-based machine that's defined in meta-arm
> > which uses TF-A + optee + u-boot and can successful boot using TF-A
> > and passes the op-tee unit tests, so I don't have any concern about
> > that anymore.
>
> That's great for testing meta-arm components w/o requiring any specialized
> platforms!
>
> --
> Denys
> 



-- 
Regards,
Andrey.
