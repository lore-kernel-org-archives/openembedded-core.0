Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T1l4s-0000op-KB
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 23:24:34 +0200
Received: by wgbds1 with SMTP id ds1so37633wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xW9HqXw4zslBUbkJL9pBY05vxMpyKvQqiA9FUmQg0Vo=;
	b=vOeNroRT9+vYGaHf7/5cTR4G8MpWudsUpkhGyYoc40DXseUp9f0IhdahYtLjEPW2NE
	dJkaix0tAKdn5EcMhsEp9bOcU4mIsSB0sWZ4USw2lvsJ7+jt2kLJBs6IjWt9/XiSwq2c
	tP8x6LmALMPRcyatL0YG7MZqfBp2sx9/qk94mH+mD4CTVyN6rY0fHKu0FKFE3K41Uwyl
	zqoY9LR0+Kw0ZrIeNEJRS+9NL/82XhH3QaKbCjiJIZYJLFEiVdbB6+pdAha4LsRpbfED
	4xUVj775zxzuJxOT53kv7RHOU7xkJrJ5MbNKO26bDc9lyMtq0KeUA4RPo1eVNUBv0k+R
	Mjtg==
Received: by 10.216.238.30 with SMTP id z30mr11007940weq.223.1345065158082;
	Wed, 15 Aug 2012 14:12:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm7799985wix.5.2012.08.15.14.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 14:12:36 -0700 (PDT)
Date: Wed, 15 Aug 2012 23:12:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120815211232.GC3108@jama.jama.net>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 21:24:34 -0000
X-Groupsio-MsgNum: 27543
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 05:18:49PM +0100, Ross Burton wrote:
> GNU Make 3.82 has some regressions regarding parallel processing that cau=
ses
> some packages to fail, specifically WebKitGTK+.  Add make-replacement-nat=
ive
> 3.81 so that those packages can depend on a Make which is known to work.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.=
81.bb
>=20
> diff --git a/meta/recipes-devtools/make/make-replacement-native_3.81.bb b=
/meta/recipes-devtools/make/make-replacement-native_3.81.bb
> new file mode 100644
> index 0000000..716a8b5
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make-replacement-native_3.81.bb
> @@ -0,0 +1,6 @@
> +require make_${PV}.bb
> +
> +inherit native
> +
> +BPN =3D "make"
> +EXTRAINSTALL =3D ""

eglibc was failing to build with make-3.81
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2314

so I guess once this is built (as webkit-gtk dependency), eglibc will maybe=
 sometimes fail again..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAsEMAACgkQN1Ujt2V2gBx0VwCggWbiE2QgkpMcBHLkioOXp7Z6
odkAn1Y6wx16XtPNepvbLG6dYf/xVZkL
=4XmX
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
