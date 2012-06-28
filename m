Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SkKJh-0008Lt-HB; Thu, 28 Jun 2012 21:23:49 +0200
Received: by werg55 with SMTP id g55so1671897wer.6
	for <multiple recipients>; Thu, 28 Jun 2012 12:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fI/iwrLSB6W8pWKs1pFytn26OyWVXSE05vLAZ+uoYAo=;
	b=PXRq3usQbfWKL2kYldW6pucgD8xCGDPBRMp5KctjJe97tXW9UlBi+s8PpvIrZnOQ2y
	wktpAUyrrsx+BRiW0JqUnjOgDrNhh/L0cQqEWDb5UjokTPzIZNkhVxZvnCLu1D61FKln
	V0QiQTLCBiAFq2fytqQHjAqx0V+++xVosHgqV2vSaG2vbKxWbpgImanuHwdV6m4b2fws
	PDq95LGQ2g7mzVhlJx0Uc98zdPkeI5bwzqmQ/TRzgPPNMn45MQQKu6t2PLcFJeLm7Mrp
	nH8gApPPnT4hMF9Sy0k0J78YZwCFt17hObpd4gGedkrXu3EG18X2jN9+oJn7fzzbb9Nc
	DnbQ==
Received: by 10.180.20.239 with SMTP id q15mr226810wie.13.1340910774546;
	Thu, 28 Jun 2012 12:12:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm661445wib.4.2012.06.28.12.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 12:12:53 -0700 (PDT)
Date: Thu, 28 Jun 2012 21:12:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120628191246.GA5532@localhost.jama.net>
References: <20120530110534.15D7110219@opal>
MIME-Version: 1.0
In-Reply-To: <20120530110534.15D7110219@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : util-linux: use new update-alternatives
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
X-List-Received-Date: Thu, 28 Jun 2012 19:23:49 -0000
X-Groupsio-MsgNum: 24259
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 11:05:32AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 55c01de28a28a4cfe16d36663c190a874ef2e85d
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
>=20
> Author: Mark Hatle <mark.hatle@windriver.com>
> Date:   Mon May 21 12:42:34 2012 -0500
>=20
> util-linux: use new update-alternatives
>=20
> In addition to switching to the new update-alternatives, it was discovered
> that the sln, shutdown, halt, reboot and related commands were never gene=
rated.
> Remove these from the list.  (These appear to have been removed from util=
-linux
> some time ago.)
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

This seems to break u-a for reset while upgrading from older image:

update-alternatives: Error: cannot register alternative reset to
/bin/reset since it is already registered to /usr/bin/reset

anyone seen it too?

Cheers,

>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc       |  212 +++++----------=
------
>  meta/recipes-core/util-linux/util-linux_2.21.1.bb |    2 +-
>  2 files changed, 45 insertions(+), 169 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D55c01de28a28a4cfe16d36663c190a874ef2e85d
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/srK4ACgkQN1Ujt2V2gByPiwCfUgM5aT467E37UhFLq6g18h9C
0tAAoLq5sYUIm3n4qYg+aLexJIeM27PL
=16l8
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
