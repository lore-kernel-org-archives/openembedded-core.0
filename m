Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.15126.1586191673572719068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 09:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FPJTXrJt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id j17so186959wru.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SsOL9dybzKfavZtIvOjzZj/O+CIN0yoyvLXtumktZN8=;
        b=FPJTXrJtBe8ezoW+JUbEzvJAXpeqtsxJU7EXioh4ZTLPJhz00uD5ZFpwBhsq7MB22y
         QXiGkFQvSZbnSTqqG1IZuWaoKHQAPn7NWax+syGCzoQbQc8E+fNpYa7mvgSj3ovZ3UwC
         QpusiYtpabzh9xJZ0EUwSX7fNt9qKWt1zQoN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SsOL9dybzKfavZtIvOjzZj/O+CIN0yoyvLXtumktZN8=;
        b=NjTrZ/PYMf8TzAgTSJbbYUEqUzblFcVawGEnyKrirTM5VYDAEcJkNnaZyeYnQmjgQH
         RJfUUHYavr2maVroIxcz0yk+HiY3Klz6Lu8zuHHrj8mCS6X13kNdSCJ4n9BoaY2FU99S
         grcDfN0F/jhjeelPZJda0L4fsUijE28rsZB4yGwq/MOq5TqQAgrGZ1ZWbgx8gnWCypU+
         b0JjMJTqlgoW2qeE041nVeP4MnRBRplPlq/Yc11+Klr2JGJkD5KWRmKLcJ/UAgfEKyKT
         AK3rUgLwq3GzR3kmdsDrNveKWVcH2KDdxHYro/ItcWE6D09xTdMf6aCC5fsURyIwmbDW
         oHMw==
X-Gm-Message-State: AGi0PuZf72nTzHaIGdcddyg9hBD18wuIqc/sk7qATYF10Ah2kWRXkLTo
	E9JS4afhq/dthk4dbLKYshnVtw==
X-Google-Smtp-Source: APiQypLVL8O8KsGPZvYnXVhxIEIJIFkmAcU/AHWgpDFPXVbn/u3jJ6pkx47upk7DAuEnuEa0GirEJg==
X-Received: by 2002:a5d:45d1:: with SMTP id b17mr85105wrs.111.1586191671964;
        Mon, 06 Apr 2020 09:47:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m21sm213241wmc.6.2020.04.06.09.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:47:50 -0700 (PDT)
Message-ID: <bbcedb53a9f5c5515acb5760237c5d3fe1f01e61.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2 v5] coreutils: add ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Trevor Gamblin
	 <trevor.gamblin@windriver.com>
Date: Mon, 06 Apr 2020 17:47:49 +0100
In-Reply-To: <CAMKF1so-A14JBx3CBAed2+zeBYN_Z8khPAMiXhcwT4HO-ZdsGg@mail.gmail.com>
References: <20200311113235.61655-1-trevor.gamblin@windriver.com>
	 <20200311113235.61655-2-trevor.gamblin@windriver.com>
	 <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
	 <5ebbb63be39a442c740660ff321338f522dc4b68.camel@linuxfoundation.org>
	 <CAMKF1so-A14JBx3CBAed2+zeBYN_Z8khPAMiXhcwT4HO-ZdsGg@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-04-06 at 07:32 -0700, Khem Raj wrote:
> On Mon, Apr 6, 2020 at 4:58 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2020-04-05 at 17:26 -0700, Khem Raj wrote:
> > > On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin
> > > <trevor.gamblin@windriver.com> wrote:
> > > > +inherit ptest
> > > > +
> > > > +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
> > > > +
> > > 
> > > Adding libmodule-build-perl to rdeps here is pulling in whole target
> > > toolchain components now while building core-image-minimal
> > > the dependency chain looks like, total task building for this image are 3000+
> > > 
> > > "coreutils.do_package_qa" -> "libmodule-build-perl.do_packagedata" ->
> > > "packagegroup-core-buildessential.do_packagedata" ->
> > > "gcc.do_packagedata"
> > > 
> > > IMO, it's a bad experience for the user when building a simple minimal
> > > image and it ends up building whole toolchain for target that
> > > eventually won't even
> > > be part of the image. perhaps make it dependent on ptest or some such
> > > knob thats not commonly used.
> > > 
> > > Please revert this patch series until we can find a way to not insert
> > > these build-time dependencies in normal flow.
> > 
> > We were aware of this when it merged. This should already only happen
> > if ptest is enabled?
> > 
> 
> I am seeing it with a fresh checkout of poky with no other changes 

Poky enables ptest by default:

meta-poky/conf/distro/poky.conf:
POKY_DEFAULT_DISTRO_FEATURES = "largefile opengl ptest multiarch wayland vulkan"

so that is expected.

> > (else ${PN}-ptest isn't in PACKAGES and hence the RDEPENDS isn't seen).
> > 
> > I wish we had a better way of handling these dependencies but we sadly
> > don't.
> > 
> 
> Such changes should be left to users to enable imo may be a packageconfig or so 
> 
> People have reputation of long build times and large disk space for OE this won’t help that cause 

Well, I tried to have this conversation when the patch was being
reviewed and tested. Nobody seemed bothered then. I get tired of
talking to myself in a vacuum and having a reputation about being
difficult over patches when nobody seems to care (as no other voices
came into the conversation). I've tried to minimise the impact which
was the best we can do. We are trying to encourage people to add tests.

Starting to revert things just before release is a really bad idea so
we're not doing that.

We can disable ptest in coreutils specifically if we wanted. Ultimately
we need to find a better way in general of handling some of these
runtime dependencies but at this point that is a 3.2 issue.

Sorry, but if we were to have this discussion it should have been
months ago :(.

I'd also note that 3.1 rc1 is building now.

Cheers,

Richard

