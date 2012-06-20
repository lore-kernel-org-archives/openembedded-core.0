Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShQEg-0005ch-LS
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 21:06:38 +0200
Received: by werg55 with SMTP id g55so5232633wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 11:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2I91UDkFWGh+i43Hy5Yy1xQD7BBXB42TteP6bjO/hLI=;
	b=yaNdqfGS6NOKDamUjHD+LmiEWoEMvtBQ/WlPSxB4Rmop7EUAFWicXykqAi308C69QV
	v+hslSfRTbyo8bDrhbiDeTA6Eeh3B9Mf6IjqXg6UZzc13DH69NpW7MOqRBuvHWOjY6//
	IC+yM0pDQo0YbsFvPzk74T7MSLF5LG56RkgUapyV3oHSO1w3KggMaQbYu1r4BgtpS/Mz
	LjKIEivPrrVeP0OD10Uq2cuvOrAzYbM+9meLymi+7u5N/UST3eUer+kkQkhjj0Kdxbzl
	vMCsZQAtuskf85CUmYCnG2p72xGmN1JQRor1LxOfgSg60JBJlUdTEVJstUDwdHQSRj6J
	r1Gg==
Received: by 10.180.24.103 with SMTP id t7mr13996933wif.16.1340218548875;
	Wed, 20 Jun 2012 11:55:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm77488474wiy.1.2012.06.20.11.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 11:55:47 -0700 (PDT)
Date: Wed, 20 Jun 2012 20:55:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120620185551.GU3178@jama.jama.net>
References: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: latest updates make kernel menuconfig unusable
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
X-List-Received-Date: Wed, 20 Jun 2012 19:06:38 -0000
X-Groupsio-MsgNum: 23901
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oP9at/Ymg5VWhwKB"
Content-Disposition: inline

--oP9at/Ymg5VWhwKB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 04:20:03PM +0200, Andreas M=FCller wrote:
> Hi,
>=20
> since
>=20
> commit fe417e8a4d625c6933de72163d2fee52ac47f571
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu May 31 13:22:34 2012 +0000
>=20
>     cmd1.bbclass: Ensure ncurses is built and used for menuconfig tasks
>=20
>     Currently, the task just exits if something goes wrong. This adds the
>     ncurses-native dependency. It also adds a small delay before closing =
the
>     window so any messages displayed there can be seen.
>=20
>     Trying to get the kernel build system to correctly find and link with
>     our copy of ncurses is some kind of nightmare. I ended up having to a=
dd
>     it to HOST_LOADLIBES globally for this task which is rather nasty but=
 I
>     couldn't find any other way.
>=20
>     [YOCTO #2513]
>=20
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> my menuconfig is unusable (see screenshot attached). I reverted it and
> can work as before.
>=20
> I am working on Fedora 15 and set in my local.conf
>=20
> TERMCMD =3D "${GNOME_TERMCMD}"
> TERMCMDRUN =3D "${GNOME_TERMCMDRUN}"

I can confirm the same look&feel with=20
TERMCMD =3D "${SCREEN_TERMCMD}"
TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oP9at/Ymg5VWhwKB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/iHLcACgkQN1Ujt2V2gByEsQCcCc7uNKotFtnghl+hqVziAuqh
AaAAnA1tBjm0NFT4BMEBer9i39b7C6Eh
=a+tK
-----END PGP SIGNATURE-----

--oP9at/Ymg5VWhwKB--
