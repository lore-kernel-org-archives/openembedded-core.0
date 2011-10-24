Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RILYB-0001tG-VX
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 16:30:52 +0200
Received: by bkat8 with SMTP id t8so8431696bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c+a84YsP4neceWSCDK5AaKWM7M9P8mVFzr+o2DoliDc=;
	b=hyiSnfsEJ3OTP4lxqxBXojMRcJsjvKQg7W6nmlrq/XEhuWBxF3aHLpLCT6jVqb0cOF
	cipNbbnfyfro2oIKeTXIUecPErPriZnFUrfpcs2JQh5s9B1v1HNMW9EbWYF9RuXiaXS9
	z/rqjWXFwCphIJ693HO1OUWciOTw+igxWhaoQ=
Received: by 10.204.129.155 with SMTP id o27mr4289201bks.94.1319466293600;
	Mon, 24 Oct 2011 07:24:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm23962333bkv.3.2011.10.24.07.24.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 07:24:52 -0700 (PDT)
Date: Mon, 24 Oct 2011 16:24:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111024142446.GC3602@jama.jama.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<6038b7e0961ca4aec70cc6de8adbc79567500e2b.1319394187.git.sgw@linux.intel.com>
	<1319462157.25011.1.camel@ted>
	<91421698-3BCA-4B52-8C7C-AD842A2E62FB@dominion.thruhere.net>
	<1319465707.25011.21.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1319465707.25011.21.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [CONSOLIDATED PULL 11/27] pulseaudio-0.9.23: inherit perlnative to work around build on host without XML/Parser.pm
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
X-List-Received-Date: Mon, 24 Oct 2011 14:30:52 -0000
X-Groupsio-MsgNum: 11524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2011 at 03:15:07PM +0100, Richard Purdie wrote:
> On Mon, 2011-10-24 at 15:19 +0200, Koen Kooi wrote:
> > Op 24 okt. 2011, om 15:15 heeft Richard Purdie het volgende geschreven:
> >=20
> > > On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> > >> From: Martin Jansa <Martin.Jansa@gmail.com>
> > >>=20
> > >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >> ---
> > >> .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
> > >> 1 files changed, 1 insertions(+), 1 deletions(-)
> > >>=20
> > >> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb=
 b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > >> index 33f5e15..4ac2418 100644
> > >> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > >> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> > >> @@ -4,7 +4,7 @@ PR =3D "r5"
> > >>=20
> > >> DEPENDS +=3D "gdbm speex"
> > >>=20
> > >> -inherit gettext
> > >> +inherit gettext perlnative
> > >=20
> > > This doesn't look right. If we need xmlparser, we should state that in
> > > DEPENDS. If that is added to DEPENDS, I'm not sure we still need the
> > > inherit of perlnative?
> >=20
> > If you need xmlparser during the build you almost always need the
> > perlnative wrapper as well :(
>=20
> I was under the impression that we'd fixed most of those issues :/. It
> could well be a valid dependency in this case so I'll take the patch
> with the added DEPENDS.

Those were imho transitive deps from intltool, that's why this is a bit
different.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ldS4ACgkQN1Ujt2V2gBz9DQCdEdRk3olsRZqKSMMfqSYOYEDT
tdUAoLm1DWyHtwkQVWh73UQBAH2aXTDn
=9NlG
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
