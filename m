Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIbVP-0006Do-Nl
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:33:04 +0200
Received: by bkat8 with SMTP id t8so166874bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0U4YXFYoCV8nV2oQRBKVIJ/867YG2t915lXSK3iYfrk=;
	b=MVjKpxK0rxkktFXoXMH1xzB0JoOPlx08ZJ+goePFAji2h81uEf1MkrCXDe3W28g14m
	/bNCBjLLzjm4+ozXhiE69HthdePNxnT4c1WsKz9bGKRTISWZJCKs3lF2uA+4pmF6tzDt
	zZf5V9HfaBIJ3P/SsOyyX5GgmTgTLzaBSG+SQ=
Received: by 10.204.129.146 with SMTP id o18mr19562231bks.95.1319527626009;
	Tue, 25 Oct 2011 00:27:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm26467153bkn.7.2011.10.25.00.27.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 00:27:04 -0700 (PDT)
Date: Tue, 25 Oct 2011 09:26:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111025072658.GF3602@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
	<20111021161620.GS3522@jama.jama.net>
	<1319286826.3310.1.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1319286826.3310.1.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Tue, 25 Oct 2011 07:33:04 -0000
X-Groupsio-MsgNum: 11539
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 22, 2011 at 01:33:46PM +0100, Phil Blundell wrote:
> On Fri, 2011-10-21 at 18:16 +0200, Martin Jansa wrote:
> > On Fri, Oct 21, 2011 at 08:40:20AM -0700, Khem Raj wrote:
> > > On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
> > > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.b=
b b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > > index 4ac2418..2f872b8 100644
> > > > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > > > @@ -23,3 +23,4 @@ do_compile_prepend() {
> > > >     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> > > >  }
> > > >
> > > > +ARM_INSTRUCTION_SET =3D "arm"
> > >=20
> > > not averse to patch but it would be nice to know what fails in thumb =
mode.
> >=20
> > selected processor does not support Thumb mode `swp r1,r2,[r3]'
>=20
> If it's only that one error (presumably some kind of home-grown atomic
> operation) then let's just fix the code in question rather than forcing
> the whole thing to build in ARM-state.  Or if the code is hard to fix,
> patch the makefile so that only the particular source files with the
> assembly in are built for ARM and let the rest stay as Thumb.  Making
> the whole package be ARM is a bit of a heavyweight fix for that issue.

That's why I've called it work around in cover, because I think that fixing=
 it in
old 0.9.23 is not worth it, we can try to fix it in 1.1 when we have it.

And it's not the only one error, I've updated commit message with bigger
chunk of log in=20
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/pull

and for om-gta02 (armv4t) it's about
selected processor does not support Thumb mode `mla r3,r7,r0,r3'

while swp was from spitz (armv5te).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6mZMIACgkQN1Ujt2V2gBxtGgCdEhUb8BWjzA0QCum0XU7ygsA1
dzsAoIwygFG4EPVXWCRqVl9GnLGl6bxP
=xCup
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
