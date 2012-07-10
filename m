Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoWNW-0006OH-S3
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 11:05:06 +0200
Received: by wibhm11 with SMTP id hm11so3350178wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S/neZmNzORDff3ME1p2eFQI9CUsPAnVrO2Rjq+frw38=;
	b=s75zVfLzEgmfbv+HxFM0pmIxFmlnHP94q/qLBovHk8Ay3VFUp/pqVtLwGKJVBAmuK/
	1q0zwO/bgOHIpX3BwPoaZKqJwDDrD3cPURHVxcn6xRN2icejwuSk2J+BD6jaf5Eg95M5
	s4NVoRIwtQ7uaHxiytoLeIcF/Km0/V/hLYgWuUa8jEiQFCWOoQvTDfIHwUJQrc2EyY5+
	EcOsg1YXesIPd26/I968RgDzSvXdG3NMask4CRLTiTt1a0yjyZVTN5xNzOodmHs3gp8a
	/0v8OrzsXE1ZpNIH6+Rhf8kUN/BHFGN03yLCWy4+nFe12xebXFC0gJ1le4L0DurH7PgX
	7KGg==
Received: by 10.216.215.201 with SMTP id e51mr17465284wep.214.1341910436507;
	Tue, 10 Jul 2012 01:53:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm27871246wib.2.2012.07.10.01.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 01:53:55 -0700 (PDT)
Date: Tue, 10 Jul 2012 10:53:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120710085352.GL6308@jama.jama.net>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
	<CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
	<1341909998.23941.20.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1341909998.23941.20.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: The Mythical Sato Replacement
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
X-List-Received-Date: Tue, 10 Jul 2012 09:05:06 -0000
X-Groupsio-MsgNum: 25046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PpocKf6TCvdC9BKE"
Content-Disposition: inline

--PpocKf6TCvdC9BKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 09:46:38AM +0100, Richard Purdie wrote:
> On Mon, 2012-07-09 at 15:36 -0700, Khem Raj wrote:
> > On Mon, Jul 9, 2012 at 2:06 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
> > >
> > > Shuku will be a descendent of Sato, that is continue to use the
> > > Matchbox Window Manager, Desktop, and Panel; although the latter two
> > > will be updated for GTK+ 3.  All applications will be removed and
> > > fully reconsidered when adding back, so the text editor might well
> > > change from leafpad to something that had a release in two years,
> > > Midori is looking like a good web browser choice instead of Web, the
> > > PIM suite removed, and so on.
> >=20
> > Did you consider QT instead of GTK+ ? I think having wayland would be c=
ool.
>=20
> Ross didn't cover the question "Why do we need anything in OE-Core at
> all?". The answer is that we do need *something* to actually test the
> components we build. Its all well and good having toolchains, libraries,
> architecture support, graphics, X11 etc. but if we can't tell whether it
> works or not we're in a bad way. I've said this before but I want to
> make it really clear that I believe in testing what we ship, otherwise
> its worthless.

But then it still can be in extra layer (maybe in oe-core repo), no?

Basic tests with oe-core only and then test graphics/X11 with
oe-core+meta-foo layer. Where meta-foo can be sato/qt/kde/enlightenment/..
and maintained/released together with oe-core.

Cheers,

> As I see it, there are some significant advantages of matchbox:
>=20
> a) It doesn't put us in any one UI camp. I don't want OE-Core to be seen
> as Qt only, or GNOME only, or enlightenment only. I know matchbox uses
> GNOME components but its sufficiently different that it illustrates a
> key value of what the OE architecture offers, the ability to customise
> and innovate. As such I think it makes a compelling reference UI.
>=20
> b) Its simple. There is no large complex stack to build and include.
>=20
> c) Ownership wise, we can choose which direction to take some of the
> matchbox/sato components in, not least as Ross authored matchbox-desktop
> and matchbox-panel version 2.
>=20
> We also need to be mindful of resources and expertise which is something
> people perhaps don't immediately realise. Whist I've been able to find
> the Yocto Project resources to cover the work on the core and much of
> the feature development work we want to undertake, I've struggled to
> convince people to put development resources into replacing Sato as its
> hard to make a business case for or give a specific target for the UI.
> As such, any plan which involves significant development effort is not
> going to be resource feasible. A nice feature of Ross' plan is that it
> can be done incrementally to a degree, it doesn't involve large amounts
> of development effort and we have expertise directly on the team for
> most of the work needed.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PpocKf6TCvdC9BKE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/77aAACgkQN1Ujt2V2gBypaQCeOemot4mX5WDK8Fymzj6jablp
r2EAn1wJv5rZT7tH4+XMP3ysTIsWjpmq
=EW0S
-----END PGP SIGNATURE-----

--PpocKf6TCvdC9BKE--
