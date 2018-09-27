Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id E811460234
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 18:50:02 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n6-v6so3938593qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d8T9x/LyCe+MiGViK7xOakvqmJ3Zak9kTkDJfFmHDq4=;
	b=oOws7tsdXZ+w5NpOKIwgEwqWjaaE2GHLCDw9NqXMqpC8ezbCGcPrH6nXkwr6mYsOcy
	KeyFCQB//ZLmd0eFGlMAp7zmDOPb0qRhgm9duYVlDc5VnIXZPqQZJTySgWURw6KbASpp
	mYtCdFrK9pUO5u9GXQJQtxv6MfnAatYrSGn95pERXB6K9zADniu96MKnfMgq3z45WsVg
	SqoNw2xH7QXFDE4pVifF3SByDkP4ubxUimj/xmhruenrYLEfUtQ+gmuj/TiFZ8L2DgWY
	8wbS8y/OlmA2jrMC4odaCZ/tsYl3OD9ubM+Otax/HfoJ18r5v3tqQA0RRMDATO3mXZ8l
	sPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d8T9x/LyCe+MiGViK7xOakvqmJ3Zak9kTkDJfFmHDq4=;
	b=jlUMUhgUcnxqttTSc2CTFygTmJTLR4fbYEQO3LP7Jhz3CeTnzQxwWkQN8EKyCawqPM
	Hj29aeODsI6vgSlGUi3GyfECr1dgdQsjVsgEMUNnmyEwgyXKeXv9B6anhrErL15mJvzp
	K9FSU4s2qJdmdBSc8pW+zJ/vgI0amZxeX7CtpF7WzZ4Qzj8DGEP+p6hXr+O14aVzERCG
	T5+HTS6kLB3vxeuyhbavfdwh2hTHBuMCmCmh3LN7SOLxLFK8Hq9rRGcNOxv5WeMTPkbJ
	hMrZ/iL8ovUhXdDYxo+harcup3T9qdwq8rKrmNQ9vfFHMnYbKFDp7kaY7QBt4FzfIM1s
	Yinw==
X-Gm-Message-State: ABuFfoh+45LJafv8Fezl3Im0zH1bV1EEYazhRsF9y7sWzVwwQpKdV0LZ
	r16SwE7BPl84Hf7uOT86hxaKPPVdwI+NaM1WR+Y=
X-Google-Smtp-Source: ACcGV61oyOGCFcaNrK1UAE4q/Qyl3l0l0X7pUjbgSha7Zd+pk11ljHHeodn0IbPp2L7wGtOia81inXkpcS9IEZ7W5K0=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr9391102qte.218.1538074203332; 
	Thu, 27 Sep 2018 11:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
	<CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
	<CACS+7ZQngcTuxFbyq9Ydb=unRp0raKomB4UbutKNWTHtC2V-cw@mail.gmail.com>
	<CALbNGRTWz-_FPAuCZZRr2baakz99h+3UJpJAF--H0d_jx1od3A@mail.gmail.com>
In-Reply-To: <CALbNGRTWz-_FPAuCZZRr2baakz99h+3UJpJAF--H0d_jx1od3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 11:49:36 -0700
Message-ID: <CAMKF1sptrEhQPgRf1kdq4oG8i2CpFQxpPR5mNb=4mRGEYSXvvA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Run experience with security flags enabled
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
X-List-Received-Date: Thu, 27 Sep 2018 18:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent it earlier today see

https://patchwork.openembedded.org/patch/155216/
On Thu, Sep 27, 2018 at 11:42 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Sep 27, 2018 at 2:57 PM, Dan McGregor <danismostlikely@gmail.com>=
 wrote:
> > On Wed, Sep 26, 2018, 15:47 Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On Wed, Sep 26, 2018 at 2:25 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
> >> wrote:
> >>>
> >>> Hi,
> >>>
> >>> from oe-core perspective my images are build on sumo (glibc 2.27). To
> >>> see what to expect, I enabled security flags (and yes some recipes in
> >>> my layers needed rework).
> >>>
> >>> Now that I have an image, I thought: let's give it a run. Apart of
> >>> other issues (maybe later) I get on every startup an error message fo=
r
> >>> ldconfig.
> >>> systemctl ldconfig says:
> >>>
> >>> =E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache
> >>>    Loaded: loaded (/lib/systemd/system/ldconfig.service; static;
> >>> vendor preset: enabled)
> >>>    Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:04
> >>> UTC; 2 days ago
> >>>      Docs: man:ldconfig(8)
> >>>   Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=
=3DSEGV)
> >>>  Main PID: 136 (code=3Ddumped, signal=3DSEGV)
> >>>
> >>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic
> >>> Linker Cache...
> >>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main
> >>> process exited, code=3Ddumped, status=3D11/SEGV
> >>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed wit=
h
> >>> result 'core-dump'.
> >>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild
> >>> Dynamic Linker Cache.
> >>>
> >>> Again somebody else seeing similar / remembers a fix?
> >>
> >>
> >> I see similar issue in sumo as well
> >> I do use security flags too and was not sure if that was the reason I
> >> think its a good data point
> >> Sadly I don=E2=80=99t yet have looked into the issue in detail
> >
> >
> > GCC 7 and glibc don't play well together with static PIE. The real solu=
tion
> > is to use GCC 8, but Ross made a workaround for this issue:
> >
> > http://git.openembedded.org/openembedded-core/commit/?id=3D5f64946b8740=
a5d944f48ec430470265703bfe5e
> It seems I can confirm this: Debugging shows that the crash happens in
> dl-relocate_static-pie.c _dl_relocate_static_pie line 41.
>
> Will send this to sumo as soon as tested.
>
> Andreas

