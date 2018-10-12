Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A69FC79AD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 21:47:53 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m8-v6so8549283qka.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XLP2T5Lc6NnkoZ70LaWHv7osaVKElbv21qWvgxbM3k0=;
	b=rwpInThlkTccDFKeWXOuT2ax5ELVYoj5aQ3OWOKf/KfgCGOrNvnJZnH/NUfywv2Im3
	zBAD1WAcNrtS7ZLPZJLKC3CD1krgjkZ5mw6DdgrJ3gf7rI+Pu/KlVGAMiEGC7TpbMrke
	rgJHWpFMkRu8/zvbT4cFBIaWiismvp9KYACko3xheui3mjZoEsk7Mj2r8N3mFc467UYZ
	0Nx/25xlTNCR9MhAJF5bD2JIGbPBogd4RZRV/91E6uGwXOaBMaIjwNljnwB+0RIq89HA
	GJ8LvXLGsLvT0NPPzL1ZY3saw0F4KypXipbQ4JxJH9WAATQCJg7cxXHA9ilZMS04KNz/
	xl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XLP2T5Lc6NnkoZ70LaWHv7osaVKElbv21qWvgxbM3k0=;
	b=KsmADZVGLBBPDNEDY/+jX/4KOhXVzBfdheqReRLEg45OWYAUkU+yNUTOAJLbyM9tow
	DU6NpbRo2V2N8w57pWKGckzFs7giTy3s60OXNRyOw110hWHDa0STGJ9Qhuhi7LyEdmRU
	GK4usrz1RCGclaXkwUhZD/ZGXjGoK9+9urVbgp4Pkyrj6V0nyY0lYF+/PspT827E84Qa
	ZkJE2WkH9L+4BqhBacZAQJiP8hWczkBpKdvNBRMVHkC0bzMn012xWbZR71i1XiwwBrZ6
	W+nzrLkbxtgppBcgsAuhw30+3Jvdtj7egLfbEygP8g8Kdfd2epSffdkKFjAtK1hNPLO8
	2bYA==
X-Gm-Message-State: ABuFfoitNuXfwBkxeQx/ZRoo07ZDGqkN/KUPtrutGK43EljUV80F68QD
	2Dmied2Ym8DAB+S1bAqsyenrTSSW3pMtj6TN6RQ=
X-Google-Smtp-Source: ACcGV61JgwCQsdB63AXb7lBUPPeipkS6tp9lDuaCfw4dGUj4Adw/ygVeNhgQXO7sQx8/5yYVCWFr218oBIFw78ZXFOI=
X-Received: by 2002:a37:31cf:: with SMTP id
	x198-v6mr7351940qkx.206.1539380874126; 
	Fri, 12 Oct 2018 14:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20181012202823.4003-1-raj.khem@gmail.com>
	<CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
	<CAMKF1sqEBLiSmzJALVmvRep0jzAGpgqtuZZVaoWu69D-X3dktg@mail.gmail.com>
	<d33798973eaad929a0ff674b3651c985ee684f36.camel@linuxfoundation.org>
In-Reply-To: <d33798973eaad929a0ff674b3651c985ee684f36.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 14:47:28 -0700
Message-ID: <CAMKF1srGfJ8C38hRe=GcpCMRspUkTCwK3j4WgrPZ=eBcS_tiBQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 21:47:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 2:42 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-10-12 at 14:13 -0700, Khem Raj wrote:
> > On Fri, Oct 12, 2018 at 1:56 PM Andre McCurdy <armccurdy@gmail.com>
> > wrote:
> > >
> > > On Fri, Oct 12, 2018 at 1:28 PM, Khem Raj <raj.khem@gmail.com>
> > > wrote:
> > > > This does not work and is unsupported so lets compile glibc in
> > > > ARM mode
> > > > always on armv6 SOCs
> > >
> > > Note the comments in glibc-collateral.inc:
> > >
> > >   # This needs to match with glibc.inc, otherwise glibc-scripts and
> > > glibc-locale
> > >   # will fail to find main glibc, for details see
> > >   #
> > > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
> > >   ARM_INSTRUCTION_SET_armv4 = "arm"
> > >   ARM_INSTRUCTION_SET_armv5 = "arm"
> > >
> > > Either the two recipes need to be kept in sync or the comment no
> > > longer applies?
> >
> > I think we can delete comment in a followup
>
> Looking at the link I'd have said that issue still applies?
>

I am not 100% sure, thats why I wanted
to check and come back with followup
if update was needed.

> Cheers,
>
> Richard
>

