Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RsvPN-0007zW-9L
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 13:04:58 +0100
Received: by eekd41 with SMTP id d41so617467eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 03:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lJXJ0AKA8upP/2RXPzcUqBOMRnPX5SXqGDAXMgSDOPQ=;
	b=qtvC9h1m56CBTU8chH3Es3Ac3FxUY13OP2ISTqTs+5tAOKEBg3wU+QG39NvUBrKgJy
	w5WNF90iB4PCPLt7HhvLHGcBUXJanGXD8zOZ5Qq5Qf/gN1WL8mWZlhQkXES0EuKOA1vb
	Hm+v4YEIZSeNoskOXVCbk2iuknZsAnuB0o6k8=
Received: by 10.14.39.202 with SMTP id d50mr822134eeb.79.1328183821156;
	Thu, 02 Feb 2012 03:57:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm8443869eeb.7.2012.02.02.03.56.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 03:57:00 -0800 (PST)
Date: Thu, 2 Feb 2012 12:56:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120202115658.GH3697@jama.jama.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 02 Feb 2012 12:04:58 -0000
X-Groupsio-MsgNum: 16907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline

--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2012 at 12:50:16PM +0100, Samuel Stirtzel wrote:
> Hi,
>=20
> for some time now I've been working on a port of Plasma Active, the
> next generation touch user interface from KDE.
> If you never heard about Plasma Active see [1].
> For touch devices it is much more satisfying to use a GUI that is
> designed for this input method, so I started porting it.
> Someone already built Plasma Active for the Pandaboard [2] but it was
> compiled native on the device, but somehow this inspired me to start
> this project.

Hi,

are you "darkh" on IRC? Because he wrote me about his meta-kde layer few
months ago, but haven't seen him since then.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8qegoACgkQN1Ujt2V2gByIvwCeMOIuVnQv51lfK2un8oSYpx6y
T84An3hx3iXr3bKDi8jpxN68cyKj54xR
=eqBx
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
