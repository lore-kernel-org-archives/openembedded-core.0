Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2833E7DBBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:36:57 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n15so6040346ota.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=//n+4N36Xder8+eUKi3kT6WnZ69rThp/CPUtVEFxBUc=;
	b=BVzKH4JLxKlWICGDl0lyeZvR1OE4Qm8xlniGIX81CFDGnc/E1SfKwVwUPC6Vuszv8j
	k3cwFZ3qL4GV7+KbPKeSSs/1IBn/YJo6z17bTYGZsTmXHqLAk1dYDBL+qPSs8Civxr5d
	4UxXra9L40VxvYhuIRpND7CNzxJl2myzbooocGzpEWB/2nTi2epRBsHKdeABpo2t1cwG
	3te+pNXd12SK1V1xVNVy63AZSdyk16P2wqmrFJksonS6D3UPWK6Qwt9vbh4+Z53qjUKh
	LrET9WroXdhIuParwY+986eIM+wDjrCucezTrlb8egW0OgA6VtyZxM3kggQ1yvm9tAYc
	8DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=//n+4N36Xder8+eUKi3kT6WnZ69rThp/CPUtVEFxBUc=;
	b=uMxWYKZa8RvVR3tHI4XB/c8vYGAR8BaRMCMIvLrYmVP+g3BVCtO43hCnQWvj0TNDrL
	a9Exlg7OXNYpztNpveDrkgtrtWEk4IG9fi315U1Anjv7CIQ0WURwZOt5ARys8oCvkvSo
	e/9LdkEu6Fsp7Ejia9nMeEnealIV/an8EUTZbGcP8ZZKxzEd6SBf8l/WrQYkwFG/w9Ab
	xigVGsd4Yx3BurmxW0XclL2wA1w8WKLl4ZhO39KPXaJ8IRgH/AIfzuIuhYdd1EUWnBwW
	UTLDgP6geV23Udj7F8BTa/g22hd9btrhGWvgPciwl6vTJjpVdosFfrNharr/9hLwtSJ3
	MPDw==
X-Gm-Message-State: APjAAAWzkvKjHMAPMae4DLI1g45p/pwTz0vqGvL1FQem4PgxH6QENSEQ
	FeVIWy3bvAmOQ1Kv6n8INmPiMIqAPVe8zsykscc=
X-Google-Smtp-Source: APXvYqxS12CpoKuS7y6IfLgOqijK9NzH4qz0TxCqWyr2PJBZTGq2kWDhPf+hNwP0YoySvyvOTn/+ERdYlyHdnwGazyI=
X-Received: by 2002:a05:6830:140d:: with SMTP id
	v13mr11690922otp.293.1556635019005; 
	Tue, 30 Apr 2019 07:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190430115323.25661-1-m.felsch@pengutronix.de>
	<b3208cdef64483f1f5f9bb3f334374f3f9f95e3d.camel@linuxfoundation.org>
	<20190430141941.6ninp3i7xgg24g57@pengutronix.de>
In-Reply-To: <20190430141941.6ninp3i7xgg24g57@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Apr 2019 16:36:47 +0200
Message-ID: <CANNYZj_ztbH+onUYai_Z=8snDp2TC2KsBMHoBui6xVO1mfa+1w@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: fix imx gallium driver
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
X-List-Received-Date: Tue, 30 Apr 2019 14:36:58 -0000
Content-Type: text/plain; charset="UTF-8"

Info is here:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

Alex

On Tue, 30 Apr 2019 at 16:19, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> On 19-04-30 15:11, Richard Purdie wrote:
> > On Tue, 2019-04-30 at 13:53 +0200, Marco Felsch wrote:
> > > Since commit [1] the imx-drm driver is covered by the generic kmsro
> > > driver. Unfortunatly we need to patch the autotools path too since
> > > the
> > > switch commit [1] missed some dependencies.
> > >
> > > [1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
> > >     41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  ...Fix-imx-autotools-build-dependencies.patch | 46
> > > +++++++++++++++++++
> > >  meta/recipes-graphics/mesa/mesa.inc           |  4 +-
> > >  meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  1 +
> > >  3 files changed, 49 insertions(+), 2 deletions(-)
> > >  create mode 100644 meta/recipes-graphics/mesa/files/0005-Fix-imx-
> > > autotools-build-dependencies.patch
> > >
> > > diff --git a/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-
> > > build-dependencies.patch b/meta/recipes-graphics/mesa/files/0005-Fix-
> > > imx-autotools-build-dependencies.patch
> > > new file mode 100644
> > > index 0000000000..6cefe70bd8
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-
> > > dependencies.patch
> > > @@ -0,0 +1,46 @@
> > > +From 3e2aeab89fdbd0572d635d3a57a54f3fb99af254 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Marco Felsch <m.felsch@pengutronix.de>
> > > +Date: Tue, 30 Apr 2019 09:45:26 +0200
> > > +Subject: [PATCH] Fix imx autotools build dependencies
> > > +
> > > +Since commit 41a0acd6 ("Switch imx to kmsro and remove the imx
> > > winsys")
> > > +the imx-drm is covered by kmsro. During the switch some autotools
> > > +dependencies are missed. Autotools are marked as deprecated but
> > > since
> > > +yocto still uses them we need to cover this.
> > > +
> > > +Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >
> > The patch is missing an Upstream-Status: line.
>
> Sorry, it is my first patch for the oe-core community. What did I
> forgot?
>
> Regards,
>   Marco
>
> > Cheers,
> >
> > Richard
> >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

