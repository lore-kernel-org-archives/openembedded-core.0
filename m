Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63B4B7CC14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 19:44:34 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p48so20720926qtk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GX3TOfwcRnr7Yy4FXMhbIEahcc/h1K5dPDLL47HPAsk=;
	b=gufhyKcOIFgDjn6ayRvkSq/mBIz8jiEsp5sbvO7gB5x20LvtP2YeMk2YwcnqbacM5R
	IAeoUf1BO79Mu0P3ZAQy6JMHcS9bdUpyO7ip4vXjN6xZd9fFyY+7cIV+dHgQCN+ZXMb8
	+yODnaPlN2tLcVKsodc2FtNTlcA8oW1aSBKS8OD0VAUejlAvoHlyqxZp5RthC+3Nmhdp
	DThtf3LMTxLdxAzK4gB+4CBiaVh6uy+KA2Y8oxJVNv3UmDEYYEcapzgZ3NA8IdEJQSwv
	BiNvvb3pKho4ietKECfqAk/BR6keFkpv35Q1gr5YJlQpE2TKQkrHzHXRqm00xlp7fcfa
	ysnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GX3TOfwcRnr7Yy4FXMhbIEahcc/h1K5dPDLL47HPAsk=;
	b=ZYt4YOtNdIRdmhvnzcVX8soHY6Ob4kp5noMdoqSiR9e9dXLxYl8JH+cpd3PRJwAPAX
	DwBlzm3TcVYCPmARDAYO6NVeok1jgOnh4aEBz3edPbKB0aby2mGGwPaHsRsDNoCdNasO
	QJO52qZS7grvHlQDDeqqa8BbMdf22Af27YKILf48GREFJl6UQMwZ4Q20wFDQZKQsPalG
	OsFHT6PVljzQacrvWpTms9O0DbkeTTz4czrV6rZhwx8lziG9UBAI0d7Tp1ibKBFDTbwz
	pNrIijkd2vnsna/IZJIOt7Odz8MqZbZgaaFBX8lRGe25NSJaLSSnJ6moolkIU/TYsz28
	Vxkw==
X-Gm-Message-State: APjAAAWwKUR5LZ/DNddVi/z2vnGy/lNEDj6HT6bAhyPE4wBIiftMS6/H
	GY3gr8pvkSOFrTHqdYMyvTrUYQdXpJRI+yGJ7gaqWw==
X-Google-Smtp-Source: APXvYqw2RJ86PnUSujsCQjOi2ZbbzHE8Zhgc5os1zPnaBBtxMbr9dyLRx3b+C8GkHzsFrf9+oAHPLdU5B0gd5Trwuvw=
X-Received: by 2002:a0c:b660:: with SMTP id q32mr3402821qvf.50.1551296675032; 
	Wed, 27 Feb 2019 11:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20190227070420.36624-1-raj.khem@gmail.com>
	<20190227071954.GA20203@localhost>
In-Reply-To: <20190227071954.GA20203@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 11:44:09 -0800
Message-ID: <CAMKF1sqWB4fFPSHdA10X+BE=Fg68v-_8gLT0_Tu6-C1_E02_ew@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
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
X-List-Received-Date: Wed, 27 Feb 2019 19:44:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 11:19 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Feb 26, 2019 at 11:04:20PM -0800, Khem Raj wrote:
> > -Og is for optimized debugging experience.
> > this makes this consistent across different compilers especially gcc and
> > clang, -O in clang is equal to -O2 where as in gcc its similar to -O1
> > so it was not giving consistent debugging experience across compilers
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 1c5369ec98..758e89f126 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
> >
> >  # Disabled until the option works properly -feliminate-dwarf2-dups
> >  FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> > -DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> > +DEBUG_OPTIMIZATION = "-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> >  SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> >  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
> >  BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
> >                                                            ^^
>
> Another place that might have to be updated.

I did not do this intentionally, since we do not control gcc on build
host, but rethinking it a bit I think it might be doable, if all hosts
we support use gcc 4.8 or newer
for gcc, which I see is the case of  centos7 uses gcc 4.8, so thats
the oldest supported distro we list.

>
> And the ref/dev-maunuals also need updating (they document -O as default).

yes, thats taken care of locally for next rev

>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

