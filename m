Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8724.1613574287246339017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 07:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XAmksvlp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id v62so3917431wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kDbOKeKt1CXqu4a7T4xHBvbSy9Uwb9MqHXqyipAfDkk=;
        b=XAmksvlpNHZHHiAJrxCmawCoo8Yf+/f12nmnjVGgv9ALgu7QTKTa5vhBansR3iV5cn
         scKZAFS+LA0L2+tKp4kG/a6c6vg2is9Kaet59LDC0MY+C94xYKQrolM2WJ+Pi8/Cdt5b
         ViAnmHJZ/C5O9T/NWJaD6mBNDAparSqbg81tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kDbOKeKt1CXqu4a7T4xHBvbSy9Uwb9MqHXqyipAfDkk=;
        b=iyrvVuip97qBSkmFlUaHd6jrVDHjWEdJC+AhiUsQO+MnG4UvMYqbTcX7wJWDnJYwRU
         RCjRYmP+bbD+rMhztnsWI1m4i8TPpLMSDoJUOc7s4ENlIyKKhrGM61ZCkpi2Q97uxyD/
         WPLTath4+PdJkemXAxo9zQjHe/BTSSSMBvvCw3/rHU6T4DXqbfwlB1+Wq2x/PWCDWxzv
         e/zVSZHuSiQ7lCnTpmrFOpmQuPnCgUXI71eEaInl/YIWCsN6f9kWTnl6Tp7Mw1OI0IaM
         iYGNbIdStfFjKPgI8y1g4P0r7/xuLTWQXH1chpx4jiICNUdAVkWojCdrvM8meVzYTPWJ
         Spzw==
X-Gm-Message-State: AOAM532ji11TRfMbS/WARW9nx/pOrfwibF70PK6ELKAi3h6C+9OqAeR6
	SpNSDyc4ovmuqXvLfxFf3IHb9w==
X-Google-Smtp-Source: ABdhPJw0q3lkQebHvlmaF0XIdy4qlPhd4zZprYNEBV7P199hRg2MBDtzD7Vf377aIsFmNWsuJvFuSw==
X-Received: by 2002:a1c:6805:: with SMTP id d5mr7405842wmc.19.1613574285609;
        Wed, 17 Feb 2021 07:04:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id q20sm3303550wmc.14.2021.02.17.07.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 07:04:45 -0800 (PST)
Message-ID: <bd27798a81ad62fb15571dcd14dcd9825c132f38.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 2/5] package: Remove false positive lic warnings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Meh Mbeh Ida Delphine
	 <idadelm@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2021 15:04:44 +0000
In-Reply-To: <008095bfe41a468ba2d5fb3ba06160eb@XBOX03.axis.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-3-idadelm@gmail.com>
	 <8bb8d2888759c8102ee35a7b3badf06fdb0eea86.camel@linuxfoundation.org>
	 <008095bfe41a468ba2d5fb3ba06160eb@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 14:55 +0000, Peter Kjellerstedt wrote:
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> On Wed, 2021-02-17 at 05:00 +0100, Meh Mbeh Ida Delphine wrote:
> 
> > 
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index c3259146b6..14c8475cfa 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1774,6 +1774,10 @@ fi
> >                      if l.endswith('-or-later'):
> >                          lic_ = l.replace('-or-later', '+')
> >                          computedpkglicsperpkg.add(lic_)
> > +                    elif l.endswith(' WITH Linux-syscall-note'):
> > +                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE")
> > == "1":
> > +                            lic_ = l.replace(' WITH Linux-syscall-
> > note', '')
> > +                            computedpkglicsperpkg.add(lic_)
> 
> I think this is going to break things and it should be entirely
> removing this license entry.
> 
> Why? Headers under GPLv2 WITH Linux-syscall-note can be used in a
> non-
> GPLv2 application and that application doesn't then become under
> GPLv2.
> 
> What we probably want is a "safe" list of licenses which don't have
> implications and entries matching "* WITH Linux-syscall-note" can be
> ignored, as long as they're only in header files. Perhaps we also
> need
> a check to ensure we only see "* WITH Linux-syscall-note" in header
> files?
> 
> Cheers,
> 
> Richard

Isn't the problem here really the multiple (sometimes contradictory)
use 
cases for the LICENSE variable. 

1) It is used to document the licenses that cover the code.
2) It is used to determine if the recipe can be built.
3) It is used (together with LIC_FILES_CHKSUM) to populate the licenses
that 
   go into, e.g., ${PN}-lic.
4) It is used by archiver.bbclass to determine what code to export.

I guess I have more specific context here since I know Ida is looking
at comparing what we have in LICENSE with what we can learn from
license headers being built into the code, e.g. to find mismatches.

In that context, trimming to "GPLv2" and them comparing with a recipe
saying "APL-2.0" is bad when in fact its fine.

Cheers,

Richard



