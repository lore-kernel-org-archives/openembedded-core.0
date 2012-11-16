Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZUcR-0003G8-TS
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 23:42:40 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1222863eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 14:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hmfGs0DgEUQurvN5zAniJ8s8q+ceFcgJJoccol6qKRs=;
	b=m6T6hu1BojDohyVzeZBzMRLLTp7KWoENa+pTq1aFz8o5GImj5i/7hgqwE2jOgMqZOZ
	BA9Zv385rrKe/+Wi0jD2DV6hlRbmoiGkGNKSQ6FKUCvFIMJt/1ivVWH+J7iPngiFzUtJ
	bbEZzKfMnNM+EfmXYjQCGWwmCQ/wbP79SyYRM6DUJ6qXFHLFiHC/0yUbwJL9Oytvob9N
	H/IkGAER14OgWlrXq8XIdmcWHeOj87NvMLtIhrVW0skgAB0LxZd5ck8z+QUhup2ll5Td
	TNp6Q0RbdKWtlC6QlYWdbGoOmltPNcXwBdQtj/Ac5PJSBbEEFWlHFU+6kP8Apq1PbU5l
	buhw==
Received: by 10.14.184.1 with SMTP id r1mr1178350eem.4.1353104921368;
	Fri, 16 Nov 2012 14:28:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b44sm6145426eep.12.2012.11.16.14.28.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 14:28:40 -0800 (PST)
Date: Fri, 16 Nov 2012 23:28:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marko =?utf-8?B?S2F0acSH?= <dromede@gmail.com>
Message-ID: <20121116222855.GD3411@jama.jama.net>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Fri, 16 Nov 2012 22:42:40 -0000
X-Groupsio-MsgNum: 31469
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2012 at 10:48:41PM +0100, Marko Kati=C4=87 wrote:
> Udevtest and udevinfo are not being built because they no longer exist in
> udev 182 sources.

Ah, so this change is only cosmetic and does not change package output
(otherwise missing PR bump).

Cheers,

> On Nov 16, 2012 10:36 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
> >
> > On Fri, Nov 16, 2012 at 09:11:39PM +0100, dromede@gmail.com wrote:
> > > From: Marko Katic <dromede.gmail.com>
> > >
> > > udev provides a udev-utils package that once provided utility binaries
> > > such as udevadm, udevtest and udevinfo. udevtest and udevinfo are
> > > deprecated and their functions are now handled by udevadm.
> > >
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D597539
> > >
> > > remove udevinfo and udevtest from the udev-utils package.
> >
> > Are they still built? If yes then there should be warning about
> > unpackaged files (you would need to delete them in do_install) or they
> > are picked by some other package (PN probably).
> >
> > Cheers,
> >
> > >
> > > Signed-off-by: Marko Katic <dromede.gmail.com>
> > > ---
> > >  meta/recipes-core/udev/udev.inc |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/udev/udev.inc
> b/meta/recipes-core/udev/udev.inc
> > > index 4705b9b..7133cc4 100644
> > > --- a/meta/recipes-core/udev/udev.inc
> > > +++ b/meta/recipes-core/udev/udev.inc
> > > @@ -74,7 +74,7 @@ FILES_udev-cache =3D "${sysconfdir}/init.d/udev-cac=
he
> ${sysconfdir}/default/udev-c
> > >
> > >  FILES_udev-acl =3D "${base_libdir}/udev/udev-acl
> ${base_libdir}/udev/rules.d/70-acl.rules"
> > >
> > > -FILES_udev-utils =3D "${bindir}/udevinfo ${bindir}/udevtest
> ${base_sbindir}/udevadm"
> > > +FILES_udev-utils =3D "${bindir}/udevadm"
> > >
> > >  RDEPENDS_udev-consolekit +=3D "udev-acl"
> > >  FILES_udev-consolekit =3D "${libdir}/ConsoleKit"
> > > --
> > > 1.7.9.5
> > >
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCmvicACgkQN1Ujt2V2gBxGmgCgh6pE9om3PK8Zmb9t8uD3gj23
legAn171kBYzULM0v8tPlI4YKzgbkR+G
=fYEz
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
