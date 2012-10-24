Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQw5W-0001PU-1v; Wed, 24 Oct 2012 10:13:18 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so108815wey.6
	for <multiple recipients>; Wed, 24 Oct 2012 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nDDaaY61VWruGHp9UEJ3yA5uliUJf+cTg/KgLzUo5hU=;
	b=dUJxrXmyIaJjNBniMhALeMwXgqJUShzZjt0YZFpRdHHLzW5tja3S+v+N/nR3w+E7hY
	i6p7NshGO7qrzumlYVz93CllioOh2O4RqjfJkmUTFpWHXcoDPzLM0OxNjofvIzzbLoE9
	hvFfaJLcJ1SShTDXQAjFR6AjluD5XdJvGexKmEHpgk7OYiev2KBTnfgghs+aKP1oUQUL
	0NpeBGMOLqqQ55BiACsoHnE5LCTUPtjUBldRLNWfEvfx53GSahQ6l1qWMrToh5WuKMeV
	P3K88hBiWSaCWxp0F4IwO6V9vyIiV8wW3C7YQfhmHNeiStBZKN6/Ddw6IJxZmDzGFiEN
	K6PA==
Received: by 10.181.13.239 with SMTP id fb15mr3813642wid.22.1351065590723;
	Wed, 24 Oct 2012 00:59:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fp6sm3102144wib.0.2012.10.24.00.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 00:59:49 -0700 (PDT)
Date: Wed, 24 Oct 2012 10:00:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121024080007.GZ3269@jama.jama.net>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
	<20121018205948.GE3087@jama.jama.net>
	<20121023185454.GS3269@jama.jama.net> <50879CC0.2030104@intel.com>
MIME-Version: 1.0
In-Reply-To: <50879CC0.2030104@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
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
X-List-Received-Date: Wed, 24 Oct 2012 08:13:18 -0000
X-Groupsio-MsgNum: 30913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jwJ6bIT+r2BZUD+c"
Content-Disposition: inline

--jwJ6bIT+r2BZUD+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 10:46:08AM +0300, Andrei Dinu wrote:
> Hi Martin,
>=20
> This change was caused by the bug :
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2797
>=20
> I removed the tarball and kept only the git package because that is what=
=20
> says in the bug.
>=20
> Secondly, i modified the SRCREV because i took the latest version in the=
=20
> git repo.

Hi,

So this SRCREV points to newer code then 0.9 now? Then you forgot to
update PV to say so.

That's why there is error about downgrading it.

Cheers,
=20
> If there is anything more to add please send me an email.
>=20
> Thanks,
>=20
> Andrei Dinu
>=20
> On 10/23/2012 09:54 PM, Martin Jansa wrote:
> > On Thu, Oct 18, 2012 at 10:59:48PM +0200, Martin Jansa wrote:
> >> On Thu, Oct 18, 2012 at 08:59:19PM +0200, Martin Jansa wrote:
> >>> I know you've sent
> >>> http://patchwork.openembedded.org/patch/37763/
> >>> to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
> >>> and only older gypsy_git.bb was added back.
> >>>
> >>> Please fix that.
> >> There is also this diff which isn't mentioned in your commit.
> >>
> >> -SRCREV =3D "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
> >> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
> >>   PV =3D "0.8+git${SRCPV}"
> >>   PR =3D "r2"
> >>
> >> @@ -15,4 +15,5 @@
> >>                       file://gypsy/gypsy-time.h;beginline=3D1;endline=
=3D24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> >>
> >>   SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> >> -           file://fixups.patch"
> >> +           file://fixups.patch \
> >> +           file://0001-gypsy-m4-directory-missing-from-structure.patc=
h"
> > ping
> >
> > meta-oe is still broken because of this
> >
> > Cheers,
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jwJ6bIT+r2BZUD+c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCHoAcACgkQN1Ujt2V2gBy+mgCfXrOmsywGP6jmXVDKRGKEcfuh
lbcAoLU1j+a1NaJphAll684SaJ+s5HWS
=W1+x
-----END PGP SIGNATURE-----

--jwJ6bIT+r2BZUD+c--
