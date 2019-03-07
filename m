Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0C17B7CF0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 21:48:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w6so19200974wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 13:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BnsdQMW0J7D0cwPotL9L/AKshpzpNBgz7KDn1bYpNRQ=;
	b=T1A628vT8cVSjNmlIt1x73yOgiB7KmFHOUagMaC19+vLtAWeZ/UNrpUqTVAvkVX4ym
	1z/KaqjzSdx8DKcT0LAnrngI6cUWOLWTtZwPI+kYvEAEAdk1RYpgfpezpi7obJEWNhW6
	HwWrr1LrNkOkGgeR4ibIdVzaTMqdW7ykTbgYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BnsdQMW0J7D0cwPotL9L/AKshpzpNBgz7KDn1bYpNRQ=;
	b=HO/IM2L9IfYm+0apN9m4svA3wQc1aEILVSpR7D9Jr43q0PO78p2YeA+Jcw+wJUIxsj
	59fLFhIM/RoP4irL4bx06UBl3WKAoS+UZuFGLhOt01QjY5+6wxBa74qcvO7M8BkBo12r
	4zpkjbZq9x8OuWnfaKk4kcAllLZj+xJKi965RmBL5Kju4/tu6vJTHxn4qEYaIbW5LXTm
	3ICjvwZrzPKxRTJCsY6vDNte/FHopJEQym2oaG+up96BUCvjK/51F2oyYzpmNOCA5xmi
	pTi2rBks8sxHimd1VAgzx8BtRaNZNb6DtTDxfWwR8mvHefMsUV754urZUwCiCW90eDXL
	XfuQ==
X-Gm-Message-State: APjAAAXms6WdiJEb1hVT5/w8UZiWXHoXRFHY5is5MgSlw20yCv1mRdqN
	Q47+xipbJWRcaMYlvSvCzzQoX4JL4QI=
X-Google-Smtp-Source: APXvYqx8rLVPwMP9qZKfdJUTCf64emqvFwBbeuHMx1Cr8Ddn5qgraHz/AcWMyBdqLnjPWHvO1BW9zg==
X-Received: by 2002:a5d:5506:: with SMTP id b6mr8092291wrv.33.1551995283650;
	Thu, 07 Mar 2019 13:48:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m16sm9951082wro.78.2019.03.07.13.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Mar 2019 13:48:03 -0800 (PST)
Message-ID: <87265d8970131474709a4589cdef7015fa72b87a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Mar 2019 21:48:02 +0000
In-Reply-To: <2dae498718e3aea65b65efe9fded89bcbbeae4bf.camel@andred.net>
References: <20190307142709.12076-1-bunk@stusta.de>
	<CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
	<20190307151827.GA16556@localhost>
	<2dae498718e3aea65b65efe9fded89bcbbeae4bf.camel@andred.net>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 07 Mar 2019 21:48:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-03-07 at 15:38 +0000, André Draszik wrote:
> On Thu, 2019-03-07 at 17:18 +0200, Adrian Bunk wrote:
> > On Thu, Mar 07, 2019 at 03:56:33PM +0100, Leon Woestenberg wrote:
> > > On Thu, Mar 7, 2019 at 3:27 PM Adrian Bunk <bunk@stusta.de>
> > > wrote:
> > > > From: André Draszik <andre.draszik@jci.com>
> > > > 
> > > > It looks like there is an implicit dependency on util-linux'
> > > > umount - as otherwise when using busybox' umount we see a
> > > > long delay on shutdown / reboot.
> > > > 
> > > > [YOCTO #13058]
> > > > 
> > > That bug number is wrong, seems only slighty related:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13058
> > > 
> > > Following the discussions, I think this had to do with older
> > > versions
> > > of busybox not ignoring the '-c' option that systemd passes to
> > > umount.
> > > 
> > > https://github.com/systemd/systemd/issues/7786
> > > 
> > > So, systemd has a dependency on *either* util-linux-mount *or* a
> > > minimal version of busybox. Do we support minimal version
> > > dependencies
> > > in Yocto?
> > 
> > Then the patch to master didn't make sense,
> > unfixed busybox is not a problem here.
> 
> Yeah, I did ask for my patch to be ignored, and there was further
> discussion
> confirming that it isn't needed these days. Unfortunately my patch
> still
> went in.
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2019-February/278893.html
> 
> 
> > If systemd needs util-linux mount/umount in master it should also
> > depend on them in older releases (both master and thud had systemd
> > 239 
> > at that point).
> > 
> > If it does not, it should not pull in such dependencies
> > unconditionally
> > in master.
> 
> Care to post a patch reverting it on master?

Going from memory I think there were some responses saying we should
probably add this patch regardless since we already needed util-linux-
mount. I didn't think it was a huge issue since mount was already there
and it seemed to solve some problems others were having.

I don't have a strong preference either way, we just need a general
consensus about what to do...

Cheers,

Richard



