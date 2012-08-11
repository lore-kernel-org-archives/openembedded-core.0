Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T06yG-0008O4-3R
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 10:22:56 +0200
Received: by wibhn17 with SMTP id hn17so948664wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2012 01:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wJH5I4a60FSQ5OTRJTlhN+ssC5t+Ibk6VtkEAMjurPQ=;
	b=cEovgswqdtRhOgImzTkoYoa8/0Dw0n6E/zRKvwE60/Z01oACWCsRrSYeiv/xompzKa
	pOsDgxEdViqHGTcM3xlvDnV99YOLtYmeEO8+vUz6s9B9VOS98sPdyAlr0BoQ+5WFcsjj
	UxdJpoft5kcxurrep4kPHgWcoBzKQNGY1kcjyyUkKvvEdzpH36iKSPqZrPWgUy/VHnpb
	QblGc64h+CshebDIJe4yht5c43nzsRmL6K17d5phm53OYVb3WYuDxbQ4yM1Nf4S+i7U3
	CFbhuHJJgEtIWTjpLGQlLZR3iOIVTQ69055F+kinAf4py6hA5mEjA/efdLyJ/im+NX7H
	D2zg==
Received: by 10.180.84.1 with SMTP id u1mr2347762wiy.15.1344672665570;
	Sat, 11 Aug 2012 01:11:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm3675124wix.6.2012.08.11.01.11.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Aug 2012 01:11:04 -0700 (PDT)
Date: Sat, 11 Aug 2012 10:11:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120811081108.GB3258@jama.jama.net>
References: <1344672337-9025-1-git-send-email-xin.ouyang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1344672337-9025-1-git-send-email-xin.ouyang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libatomics-ops: update to the latest version 7.2
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
X-List-Received-Date: Sat, 11 Aug 2012 08:22:56 -0000
X-Groupsio-MsgNum: 27287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline

--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 11, 2012 at 04:05:37PM +0800, xin.ouyang@windriver.com wrote:
> From: Xin Ouyang <Xin.Ouyang@windriver.com>
>=20
> All old patches are droped because:
>=20
> Merged into 7.2 by upstream:
> * fedora/libatomic_ops-1.2-ppclwzfix.patch
> * gentoo/libatomic_ops-1.2-mips.patch
> * gentoo/sh4-atomic-ops.patch
> * libatomics-ops_fix_for_x32.patch
>=20
> Obsolete:
> * doublefix.patch
>=20
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>  .../pulseaudio/libatomics-ops/doublefix.patch      |   27 ----
>  .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |   20 ---
>  .../gentoo/libatomic_ops-1.2-mips.patch            |  129 --------------=
------
>  .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 -----------
>  .../libatomics-ops_fix_for_x32.patch               |   41 -------
>  .../pulseaudio/libatomics-ops_1.2.bb               |   34 ------
>  .../pulseaudio/libatomics-ops_7.2.bb               |   29 +++++

Can you resend with -M?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAmE5wACgkQN1Ujt2V2gBwJkACghL4y9o2BRPLgGVZZj+1+O5tx
bowAoKiFEeQ8Iv94Vj3W+V0LUgM6iNMO
=tOGb
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
