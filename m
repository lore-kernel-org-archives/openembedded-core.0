Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SC925-0002n6-BB
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 14:28:21 +0200
Received: by wgbdr12 with SMTP id dr12so3448357wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6cq2CPqAN9U4Og6ShlYSDnGzKbn4BcFyOv37WKWqSlA=;
	b=mY5gN1aQfLBl7XPuV+VzyAzXu3U3hQZCr67761efv8eRd2C0Uti0mhqwKsZWuFW7oL
	kjmNjz4F+aMp4K00pUNs+2hcj+8+8SZmwuEaFJ29pQ7n8p5rhMJVLOXnmJxeXzMr4yH6
	b4gxoZq0jJnv+/MP4Lxg3/WRhc1EJTWifSxCF4usbRTM/x0gtFbLu467mpQpkJopwdc/
	Y8KvJ7pq5xJ8SQJLFceZcvYqA7c/seK6l/ywTv4W8NR6hWaSGYMKrBDvKCRSxnSadg+Y
	IXUDZnx6DW/a/LmjBO23H3gvu59cyYA6h78zkU3rKKeXKeYMSWmDy3z83/MgkpJ6d3jc
	uIbA==
Received: by 10.216.137.74 with SMTP id x52mr12642271wei.77.1332764361775;
	Mon, 26 Mar 2012 05:19:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm66511272wiy.3.2012.03.26.05.19.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 05:19:21 -0700 (PDT)
Date: Mon, 26 Mar 2012 14:19:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326121919.GE3941@jama.jama.net>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<313583f23e026bed3155643d1e8914313fce7478.1332541342.git.Martin.Jansa@gmail.com>
	<1332762240.28414.115.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332762240.28414.115.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv 08/10] libusb*: import native support from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2012 12:28:21 -0000
X-Groupsio-MsgNum: 19744
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 12:44:00PM +0100, Richard Purdie wrote:
> On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 +++++--
> >  meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 ++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/=
recipes-support/libusb/libusb-compat_0.1.3.bb
> > index 43da5af..7edd422 100644
> > --- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
> > +++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
> > @@ -13,9 +13,12 @@ DEPENDS =3D "libusb1"
> >  # Besides, libusb-0.1 uses a per 1ms polling that hurts a lot to power
> >  # consumption.
> >  PROVIDES =3D "libusb"
> > +PROVIDES +=3D "virtual/libusb0"
> > +PROVIDES_virtclass-native +=3D "virtual/libusb0-native"
>=20
> Doesn't the -native class extension code handle the above correctly now?
>=20
> i.e. PROVIDES =3D "libusb virtual/libusb0"
>=20
> should be enough?

Ah right, will simplify that (it's because it was needed in this form=20
in bbappend).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wXscACgkQN1Ujt2V2gBxufgCaAtHSvGmWkIYf+SWhcrUm7LFc
3ZsAoIgEsZYus7vFPSCNHyssGph1Z7nq
=Xhkt
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
