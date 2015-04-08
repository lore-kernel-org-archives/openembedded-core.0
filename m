Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8922C60089;
	Wed,  8 Apr 2015 16:55:59 +0000 (UTC)
Received: by widdi4 with SMTP id di4so62447783wid.0;
	Wed, 08 Apr 2015 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IAltOw+lr/lSJKsJDhclM7FgG+5XxjmKAqGJ5PNlD6k=;
	b=PGK9mqn2fs7spMUKUSQxMNdwxYMqUv7Ny4Vwu4DIOBkgF05Yf92sl2IoqQVQGvqxoh
	6lXrRDNCkv9iOjzpyMtMthbERI6gz7JzaciqhehzVcedkrxM0JNr68+80KUbRdaQhPYY
	mfoN5Id+ldjXiiJJKj43OTFhluHKG8QvyiK2Q4CXIcukSYu7+TliT+pVJzesrvY9AH7e
	mTonyfplqAQfjGXV0KjazqmhROOIIqaP508TmOkoqc+xPqza+Ppvz/q9Kv3EUkPd5gwP
	cdweMWoo8WzD33iOaTQLdxfU1+zhektuN1WHQvSmlt1rj8lmFinru4YUy4M4xKOcq78F
	W1yA==
X-Received: by 10.180.104.4 with SMTP id ga4mr16249217wib.86.1428512159857;
	Wed, 08 Apr 2015 09:55:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xy2sm16410131wjc.14.2015.04.08.09.55.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 09:55:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Apr 2015 18:56:02 +0200
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150408165602.GI2337@jama>
References: <20150408095412.1AF5150308@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150408095412.1AF5150308@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : gdb: Upgrade 7.8.1 -> 7.9
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
X-List-Received-Date: Wed, 08 Apr 2015 16:56:02 -0000
X-Groupsio-MsgNum: 64134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHuqAdgBYNjQz/wy"
Content-Disposition: inline

--lHuqAdgBYNjQz/wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2015 at 09:54:11AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 34a77b11350f1f4ccd952f78fd660710b6efaac8
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D34a77b11350f1f4ccd952f78fd660710b6efaac8
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Mar  2 02:11:00 2015 +0000
>=20
> gdb: Upgrade 7.8.1 -> 7.9

meta/conf/distro/include/tcmode-default.inc

should be updated with the same commit, now it causes:

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available (for i=
tem gdb-cross-canadian-arm)
NOTE: versions of gdb-cross-canadian-arm available: 7.9
NOTE: preferred version 7.8% of gdb not available (for item gdb)
NOTE: versions of gdb available: 7.9
NOTE: preferred version 7.8% of gdb-cross-canadian-arm not available (for i=
tem gdb-cross-canadian-arm-dev)
NOTE: versions of gdb-cross-canadian-arm available: 7.9
NOTE: preferred version 7.8% of gdb not available (for item gdb-dev)
NOTE: versions of gdb available: 7.9

because it still sets:
GDBVERSION ?=3D "7.8%"

>=20
> Refresh patches against new baseline
>=20
> Change-Id: I34c5a284c12f669ff3539a363e5eded15eeeeb23
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../gdb/{gdb-7.8.1.inc =3D> gdb-7.9.inc}             |   4 +-
>  ...canadian_7.8.1.bb =3D> gdb-cross-canadian_7.9.bb} |   0
>  .../gdb/{gdb-cross_7.8.1.bb =3D> gdb-cross_7.9.bb}   |   0
>  .../gdb/gdb/gdbserver-cflags-last.diff             |  14 +-
>  .../gdb/gdb/renesas-sh-native-support.patch        | 155 ++++++++++-----=
------
>  .../gdb/{gdb_7.8.1.bb =3D> gdb_7.9.bb}               |   0
>  6 files changed, 85 insertions(+), 88 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D34a77b11350f1f4ccd952f78fd660710b6efaac8
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lHuqAdgBYNjQz/wy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUlXaIACgkQN1Ujt2V2gBx2ewCfSSZ+f7RGRZZz7ldmZTxlaVjH
pWEAn07t7SJcFTulmN6TP9BhiUyJjtTa
=8dXr
-----END PGP SIGNATURE-----

--lHuqAdgBYNjQz/wy--
