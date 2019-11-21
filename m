Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1A09D7FC21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 22:19:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y39so5572425qty.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 14:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1f3k1UZ2xEvyLJP8JKRTQF92/n52MCjZiVhQV1+sDbA=;
	b=n8xkefLe+e3z1wzqoLHxCkv9wVU0D44FvLwlgnkfEy0W+/6SvQWZWGWV88hCocAysP
	FduKIa7IJNeCYEmd44a388ct4O4oXSLjQLsdW1aa46tgm3RA6dSEOMb1gS6EDu5Vl0JS
	3Ul99qpT7j6P1V6qBf/TBYqcbvBVFzN3pwTj+fIO37WZZUeFtFeU0pgYGJK/uJP4eatn
	v8dRxxUgjVJK720FBEPZ/t09nfeci3R3S6S5IRdAhPoW2NPPc4nu+wKCJ80nDKHW/eM/
	vYLqbGM/1P6odV4vhYLAjANkrMedW1x+2TA+SQrypjN6OBGbJdyH2HO3owYPwDd2jm+9
	xrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1f3k1UZ2xEvyLJP8JKRTQF92/n52MCjZiVhQV1+sDbA=;
	b=Z6I/FtEB92RdSn4TVN19nhb4iWP89OaEJLwWCPaLJ+6zw9+e1wdPPh2StekxFKuiNt
	kEtCVzKkRhFy24oELXwznfbhsrw3JdoyxFwBhrYp+at/YdBMjI/TqjIidaifbNJLIbrr
	Pf20heAG++Ugt+y5Ny/CNE7tMUie/SBeZ3ZGBj1m21YKuZ/CPC51muBWgpdwHItGUmv2
	6ndQdLvYpWJK+A7E2j2hz2cfVX1ltDrDf7QOcn14MoPgRyy/8VhN2Zp+JHt+4QjvTXC3
	/i8FsPp3wfafZ1RvChYDGfgQGy0x7RR7Q51+4Z7CQRulA6D72lmetF5HMd0XaPBW2dzE
	FNXg==
X-Gm-Message-State: APjAAAWm2v9eMA//PUMa8VW7jDKPJh+tpSCtWAs/hUyeA8jsqhRgJNNR
	129Q6Wr7KZZwqTeZb5bceL9MYkB9sIQtdPC0Dn4=
X-Google-Smtp-Source: APXvYqwLwougtEE1y6RR35fAwmh2fbRmZ/uMtb4H/Sxv9M4uHzqRDcVQ5KTaWeH7k9MErIV1o9qY6lrfijwNv4yJ4aA=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr11323371qtr.378.1574374769391;
	Thu, 21 Nov 2019 14:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20191121182105.2803314-1-raj.khem@gmail.com>
	<b7d34d41f90f560b267015c7b43cdc96e7e5ae49.camel@linuxfoundation.org>
In-Reply-To: <b7d34d41f90f560b267015c7b43cdc96e7e5ae49.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 14:19:02 -0800
Message-ID: <CAMKF1srcupKbcmPfX5=xL=TKcDtxN+e2LEPaCBBZwCbxLSySGA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-bootchart: Add RISC-V support
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
X-List-Received-Date: Thu, 21 Nov 2019 22:19:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 12:46 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-11-21 at 10:21 -0800, Khem Raj wrote:
> > This is a partial backport from upstream systemd
>
> Partial in what regard? Its incomplete and doesn't work? or we don't
> need some of it? :)

Upstream code has been re-organised before risc-v support was added to
its mix of two commits
primarily
https://github.com/systemd/systemd/commit/171b53380085b1288b03b19a2b978f36a5c003d0

https://github.com/systemd/systemd/commit/680a752c834aba1b66449d34f17dbe37e040f6b0



>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...itecture-Recognise-RISCV-32-RISCV-64.patch | 45
> > +++++++++++++++++++
> >  .../systemd-bootchart_233.bb                  |  1 +
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-
> > bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
> >
> > diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-
> > bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
> > b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-
> > architecture-Recognise-RISCV-32-RISCV-64.patch
> > new file mode 100644
> > index 0000000000..5e89195915
> > --- /dev/null
> > +++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-
> > architecture-Recognise-RISCV-32-RISCV-64.patch
> > @@ -0,0 +1,45 @@
> > +From 4a6ace0a965965ea15e88c3418c7158ca5cc9f8f Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 21 Nov 2019 10:12:05 -0800
> > +Subject: [PATCH] architecture: Recognise RISCV-32/RISCV-64
> > +
> > +Upstream-Status: Pending
>
> So it isn't a backport?
>
> Cheers,
>
> Richard
>

