Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1UcxjA-000384-UO; Thu, 16 May 2013 14:56:20 +0200
Received: by mail-vc0-f180.google.com with SMTP id gd11so2751099vcb.11
	for <multiple recipients>; Thu, 16 May 2013 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=fHt9OYvaNZRv7z7nRCpXziRZ38+jcrmZouBxV+oYC1g=;
	b=kRbbKY4VqM6Ns3oMm4ufJ6oJGbSirjLars3fSykhum4Su/b/za2hrYnHcV5oBlIOe3
	6YI9YHLlKJ3hBwE1NOvB3PzIHS5gy0g+mq8jiak7M4hpaLVQPprhcDQ1G8RpW0XEjZul
	P3MI5lngufH9MPgPVT4H5R9PSHOrLlYj3oQVMTYNY4wfnz0dFMXWMsc7yFWHu4xasV9K
	lDYwh6Ny9Gx/DHP2RB1Ut0B1AscewcXl2xnSFeixqA3QXlOSI0BBXGxQu/wMy8HG1dFF
	wZaEsGeT3Gg+cZ3g8mEeVvQYu5+m9AXi77OU5XjyNsO5oEojdLGmvR3xVk4Of2lXzFEU
	zmEQ==
MIME-Version: 1.0
X-Received: by 10.58.32.131 with SMTP id j3mr15948749vei.57.1368707878041;
	Thu, 16 May 2013 05:37:58 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Thu, 16 May 2013 05:37:57 -0700 (PDT)
In-Reply-To: <20130516091427.GE24809@jama.dyndns-home.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130516091427.GE24809@jama.dyndns-home.com>
Date: Thu, 16 May 2013 14:37:57 +0200
Message-ID: <CALbNGRSipKrPfpzYx_SDETPY_kp5orHsHQT+=2Ds22d=sBiR7A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 12:56:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 16, 2013 at 11:14 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> FYI: these builds were started +- 3 days ago, because it takes +- 24hours for
> world build on one architecture (even with sstate-cache kept between
> builds, because it's quickly changing checksums with oe-core changes) ...
>
> so some fixes sent in last 3 days weren't used (there is patch to fix at
> least maliit-framework and gnome-bluetooth)
The patch for mallit-framework fixes glib-2.0 2.36 error (so we need
that patch). I looked into the logs and this one seems caused by gcc
4.8. Will send further patch soon.

Andreas


