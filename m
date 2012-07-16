Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqoM5-0001MA-5T
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:41:05 +0200
Received: by weyr6 with SMTP id r6so3628605wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KXBJhJ7gBUD7BxAybM91+YoXdiHVpO9uiiYRZ9qPe+I=;
	b=ljJ/+VmoSx2cqXrjKeMqmqDM8Jv1QOswtnX+FcEJj5Rx40uBNTXsAfKGSGJSPHUNfv
	YHBXLmeOoY1QoQanuvf3ndO7w939Y34SoY2JcoeL960HP+B97wMQm8O/vEpy7ZgLhbx+
	elRBCq3Lf4cIbDEtvwVO9rsgNL59MOL3TrG3rzsIBKvDxtJ0pi9bvgyVVqNzg//YrwB2
	t4QjTMhbrXPzaQ30nRKrWhj8CrTJmfJ6kCqCpxOZk92MW+m6rx/mY7gyaotYhUMmsyhJ
	JYHLIZ3wyjKJ3Ok5L7eJBpmCIFT9rn19Xq1GBx9dV0f+ksg229tir3aA9tMBhm0Eald2
	U8tg==
Received: by 10.180.81.193 with SMTP id c1mr19431460wiy.12.1342456186717;
	Mon, 16 Jul 2012 09:29:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm32815967wiy.4.2012.07.16.09.29.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 09:29:45 -0700 (PDT)
Date: Mon, 16 Jul 2012 18:29:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120716162952.GI3729@jama.jama.net>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
	<CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
	<20120716160454.GH3729@jama.jama.net>
	<CADkTA4PjzUm1dBGECZj7urEK3RmEcjm026EkL_xRmoacJAHk1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PjzUm1dBGECZj7urEK3RmEcjm026EkL_xRmoacJAHk1Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 09/30] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Mon, 16 Jul 2012 16:41:05 -0000
X-Groupsio-MsgNum: 25432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3s59FfKcByyGl+j"
Content-Disposition: inline

--U3s59FfKcByyGl+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 12:08:10PM -0400, Bruce Ashfield wrote:
> On Mon, Jul 16, 2012 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Mon, Jul 16, 2012 at 11:58:52AM -0400, Bruce Ashfield wrote:
> >> On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> wrot=
e:
> >> > From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> >
> >> > Tested by building core-image-sato-sdk.
> >>
> >> We've never gone to this level of granularity in the past, since
> >> -stable updates to
> >> the kernel are not going to change something in the libc-headers expor=
ts.
> >>
> >> As far as I'm concerned, bumping this for each stable release is too m=
uch churn.
> >
> > But this time it's quite usefull after
> > http://git.openembedded.org/openembedded-core/commit/?id=3D2a4ab6fc2ef1=
0202d13568aba5d7633e88aa71e5
> > removed some headers from sysroots and some packages (like IIRC udev)
> > were failing to build until someone rebuilt linux-libc-headers manually
> > to fixup staged headers in machine sysroot..
>=20
> I'm not following completely .. is that specific to the .3 in 3.4.x ?
> Doesn't look
> like it to me.

No it's not specific to any version.. just before referenced patch there
was e.g. ubi-user.h in sysroot "owned" by linux-libc-headers and
mtd-utils recipe.

That patch caused mtd-utils to be rebuilt and restaged again, but this
time without ubi-user.h and IMHO this doesn't track that ubi-user.h
is also "owned by linux-libc-headers recipe so we end without any
ubi-user.h in sysroot until someone rebuilds linux-libc-headers to stage
ubi-user.h again.

Staging the same file from different recipes should imho show some
warning or keep track of all "owners" so ubi-user.h is not removed
unless someone cleansstate both mtd-utils and linux-libc-headers.

Cheers,

>=20
> I don't recall Greg changing the mtd exports in 3.4.3 .. but that
> wouldn't be the
> first time something like that slipped in.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> >>
> >> Sorry I missed this during the original review/posting.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> > ---
> >> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
> >> >  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
> >> >  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
> >> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-lib=
c-headers_3.4.3.bb
> >> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-lib=
c-headers_3.4.bb
> >> >
> >> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf=
/distro/include/tcmode-default.inc
> >> > index f11e687..0a068be 100644
> >> > --- a/meta/conf/distro/include/tcmode-default.inc
> >> > +++ b/meta/conf/distro/include/tcmode-default.inc
> >> > @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
> >> >  BINUVERSION ?=3D "2.22"
> >> >  EGLIBCVERSION ?=3D "2.15"
> >> >  UCLIBCVERSION ?=3D "0.9.33"
> >> > -LINUXLIBCVERSION ?=3D "3.4"
> >> > +LINUXLIBCVERSION ?=3D "3.4.3"
> >> >
> >> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >> >  PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4=
=2E3.bb
> >> > new file mode 100644
> >> > index 0000000..6f8d9e8
> >> > --- /dev/null
> >> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.=
3.bb
> >> > @@ -0,0 +1,6 @@
> >> > +require linux-libc-headers.inc
> >> > +
> >> > +PR =3D "r0"
> >> > +
> >> > +SRC_URI[md5sum] =3D "3aefa02db55715d627ed23a01667057d"
> >> > +SRC_URI[sha256sum] =3D "17f1256daa289dde1a0a587c9753556d37a52770f7c=
4efcf2666fd4796a6eacc"
> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-heade=
rs_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
> >> > deleted file mode 100644
> >> > index 9e8c88f..0000000
> >> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.=
bb
> >> > +++ /dev/null
> >> > @@ -1,6 +0,0 @@
> >> > -require linux-libc-headers.inc
> >> > -
> >> > -PR =3D "r0"
> >> > -
> >> > -SRC_URI[md5sum] =3D "146af0160fc7a60cf9acf44aec13482b"
> >> > -SRC_URI[sha256sum] =3D "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd5=
21ba3b3e1325e85b5b16d"
> >> > --
> >> > 1.7.7.6
> >> >
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U3s59FfKcByyGl+j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEQYAACgkQN1Ujt2V2gByTrQCeL9WeMYS+1Y9tQpIrdXJadtw3
i2sAn06MaUFhu3W5ShyDwD+3Ct7HZyAJ
=N5nj
-----END PGP SIGNATURE-----

--U3s59FfKcByyGl+j--
