Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id E5DA778268;
	Fri, 11 Aug 2017 17:58:35 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id k43so2210881uaf.1;
	Fri, 11 Aug 2017 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VnSoYi35VVZiK8RnDuroIfNoEayIulPKwZHn3pzONoE=;
	b=RLqKZWrxdWsuUOFws6zYrcSB3bx+nlDUu/Ms1kqgo2nsVuUCY28iPzZpfPWdkaDchm
	iAqMc36LC0QjRuydRCEYTxmW30CQ/Q8c4YiiBGvn2CoVyVT3ovsOVnmQDotfHQ608lHR
	Bb8szeHOCmKkMnKz54SzieWuYELbES8LJvfiG6hNn5H4cE3CgsWjGYgKkkxfq+6v+eSY
	lN9HLw/bHiuVJBW/qIqR7qVDwDk9DmNWKZMYtbgYAemihpT4HfNbkCticfQ8pk+6ZcQe
	IlGrWv4kmZ+zpIxJ3kSAg5MhQThh1mf9plkeZhb/wueGXdocId+gRsr2qx0usZAS+f4J
	/Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VnSoYi35VVZiK8RnDuroIfNoEayIulPKwZHn3pzONoE=;
	b=JQ9egH3+3xZ80YFVAg08HTyO11v9aBXqcoQ6BuufMu0NN1PkY0Q8IBy9T/t1GacGWm
	sMmGkc/jKoJ1n2DsBsWUK6QfE2xxKHXBBfsrESTUOp1+0JvvBS7BcVLC1dgTGHEyf4Cs
	VU8bv6IeMY0ou3XU2ia+ab7NWRcrtRaASAEGdO4Y2NICYrYMUmJ6vxFNE+iNvOHhzKlp
	xIxfFBpTT5Rq59mM3HijK1NYOG5XZJLR7S7n1KYHHjQ0iGcmnUr3K+bWpj8z4pJjk0ET
	72fyQVF+SMB5Zzp1mJgCNt2Nyn89/BmbsUW0JGeSuzD+ddtlTMcxgNlGs6qRS29mffNH
	UBbA==
X-Gm-Message-State: AHYfb5iRkIgU4abIM9lNaHTzXq2SvkQg2zuOt6WLSDKn5VLBzvtPvdCm
	jMvT3ouKUXfK+kVNVpCZg8xT1jEE/A==
X-Received: by 10.176.82.153 with SMTP id v25mr11533106uav.150.1502474316735; 
	Fri, 11 Aug 2017 10:58:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.100 with HTTP; Fri, 11 Aug 2017 10:58:36 -0700 (PDT)
In-Reply-To: <20170811164545.GC3320@jama>
References: <20170811080344.GB3320@jama>
	<CAMKF1sohv7_j=Gduw5y-9-4jCKWNjx-pc205PmfvN2vR4MOe6Q@mail.gmail.com>
	<20170811164545.GC3320@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 11 Aug 2017 19:58:36 +0200
Message-ID: <CALbNGRRdCu1oYc=SOf0LrENZ+tJhJMSTu20OvzBWo8BwMbQMUQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-08-09
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 17:58:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 11, 2017 at 6:45 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> firefox and mariadb fail like this only since conf/distro/include/security_flags.inc was included
>
> qtbase fails because of ptest addition as reported on ML
>
>> Kodi patch to use std::string was sent. mongodb needs something similar.
>
> The kodi patch from Andreas was already included in this build. Yours
> kodi patch looks similar, but not backported from upstream.
>
> see:
>> > 3a03560 kodi: fix build with latest gcc
I checked the log and don't understand what happened: kodi on qemux86
failed exactly with the error message I saw before fixing. Since the
other qemus did not fail: are you sure my patch did not come in while
build was already running?
>
>
>> imagemagick issue is also taken care of
>
> is it? where? Notice that this includes also the 2nd imagemagick upgrade
> which also already disappeared from the site.
Randy suggested to skip imagemagick update until upstream stabilizes.
>
>> I have sent a patch for squid issue
>
> You mean this one?
>> > e435561 squid: Add missing dependencies on openssl expat and libxml2
>
> it's already included (might be missing in qemux86 build which was
> started first).
>
-> kodi?

Regards

Andreas

