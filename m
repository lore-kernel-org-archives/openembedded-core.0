Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UHc3j-0007wg-0c
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 16:33:27 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so1394658dak.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OXUfDCH/6Kg6BUEGoV57RnSATZV35ECIngk4EdUtzI4=;
	b=tkDQyVfEMfrltRkMxDoCcEvQ6Etzy2nmVJbKjFqXPD1FUfM7yTiSSFR0htkfcCfFTh
	9g+KgXAja47TPgYr/bZ8FGgHAtsVtazUgVKnj7XROzJpZTlA5nAM6fuKkm9GEe167Fu8
	mvZvoobLusubA7cKlgVP/dE2b7Z4VJHm/LQiYytCtrU3EVBkaYn8vt9VqnaRQlmTBi1n
	c9z3u3b1lDGZCEQtJRwUi5zTb43JDwUViHNYv2EcrdM6dZ6BzdxBOeiDFR1jcjz4VWtt
	fz261L/zDnqFW65nlmLHsFWLF1aXF0tP1mLn7aaT4vuwlQ8H6SxuL29bYaPKirnTX5Ku
	TVZg==
X-Received: by 10.66.139.166 with SMTP id qz6mr10785177pab.139.1363619781983; 
	Mon, 18 Mar 2013 08:16:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y1sm20514794pbg.10.2013.03.18.08.16.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 08:16:20 -0700 (PDT)
Date: Mon, 18 Mar 2013 16:16:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Olivier Guiter <olivier.guiter@linux.intel.com>
Message-ID: <20130318151612.GC13277@jama.dyndns-home.com>
References: <1363618422-19390-1-git-send-email-olivier.guiter@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1363618422-19390-1-git-send-email-olivier.guiter@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] neard: upgrade to 0.10
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
X-List-Received-Date: Mon, 18 Mar 2013 15:33:32 -0000
X-Groupsio-MsgNum: 36708
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline

--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 03:53:42PM +0100, Olivier Guiter wrote:
> neard ver 0.10:
> 	Added initial WiFi handover support.
> 	Added Service Name Lookup support to nfctool.
> 	Added NDEF building unit tests.
> 	Added State support to Bluetooth handover agent.
> 	Added neard and neard.conf man pages.
> 	Added a copy of the NFC kernel header.
> 	Fixed handover validation tests failures.
> 	Fixed Tag and Device PropertyChanged signal.
>=20
> Signed-off-by: Olivier Guiter <olivier.guiter@linux.intel.com>
> ---
>  meta/recipes-connectivity/neard/neard_0.9.bb |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-=
connectivity/neard/neard_0.9.bb
> index 8e33a9d..3ece002 100644
> --- a/meta/recipes-connectivity/neard/neard_0.9.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.9.bb
> @@ -47,14 +47,14 @@ FILES_${PN}-dbg +=3D "${libdir}/${BPN}/*/.debug"
> =20
>  RDEPENDS_${PN}-tests =3D "python python-dbus python-pygobject"
> =20
> -# This is valid for 0.9+
> +# This is valid for 0.10+
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
>   file://src/near.h;beginline=3D1;endline=3D20;md5=3D358e4deefef251a4761e=
1ffacc965d13 \
>   "
>  S	=3D "${WORKDIR}/git"
> -SRCREV	=3D "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
> -PV	=3D "0.9-git${SRCPV}"
> -PR	=3D "r1"
> +SRCREV	=3D "eb486bf35e24d7d1db61350f5ab393a0c880523d"
> +PV	=3D "0.10-git${SRCPV}"

This should be "+git${SCREV}" PV increment is good time to fix
that without need for PE bump.

> +PR	=3D "r0"
> =20
>  SRC_URI  =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protoco=
l=3Dgit \
>  	file://neard.in \
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

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFHL7wACgkQN1Ujt2V2gBx5XQCfV968itH5eCmHIPYqZaRqsDTt
0IIAnipbx8dGypSoiaQnHKyq0vZMvxBe
=dE5o
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
