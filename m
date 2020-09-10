Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.18247.1599730692581472057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 02:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GoOput0s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k15so5911208wrn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 02:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5R3/3JWR4N3BRXXBQ9uTRl2ObUHPeSfV//QataXlZFE=;
        b=GoOput0sT80GZBT3r/NU9n0fdyi6Hdc91GSKanx0sI+Bz2RYm7J1wV2Oe8Y+AyJct5
         sHc35sY35+Sca26b/NRokG+zEQ1YK+KYZeuQtMCAfr8Jpu9Ly9ulWhkJISoxa+U4yYul
         /xnS+ixSNSZUUVGWIZ/ppdXsO2J+phhr95jrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5R3/3JWR4N3BRXXBQ9uTRl2ObUHPeSfV//QataXlZFE=;
        b=CoSHe9oD93/FZmGfpSSXbL8/i7AJ11xl6jq44D10ciQpoi3YKfBKbUG4XmBLzeafe9
         wcT5TUCbkgLi+wUtow6oKcc95MLI4e5XWAK5qhFtK5GYklmEbJpiOqIMzsvD2DPSC3Mu
         K90Ln+DrNgEqV1IDFFAbNq5h0jVaxDCpvlZr8zEhHeIhyNvVjdFFkHlpg/kRfi9vljOp
         Jz+V+asVdEROj2CrxbDR1FpSyFsYH5wAMW/lvdKqST/3lSCjf+1GrHhmdOH47RdgtY/X
         nD6DnLPP6CcY6iHNGLVl0iKh2zIIMDFVTYn/yqvyNScieboQhoxJepjch8KXxvdTZsy3
         jUeQ==
X-Gm-Message-State: AOAM531GBhKuONq0LWwZhjFcxVMZr4X/StLypAOoUD5vOVhRYMPh/IUN
	+B/0C6d2N3n1w1ultiQxViS+1g==
X-Google-Smtp-Source: ABdhPJxcxtkxcY39I++faEf1QO0IGzBQyO7qs9qSBuHLPma+4+M9hQWZ+j8DkEBGVC4ka8EcIX/ydQ==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr7877942wrn.63.1599730690597;
        Thu, 10 Sep 2020 02:38:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id b187sm2733685wmb.8.2020.09.10.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 02:38:10 -0700 (PDT)
Message-ID: <ef5166614af2a7d3dec2d47425d7bfc5c4f24b27.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC 2/6] arch-armv8-2a.inc: Add Cortex-A55 tunings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Sep 2020 10:38:06 +0100
In-Reply-To: <CAPoiz9y_Afu5ieVg49HgX5rzhrsdDRN1BWDMgykhrOfxfVgRWQ@mail.gmail.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
	 <20200909224535.27164-3-jon.mason@arm.com>
	 <46623150-db60-1948-c669-0abe72fdc122@kernel.crashing.org>
	 <CAPoiz9y_Afu5ieVg49HgX5rzhrsdDRN1BWDMgykhrOfxfVgRWQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-09 at 19:21 -0400, Jon Mason wrote:
> On Wed, Sep 9, 2020 at 6:59 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> > I like the direction of this work, but one comment.. (down below)
> > 
> > On 9/9/20 5:45 PM, Jon Mason wrote:
> > > Migrate the settings in tune-cortexa55.inc to arch-armv8-
> > > 2a.inc.  This
> > > will allow for a single file to include all of the tunings of a
> > > family
> > > of processors.  This will reduce the proliferation of unique
> > > files per
> > > processor currently occuring in conf/machine/include/
> > > 
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  .../machine/include/arm/arch-armv8-2a.inc     | 31
> > > ++++++++++++++-----
> > >  meta/conf/machine/include/tune-cortexa55.inc  | 12 -------
> > >  2 files changed, 23 insertions(+), 20 deletions(-)
> > >  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
> > > 
> > > diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > > b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > > index b40ebf176e43..38564a17d98b 100644
> > > --- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > > +++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > > @@ -1,4 +1,19 @@
> > > -DEFAULTTUNE ?= "armv8-2a"
> > > +#
> > > +# Tune Settings for Cortex-A55
> > > +#
> > > +TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor
> > > optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES',
> > > 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES                                         +=
> > > "cortexa55"
> > > +ARMPKGARCH_tune-cortexa55                           =
> > > "cortexa55"
> > > +TUNE_FEATURES_tune-cortexa55                        = "aarch64
> > > cortexa55 crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa55                  =
> > > "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> > > +
> > > +#
> > > +# Defaults for ARMv8-a
> > > +#
> > > +DEFAULTTUNE                                        ?= "armv8-2a"
> > > 
> > >  TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
> > >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-
> > > 2a', ' -march=armv8.2-a', '', d)}"
> > > @@ -8,10 +23,10 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUN
> > > E_FEATURES', 'armv8-2a', 'armv8-2a
> > >  require conf/machine/include/arm/arch-armv8a.inc
> > > 
> > >  # Little Endian base configs
> > > -AVAILTUNES += "armv8-2a armv8-2a-crypto"
> > > -ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
> > > -ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
> > > -TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-
> > > 2a"
> > > -TUNE_FEATURES_tune-armv8-2a-crypto           =
> > > "${TUNE_FEATURES_tune-armv8-2a} crypto"
> > > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a            =
> > > "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> > > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     =
> > > "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> > > +AVAILTUNES                                         += "armv8-2a
> > > armv8-2a-crypto"
> > > +ARMPKGARCH_tune-armv8-2a                           ?= "armv8-2a"
> > > +ARMPKGARCH_tune-armv8-2a-crypto                    ?= "armv8-2a"
> > > +TUNE_FEATURES_tune-armv8-2a                         = "aarch64
> > > armv8-2a"
> > > +TUNE_FEATURES_tune-armv8-2a-crypto                  =
> > > "${TUNE_FEATURES_tune-armv8-2a} crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-armv8-2a                   =
> > > "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> > > +PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto            =
> > > "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> > 
> > It may make sense, instead of deleting it, to have just the
> > 'require
> > conf/machine/include/arm/arch-armv8-2a.inc' file for
> > transition.  (If a
> > transition period is NOT required or desired, then this isn't
> > necessary!)
> > 
> > Tricky part is how to notify someone they're in the midst of the
> > transition
> > period, and using the deprecated behavior.
> > 
> > (In past work, I've had a class that looked for a variable to
> > exist, if it did
> > it printed the contents as warning messages to the console after
> > parsing.  I'd
> > love to see something like this as standard behavior for future
> > cases like this.)
> 
> Fantastic idea.  I hate the idea of breaking backward compat.  Any
> newly added tunes would not need this, so no extra files for my new
> 13.
> 
> Question 1.  How can we do this warning?  Is there something I can
> steal from as a basis?
> Question 2.  How long do we keep this compat around?

I actually lean the other way. By removing the file you make it clear
to the user they have to do something. Adding in the compat in this
case doesn't even show a warning, so we just kick the can down the
road.

More recently I have lent towards "hard" fails which force the user
into adapting to the new situation as otherwise I think we're kind of
giving false promises...

Cheers,

Richard


