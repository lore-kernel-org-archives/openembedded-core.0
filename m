Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id F3C547C85A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 22:11:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o10so2699100wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 14:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rRq1RBFG3MnBMi4z42ICkw4Ik8vjhi5/3rTGp3njs1Q=;
	b=t44v3H3j6jgHbCt0Eu4vLl9ubNrtZyirivenhq78y3nG/+bFG7TAuK65xunAd2rEiA
	C5Z5Fs8uou//kBGys9aDz3EoIOjpfALkdlUt5NJRclsFPvXsf0msO7kD4B9rm8kPkPdP
	gttGi9IGQzSMwudTstoUUZ62oJKA7uAmNQerUK9apMvkDwSpRPmtUPdPeWGLR7QyoIlv
	kI8SCFxNh23OoCa0SoOHf/i8xHpjSDeKFBZ5XE1eMHpATMyGLivhnWq8f95CEK4lVhT5
	1ABQI7mTkC8nJw98QTcv4U3t5ZL8VRnQ3w6Vtpo8OC35IjeYtyBp1INnbDUutnOEVYJi
	pX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rRq1RBFG3MnBMi4z42ICkw4Ik8vjhi5/3rTGp3njs1Q=;
	b=kaoDe3GavDIS4zyU4fZLUodFEfurFoqlREG3HI0drpxsV8gBFDxcQGW8jOTafu7p3A
	81BQm/wb83TaFHNcwm4sr5JXihzxtFYEBILSRUntr5Pij0Sz2Garhcwyc3n6edyxs9GU
	1e/axi6qraHMwfYy8mjQURnCsm/rIqNSvDK3Eif/PcDvtTrjEi+BUuoram0NNVE9CrJE
	DcbWBkLu8/39dZaylsLTNf0rifPsrveI1K3clVvoizHWTouP6Z0l49poSXszGCjQq7yx
	xbiQ31QbLj6WhiEHXlzO/Qt0P52ce/iudht5BSK2lkNH8xLqwwBkJjx4anTqkCKvzSZV
	JJRA==
X-Gm-Message-State: AHQUAuZCsXYAxFaUBnxGpcBuZe55UeqCLc07buCQoDc7H/2WleKIvWwq
	57UqjPc409fqJk41xmC7sCeO49X7DUTTMFEpBRwT05S1
X-Google-Smtp-Source: AHgI3IYDW5DhJ7yZH/xX1HobEmA3VHQ/PocaKTqxipVsucL00c2ZQWogWYHOA/jRbIqFmiUBbi6Dhc/K2Sy5i4tGSXo=
X-Received: by 2002:a1c:a004:: with SMTP id j4mr8888390wme.143.1551651107463; 
	Sun, 03 Mar 2019 14:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
In-Reply-To: <20190303212515.GL5026@bill-the-cat>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 3 Mar 2019 16:11:36 -0600
Message-ID: <CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Sun, 03 Mar 2019 22:11:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 3, 2019 at 3:25 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Mar 03, 2019 at 03:21:12PM -0600, Joshua Watt wrote:
> > On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > > Hey all,
> > >
> > > As part of the packagegroup-core-base-utils series I noticed that
> > > with rm_work enabled like I usually have, every build was starting over
> > > with rebuilding linux-libc-headers and going down from there.  I
> > > finished bisecting this now and it comes down to:
> >
> > Just for reference, are you trying to use hash equivalence? It sounds like
> > not, but I would like to make sure.
>
> I am not.
>
> > Also, it there an AB build that uses rm_work that would have seen this?
>
> OK, so I see I forgot a step that was clear to me, but, uh, not in the
> email.  What breaks is for example:
> bitbake core-image-minimal && bitbake core-image-minimal
> That second build, rather than see "nothing to do" (or at least, almost
> nothing to do) says "Oh, I need to build linux-libc-headers from
> scratch" and possibly other stuff too, but that's the first thing I
> notice.

Ok. I've started a build to test it. Would you mind opening a Bugzilla
for it and assigning it to me?

For posterity, the poky commit SHA is adc37721a86c

>
> --
> Tom

