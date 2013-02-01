Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U1E3z-0006N0-V2
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:42:23 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so1681819dad.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=E7DjeHJegDKqnjjB+LH6wzP08B9cl0YlzKm0ilYySuc=;
	b=Lg9J7p46Jx4LmpSV9nikFEmlq2GI6r6BeGUpfTJJz2OwKuOHuuXftKC5lnmJ/xfnpO
	NPErRsKfuVFq9c7lvkutxFbqB7rlYWQqwvYUnbB52EXc+NNTiPJEoqJ0mCISPJek6Z5d
	va2H7FxDELhzCqyrdvEmljkMRzM6bHwgEiXqmG2+QYAkQZSGCVwp1kPC+5jhezlMEMEv
	E9XQj8NlIRD4nti4U6pePhGvgEZKVYmmvKCtAKCew/suAUnxe5jZ5jABQWniqf/IEVIB
	F1QMOsLMZ8KQIe6xhy/nA0SX17OE+U1EW+A6WpAtgVsvX3j7gnoyyoYxnpB6+2GfoCeW
	GGYA==
X-Received: by 10.66.81.166 with SMTP id b6mr28610960pay.7.1359714359489;
	Fri, 01 Feb 2013 02:25:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nw9sm8043972pbb.42.2013.02.01.02.25.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 02:25:58 -0800 (PST)
Date: Fri, 1 Feb 2013 11:26:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130201102601.GC3234@jama.dyndns-home.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
	<510B9749.6040801@intel.com>
MIME-Version: 1.0
In-Reply-To: <510B9749.6040801@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 10:42:41 -0000
X-Groupsio-MsgNum: 34799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline

--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2013 at 12:22:01PM +0200, Radu Moisan wrote:
>=20
> On 02/01/2013 11:44 AM, Burton, Ross wrote:
> > On 1 February 2013 09:22, Radu Moisan <radu.moisan@intel.com> wrote:
> >> enable/disable support as relevant
> > Please write a more verbose comment, something along the lines of
> > "systemd is auto-detected unless disabled explicitly, potentially
> > contaminating sstate".
> >
> >> +# there is no --enable/--disable option for consolekit and it's not p=
icked by shlibs, so add it to DEPENDS
> > It's not picked up by shlibs because it's a dbus call not a library
> > call, and that's *RDEPENDS* not depends.
>=20
> I did change that manually because I assumed it was a typo. However it=20
> make sense to add consolekit as a runtime dependency, but the=20
> documentation specifically says PACKAGECONFIG will add to DEPENDS. How=20
> is it different in this patch? The PACKAGECONFIG[systemd] is clearly=20
> specifying a build time dependency, why the PACKAGECONFIG[consolekit] is=
=20
> specifying a runtime dependency? How can I discriminate in this context?

3rd (DEPENDS) or 4th (RDEPENDS) parameter is the key difference.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlELmDkACgkQN1Ujt2V2gBwXxgCdHOLH7C0sh4evS5dArdvfBoko
fswAoLDACkiA/dy5Wtc5Bz/MYsqg5j5R
=RDTv
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
