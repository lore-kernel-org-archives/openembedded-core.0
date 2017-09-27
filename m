Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED9C71CA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 22:17:40 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id u205so10329431ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 15:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9TSL0Drln9+9nFJKKy2+MnD/WczeYEp/5wx5VKoyVNI=;
	b=VEpUTyQH/PR7UO4IAHclZGawj6iM5itFaQ49tzSEuDKtbJK023s+DHkezjiWRG1/HK
	MciPLaP+u3i40M6wn5e51y/87xGciv8qEptkxhe72vSvj5xgWXPyDL3rVwx21hw0+1Cx
	ntiaEznmJEX+7aamDA+GSNVT+DqjSir1ePNnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9TSL0Drln9+9nFJKKy2+MnD/WczeYEp/5wx5VKoyVNI=;
	b=bklsinm6K5G8DwUE5YPwSnYTcwGnYuuTuVNicKEljWfqx6YlWBigJllUEUWOUENK6M
	OhbKJqTUoGvTJjKa/mlSTaeCyQjX35DQn76C1XHsu6A3+GOAgw911/OKGkGIrVfHy9Hd
	pTrvq1KoYQ/ScjS+Y9a0giCZFOI/XN0lB43olU0kC4Evti54vWrcfaG9aExIqtucUZMU
	xMUt3bAmYDY+oETPSpw4RcrPkrDH5QYMj8nfuxaCvpm5N7WpDYYDmXMqskY5LJ4yB7Oy
	Z8pjojeRAlKh2uxCUcWA68zpJC2qv5yyrOVU36h3ynei39jdaexaIQDw7i+VcYEiIYhD
	nyJg==
X-Gm-Message-State: AHPjjUg3aTKsi621CsRTab/hHigZzd3ffYJxSefhLeTze+WlxaIL3nr6
	9ft72ZWmBRuEbsBmeqpuQ3tJNw==
X-Google-Smtp-Source: AOwi7QAt+Gf6N7Awfcun9kG5VunoyobLwzlS+kwYmI6KdR8mqBeZXExm/fLiQoJ8VkJj7HkEeX9+GQ==
X-Received: by 10.129.86.212 with SMTP id k203mr2017989ywb.155.1506550661771; 
	Wed, 27 Sep 2017 15:17:41 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:a523:8806:2b32:ed54])
	by smtp.gmail.com with ESMTPSA id p188sm4271ywb.53.2017.09.27.15.17.40
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 15:17:41 -0700 (PDT)
Date: Wed, 27 Sep 2017 18:17:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170927221744.GE3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
	<20170927215300.GD3112@bill-the-cat>
	<CAMKF1soatZ5fjbaD6fWmXN7nyw+Hz1T0QJDj176_W6Vrx5LoXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soatZ5fjbaD6fWmXN7nyw+Hz1T0QJDj176_W6Vrx5LoXw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 22:17:41 -0000
X-Groupsio-MsgNum: 103435
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9hzSyicXuByfNYJd"
Content-Disposition: inline

--9hzSyicXuByfNYJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 10:14:51PM +0000, Khem Raj wrote:
> On Wed, Sep 27, 2017 at 2:52 PM Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Wed, Sep 27, 2017 at 02:01:43PM -0700, Khem Raj wrote:
> > > On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini <trini@konsulko.com> wrote:
> > > > With RSS we need to ensure that when making a bmap image that the
> > > > python3 that we created is found via /usr/bin/env rather than the h=
ost
> > > > python3.  Otherwise we're relying on the build host to have bmaptool
> > > > support installed.
>=20
> Who is staging python3 native here may be that's where it could be added

What do you mean?  Adding whatever.bmap to IMAGE_FSTYPES is valid and
how you get the bmap file for the whatever image type.  bmap-tool-native
is correctly inherit'ing python3native which is why it's staged
correctly.  It's just that images aren't adding the EXTRANATIVEPATH
that's required because nothing is telling them that bmap requires it.

>=20
> >
> > > >
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > > I played around with a few ways to try and fix this problem, and th=
is
> > > > was the best I could come up with.  Once this is in we need this in
> > pyro
> > > > as well as it's broken there too.
> > > > ---
> > > >  meta/classes/image_types.bbclass | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta/classes/image_types.bbclass
> > b/meta/classes/image_types.bbclass
> > > > index 61dca626311e..3ff960e3a889 100644
> > > > --- a/meta/classes/image_types.bbclass
> > > > +++ b/meta/classes/image_types.bbclass
> > > > @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
> > > >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
> > IMAGE_FSTYPES,
> > > >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow=
2,
> > hdddirect, hddimg, iso, etc.
> > > >  IMAGE_TYPES_MASKED ?=3D ""
> > > > +
> > > > +# bmap requires python3 to be in the PATH
> > > > +EXTRANATIVEPATH +=3D "${@'python3-native' if
> > d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
> > > > --
> > >
> > > I think somewhere inherit python3native should fix it.
> >
> > Yes, image_types.bbclass could also inherit python3native but that
> > seemed heavy-handed.  There's not some other place that should be doing
> > it as the problem is saying we want to call bmaptool, and that's handled
> > here.
> >
> > --
> > Tom
> >

--=20
Tom

--9hzSyicXuByfNYJd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzCOIAAoJEIf59jXTHXZSnMoP/2800WscR3AWGUIYbbxWUNGL
Qrkh+pS7j/6UnhEvckT6nNTsGh5pohcEfxISA413Qz8eEAqDak4dXivl94qZlWgI
AvKHMm86hvly+sVKebX/RF0KrGCsDnyEFD5ntF+HjwesuUn3xoUEmw7ukqzv/Wan
39JjcuH79GQ3zKtYPtamX6wiz6kToQvRzervw1NRkWm3Ebnp9qYCcwt7WPgeSUCv
Ud2wZ7as2McnCMXGP+sGEMgi/u5FkXgqcBEVAZKRcwYJZ0ZbMiE1ejdS9cZq+/Ry
kPGfWWOIrdSqCVoMv/JRiCLroQSwt1o+z5Ljhx2uOEhj09Vo5vJTy/NaR/7L2r9z
PSkaLl2o9+Ccx47yb/dRNI69PtoylzSD2wb1MnLR80HRmSexIsvd17q9uie3QQi5
+4yW1m6SFIUVkG4HT7KxdOd77JGlc3tV9pSafIuWdEzuQtmoVikXQf/X/dQe4hXl
p5AkeVa/ImxGxyHMr6aLnrTwBpcaLTq+8WyHaQOeZkEG5fXyBtjL3LKiY8Zb5K66
IUx6Ec2F0R5JktKi+mk68id1eEP9/TXEMUvGSVfxSaXEuKUgafNKsulgwEj1L2To
VJoqkAmV024FiT7QQEKvj/YQG5DlKJtRxBkf2G6P24KEhtr3+SrNM4lcvuC587B+
irlqowo0O6/qYx3r8Bmy
=oj2/
-----END PGP SIGNATURE-----

--9hzSyicXuByfNYJd--
