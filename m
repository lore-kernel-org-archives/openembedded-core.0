Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CB7A8605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 15:27:14 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r129so170405517wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 07:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aX3AIPnEKPGMeW1N/roHHdEls3VcB713pj+1qqNagl4=;
	b=HoYC3Inb+C68jBtryzIhSCH2DKkYK2SQzdG/TjQPbzKOp8MrZBtDs7EoB+wDi4acSX
	EPl+rK57ePViw4pFu/C3vwn+VnX18Xnn7asqpDIwdpdUDN+GvFOirDdy+lEa5gK5rMqt
	RVr8LzwgQQt0sTdCeG3fFHFIUN64LzjmTa+FQda1pwGNr3Qr6U/xuf1FtkKm/JlqYw2t
	kMtSkXTGYq4+HZHhdJxQVj3pOPi0DO816oZGqmie8OSsKbboy1fPjBtqEvFxfbZtgzq2
	Y9Uf6ds7IjyXZ6bvNyFU47+Z0yv4oyONJK9Ea+l4VMS/zE5e4ZpgOQqEMA7uKr3Nr71U
	YtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=aX3AIPnEKPGMeW1N/roHHdEls3VcB713pj+1qqNagl4=;
	b=gkBXf7Gg4iWZARaBKGEvpR6/n1C+CuGPi6RDSq4pdwLqvi8xjs4CI7fJf68N9R9sU2
	d6fP4EJ5/yTBeVARgLKfflOkgaCq8qVRngIeUY+OxQ0vO4JgSNK7tON/uw/G6d6GTOT4
	6oNuCxkZ1VAgfgoyBnX3KkIoLJEOEHNMd648ch4EcxbW0Wr0Pw/rUOlHUabrWuible+T
	s7KWjcp2zfht/q+2QhrjwvDYMiMleoOZyHlv1w+Utjr8+pu3Mb40FkpYCtNROn3+C1g3
	Z/WB7d20dRw3bpjFHqUNZpu+kDxGMPe1DtJ4r5Abw4lLngUO1An4CC+JA20WbvAYLSsh
	/X0g==
X-Gm-Message-State: AG10YOTUJ5hgiuSq8FEu2lFv8rxFlZcSMqfydJULk3IqBhjJ2zkomNXVJCeYYZcW2xIdOw==
X-Received: by 10.194.52.8 with SMTP id p8mr2532511wjo.62.1454513234822;
	Wed, 03 Feb 2016 07:27:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f205sm8450389wme.4.2016.02.03.07.27.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 07:27:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Feb 2016 16:30:24 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160203153024.GC2567@jama>
References: <1454495408-23334-1-git-send-email-maxin.john@intel.com>
	<20160203150256.GA2567@jama>
	<20160203150847.GB20736@mbabyjoh-mobl.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20160203150847.GB20736@mbabyjoh-mobl.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Wed, 03 Feb 2016 15:27:15 -0000
X-Groupsio-MsgNum: 77463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline

--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2016 at 05:08:47PM +0200, Maxin B. John wrote:
> Hi Martin,
>=20
> On Wed, Feb 03, 2016 at 04:02:56PM +0100, Martin Jansa wrote:
> > On Wed, Feb 03, 2016 at 12:30:08PM +0200, Maxin B. John wrote:
> > > We need machconfig file to automatically choose between physical and =
virtual
> > > keyboards.
> > >=20
> > > [YOCTO #9027]
> > >=20
> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > ---
> > >  meta/recipes-bsp/formfactor/files/beaglebone/machconfig |  3 +++
> >=20
> > I still don't understand why beaglebone specific file should be included
> > in oe-core, all other BSP layers are providing own machconfig for their
> > MACHINEs, why should beaglebone be first exception for oe-core?
> >
> Apart from what Ross mentioned before,

Is this for oe-core or meta-yocto-bsp? The subject doesn't say which and
path looks like for oe-core.

And if it's for meta-yocto-bsp, does it belong to yocto ML? There is no
README in meta-yocto-bsp root.

> commit 76b1d595cd7104797495067cc8c59db631edb75d
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed Mar 26 15:21:10 2014 -0400
>=20
> added beaglebone to meta-yocto-bsp. Before that, ARM reference board was
> beagleboard.
>=20
> commit 7254dfb642cb0262c7e14ef2a4c8a7a42afada60
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Fri Mar 28 18:07:01 2014 +0000
>=20
>     Drop beagleboard, replaced by beaglebone
>=20
> > >  meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 +++++++=
+++
> > >  2 files changed, 13 insertions(+)
> > >  create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/mach=
config
> > >  create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/mach=
config
> > >=20
> > > diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig =
b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> > > new file mode 100755
> > > index 0000000..ffce012
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> > > @@ -0,0 +1,3 @@
> > > +# Assume a USB mouse and keyboard are connected
> > > +HAVE_TOUCHSCREEN=3D0
> > > +HAVE_KEYBOARD=3D1
> > > diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig =
b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> > > new file mode 100755
> > > index 0000000..56777b6
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> > > @@ -0,0 +1,10 @@
> > > +HAVE_TOUCHSCREEN=3D1
> > > +HAVE_KEYBOARD=3D1
> > > +=20
> > > +DISPLAY_CAN_ROTATE=3D0
> > > +DISPLAY_ORIENTATION=3D0
> > > +DISPLAY_WIDTH_PIXELS=3D640
> > > +DISPLAY_HEIGHT_PIXELS=3D480
> > > +DISPLAY_BPP=3D16
> > > +DISPLAY_DPI=3D150
> > > +#DISPLAY_SUBPIXEL_ORDER=3Dvrgb
> > > --=20
> > > 2.4.0
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
> Best Regards,
> Maxin
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlayHQ8ACgkQN1Ujt2V2gBwuqQCfXO9Op/lJ5up6/Gea38jp1Aor
My4An3HryxV5pqIQsMtn/+MGQ0YgJggP
=jmhI
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
