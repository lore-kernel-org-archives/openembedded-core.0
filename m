Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8146A7C723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:55:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r201so5910619vsc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7huipc3oiXQEBDkOfkkjP24/tiCV41BmsRWDahSEgs8=;
	b=M7LnC1fJin2lFsFdQc/wa6ci5KP9tz76BBBaSmB3d8Ub0effLqiZvsq61d2uCxr/CH
	gXULMPuupOsKJ9s+Zvt5O7w1VxViaaozHuXJDiMab6QQnyxicybSkylJL2FvIxFBYEQ2
	mgvIpfuYiAh7vtc69gQT6wN01M7vjpM+5R/+lb1cTyRL8YysQtAtrYvpaVhpLrU9beOx
	WX6Rp/Od9YH2Ek6WQQWi+k4cfjxQENbJ2/LgPymdm7Oz48oU3mj+6m2mPkE21AuHe0WV
	hqjcxK+9eXFtyhah2T6bB3g0bDVWenmuhNf9yvbJuC8ArbVFOztiwnCfjilE6iBPbbme
	ksTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7huipc3oiXQEBDkOfkkjP24/tiCV41BmsRWDahSEgs8=;
	b=k4AHccmDT9r/U5Fj4knfX35pMNA8FgPiHTqE9ajtgVd/HSAU4eaXeM/nRMONH+l8th
	CgNGs62WcLkm80lxxmtljFInR5isNihHn37VjitnCvOdsCkmQAPhe8bjiIHRL0aeI+gE
	m7vO2e564GJ4ct5PMlbBK4qJhZOWB4w/RPoe8Ty4TR2wHq/yA2dCr2XQ96WZ1emw/ua9
	85mgb8/Ssg4XZ3bTxBhb9v5wZudKVlHS+cBfvSnRyM/8hZt0Z3bArnAWKydjOSwZIHUv
	yGcqtULvqhGMH5TpD31vgJjH1iXKWnUbobMLS5Zi5oBO+R3Zje+FP24WwfPoObaRKCQL
	sEfw==
X-Gm-Message-State: AHQUAuafD4BYM+Y3PTAyGghVjxzXRcllM/Le77aey5YDBCsGsI3Zxtnm
	+F+WmZg/1QQKEnqpzOWN44vQC61k3VUiUod6T5o=
X-Google-Smtp-Source: AHgI3Iacx1PU5z0L/E8uTyE6YTbfGgmoDCU3jhndyB/7m8MdAkLBD6CyBJmCl7DeQsgAB33AmdBgRkLYFA/0dh/vdd8=
X-Received: by 2002:a67:7d06:: with SMTP id y6mr5250409vsc.22.1550242540330;
	Fri, 15 Feb 2019 06:55:40 -0800 (PST)
MIME-Version: 1.0
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<CANNYZj-7Qe3-NwsBZKtmP9iyqsvQm5QP6gQzf9YU_-XYYs5_yQ@mail.gmail.com>
	<1581437706268e9141366523e891a9625a3a453c.camel@linuxfoundation.org>
In-Reply-To: <1581437706268e9141366523e891a9625a3a453c.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 15 Feb 2019 14:55:28 +0000
Message-ID: <CAO5Uq5Q64Tf8=71TU69QFvSZVp272rtTpgtBfjDzC=c7jEh22w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Fri, 15 Feb 2019 14:55:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 11:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-14 at 22:17 +0100, Alexander Kanavin wrote:
> > On Thu, 14 Feb 2019 at 22:10, Alex Kiernan <alex.kiernan@gmail.com>
> > wrote:
> >
> > > +PV .= "+git${SRCPV}"
> >
> > This is unnecessary and adds clutter. Just the plain version number
> > is enough.
>
> If I read the original commit message correctly, it is necessary as the
> version is 3.5 plus a bugfix?
>

Yes it was 3.5 + a bug fix.

Ignore v2 that I sent!

-- 
Alex Kiernan

