Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A53EA6188A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 22:25:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t2so8856596wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rRyz7konkgtgbBmq/zWaIVkYMnDimJxP2jw2TWNw/fo=;
	b=Xfep7qNfd0XW5vxnru03MaQkYfNtOwJcD6MU2cDE9nsFsFzJgNOVbIDBiJHYklhHMx
	Bf5xAl9pC99oLpm18a9if/NwgcPqi2Ag8qJVIhwpZnod5BcQeUFi4Rj28d6EeHz5YDtn
	WFmHkdXhf1qmEwAhejGx4OmrHFFcJSypUDuco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rRyz7konkgtgbBmq/zWaIVkYMnDimJxP2jw2TWNw/fo=;
	b=U+rfT4U4uebxr1fsaTTHPlpXvr/MFZIL1r4mUYsWmsB3GYZPjEvePGVJHLl4rdosrG
	m+OCJRKYoTK+mgafHSp4iEUK0jpUFTRD98D8CKs/TUvcdd/CxPYkXpVXMail9w9WsBlH
	mG7GbTDu1aL0YLcdceRnE7CoUE3Uw6OkrnlkgnSZxBOGacqsCbuVHZ+AquWvvDp4v6+v
	e0tdfHlHl7s6gAYvui1gR7WJnrGZ7stS01Sm5DEsRXanJamiLLg0Xnn+osEus2x5jMtH
	7u82PnooqfNfInUQWQMOpluy+9DQ1DW7SGkQgeORB1LcFnIyFMhGREgQYVnc7UEDNLyy
	5fRw==
X-Gm-Message-State: ANhLgQ1eOj8+yYDt1aay/yycJ9Zc+8w/hJlnA9xX/ClXEBE+rX6LI8Q4
	Ykxxsf8e77nczsSYfQaR0pt/ow==
X-Google-Smtp-Source: ADFU+vtS+TMxcv3msKpzjdgPrROZOHb1KNa9kI/04tAHGlM96dq2VS1xRAYuyABVi17d2gEQ+GdHfg==
X-Received: by 2002:a5d:5290:: with SMTP id c16mr30231773wrv.235.1584311157288;
	Sun, 15 Mar 2020 15:25:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b82sm21183026wmb.46.2020.03.15.15.25.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 15:25:56 -0700 (PDT)
Message-ID: <3d626d46a2cf1cb10d0ae41444db96a65e65e201.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 22:25:55 +0000
In-Reply-To: <CAMKF1spW8XY4q2rbo8on6AiVjsrF+xmLCSgJ9-Yza31=18VWEg@mail.gmail.com>
References: <20200315042947.3257882-1-raj.khem@gmail.com>
	<cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
	<CAMKF1spW8XY4q2rbo8on6AiVjsrF+xmLCSgJ9-Yza31=18VWEg@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 22:25:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-03-15 at 15:23 -0700, Khem Raj wrote:
> On Sun, Mar 15, 2020 at 3:14 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:
> > > In some cases, we run into parallel build failures where
> > > BUILT_SOURCES
> > > is skipped, as a result required header files are not generated and
> > > the
> > > build fails with missing header errors like
> > > 
> > > ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
> > > No such file or directory
> > >  #include "uniwidth.h"
> > >           ^~~~~~~~~~~~
> > > compilation terminated.
> > > 
> > > BUILT_SOURCES should be built automatically with `make all` [1]
> > > therefore
> > > ensure that make is invoked with `all` target
> > > 
> > > bison-native parallel build fails when -l<n> is passed globally from
> > > build environment, errors like below due to race starts to show up
> > > 
> > > Therefore removes a previous load limit if set
> > > 
> > > [1]
> > > https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example
> > 
> > I'm not sure I understand this. We've seen a failure on our ubuntu1604
> > performance tester which I think is the same bug as this. The
> > environment on that machine doesn't change, so how/where is this -l
> > option coming from?
> > 
> 
> From custom distro global settings for EXTRA_OEMAKE
> 
> > I suspect there is some issue we're not quite getting to still :(
> > 
>  its well reproducible now with -j and -l together on our builders, From what
> I see in makefiles bison is doing right thing in using BUILT_SOURCES so
> I suspect it could be make acting in a certain way when those options
> are present.
> 
> our custom settings use -l options globally in EXTRA_OEMAKE
> this is to let machines with certain configurations build when machines are
> shared, we don't want a given build to use all resources on box. Yes one
> could say why not do something else to limit the resources build uses but
> this is a global setting that works well
> 
> This patch just ensures that any -l setting passed from environment is
> cleaned up and reset. So for general case it will be a noop.

Ok, that explains your failure but not the one on our performance
testing worker :/.

Cheers,

Richard


