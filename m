Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB496EF8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 15:15:33 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id k10so1643127eaj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ME5unudJTvLNX3Fu+n1AUbG0WzcI4XQFnZ9F08//xRA=;
	b=NlnwW2aeyALXGBopF9QSXTftTQ2XU/yyJ+dMIBClsbceE2YGUQbVjaGO4F9aXBpS2o
	Nfb3Y5hR0pJ3OA0NKufHvjX07qNO3ws/rKULPgSGRi/KDpvOF8ALsoCmzEJQ7Ue2rlHc
	mqEoe6XlXXq98Irqw2n/8mtJYY2Eto0AB/cMrhGOFvwBm8ghd/kgWoEAxMxwVkUnOh88
	jTr6B2+KyZE4tCOiagxX9Tfiz9oxQSjJ2EtN2bDio1J8fG9xbKIjq+uFvnBNzBaEVEh6
	crj/Wlmejj2Z7jKoleCOPRW6k5hTTMxHGOZUK164IxipKmN3BdhQXDSPq/2NXd4kTxf9
	GKug==
X-Received: by 10.14.88.131 with SMTP id a3mr9212312eef.64.1392995733519;
	Fri, 21 Feb 2014 07:15:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm27507330eep.11.2014.02.21.07.15.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Feb 2014 07:15:32 -0800 (PST)
Date: Fri, 21 Feb 2014 16:16:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140221151607.GG3854@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1392891203.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Fri, 21 Feb 2014 15:15:37 -0000
X-Groupsio-MsgNum: 50423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline

--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 02:18:56AM -0800, Khem Raj wrote:
> This patchset upgrades systemd to 209 as can be seen some enahancements
> to uclibc were neeed. As of now. It builds for me on both uclibc/eglibc
> Please test it out in your setups and report back any issues
>=20
> The following changes since commit 9a98b8bfe13b94d89a9e39cca821f26fdeaeff=
c3:
>=20
>   image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-=
02-18 08:37:03 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib kraj/systemd-209
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/systemd-209
>=20
> Khem Raj (2):
>   uclibc: Add new functionality needed for systemd 209
>   systemd: Upgrade 208 -> 209

Thanks for upgrade

I've noticed pulseaudio failing to build when it tries to detect old
libsystemd-login lib:

| to the PKG_CONFIG_PATH environment variable
| No package 'libsystemd-login' found
| configure:26263: $? =3D 1
| configure:26277: result: no
| No package 'libsystemd-login' found
| configure:26310: error: *** Needed systemd support not found

do we want to enable compat libs or update pulseaudio to use new
libsystemd?

>  ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch |  31 --
>  ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  15 +-
>  ...ournal-Add-missing-byte-order-conversions.patch |  60 ----
>  .../journal-file-protect-against-alloca-0.patch    |  23 --
>  ...n-appending-to-journal-file-allocate-larg.patch |  83 -----
>  .../systemd/journald-add-missing-error-check.patch |  16 -
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |  22 +-
>  .../systemd/systemd-pam-fix-fallocate.patch        |  24 +-
>  .../systemd/systemd-pam-fix-getty-unit.patch       |  20 +-
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 166 +--------
>  .../systemd/systemd/systemd-pam-fix-msformat.patch | 115 ++++---
>  .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ++
>  .../systemd/{systemd_208.bb =3D> systemd_209.bb}     |  14 +-
>  meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
>  .../0001-Add-eventfd_read-and-eventfd_write.patch  | 120 +++++++
>  .../uclibc-git/0002-wire-setns-syscall.patch       |  68 ++++
>  ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch | 377 +++++++++++++++=
++++++
>  17 files changed, 702 insertions(+), 474 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-=
instead-of-host-mkdir-path.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing=
-byte-order-conversions.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/journal-file-protec=
t-against-alloca-0.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/journal-when-append=
ing-to-journal-file-allocate-larg.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/journald-add-missin=
g-error-check.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.pa=
tch
>  rename meta/recipes-core/systemd/{systemd_208.bb =3D> systemd_209.bb} (9=
6%)
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_=
read-and-eventfd_write.patch
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-s=
yscall.patch
>  create mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Defi=
ne-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
>=20
> --=20
> 1.9.0
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMHbbcACgkQN1Ujt2V2gBwP8ACfcK7i6WEh0n2isWVQ3ukuZA5y
c2EAn0Sqr0PaNyR1OBy6NqWMl+ll7Sl2
=Zk12
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
