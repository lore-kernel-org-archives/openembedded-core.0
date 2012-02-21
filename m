Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzydO-0003wu-3Z
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:56:34 +0100
Received: by eaal10 with SMTP id l10so2372866eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:48:14 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.7.144 as permitted sender) client-ip=10.213.7.144; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.7.144 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.7.144])
	by 10.213.7.144 with SMTP id d16mr4133896ebd.54.1329864494523 (num_hops
	= 1); Tue, 21 Feb 2012 14:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A8ul9MaBvdCfdrLNgDg8vsBRffbkVQdTsb0Mq2dbfeU=;
	b=itncDbOi4BeZTN+sRQsfE+OToNA9hHnHjoKyTTB7amGx0p39v2sWnFU08hC3oas037
	VblrFxCk3VQTE1VIryoCBsniCLdeX5rbM/pXdePzp3EpzeS8BaCjg3fQ9TZhv1+3ayal
	pa+pdeizR0PqSu4jUKvTD3jk4BeeP/NH2xATw=
Received: by 10.213.7.144 with SMTP id d16mr3284276ebd.54.1329864494397;
	Tue, 21 Feb 2012 14:48:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm95131621eeb.8.2012.02.21.14.48.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 14:48:13 -0800 (PST)
Date: Tue, 21 Feb 2012 23:48:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120221224811.GB3769@jama.jama.net>
References: <1329851229-31625-1-git-send-email-steve@sakoman.com>
	<1329861178.20261.62.camel@ted>
	<CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdabeX7TrUa_xGKAjdTS_NtmVRR+Y_Jz_27PkvXx9XNWPQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libxml2: add missing dependency on binutils
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
X-List-Received-Date: Tue, 21 Feb 2012 22:56:34 -0000
X-Groupsio-MsgNum: 17650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 02:26:49PM -0800, Steve Sakoman wrote:
> On Tue, Feb 21, 2012 at 1:52 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2012-02-21 at 11:07 -0800, Steve Sakoman wrote:
> >> Otherwise build fails with following error:
> >>
> >> | In file included from libxml.h:36:0,
> >> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from xmlmemory.c:8:
> >> | ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No su=
ch file or directory
> >>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >> =A0meta/recipes-core/libxml/libxml2.inc | =A0 =A02 +-
> >> =A01 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/=
libxml/libxml2.inc
> >> index 0979acd..6230f60 100644
> >> --- a/meta/recipes-core/libxml/libxml2.inc
> >> +++ b/meta/recipes-core/libxml/libxml2.inc
> >> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c48=
926316d9af6e2d70ca7013ade \
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://trio.c;beginline=3D5=
;endline=3D14;md5=3D6c025753c86d958722ec76e94cae932e"
> >>
> >> =A0DEPENDS_virtclass-native =3D "python-native"
> >> -DEPENDS =3D+ "zlib"
> >> +DEPENDS =3D+ "zlib binutils"
> >>
> >> =A0SRC_URI =3D "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz \
> >> =A0 =A0 =A0 =A0 =A0 =A0 file://libxml-64bit.patch"
> >
> > This sounds very wrong. It would have implications for libxml2-native
> > I'd imagine. What is it doing that needs binutils?
>=20
> For some reason the libxml2 configure phase decides that ansidecl.h
> from binutils is present, but then at compile time it finds that it
> actually isn't there!  I saw the same issue on both my desktop and
> autobuilder setups.
>=20
> I'll try a clean build to see if the problem persists.  The libz
> change from last week seems to have put my builds in a bad state, and
> the PR bumps intended to fix things really don't seem to be fixing
> things, at least on my build machines.  I suspect it might be faster
> to do a clean build than to track down where the corruption is.

The list of PR bumped recipes probably wasn't complete for you. It was
for me, but later I've noticed that ie subversion-1.6 wasn't bumped,
because I'm using only 1.7.

So it was complete for my default build (when those PR bumps were
applied to all included layers at once, which is not the case for most
people) and if you build different recipes or different versions you
have to add your own PR bumps in those recipes (see khem's script).

Clean build could be faster but doesn't fix installed -dev packages on
target..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9EHysACgkQN1Ujt2V2gBzqjwCdHqIUvlOUsmkyLwvVUcNV9IAB
1bIAnizrnOsQW0cQ286RU66m7VVaN7XZ
=2N1s
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
