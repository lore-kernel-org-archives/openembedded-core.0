Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 281C37050A;
	Tue, 15 Jul 2014 16:58:31 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so5839020wgg.12
	for <multiple recipients>; Tue, 15 Jul 2014 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7+sNrjiHGFNwVaBArckSqnZknH3+czz8g6QNU9MiEZE=;
	b=CjoyFZst+VB+QmK7UNvs+h5fgwCgB2VTXZwdvjugfvSJUXnXRoEuXI1vVaLnp8TxTS
	yaxkQjz7kJ2/LLbj51RESYj61EY0ESzGdrVYT+SVmMkUxqQfFO1EPHq+lyxHjNkv1L4b
	HwBxkgSO28AEjsSuz2jOcM7SSqlfjWBnwh0Q+4NvZBqd1TojoZ0+UsSn0807WNS54qzu
	nLUnmzkABkTjY4UdzY5buyCsW/bxz/i7AzoqnHj1e+hMT5V1DIswa1ph8HAASI1nCf+u
	2vBiR1yY2XHfEo/gFd5T9XfkIqJmG7trkpRKpEULPCySok0I4tiidWxrwhwUw81JzuGK
	PhZA==
X-Received: by 10.180.206.15 with SMTP id lk15mr6867618wic.43.1405443512796;
	Tue, 15 Jul 2014 09:58:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm33758862wjb.47.2014.07.15.09.58.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:58:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 18:58:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140715165842.GN2433@jama>
References: <cover.1405440532.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH 0/7][RFC] Remove enforced --foreign in autoreconf
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
X-List-Received-Date: Tue, 15 Jul 2014 16:58:43 -0000
X-Groupsio-MsgNum: 55018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0PSjARDFl/vfYT5"
Content-Disposition: inline

--f0PSjARDFl/vfYT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 05:18:30PM +0100, Ross Burton wrote:
> Hi,
>=20
> Since 2004 we've been forcibly passing --foreign to automake in autorecon=
f.
> This is a change from upstream behaviour and can actually break packages =
that
> expect GNU behaviour (admittedly the failure case reported was "interesti=
ng"),
> and I'm on a bit of a mission to remove patches that don't have a solid r=
eason
> behind them.
>=20
> Forcing --foreign doesn't seem that important these days as the majority =
of
> packages are telling automake they're foreign, There are a few packages t=
hat
> need patches for this change, notably they're mostly packages that haven'=
t seen
> a release for ten years.
>=20
> This series is build tested against a world build in oe-core for NUC, so =
I'd
> call it a demonstration that the patch is viable and would appreciate oth=
ers
> running build tests against other machines or layers.

world builds from
http://www.openembedded.org/wiki/Bitbake_World_Status
already have around ~50 failed recipes per architecture, I don't think
we need more now :/

Do we have some volunteers to fix-up meta-oe/* layers?

I'm going to use PNBLACKLIST more aggressively as agreed on OEDAM, but
with this speed next meta-oe release will have half of recipes which
were available in daisy.

> The following changes since commit 9e99bcffec594cb5b4c3533200e8eb56d32e6a=
77:
>=20
>   insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 2=
3:20:04 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib ross/automake
>=20
> for you to fetch changes up to 406153008dc78f4e3198c012f2db98fcac09b5c1:
>=20
>   autoconf: remove automake patch enforcing --foreign (2014-07-15 17:05:2=
9 +0100)
>=20
> ----------------------------------------------------------------
> Ross Burton (7):
>       bzip2: use "foreign" automake strictness
>       libid3tag: use "foreign" automake strictness
>       which: use "foreign" automake strictness
>       libmad: use "foreign" automake strictness
>       oprofile: use "foreign" automake strictness
>       ltp: use "foreign" automake strictness
>       autoconf: remove automake patch enforcing --foreign
>=20
>  .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
>  meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
>  .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
>  .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++=
++++++
>  meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
>  .../which/which-2.20/automake.patch                |   10 ++++++++++
>  meta/recipes-extended/which/which_2.20.bb          |    1 +
>  meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
>  .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
>  .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
>  .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
>  12 files changed, 56 insertions(+), 16 deletions(-)
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-fo=
reign.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
>  create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreig=
n.patch
>  create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreig=
n.patch
>=20
> Ross Burton (7):
>   bzip2: use "foreign" automake strictness
>   libid3tag: use "foreign" automake strictness
>   which: use "foreign" automake strictness
>   libmad: use "foreign" automake strictness
>   oprofile: use "foreign" automake strictness
>   ltp: use "foreign" automake strictness
>   autoconf: remove automake patch enforcing --foreign
>=20
>  .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
>  meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
>  .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
>  .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++=
++++++
>  meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
>  .../which/which-2.20/automake.patch                |   10 ++++++++++
>  meta/recipes-extended/which/which_2.20.bb          |    1 +
>  meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
>  .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
>  .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
>  .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
>  12 files changed, 56 insertions(+), 16 deletions(-)
>  delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-fo=
reign.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
>  create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
>  create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreig=
n.patch
>  create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreig=
n.patch
>=20
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f0PSjARDFl/vfYT5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlPFXcIACgkQN1Ujt2V2gBzB/wCdFfGVp6lOWqqVTsN8WLU+CZ2A
7nYAljJR2Bt7thK+0HIcfUeKimbK5YQ=
=1ava
-----END PGP SIGNATURE-----

--f0PSjARDFl/vfYT5--
