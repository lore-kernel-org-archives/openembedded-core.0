Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REkMN-0001vI-5V
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:11:47 +0200
Received: by bkat8 with SMTP id t8so2157422bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VF+y088558n59oxyGVwjEYSwj0H4Hw1AWLt+c6mmSOw=;
	b=XFd3VtfuPbuVQEEkzoc/SaZGneWWeQU7FUwTsfA6numAcGhUSnmwVy6PL8LnEQiC1s
	Mq09wUu92wkCXilgJNsV2jRDKYic9NanPT8c9Lf/q6jpL3XwwYxiRYiL+vdDwK3JSHxc
	6HRnyaelEsRjmh8fVd3INAqOt/gpTtcxuvwfo=
Received: by 10.204.140.202 with SMTP id j10mr7352351bku.66.1318608361888;
	Fri, 14 Oct 2011 09:06:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm8959358bkn.7.2011.10.14.09.05.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 09:06:00 -0700 (PDT)
Date: Fri, 14 Oct 2011 18:05:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014160553.GM3542@jama.jama.net>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
	<1318605925.2342.24.camel@ted>
	<20111014153034.GL3542@jama.jama.net>
	<1318607759.2342.28.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318607759.2342.28.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 16:11:47 -0000
X-Groupsio-MsgNum: 11040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xdWF/UuCWMRSqXrg"
Content-Disposition: inline

--xdWF/UuCWMRSqXrg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 04:55:50PM +0100, Richard Purdie wrote:
> On Fri, 2011-10-14 at 17:30 +0200, Martin Jansa wrote:
> > On Fri, Oct 14, 2011 at 04:25:16PM +0100, Richard Purdie wrote:
> > > On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
> > > > +1
> > > >=20
> > > > Just another thing, I'd prefer to have DRIDRIVERS as ?=3D so machin=
e can
> > > > override it.
> > >=20
> > > I really wouldn't recommend overriding this on a per machine basis, it
> > > needs to be on a per arch basis. This is because the recipe is not
> > > machine specific (nor should it be).
> > >=20
> > > Configuration therefore falls to the distro, not machine.
> >=20
> > Why not make it machine specific only when machine provides own module
> > (like the case with glamo on om-gta02)?
> >=20
> > Or recipe cannot change PACKAGE_ARCH in some special cases (like
> > $MACHINE in path to some file in SRC_URI) anymore?
>=20
> It works just fine but its not nice practise in my opinion for a library
> like this and I don't see there is any need in this case. Certainly I
> don't see it as something OE-Core should be recommending.

So can I send patches adding my glamo.patch to libdrm and mesa-dri so we
can add glamo to=20
DRIDRIVERS_armv4t ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xdWF/UuCWMRSqXrg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YXeEACgkQN1Ujt2V2gBxs8gCfRzPvgbykRA4YE1jjsOXEAj1k
ydoAoK/0kLrAYdk+aejZcKE6jM49gFLf
=8puT
-----END PGP SIGNATURE-----

--xdWF/UuCWMRSqXrg--
