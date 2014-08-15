Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 37999601A8;
	Fri, 15 Aug 2014 09:50:40 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id c11so1790548lbj.9
	for <multiple recipients>; Fri, 15 Aug 2014 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gcLNDP7EPDpH2tMltrbM7aF8Kfk1xTd672jIButtC4U=;
	b=EEw3CqqpAchqHlNWS3GQQTxmMQQhFGL2lNjZfKm4GE6YpSc8MpVggeDq2vqGo3IN0W
	PAvom8LFgjr4gCFruw+bxcba7571LPbYLcZfOlPJ+2NbvNlJ9z+6V0IqLannb32K5ULv
	d0/mkEYI6krW2SG5XuVRrUEU3lMB6dVbSrWeTb6Q1h/pK0ZywvkNmri/CKMp+7xioP6c
	SKmDHlDpD5CwDkwxlC/nlvZseeQqiMJM4kvhLXlEG+ZmHU9HL59mME88MDJbgCBEga1E
	38EAiI3/RAv73akgRgQxegmiCh+EzOiaXoSsv+1f65koq9cgRyaxwpY9KCQnFC6Gvw1h
	DIwg==
X-Received: by 10.112.87.41 with SMTP id u9mr1739190lbz.97.1408096240936;
	Fri, 15 Aug 2014 02:50:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q10sm4699154lal.37.2014.08.15.02.50.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 02:50:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 11:51:16 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <20140815095116.GD22747@jama>
References: <20140803114102.3311B503F2@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140803114102.3311B503F2@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bdwgc: Upgrade 7.2d -> 7.4.2
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
X-List-Received-Date: Fri, 15 Aug 2014 09:50:43 -0000
X-Groupsio-MsgNum: 56579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 03, 2014 at 11:41:02AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1ad6d714b1cc19ef92e74f7e559c8570ceae4685
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D1ad6d714b1cc19ef92e74f7e559c8570ceae4685
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Aug  2 09:44:12 2014 +0100
>=20
> bdwgc: Upgrade 7.2d -> 7.4.2
>=20
> Update the SRC_URI to the new site, same as HOMEPAGE. The libatomic
> pieces were removed and some of the READMEs, allowing simplification
> of the project license which is clear now.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../bdwgc/{bdwgc_7.2d.bb =3D> bdwgc_7.4.2.bb}                | 14 ++++++=
--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb b/meta/recipes-supp=
ort/bdwgc/bdwgc_7.4.2.bb
> similarity index 71%
> rename from meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> rename to meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> index 2e1a0e5..23ec954 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> @@ -16,17 +16,15 @@ DESCRIPTION =3D "The Boehm-Demers-Weiser conservative=
 garbage collector can be\
>   by replacing malloc with GC_malloc calls, replacing realloc with GC_rea=
lloc\
>   calls, and removing free calls."
> =20
> -HOMEPAGE =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> +HOMEPAGE =3D "http://www.hboehm.info/gc/"
>  SECTION =3D "devel"
> -LICENSE =3D "MIT & FSF-Unlimited & GPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://README.QUICK;md5=3D9b9dd874f6940641b6ab1989=
3ee8f1cc \
> -                    file://doc/README;md5=3D92e7dd0334d1f672b699cd0aca08=
bef0 \
> -                    file://libatomic_ops/doc/LICENSING.txt;md5=3D607073e=
04548eac7d1f763e480477bab"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://README.QUICK;md5=3D55f5088f90a982fed7af9a48=
97047ef7"
> =20
> -SRC_URI =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-$=
{PV}.tar.gz"
> +SRC_URI =3D "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz"
> =20
> -SRC_URI[md5sum] =3D "91340b28c61753a789eb6077675d87d2"
> -SRC_URI[sha256sum] =3D "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8e=
bd16aa985b511c5e"
> +SRC_URI[md5sum] =3D "12c05fd2811d989341d8c6d81f66af87"
> +SRC_URI[sha256sum] =3D "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c328=
2b994f933312afa2"
>  FILES_${PN}-doc =3D "/usr/share"
> =20
>  REAL_PV =3D "${@[d.getVar('PV',1)[:-1], d.getVar('PV',1)][(d.getVar('PV'=
,1)[-1]).isdigit()]}"

Since this release the PACKAGECONFIG for libatomics_ops is no longer
optional:

http://www.hboehm.info/gc/#where
Note that 7.3 and later require that you download a corresponding (or
possibly later) version of libatomic_ops, which should be available in
https://github.com/ivmai/libatomic_ops/wiki/Download. You will need to
place that in a libatomic_ops subdirectory. (We expect this requirement
to disappear again once C11 atomics become widely available.)

and it's not bundled anymore (like it was in 7.2d) and configure without
libatomics_ops now fails with:

| configure: error: libatomic_ops is required.  You can either install it on
|                   your system, or fetch and unpack a recent version into =
the
|                   source directory and link or rename it to libatomic_ops.
| Configure failed. The contents of all config.log files follows to aid deb=
ugging

It's enabled by default, so it can probably stay as is, but the web page
indicates that we probably need newer libatomic_ops for libgc to work
correctly.

>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPt2BQACgkQN1Ujt2V2gBwPuwCggE8f6WkVT20tCTryCUENg3IZ
ld8AoItw6j9PhCH5ywtjC6Ij2pak1jZA
=782A
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
