Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0006065F8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 10:33:32 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d49so2188705eek.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jioc9G3kli2kCNUGcxfKyF++ZFrYsnQ/8yUxZu8gMMo=;
	b=AW7BcYEg5Q22192MjaIfFZ5kjY9zn25k1jLJEzgQCIfK8uLWIj1ep9ipBnTYNnuTK3
	2S3gn1f1QSJV3zgjkRRA1CjmM7bs2ObrAVIYrhU1vnXOf/fnmSpE/RHprpTMw9QHoKQ8
	ibBXxv7eEvw5P1IjRmL9M+t4BqqHdRP5/wfuI28gSxq3yKC76n2S1gTN9WEtxRbZ9tYT
	L7wiNgiRYAIwAbjl7W6a4Jh/6wQP+RJ/pHBK04pIR6lQ44tghy9HnFIGZpe9NkxY5nTy
	ZMF+NM65kZ7Pqdt9ajH5HlXV4Xeyz29KaQs00VrkHHJ0pMO/FF6wN7KSGz/OX+wq98fC
	FoYg==
X-Received: by 10.14.209.3 with SMTP id r3mr15082859eeo.27.1399372412994;
	Tue, 06 May 2014 03:33:32 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id 48sm37342193eei.24.2014.05.06.03.33.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 03:33:31 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 6 May 2014 10:33:29 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140506103329.GD12987@gmail.com>
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
	<A4B8EEBF-A117-4A52-B23E-FB09372AC3DF@dominion.thruhere.net>
	<3786353.G8dUuZuNuH@peggleto-mobl5.ger.corp.intel.com>
	<3296908.lWzdU1Kadh@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3296908.lWzdU1Kadh@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Tue, 06 May 2014 10:33:33 -0000
X-Groupsio-MsgNum: 52860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 10:18:41AM +0100, Paul Eggleton wrote:
> On Tuesday 06 May 2014 10:17:03 Paul Eggleton wrote:
> > On Tuesday 06 May 2014 07:52:23 Koen Kooi wrote:
> > > Op 5 mei 2014, om 23:54 heeft Saul Wold <sgw@linux.intel.com> het vol=
gende
> >=20
> > geschreven:
> > > > On 05/05/2014 04:26 AM, Koen Kooi wrote:
> > > >> This fixes the following build error:
> > > >> 	| libarchive/archive_entry.c:59:55: fatal error: ext2fs/ext2_fs.h=
: No
> > > >> 	| such file or directory>>
> > > >>=20
> > > >> There is no configure options to avoid this dependency.
> > > >>=20
> > > >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > >> ---
> > > >>=20
> > > >>  meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >>=20
> > > >> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > >> b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb index
> > > >> eedbaa7..277d8c8 100644
> > > >> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > >> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> > > >> @@ -5,6 +5,8 @@ SECTION =3D "devel"
> > > >>=20
> > > >>  LICENSE =3D "BSD"
> > > >>  LIC_FILES_CHKSUM =3D
> > > >>  "file://COPYING;md5=3Db4e3ffd607d6686c6cb2f63394370841"
> > > >>=20
> > > >> +DEPENDS =3D "e2fsprogs"
> > > >> +
> > > >=20
> > > > By doing this we also have to extend e2fprogs to be a nativesdk tar=
get.
> > > >=20
> > > > Is there not a way to make this optional by editing the configure.a=
c and
> > > > adding a switch?  What functionality to we gain or loose with / wit=
hout
> > > > the ext2fs extensions?
> > >=20
> > > I really have no idea, I just had the above buildfailure yesterday.
> >=20
> > FYI this is a bug I was meant to be fixing in the 1.6 cycle (I noticed =
the
> > error in one of my builds a few months ago). Simply adding e2fsprogs to
> > DEPENDS adds time to the build, plus when I submitted a patch to do thi=
s I
> > found that nativesdk-e2fsprogs doesn't actually build at the moment and
> > since it's actually only the header it wants, I had in mind to just use=
 the
> > header from e2fsprogs-native. I haven't got around to testing the latter
> > solution though.
> >=20
> > Anyway, I've now done what I should have done earlier and filed a bug:
>=20
> Oops, sent too early - bug link:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6268
>=20
> Cheers,
> Paul
>=20

I just had a quick look at this as I've done a bit of work with libarchive.=
 It
looks like as long as the header isn't found at configure time there's no
problem at compile time. Could we work around this by modifying config.h in=
 a
do_configure_append() function to undefine the relevant symbol
(HAVE_EXT2FS_EXT2_FS_H)?

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTaLp5AAoJEBwoJlo7UPQD+jwH/iHeOpQ3CzZsDG4NGyt23U8B
Wp2eh/f14n7gHpnilI54zAIo2dODxVCyaRAiTg2W+Vhb/MUPI/Qq07Ryy/btx9dV
FctBNLKMkBp9LoU2sRHuxlnL84JyhX32F7IaXYd2HUOErPe2trd0CbtzHyZNCdLe
fvo187kYS79jFKT5RPY5w5I7Lx/YhFwJS3FFSOmCW3tLSb/QI3D0jmfAn60YBKqs
83H8OAamGuP8yWYXSlpAMUoG1jQGUFE/gUel6NGF9gse0sRF1VM6iPhry3LN7zEn
fwL4rtyMVY0NVhp1wOb94Yv0iBPvKfbrhzDMln/fQafQf5IAbqLYVvVDiW3LrFw=
=VAUI
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
