Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 047E07987E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 15:00:47 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w14-v6so5313586plp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tiyNVEnAopmXr8DAmOElEodcke+cCSypfPyLY7p5eHM=;
	b=tpnfQ3aBah4YjO0cqdiE1AB+HeDw8kKKKxpTTQE14LPEJoYXnhx2SnG/JvpFjklsJe
	A2gzHiEnzGkqVZjLxlFXmSOrsd4LEgoFazMrrNS47K2n57AbLzv/aI5EnuvPPp1pGd+W
	C8a/ii3GFW+XSb8gbvI9mzWxeAeAxj4GVsMisfWEErPvaMuGJxaD9shT5OZTWal5O17v
	10Ghm70V12uzotoWSkv+8dN3c4jyU/6xJKCcqY6dK1jZw2r3eZ8t8E6kaCXx/VhXv+PC
	K4eTawAt1fZ90ZONI7TVrScgapfnRyl5XvSqX9MGXPq3KMiLXg71+Hr0+0uwYlotfJVT
	GwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tiyNVEnAopmXr8DAmOElEodcke+cCSypfPyLY7p5eHM=;
	b=beIFmwJk7WsPg7pjr4qEJ/4vaPCmozcg7VdkCHe1nBhqEDqLl+AAdaw9KguJgI+XDJ
	TwOSUVhhy/qTqsEr4ZkK7Wq42Kop04F0nZA+CIgJ+NeFzjUQOxfnAuufJluTKaU0VebW
	AfGC8wNREjFcvoQ1tZ4b9rzZW8Q2zjbbZHeSrjGFMcIOgpNFgHIz49Yzlu10Hbln+ROO
	V3qbMYK+/7MuoJIm4MWew461dZNlCSGJoJAnL7DnSZssXsoVAUL6QgRjnPEwLTfBJTMT
	crbJQma3HrfneagBC91xQGdmU4yAdKnG61/iUg6KiQl7RSvhNngo1tEFvBYLtsKpl1lJ
	IqbQ==
X-Gm-Message-State: ABuFfohLrekxyqwot+GV5KePZSCBfFlLUabtfkaG7/f8yf0KepENWXKJ
	8oiTbwEz9NtK2p2pPLgLPQyynAp2SLyXd3F53MU=
X-Google-Smtp-Source: ACcGV60zbMQIYtepfEwYfyaLjY8FxCs+jrCn9J7tDT1ypBu1ydPxu8E6bBgSOHxH6kdZ+6q1lfrk68wo2DXCQIqu3Ic=
X-Received: by 2002:a17:902:9a04:: with SMTP id
	v4-v6mr6954965plp.247.1538665248994; 
	Thu, 04 Oct 2018 08:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20181004132953.3568-1-angelo@sysam.it>
	<CAJTo0LakckQ+=uGaP9Nf-Mg4i53=7w4FsuhGY7bC1Tv3t7HNSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LakckQ+=uGaP9Nf-Mg4i53=7w4FsuhGY7bC1Tv3t7HNSQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 4 Oct 2018 17:00:37 +0200
Message-ID: <CAAQYJAuqPbFn+fgkFessQC2WCZ+m6oxb5f3RqVURV0nZVYcegw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, angelo@sysam.it
Subject: (No subject)
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
X-List-Received-Date: Thu, 04 Oct 2018 15:00:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 4, 2018 at 3:55 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> I'm curious: the data sheet for the processor you mention in 4/4 says
> that it ha 64K of RAM.  Are there other processors in the range, or
> have you done incredible things?
>
> Ross

Heh,

64K is the internal sram..
There is a sdram controller DDR2 and a 32bit FlexBus bus for ROM/RAM
so I bet there is more...
Cheers
Andrea

P.S. I will notice right now an old m68k acker...

>On Thu, 4 Oct 2018 at 14:30, Angelo Dureghello <angelo@sysam.it> wrote:
> >
> >
> > This patch serie adds initial support for m68k architecture.
> > A Linux kernel build has been tested successfully using a local
> > meta layer, or kernel-yocto.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

