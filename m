Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67DC779D01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 17:57:47 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id q39-v6so25862856lfi.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9QhfA9mDcn8LYkrAdjwfRIKJV+qEfgMWqOxnpf/bXa0=;
	b=drJaN0i4ST35anCCKmZlHD1djDP8tmz/Th5DHGE6ROM3ngkz3f7AQ6nWZlAnpzQoM7
	ICPEVKlHGTDgr0M3sJX5dY5jeuNfQ5CtB9UkUPnKbEfBVAtJuAtE5/3Wzhwttp8G8w5A
	yCEsd5F/Nz+OH0N9LjckN+qf2DCtfoKeh0etSXXQu28gi/7G0DS4CYZxGUUR0uK0u/Bm
	ecrWbDXzr77NJ9WO0BgsdKVGzHzZClgcvteV6d39FJ2UAJv5z/82gzj1ltk3As5Og6Bx
	FSkixiGnKSnEDyefXKoz6Z1mmRmYaUQYhiiT9PABiiz/q/3uwmj3jJS1anIUhL6A0z2V
	JfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9QhfA9mDcn8LYkrAdjwfRIKJV+qEfgMWqOxnpf/bXa0=;
	b=lm7GZb1T99c9e9O70+dKSyg+YyFUS0GUHlJfs7E/VFO5WI8zz1TYKoIMNcK5nBaI5m
	DGbgszBi6n/8LheEHCCnWYREr38JbmTcUQPgRMuLCXQMxjDfzgNVlAuQUCYkJv5izK05
	fg0eOdz9QEsO10D+y4+HhbAgNENd+NinSPWj87ULgWZuQJ/JB0xSWKH/HQgHIVSCBVeH
	gesLcmLSTbCPsFTWw8ILcDktZYQJK9GKsi4TteP5OtEiBa9dbK9/kP8dxZ69fmUyMvEv
	XIW976lTD3MwFocxNBfl7t3xbU1ni4LTMPVEbnzCQSUN1c+AD7TvD8wOLk47J6ch/82N
	hTeg==
X-Gm-Message-State: ABuFfohVRbPpX3+9FAfij4IEbfoeLnPc3JIxNK16W82X9xMt0dbWFirq
	+4SVbpBtSCc7cWOAQk6cNiQfwp3viyscon6IpeM=
X-Google-Smtp-Source: ACcGV6275yJNE96STu/69pGnl2f2QjvgwffM9QZhEJbDONNPzRjveRSB1/gZrYwwyCu1WITWGt/FwHqYeM5QPspmoTM=
X-Received: by 2002:a19:290e:: with SMTP id
	p14-v6mr3802859lfp.85.1539971867890; 
	Fri, 19 Oct 2018 10:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20181018152215.23525-1-danismostlikely@gmail.com>
	<fa65fef901b5056d730703ce1c01a1594b2dc37c.camel@linuxfoundation.org>
	<64558ddd-8865-a96b-cc19-5c0e6d270754@windriver.com>
	<ade6aec7-e193-bc8e-531f-811a17cb6bbf@windriver.com>
	<f595aee61f3c533f9d08152a2b3c896a9a4e2f16.camel@linuxfoundation.org>
In-Reply-To: <f595aee61f3c533f9d08152a2b3c896a9a4e2f16.camel@linuxfoundation.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 19 Oct 2018 11:57:35 -0600
Message-ID: <CACS+7ZTer-N21JisU61eobS65NhcFZ_dBqSPX6+iT42Vp_N_Zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Fri, 19 Oct 2018 17:57:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Oct 2018 at 11:28, <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-10-19 at 10:23 -0400, Randy MacLeod wrote:
> > On 10/19/18 10:18 AM, Randy MacLeod wrote:
> > > On 10/19/18 9:47 AM, Richard Purdie wrote:
> > > >
> > > > The rebase went wrong here. I'll try and fix this up in -next and
> > > > retest so we can figure out if switch_root really is broken (cc
> > > > Randy)...
> > >
> > > Ah, so it seems. Deleting switch-root alternatives, eh... WTF Dan!
> > > :)
> > >
> >
> > Oh, the oe-core commit log for master-next shows that Dan's
> > commit is fine so it's *Richard's" rebase. I rescind my humorous WTF.
>
> It was Dan's patch that was broken and I've now fixed it in -next ;-)

Thanks for that. Turns out I need to watch the commit log more closely
when I'm rebasing stuff.

>
> Cheers,
>
> Richard
>

