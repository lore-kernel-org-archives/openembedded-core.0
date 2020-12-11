Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.10011.1607705671643442136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ebSdFScM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q75so9213425wme.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NWj1gLPK4C4ot5vWt1p8QAlNbm/55Dv2ZKzSa5pXlMM=;
        b=ebSdFScM99jsot8ipaFA7t34HlalrRuAehlzVV72ifUT5zPVEMbSA7k+6obEXbfuak
         Z0bI3WqSenk7iAjbJyH+SHXxWriYvrcADDSdzRQ7s7Wa749YxcKhsZCnPkG5mPYV+E5X
         qmflrLLQVioKqpHypoMkgdKIe2TS0PJk16T0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NWj1gLPK4C4ot5vWt1p8QAlNbm/55Dv2ZKzSa5pXlMM=;
        b=imaOZyDteMFEPB1O7P1UL6T0htj/P8CF554uEhSDM/gS/G4Z+CH67wH/7i1moOswxR
         kYQJJ7p1TcOnQDm7s5qhyQKGmLQ2/HZAuN2p16MKH9lHiABYL9y4XuodQGlU/oqILGY8
         a4oOeiwzcUV9gxl/G0fvBriS9urQD5R3AiNU1GcQqoX5ied10PHMr0LSdNURo0EF/LSm
         eg6bYl56t9y2MjxvnQRuCLAvtoOgGrI8QM8MBukTtBKoF5enShvq+1ych6JJx3urqNky
         fZekAuqepKDAOrkdpCKpe/6svXA4wmXoWCT2XXwYWUhpSD/EWHmFrB5rZri4/VQkg1ft
         TJTw==
X-Gm-Message-State: AOAM532O3GESfFPvByRV2Edc2XR//KNYK/5CgU2By4IuHFNl2BsVZyKs
	u4Sa2jpe80gaElJd3Oj1Y1rxjw==
X-Google-Smtp-Source: ABdhPJwLKbqZ7rI35cq5UEoM2dDaPkZQcit0x/3FR2vhkxrxqb3RMU91Ebj3YtCRO8du7bfVQgbmJA==
X-Received: by 2002:a1c:2c83:: with SMTP id s125mr14561073wms.161.1607705670160;
        Fri, 11 Dec 2020 08:54:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id b7sm16469542wrv.47.2020.12.11.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 08:54:29 -0800 (PST)
Message-ID: <8cdb3052c2f91b84127fb85555e3a4505b78a081.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Dec 2020 16:54:28 +0000
In-Reply-To: <a308f746624a7b47541d746265831a187f2535da.camel@microsoft.com>
References: <20191209162419.4343-1-luca.boccassi@gmail.com>
	 <20201123132823.3996355-1-luca.boccassi@gmail.com>
	 <2d012b8dcd17962239264152e6969edda609e16c.camel@linuxfoundation.org>
	 <f627105e5820b447a8fc4eac9afa980fb080ea4a.camel@microsoft.com>
	 <8135d8b348600bcf9c7d3c08fbd395f912c68aea.camel@linuxfoundation.org>
	 <a308f746624a7b47541d746265831a187f2535da.camel@microsoft.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-11 at 09:51 +0000, Luca Boccassi wrote:
> On Thu, 2020-12-10 at 20:04 +0000, Richard Purdie wrote:
> > On Thu, 2020-12-10 at 18:47 +0000, Luca Boccassi wrote:
> > > On Thu, 2020-12-10 at 15:52 +0000, Richard Purdie wrote:
> > > > On Mon, 2020-11-23 at 13:28 +0000, Luca Bocassi wrote:
> > I have to ask why libuuid couldn't be done in a separate repository and
> > avoid the need to do a multi-stage build of a component? To me at
> > least, it would seem to make sense to logically split the library code
> > out, then it avoids all the complexity. Yes, that means a different
> > component to release but that isn't unusual.
> 
> Because there's no need for the extra complications - again, it's all
> optional features, so bootstrapping is not an issue when the tooling is
> there to support it.
> I'm not a util-linux maintainer so my opinion on the subject counts for
> precisely nothing, but as a contributor and user I'd not be very happy
> if it was stuck to the lowest common denominator.

If its all optional and not that important I start to wonder why we
should bother with it.

My point is there has to be complexity somewhere for this "mutli-stage" 
approach to work. How much of it you see depends on the system and how
it handles it but you'd agree that having a simple more linear
dependency tree *is* simpler and easier to work with than something
which has multiple stages (and more efficient on build resources too).

> > > Yocto could really use multi stage support - this isn't the first and
> > > won't be the last occurrence. Just my 2c...
> > 
> > Well, we can do it as you're proving, its just ugly and hard to
> > maintain. I don't think the other distros will be particularly happy
> > about needing to do it either. Outside of libgcc, we've not really
> > found that we need to do this often at all and the compiler/libc
> > interface is a lot more "special" than uuid.
> 
> But that's what I'm saying: it doesn't have to be ugly, if the
> infrastructure is there to support it.

I'm sure we (OE) could "hide" it but regardless of whether the code is
hidden or not, its still ugly, not often used and hard to maintain for
someone. We don't want to encourage this though.

> On Debian and derivatives, you just mark the dependency with <!stage1>
> - and that's it. When bootstrapping you start from stage1 and the
> resolver skips those. If the package configure/make scripts are done
> well, by default optional dependencies are skipped if not available and
> if not explicitly set - and util-linux does that.
> In the RPM world, the spec has conditional macros and you set the
> appropriate one at the build config level (eg: in the lower ring
> project on OBS).
> It's not perfect of course, and requires attention, and there are
> complications and gotchas, and things do go wrong at times - but such
> is life in the software world.

Complexity is fine, where it makes sense and is needed. You're failing
to convince me its needed here at all. I believe this does need to be
mentioned to the upstream maintainer as they're probably not aware of
the issues it causes. Obviously someone else will have to do that
though since you believe its "fine".

> 
> > Thanks for updating the patch. I'll put it back into the queue and test
> > the new version.
> 
> Thank you - does the approach of adding RDEPENDS look right? The
> interaction between those variables and the native/nativesdk builds
> still confuses me a lot, and I get it wrong all the time.

I've just looked and to be honest, no, it doesn't look right at all :(.
You're adding dependencies in a recipe where the packages don't exist.

Also, if the recipes are properly structuctred, there should be no need
to do this:

PACKAGES_remove = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"

The more I look at the patch, the more I'm worried :(. As is, its not
going to work. I'm not even sure how its being tested or can work.

Cheers,

Richard

