Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RIbbA-0006OG-HH
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:39:00 +0200
Received: by bkat8 with SMTP id t8so170140bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 00:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k4EkgXwKihx1nWrPeW0sahb1fXYaWvsYvwy0u7A4I+M=;
	b=iRV8TBEtWYt+03smPN5rCR0oCCRWHMOn2D282r0NV0L92KT1TgMrgPhZHtRhE3cBeB
	9nKLN4NWfUpje1Wyn9UP3aEUbfHc7sZPM5zCR3Ihis4keqiQWYCltkhZncxQABTTT8l1
	YpysgKb3R2kPWsCITrdqjDPSwnMoEKs1Z5Og8=
Received: by 10.204.153.1 with SMTP id i1mr19710548bkw.8.1319527983124;
	Tue, 25 Oct 2011 00:33:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm10112634bkv.4.2011.10.25.00.33.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Oct 2011 00:33:02 -0700 (PDT)
Date: Tue, 25 Oct 2011 09:32:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111025073256.GG3602@jama.jama.net>
References: <cover.1319132699.git.nitin.a.kamble@intel.com>
	<c12754ae1baee14c13a2467e31efd975f7f33258.1319132699.git.nitin.a.kamble@intel.com>
	<20111025070642.GE3602@jama.jama.net>
	<07537711-5DFF-43FE-8A23-4C173BDA4921@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <07537711-5DFF-43FE-8A23-4C173BDA4921@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] perl: upgrade from 5.12.3 to 5.14.2
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
X-List-Received-Date: Tue, 25 Oct 2011 07:39:01 -0000
X-Groupsio-MsgNum: 11541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Content-Disposition: inline

--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2011 at 09:17:11AM +0200, Koen Kooi wrote:
>=20
>=20
> Op 25 okt. 2011 om 09:06 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:
>=20
> > On Thu, Oct 20, 2011 at 10:47:08AM -0700, nitin.a.kamble@intel.com wrot=
e:
> >> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>=20
> >> parallel build fix patches are not needed as they are upstream now.
> >> Got a new set of debian patch set for 5.14.2
> >=20
> > I know that nobody wants PR bumps and nobody cares so much about upgrade
> > paths on target
>=20
> I care :) But I'm waiting on the python upgrade to go in so I can fix 2 b=
reakages in one go.

I've expected you to say that :).

I fear that python upgrade wont happend soon with nitin away and me
failing to fix it, so I've sent PR bump for stuff which was failing here
today.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6mZigACgkQN1Ujt2V2gBwjsgCeMUs0mgHnyj9GOnxFI0rXIAgL
f78AnRCY4RykHlBtYlyvV9YHQLzwCucM
=SQWR
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
