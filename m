Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.19896.1607630700163070196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=McebFlNn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id r3so6789534wrt.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ATuqC5jiK6S5qKrUco86GCCozqtZmYFlr4ACmn+7gNo=;
        b=McebFlNniTYruvk5xivUkAlF+xuCQvuzbR68O5TFyQAKPciB5l82gjmti53N5JE03A
         PbuMIHS8jP3kI4yKXo9Z6LILZ0wVg9aarbCB6prxcchVBumEaCpYZtFN8VkPChJj88nR
         /GZx26twyTwHj294LrkmU4JHA89zQpVtA89WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ATuqC5jiK6S5qKrUco86GCCozqtZmYFlr4ACmn+7gNo=;
        b=XFmapepfpjy4JDUoG9QIQFOIGlyhRicnJDRpHGMRUAOFevrCQpF1eF5R5eM3i5nnkQ
         vJIkVECkrc6bHbIZacxAXOvLjhga+J0Ztjgw5yLv5mL68sXroXCRM4zpjbqrREXyGvnD
         vy8+uZmnbmRpPlxSQXWflS3OL3lMkWnDvDpdY7ANvGSsDxRX/UXfJqu9sEmRkFeeIevr
         kK7Kzunnb/GofJbGj99lzZRB5LgpJk9R73bkYRf5WTMKnKuxkyCgGEmRScAyxP6JtMiO
         jcpIAfe8XvY5MTueXtNbhQSTqYiRwwGCXbNqV9YpMSVWG0pZZvPZvRFc0E0jzlZAHPT8
         /FQA==
X-Gm-Message-State: AOAM532OYLulZK0ome9izjU1QalVNTmK/yqoLx1MXJA1A7/2QZCrHd/K
	lUedipq+ScGCDbgzesMBgtKD4w==
X-Google-Smtp-Source: ABdhPJwFWSRaOkKs9IdpvMBA/h8qKFNw8fwc6v+uo6XGxWssn0DqA8jKVFxDTEU0hVrr5Yu2iVz8XQ==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr10104072wrp.234.1607630698595;
        Thu, 10 Dec 2020 12:04:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id p9sm5602276wmm.17.2020.12.10.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:04:57 -0800 (PST)
Message-ID: <8135d8b348600bcf9c7d3c08fbd395f912c68aea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2020 20:04:56 +0000
In-Reply-To: <f627105e5820b447a8fc4eac9afa980fb080ea4a.camel@microsoft.com>
References: <20191209162419.4343-1-luca.boccassi@gmail.com>
	 <20201123132823.3996355-1-luca.boccassi@gmail.com>
		 <2d012b8dcd17962239264152e6969edda609e16c.camel@linuxfoundation.org>
	 <f627105e5820b447a8fc4eac9afa980fb080ea4a.camel@microsoft.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 18:47 +0000, Luca Boccassi wrote:
> On Thu, 2020-12-10 at 15:52 +0000, Richard Purdie wrote:
> > On Mon, 2020-11-23 at 13:28 +0000, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > In v2.35 util-linux  gained an (optional) build
> > > dependency on libcryptsetup. But libcryptsetup build-depends on
> > > util-linux for blkid (optional, can be disabled) and uuid
> > > (mandatory).
> > > Split out util-linux-uuid in a different recipe to break the
> > > cycle.
> > > 
> > > Add a packageconfig switch (disabled by default) to allow using
> > > the
> > > new dependency.
> > > 
> > > https://github.com/karelzak/util-linux/pull/898
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > v1: util-linux 2.35 is not out yet, but I'd like to get the
> > > preparatory work
> > >     underway as I'm not sure if this is the best approach or if
> > > there are
> > >     alternatives. Suggestions and comments very welcome. Thanks!
> > > v2: changed packages names to reflect old ones (eg: libuuid1 ->
> > > util-linux-libuuid)
> > >     and leave uuid build enable in main recipe to allow for
> > > uuidgen build to happen,
> > >     as it does not have its own autoconf switch. Delete the
> > > library manualy from
> > >     the main recipe after build instead, and add dependency.
> > >     Might help to break loop python3 -> util-linux -> libselinux
> > > -> python3, as it's
> > >     only libuuid that is needed, see 
> > > https://lists.yoctoproject.org/g/yocto/message/47570
> > > v3: rebased and refactored to have a common util-linux.inc file
> > > 
> > 
> > I'm afraid this causes do_package_qa errors in basic testing:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1668
> 
> Thanks, added RDEPENDS in v4. Strange that those didn't pop up when
> building poky locally, I usually get QA warnings as expected.
> Anything
> in local.conf to enable to get them?

No, you should see it in a standard build. It did make me wonder how
this was tested :/.

> > I am worried about this change as we're starting to see a number of
> > circular dependencies in util-linux (there is a new bug about the
> > pylibmount PACKAGECONFIG option too), maybe we should flag this
> > upstream?
> > 
> > Multiple recipes like this usually turn into a maintenance
> > nightmare
> > unfortunately which is part of my reluctance to go in this
> > direction,
> > not sure we have any choice though.
> 
> Well I've added the feature, and both the maintainer and myself were
> aware of the implications. It's optional, so on distros with multi-
> stage bootstrapping functionality like Debian/Ubuntu/RHEL/Suse/etc it
> can be automatically disabled for the first stage build. At runtime
> it can also be optional via dlopen, if desired (via --configure
> flag).

I have to ask why libuuid couldn't be done in a separate repository and
avoid the need to do a multi-stage build of a component? To me at
least, it would seem to make sense to logically split the library code
out, then it avoids all the complexity. Yes, that means a different
component to release but that isn't unusual.

> Yocto could really use multi stage support - this isn't the first and
> won't be the last occurrence. Just my 2c...

Well, we can do it as you're proving, its just ugly and hard to
maintain. I don't think the other distros will be particularly happy
about needing to do it either. Outside of libgcc, we've not really
found that we need to do this often at all and the compiler/libc
interface is a lot more "special" than uuid.

Thanks for updating the patch. I'll put it back into the queue and test
the new version.

Cheers,

Richard

