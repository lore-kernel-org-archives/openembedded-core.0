Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzvHH-0007dP-PO
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:26:08 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1408419dak.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 12:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=JgKuMEF9F8f7zQ5jYwkbcneoafffhnE6PhLzuixr8hQ=;
	b=mSd7tLmYcgDntyYy22cHRYtxfGRMi+MInzPdNdD7P0KS4+TzkbHd3Best2959gcEv9
	FwvxOiZSZWwrV1G8AxTPkww+XfKwN2b/ug8YIqRy/bGjeoUOtvlmN4MM5OVYy8ucxuoW
	959YP6Jge0lO2ac9K16jdzCSCgtDNFn71eqqausXBKx5b+28AXt46sH9ay6l6f5s+Edf
	v7mR/+unQApGZwI43ICObxpWYocOhV+qh7BLSZ6kHDiXSK4i7YnDREdd1kY+hOalp8wl
	dLeppOlN7DV1rL4klR3mCn2zbEBv/H9EBk///ivnWWMm3KstdI3/xQ8D+bQRFaWujR4t
	3sOw==
X-Received: by 10.66.79.168 with SMTP id k8mr38673264pax.22.1359403824291;
	Mon, 28 Jan 2013 12:10:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id sy1sm6853278pbc.66.2013.01.28.12.10.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 12:10:23 -0800 (PST)
Date: Mon, 28 Jan 2013 21:10:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130128201023.GH16904@jama.palm1.palmone.com>
References: <cover.1359402980.git.raj.khem@gmail.com>
	<25339fa58dfb08985df8f6b602e00df5d9d576c9.1359402980.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25339fa58dfb08985df8f6b602e00df5d9d576c9.1359402980.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] systemd: Drop ppc build breakage patch for test-unit-file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 20:26:10 -0000
X-Groupsio-MsgNum: 34595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xp2nimoPFnvF0aLh"
Content-Disposition: inline

--Xp2nimoPFnvF0aLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 11:58:27AM -0800, Khem Raj wrote:
> its been fixed differently upstream in 197
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |   32 --------------=
------
>  meta/recipes-core/systemd/systemd_197.bb           |    3 --
>  2 files changed, 35 deletions(-)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file=
-Add-libsystemd-daemon.la-to-LDADD.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-li=
bsystemd-daemon.la-to-LDADD.patch b/meta/recipes-core/systemd/systemd/0001-=
test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
> deleted file mode 100644
> index 4cd2ee6..0000000
> --- a/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystem=
d-daemon.la-to-LDADD.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Upstream-Status: Submitted
> -
> -From f3e0a95b6b3fe516e43ec72045c2fad239184392 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 22 Jan 2013 18:25:46 -0800
> -Subject: [PATCH] test-unit-file: Add libsystemd-daemon.la to LDADD
> -
> -test-unit-file links with libsystemd-core which needs
> -sd_* symbols from libsystemd-daemon
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile.am |    3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 7d5bd5a..884227a 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1270,7 +1270,8 @@ test_unit_file_CFLAGS =3D \
> - 	$(DBUS_CFLAGS)
> -=20
> - test_unit_file_LDADD =3D \
> --	libsystemd-core.la
> -+	libsystemd-core.la \
> -+	libsystemd-daemon.la
> -=20
> - test_log_SOURCES =3D \
> - 	src/test/test-log.c
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core=
/systemd/systemd_197.bb
> index 500c3ec..d4fee45 100644
> --- a/meta/recipes-core/systemd/systemd_197.bb
> +++ b/meta/recipes-core/systemd/systemd_197.bb
> @@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260=
aa954499f7abaabaa882bbe \
> =20
>  PROVIDES =3D "udev"
> =20
> -PR =3D "r1"
> -

^ PR going backwards

>  DEPENDS =3D "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
> @@ -24,7 +22,6 @@ SRC_URI =3D "http://www.freedesktop.org/software/system=
d/systemd-${PV}.tar.xz \
>             ${UCLIBCPATCHES} \
>             file://00-create-volatile.conf \
>             file://0001-systemd-analyze-rewrite-in-C.patch \
> -           file://0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.=
patch \
>            "
>  SRC_URI[md5sum] =3D "56a860dceadfafe59f40141eb5223743"
>  SRC_URI[sha256sum] =3D "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c=
0a8af0c1bc9774b5"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Xp2nimoPFnvF0aLh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEG2y8ACgkQN1Ujt2V2gBwRagCfW72QVe9Bgd1FPXnaOGHzY9nv
TsIAn0Vbcz4+zaotYhlkjEajJWJWF2RP
=mfVY
-----END PGP SIGNATURE-----

--Xp2nimoPFnvF0aLh--
