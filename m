Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4AD7648C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:29:38 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23580739wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AdvMXUlO1RS3Tbq2beagiGHrNNyAYRtleSD1MWRrdBs=;
	b=mHzT/AXNKzMpdTYf3vE0wwkJmd+7W0FwokpRuvx8xQAMojQ9TtBYy4chdYcBWGBpHv
	toFP9jAZCXa7HwwYoHKuEDfDSy+kdUuYG7ekpoDELnev/uH0Ij4rp+H9XvxLB7xgz/Nb
	1DU6GqcWTtVndrbQ2r5Ur6ThnBStI3VOJziWhQWMKdhFQffDgUqaulsEc33GGqN8qMw5
	2O5IpkZwW0lCn/88tqHV+mWrNc3DvYfNIV5B0tX7ks6+zNU4WOjmk/LccYwK4uc7Q07z
	sMlSzD93JhStuOmyo6S4VYjjykDsNnGc4wmer682nagihVcZW2hGOY1dLLksUPUibZKq
	k4BQ==
X-Received: by 10.194.110.100 with SMTP id hz4mr88399984wjb.6.1438266578726;
	Thu, 30 Jul 2015 07:29:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l13sm2161280wjr.18.2015.07.30.07.29.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:29:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:29:53 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730142953.GC2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<bd04d3fc13b938a1f0a20f899be7f50815d43149.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <bd04d3fc13b938a1f0a20f899be7f50815d43149.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/26] fotowall: update SRC_URI to use github instead of qt-apps.org
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
X-List-Received-Date: Thu, 30 Jul 2015 14:29:39 -0000
X-Groupsio-MsgNum: 68732
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:31PM +0300, Alexander Kanavin wrote:
> GitHub is where upstream development is happening, so we are more likely
> to find out about new releases from there
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-qt/qt-apps/fotowall_0.9.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt=
-apps/fotowall_0.9.bb
> index 48dcc02..587b074 100644
> --- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> +++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
> @@ -10,7 +10,8 @@ SECTION =3D "x11/apps"
> =20
>  PR =3D "r4"
> =20
> -SRC_URI =3D "http://qt-apps.org/CONTENT/content-files/71316-Fotowall-0.9=
=2Etar.bz2 \
> +SRCREV =3D "06d5a4142c599604d9a9fd64727b6945eb8cd3da"
> +SRC_URI =3D "git://github.com/enricoros/fotowall.git \
>             file://ExportWizard-depends-on-ui_wizard.patch \
>             "

So it doesn't need SRC_URI checksums anymore.. drop:
SRC_URI[md5sum] =3D "142ef697332e0777c6d22c5bc96cc438"
SRC_URI[sha256sum] =3D "e4d0c005d2cb1d7c09438bfc3098eadebc08946e4fbc0655b7f=
c8b046de3810d"


> =20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NOAACgkQN1Ujt2V2gBx8NQCfWiXmBrF6DHiFXhNH63h8hH++
bG0AniqwcBLx0A8GhkvztK+7vkvTCyj6
=rUWX
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
