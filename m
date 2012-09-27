Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH9n0-000644-60
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 10:49:46 +0200
Received: by bkcjk7 with SMTP id jk7so1158224bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 01:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R3ra4J41iX//koA+aRNxtFgRlVoGQf+T2HMKXaQZB/k=;
	b=ccJpc1JRMEQPntB8PbYJekOdJZajjeIyNTQsvHBx4t41W16C2MjJrR0yW3de+BY/fX
	xJWJOhohZI2h67J50NDGg5xDNxJk7D1itDq2fwS7o0Y703q6kcdr/XC6aIb4KSSJKkWv
	5Cjz5o1pru0Qu2xEcLPxyNOkL1rRPC/F0UEA7jn6aTiRD5a9ddB6gi81lFv+kiggbTco
	SJikMx30sFx01w/PcJw3nj6M4qLCcRbyqa8s/i1NhujkRj6yiEh/P4i350zQyBULAdN9
	Tv4dz7z5azv6w2cMiLrACJgAFqPQgL9cju3+/Y8mIyfQytuS9IbKOG9Im2iJzHKC6U7s
	bYNA==
Received: by 10.204.0.80 with SMTP id 16mr1734829bka.71.1348735014720;
	Thu, 27 Sep 2012 01:36:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm3765281bks.6.2012.09.27.01.36.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 01:36:53 -0700 (PDT)
Date: Thu, 27 Sep 2012 10:37:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120927083701.GC3454@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348335944.10108.211.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Thu, 27 Sep 2012 08:49:46 -0000
X-Groupsio-MsgNum: 29974
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline

--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 22, 2012 at 06:45:44PM +0100, Richard Purdie wrote:
> On Sat, 2012-09-22 at 18:51 +0200, Martin Jansa wrote:
> > * bitbake.conf has OPTDEFAULTTUNE with weak default value of DEFAULTTUNE
> > * this way xscale or arm926ejs is not used by default when some machine
> >   includes its tune*.inc, but it's easy for DISTRO to say it wants
> >   OPTDEFAULTTUNE for some packages or always (if they don't want to
> >   share built packages between xscale and arm926ejs).
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/bitbake.conf                       | 1 +
> >  meta/conf/machine/include/tune-arm926ejs.inc | 3 ++-
> >  meta/conf/machine/include/tune-xscale.inc    | 3 ++-
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9b41749..e433fcb 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -95,6 +95,7 @@ HOST_LD_ARCH =3D "${TARGET_LD_ARCH}"
> >  HOST_AS_ARCH =3D "${TARGET_AS_ARCH}"
> >  HOST_EXEEXT =3D ""
> > =20
> > +OPTDEFAULTTUNE ??=3D "${DEFAULTTUNE}"
> >  TUNE_ARCH ??=3D "INVALID"
> >  TUNE_CCARGS ??=3D ""
> >  TUNE_LDARGS ??=3D ""
>=20
> As I've said previously, I do not think OPTDEFAULTTUNE is clear in usage
> or in meaning and we need to find a better solution. I'm therefore not
> keen on this change.

OK, what about the rest of patchset (without OPTDEFAULTTUNE bits) to use
different PKGARCH for different TUNE_CCARGS?
=20
> I also still think this is a distro packaging issue and should be solved
> by the distro, even if that means more complexity there. That is the
> right place for this particular complexity IMO. I'm happy to support
> that from the core but not in something as user visible and confusing as
> this variable.

Agreed OPTDEFAULTTUNE is to help distro configs, because complexity
there will be much worse then when it's defined in tune-* files, because
now will have to define DEFAULTTUNE/OPTDEFAULTTUNE for each MACHINE (or
TUNE_FEATURE) it supports and it's less orthogonal (machine/distro
config) then it could be.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkEC0ACgkQN1Ujt2V2gBzctQCgn5XQEdiA9XWBD4ky1ByFbnCf
l7YAn2hl8YXjqXgyuKgUSqVE+7jzJz7F
=8xrU
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
