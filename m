Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D3F486B6FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:15:13 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e53so1649623eek.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5NDHOg4W8w2lP9ygamnM/E9hA8RwlHxJ/UhCrfJm63I=;
	b=IwnPuCOX22N8w4z9AmS2Vll8Sb6Ocs32C8l6kNVqJlkPRHdRbTRTOH48U4Dc+Jc1zt
	qm4fsrInwBGtQCLQ0m8qZRO4wnDcgNVWuBpR0qj2gdnfjIqpjovpI0cJ1GlcYJ7CLK+m
	h/ub1Ou9evdE/nsgw5izR0DCW6ubdSmeICZk+LtFHHA5hS8z4KpY9obaftHB1yd1foS2
	FXUUr0R/ErDCWl3MaDLb1+DqYspOBjpQv98QToENG8cHwqgi9FseBoAl6iOwdxXsqXTf
	9zPnJGnoK/+IMWPIX3ztpjEDwD3u7Bj9aBxu45QB6Q6dbGtTKMaHxMmButQaJAX8RPM9
	GdtQ==
X-Received: by 10.14.88.131 with SMTP id a3mr25491910eef.64.1393254914097;
	Mon, 24 Feb 2014 07:15:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j42sm64943983eep.21.2014.02.24.07.15.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 07:15:12 -0800 (PST)
Date: Mon, 24 Feb 2014 16:15:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>, "Burton, Ross" <ross.burton@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20140224151510.GF26981@jama>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
	<CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
	<20140224145117.GB26295@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20140224145117.GB26295@ad.chargestorm.se>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 15:15:17 -0000
X-Groupsio-MsgNum: 50499
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Content-Disposition: inline

--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 03:51:19PM +0100, Anders Darander wrote:
> * Laszlo Papp <lpapp@kde.org> [140224 15:12]:
>=20
> > On Mon, Feb 24, 2014 at 1:58 PM, Anders Darander <anders@chargestorm.se=
> wrote:
> > > * Laszlo Papp <lpapp@kde.org> [140224 14:37]:
>=20
> > >> On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com=
> wrote:
> > >> > On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
> > >> The problem is that build numbers, that I have seen at least, are
> > >> human unreadable. A human readable number would be nicer to have;
> > >> something that I have just double checked on my Blackberry Limited
> > >> Edition phone, and it is so that the OS Version is 10.0.10.738 in the
> > >> settings.
>=20
> > >> Perhaps the build number can be made human readable... but currently,
> > >> when I build an image, all I get is a long and not so convenient
> > >> time-stamp. Is there a more gentle way of generating image version
> > >> then?
>=20
> > > The git describe line is our main versioning. Using that line we get =
the
> > > abreviated SHA1 of our repo, the last tag, the number of commits after
> > > the last tag, and finally whether the repo was clean or dirty during =
the
> > > build.
>=20
>=20
> > > It might not be as pretty as the 10.0.10.738 in your example, though =
for
> > > us it's sufficient for the time being.
>=20
> > As you are writing, that is good for internal operation, but I would
> > dislike providing such "versioning" for customers.
>=20
> Yes, for customer communication it might very well be preferred to use
> some other version numbers.=20
>=20
> I'd guess that the best bet then would be to either store the version
> number in a config file in your repo, and have the build process take
> that number and put it into the image in a way similar to what's above.
> Or to get the number from a tag. In either case, you'll need to make
> sure that the release process updates the number correctly, thought that
> issue will be there no matter how you retreive and store the number.
>=20
> Though, I still think that having the info above on the images are
> usefull, not least when the customer comes back with more difficult to
> isolate issues.

in meta-webos we're appending human readable version suffix to
IMAGE_NAME, KERNEL_IMAGE_BASE_NAME and MODULE_IMAGE_BASE_NAME variables
and it's also included in some utils (like lsb and nyx-modules).

That way we can distinguish not only what is in the image, but also
where the image was built (e.g. official/local build,
development/production version, which jenkins-job produced that etc).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLYf4ACgkQN1Ujt2V2gByhbgCfc80Fc/qv5clgJq6YzO0dY+b4
cZAAn3LuZAZAOrksQt6aeYvcgkU77VlV
=LiwU
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
