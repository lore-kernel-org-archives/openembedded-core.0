Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHHrQ-0000cM-Oo
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 18:22:21 +0200
Received: by bkat8 with SMTP id t8so5309129bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DFkjBX/IjWsTRFCmmFsqiUvnE0YHewr/iwp/Zu01omE=;
	b=lQdie7DX4ZOou9jQkf5kXhhcnfUaJTK4aaSGGUD662cxo1kgCaYTGjMPvfHy6HqIju
	7opo7rmZxHsl1VqzPTRl11O3eGs9qbAsnJYbWUrDtnNmj/E5NO4qP8mrsRvQf1ueTCLj
	AmoQ/DkGfLWYxrjxvo2qiczMNs1U8dPWU3xfY=
Received: by 10.204.154.156 with SMTP id o28mr11026969bkw.12.1319213787431;
	Fri, 21 Oct 2011 09:16:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm14023782bkv.3.2011.10.21.09.16.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 09:16:26 -0700 (PDT)
Date: Fri, 21 Oct 2011 18:16:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111021161620.GS3522@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Oct 2011 16:22:21 -0000
X-Groupsio-MsgNum: 11442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQAi4ZBraoACHIeu"
Content-Disposition: inline

--rQAi4ZBraoACHIeu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2011 at 08:40:20AM -0700, Khem Raj wrote:
> On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0.../pulseaudio/pulseaudio_0.9.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> > =A01 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/=
meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > index 4ac2418..2f872b8 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > @@ -23,3 +23,4 @@ do_compile_prepend() {
> > =A0 =A0 cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> > =A0}
> >
> > +ARM_INSTRUCTION_SET =3D "arm"
>=20
> not averse to patch but it would be nice to know what fails in thumb mode.

selected processor does not support Thumb mode `swp r1,r2,[r3]'

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rQAi4ZBraoACHIeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6hmtQACgkQN1Ujt2V2gBzNCgCfXU+4y9Y15f4xEsvp9JoGQTq2
jTEAoLf3JT6lzvBiaH806zjsJ31426Me
=F3B4
-----END PGP SIGNATURE-----

--rQAi4ZBraoACHIeu--
