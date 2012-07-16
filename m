Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SqoUk-0002ln-VZ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 18:50:03 +0200
Received: by wibhm11 with SMTP id hm11so2568796wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 09:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+n8/5Q4TcSAFd3NCsSEKMOCKLR/VY5IriUPEnKmLdJA=;
	b=EO1upBeq8LmJHxxCTnS/5naih1nBp74GlrwpC5fFcUB+E/QUb5+qJy4NnwX13mgV2E
	HdcNUSopdaZ6h+vlLZ+vvl/4MR5SZ4yGI8WR2swIy6xaXSN7V5LTvmZRy2ruNd9+xMrC
	CdrnNUhkfaKqYwGlcvA1fEsPDi2MVDTGqiwNy3aBH/zNbFlmuY5OhbjA61Ev+hlZ2VNI
	7/D05COm09eItoRefLkiKdqyeUu9P0TSqWYTdnyOdk+lZJm+I2tuDOvP5a7+U1B2ATqu
	Ndusx8qibDMOC5ZGep4P1r4R/pQE6XW76318PaP93kx4s+X7FfLIgddXsiC6muoW4nRj
	XEOg==
Received: by 10.180.93.99 with SMTP id ct3mr19500728wib.13.1342456724657;
	Mon, 16 Jul 2012 09:38:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm22314864wiv.11.2012.07.16.09.38.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 09:38:43 -0700 (PDT)
Date: Mon, 16 Jul 2012 18:38:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120716163851.GJ3729@jama.jama.net>
References: <cover.1342453118.git.sgw@linux.intel.com>
	<d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
	<CADkTA4PU2FTrOkiKFL=+imfddD+Do-kpD0K9a+BuNyG041LgnA@mail.gmail.com>
	<20120716160454.GH3729@jama.jama.net>
	<CADkTA4PjzUm1dBGECZj7urEK3RmEcjm026EkL_xRmoacJAHk1Q@mail.gmail.com>
	<20120716162952.GI3729@jama.jama.net>
	<CADkTA4NKtty4_jt7z2S9GzwHMg+xmcdh3qTfUWUuYRjw92iXHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NKtty4_jt7z2S9GzwHMg+xmcdh3qTfUWUuYRjw92iXHQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Jul 2012 16:50:03 -0000
X-Groupsio-MsgNum: 25434
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="utPK4TBebyzZxMrE"
Content-Disposition: inline

--utPK4TBebyzZxMrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 12:36:07PM -0400, Bruce Ashfield wrote:
> On Mon, Jul 16, 2012 at 12:29 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Mon, Jul 16, 2012 at 12:08:10PM -0400, Bruce Ashfield wrote:
> >> On Mon, Jul 16, 2012 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >> > On Mon, Jul 16, 2012 at 11:58:52AM -0400, Bruce Ashfield wrote:
> >> >> On Mon, Jul 16, 2012 at 11:47 AM, Saul Wold <sgw@linux.intel.com> w=
rote:
> >> >> > From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> >> >
> >> >> > Tested by building core-image-sato-sdk.
> >> >>
> >> >> We've never gone to this level of granularity in the past, since
> >> >> -stable updates to
> >> >> the kernel are not going to change something in the libc-headers ex=
ports.
> >> >>
> >> >> As far as I'm concerned, bumping this for each stable release is to=
o much churn.
> >> >
> >> > But this time it's quite usefull after
> >> > http://git.openembedded.org/openembedded-core/commit/?id=3D2a4ab6fc2=
ef10202d13568aba5d7633e88aa71e5
> >> > removed some headers from sysroots and some packages (like IIRC udev)
> >> > were failing to build until someone rebuilt linux-libc-headers manua=
lly
> >> > to fixup staged headers in machine sysroot..
> >>
> >> I'm not following completely .. is that specific to the .3 in 3.4.x ?
> >> Doesn't look
> >> like it to me.
> >
> > No it's not specific to any version.. just before referenced patch there
> > was e.g. ubi-user.h in sysroot "owned" by linux-libc-headers and
> > mtd-utils recipe.
> >
> > That patch caused mtd-utils to be rebuilt and restaged again, but this
> > time without ubi-user.h and IMHO this doesn't track that ubi-user.h
> > is also "owned by linux-libc-headers recipe so we end without any
> > ubi-user.h in sysroot until someone rebuilds linux-libc-headers to stage
> > ubi-user.h again.
> >
> > Staging the same file from different recipes should imho show some
> > warning or keep track of all "owners" so ubi-user.h is not removed
> > unless someone cleansstate both mtd-utils and linux-libc-headers.
>=20
> ok .. this is what I thought you meant. I'm not a packaging expert by any
> stretch of the imagination, but I assume that someone bumping the PR or
> PE of the libc-headers package but leaving it on 3.4 would have also fixed
> this to not require manual intervention ?

yes.. I was thinking about sending PR bump patch after I've rebuilt it
manually for all machines on both my builders.. but then noticed this patch=
=20
and decided to wait for this instead of just PR bump..

Cheers,

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> >>
> >> I don't recall Greg changing the mtd exports in 3.4.3 .. but that
> >> wouldn't be the
> >> first time something like that slipped in.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >
> >> > Cheers,
> >> >
> >> >>
> >> >> Sorry I missed this during the original review/posting.
> >> >>
> >> >> Cheers,
> >> >>
> >> >> Bruce
> >> >>
> >> >> >
> >> >> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> >> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> >> > ---
> >> >> >  meta/conf/distro/include/tcmode-default.inc        |    2 +-
> >> >> >  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
> >> >> >  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
> >> >> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >> >> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-=
libc-headers_3.4.3.bb
> >> >> >  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-=
libc-headers_3.4.bb
> >> >> >
> >> >> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/c=
onf/distro/include/tcmode-default.inc
> >> >> > index f11e687..0a068be 100644
> >> >> > --- a/meta/conf/distro/include/tcmode-default.inc
> >> >> > +++ b/meta/conf/distro/include/tcmode-default.inc
> >> >> > @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
> >> >> >  BINUVERSION ?=3D "2.22"
> >> >> >  EGLIBCVERSION ?=3D "2.15"
> >> >> >  UCLIBCVERSION ?=3D "0.9.33"
> >> >> > -LINUXLIBCVERSION ?=3D "3.4"
> >> >> > +LINUXLIBCVERSION ?=3D "3.4.3"
> >> >> >
> >> >> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >> >> >  PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
> >> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-he=
aders_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_=
3.4.3.bb
> >> >> > new file mode 100644
> >> >> > index 0000000..6f8d9e8
> >> >> > --- /dev/null
> >> >> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3=
=2E4.3.bb
> >> >> > @@ -0,0 +1,6 @@
> >> >> > +require linux-libc-headers.inc
> >> >> > +
> >> >> > +PR =3D "r0"
> >> >> > +
> >> >> > +SRC_URI[md5sum] =3D "3aefa02db55715d627ed23a01667057d"
> >> >> > +SRC_URI[sha256sum] =3D "17f1256daa289dde1a0a587c9753556d37a52770=
f7c4efcf2666fd4796a6eacc"
> >> >> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-he=
aders_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.=
4.bb
> >> >> > deleted file mode 100644
> >> >> > index 9e8c88f..0000000
> >> >> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3=
=2E4.bb
> >> >> > +++ /dev/null
> >> >> > @@ -1,6 +0,0 @@
> >> >> > -require linux-libc-headers.inc
> >> >> > -
> >> >> > -PR =3D "r0"
> >> >> > -
> >> >> > -SRC_URI[md5sum] =3D "146af0160fc7a60cf9acf44aec13482b"
> >> >> > -SRC_URI[sha256sum] =3D "a797a15d0b6228381507c14ecf4eec4a6cc5c77c=
fd521ba3b3e1325e85b5b16d"
> >> >> > --
> >> >> > 1.7.7.6
> >> >> >
> >> >> >
> >> >> > _______________________________________________
> >> >> > Openembedded-core mailing list
> >> >> > Openembedded-core@lists.openembedded.org
> >> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core
> >> >>
> >> >>
> >> >>
> >> >> --
> >> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> >> thee at its end"
> >> >>
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
> >> >
> >> > --
> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >> >
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

--utPK4TBebyzZxMrE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEQ5sACgkQN1Ujt2V2gBzCngCgkOQ4g2rqQMVwuyOurwSoU5Hb
SdMAn2uxJoanQe8FukzpKLOmB+zfEWB3
=ySjD
-----END PGP SIGNATURE-----

--utPK4TBebyzZxMrE--
