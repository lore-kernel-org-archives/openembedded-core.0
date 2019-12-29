Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 392706C1CA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:33:17 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id a2so13333560ybr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A8jvWbulu0fWJ+mVh6M8/+wH56byIJ5M4/wio2fNLCQ=;
	b=TgZOKJyNdu0nEqKeKyI6rTS+DyxXfgdK3xyEkl9EVrK5e3uuqxwQk04l6KeZpMxnhi
	SFNs7AnOXH1q/3tW2hGxlMhgZyxuNJUnPBpLGsWB1tSWYXejHEJB+70pvmIjp86+mG71
	prBmpuUibA6J4MGcnP40cNZYSpDdAT34goWwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A8jvWbulu0fWJ+mVh6M8/+wH56byIJ5M4/wio2fNLCQ=;
	b=lh6jQWE2upOXrYXfpl+Y9/KQ+zUKrNFbmWuEM76sJle8td7ojcRxxl849Vwh5iukTy
	UZMQ/d4Ej8xbN/F28hBoSxJrLn4iHS11+ip1+XVJa0iZsK5NgvRny8PqR5nmcEnfSZbv
	7467DxVFey/Vrr0pNpsI69zlgVMBKGf7/MRPyEOm6WJyPkrOhM0k4DOvi93c7kbzhVKX
	Y1d4lIo75QnArQUkFAQB9wRCH1DqdccHlNZwtLkjc9QZCSubmJBvBw3JEZoNyge77VP3
	C5K+S7r6xYpRq/RF9HMJBsrvL0g4AYltSwHrC/8+V5u9Lc0TeRqrdvZoJwT+bZ6Aio7R
	52RA==
X-Gm-Message-State: APjAAAXRqifQY63dFZ/qIkGPzQ4bPiz3T6/2IKZsLEDljV9RQVAhWrJt
	EGJJ8+XboXBqi2Amtff7CnuH4w==
X-Google-Smtp-Source: APXvYqwgsuqBZatKZQCliynUKa2rBH1CvxthUcGEDtXVp5gSG3GeSaeyeBzaHNBE/iR89xnMPq3vtQ==
X-Received: by 2002:a25:d083:: with SMTP id
	h125mr38827110ybg.158.1577644397995; 
	Sun, 29 Dec 2019 10:33:17 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-8c87-7128-1bfe-2c2a.inf6.spectrum.com.
	[2606:a000:1401:86dd:8c87:7128:1bfe:2c2a])
	by smtp.gmail.com with ESMTPSA id
	189sm17017394ywc.16.2019.12.29.10.33.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Dec 2019 10:33:17 -0800 (PST)
Date: Sun, 29 Dec 2019 13:33:15 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191229183315.GA4866@bill-the-cat>
References: <20191224224135.20121-1-alistair.francis@wdc.com>
	<8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
	<20191229134620.GW18106@bill-the-cat>
	<CAMKF1srQ-4+9rvWWAsG3XeXijNTuv2pYwsuLEPawqHUj3NY1fA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srQ-4+9rvWWAsG3XeXijNTuv2pYwsuLEPawqHUj3NY1fA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: sateesh m <sateesh0457@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Sun, 29 Dec 2019 18:33:17 -0000
X-Groupsio-MsgNum: 132923
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 10:18:54AM -0800, Khem Raj wrote:
> On Sun, Dec 29, 2019 at 5:46 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Dec 29, 2019 at 09:23:47AM +0000, Richard Purdie wrote:
> > > On Tue, 2019-12-24 at 14:41 -0800, Alistair Francis wrote:
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > index a0f9c41469..4799948bb1 100644
> > > > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > > @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM =3D "
> > > > file://Licenses/README;md5=3D30503fd321432fc713238f582193b78e"
> > > >  PE =3D "1"
> > > >
> > > >  # Drop this line when updating to 2020.01 final
> > > > -PV =3D "2020.01~rc3"
> > > > +PV =3D "2020.01~rc5"
> > > >
> > > >  # We use the revision in order to avoid having to fetch it from the
> > > >  # repo during parse
> > > > -SRCREV =3D "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> > > > +SRCREV =3D "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
> > > >
> > > >  SRC_URI =3D "git://git.denx.de/u-boot.git \
> > >
> > > Seems to break on musl:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1392
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1396
> >
> > Looks like the Gentoo folks hit this as well:
> > http://patchwork.ozlabs.org/patch/1211367/
> >
> > Can someone review/ack that please if that's the best way (rather than
> > reworking include/u-boot/crc.h) to deal with the problem?  Thanks!
> >
>=20
> this patch looks ok to me=20

Would you mind following up with a Reviewed-by?

> but I do have one question
> Include should be "compiler.h" and not <compiler.h> which would be for
> system includes, is there a reason to not do so.

We're not consistent about "" vs <> for headers U-Boot provides for
system tools, a follow-up patch would be appreciated.  Thanks!

--=20
Tom

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4I8WEACgkQh/n2NdMd
dlJ1YhAAhWKRsvJwQN8hLLu+U0L107neSoHko94vDCOUjn/3sq4+xURGHK1fb7Rv
68Ljh75rQwhra5y4OowoWRpRuMrLjpYALy9x2S2IXH2BCHhAtdJqJjuOSkK4zR4u
2n0lzQ9p09J0gdmbI77SBMnK0ay/hKUsOYvZkeeQoj6pU/gpdY3OJUr8R0kbuA8l
juByrIQPNBhcq/2QUMHXcGCRjiHwxDZKVN97aymAC7jTMiJMN2NalHcsgVu3xv1o
DHMTwqxDT3F677i4dmc+ztjRgb/I6ImgBBUSEcXvc+7vN3YjYsiBMmPss6zSNP4x
R2dCznSmJ8Q8KD/kRNoD+4xS0fOZuP4xYdVSJccYc6IWNg/Zo4u+VdQP3zLbd0Q5
/5D72xmWfKBg2V1mBG7Wf9Snt/DiXoQ7hl1Ra8qgZ/NOEGMO0fb2uG3Cbwmzgfpd
5ioMoxFepppknlYrhqZDy5QTmnmfZqZzR48xynSW/RLVKd+Cw74Sqqwx3bGVBR2V
nmZvdmi7N1Nupedr/o7rP++faFoI5hD4+to0l8Iix5lPnX9TGB5PeP7HocJQSMt9
gZ8oS46RFaRby0859PUoz2FXEdkqKQlgidvucXkAcABEUMQ3Sl+OymPscQsKYcK6
Dkyc4WJmrHGqsu2hbmn0YHorRfVMpgOB8d17e8zrUYzHL/bcEl4=
=PouQ
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
