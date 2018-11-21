Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDDA6C514
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 23:41:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d19so5741741qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 15:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0rn6krdLi9xHglSA9hhTeFIvjvLk/O9GAr1A+0NzuI8=;
	b=b7dhhI/YAkHQ9Ob9HjICNMsbq8yGX70Bf2/taEHUU9K7K7XRG17+44r0vH8binci5n
	IgN1eJji67O9rVBZ2QeiDcByvvVXXcqfuEas4Vc3MsIqlrh/H/NLe4Wh1g3YpG4JVj/J
	s6J3iNkttxhSNG7s6VVB5tjAM7zxZvFvaox/ZgQEYzacKNEaytPEpxqd7/bMoM+1OQDB
	F6phF6OiksZGZJXHLXeZ2H+biTBILQw6NIWOTvUsGiE/LkKGHO0T7WXRacLhjpc6U9BC
	/+IYWjzQZ95kSDLnKkRuILMj/2Yy8VrIv3iIF6sNBKtpOZBhpn4kXPUuWRadiFPMpPW2
	t5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rn6krdLi9xHglSA9hhTeFIvjvLk/O9GAr1A+0NzuI8=;
	b=Ey2rXrWQ+id9WGSU6iVnaKMVOvlZNZAziCz9nOkfqp5zdnW/7ub+kyn9bTdaTm64D9
	PbRHd92rNqngbZjztassiRlLGf+OxsttHK7flsAjpPLPcQHoKonDo0/4+QK/fF7itgK7
	bCe6m8u4yOiEbvOe7RYyh11Bi4HwRwOF+36zYfkRCsHmQcFjv7nN+1BQvLR+GCI8s6Hl
	stTuitzJlPlEkP2zvyCqvRu/4D79eAGA0ld/hX907GU+JkO1ump2HuylcR0v9sPEZ3BI
	BhInZJTW9yL3miUn9R4H4xO/oOkoIBjtafkW5nPYhKJIYZrgU5Kvvt6lLO52DX4I05fL
	QIew==
X-Gm-Message-State: AGRZ1gI/8vlIwP3XBy/Ta5ICnX94K2ubWf2FpXgEPrKRJTs2FhmWcGoo
	tJGAdSyhz4spP5/0PwzA6lGiJqmAD7FDGqmAWYk=
X-Google-Smtp-Source: AJdET5d4sGsmV8uXbw6Pui98cMI35W+q9+Co8CndwW/ktF0bmu3H8hVSI65TYFyjTk1QZ8isZSGo51xHzz9rZq4ovZs=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr8043160qtk.253.1542843679935; 
	Wed, 21 Nov 2018 15:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20181119172726.23571-1-raj.khem@gmail.com>
	<1a6d8097cc8ed3b4a8916632e247f79d2d6689d9.camel@linuxfoundation.org>
	<5d065b2ee6f9f619ae3537eb58e5e18117fefd0a.camel@linuxfoundation.org>
In-Reply-To: <5d065b2ee6f9f619ae3537eb58e5e18117fefd0a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Nov 2018 15:40:53 -0800
Message-ID: <CAMKF1srCqbBL71mXBtTJ9EZkzFatHAR6LTNkfMLdiDZYOE40Pw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to latest trunk
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
X-List-Received-Date: Wed, 21 Nov 2018 23:41:19 -0000
Content-Type: text/plain; charset="UTF-8"

my tests were on real h/w (rpi) and there I did not
see this issue obviously. I will try to reproduce this
on qemu, I wonder if this is specific to x86
On Wed, Nov 21, 2018 at 2:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-11-21 at 09:32 +0000, Richard Purdie wrote:
> > On Mon, 2018-11-19 at 09:27 -0800, Khem Raj wrote:
> > > Complete changelogs are here
> > >
> >
> >
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..79f653c6bc2881dd6855299c908a442f56cb7c2b
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > This seemed to have a segfault in exportfs:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/231/steps/7/logs/step1c
> >
> > Will rerun and see if it reproduces...
>
> It reproduces:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/232/steps/7/logs/step1c
>
> (which is good and bad!)
>
> Cheers,
>
> Richard
>

