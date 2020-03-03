Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A845C61608
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1995; q=dns/txt; s=axis-central1;
	t=1583234504; x=1614770504;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=RwFt82uABJpPl3yeW20fzAWYt7vI76fMh8k3mAjDxsI=;
	b=L69z390PjKxn9ztwkH9mspi53/etul7oQAMRPhARiQbvWcZZAXvHlVXv
	6/iA2P6dE/LViK6AbZ5Lmr15w8sayzplkfBn3Y4UsvCyHX8F2mhsBC4uY
	gG0sM9YxFvU7jIKqyD8CrFcbrqK6+2NuCkK/n1DHfyy2wD37HKXgxEA3H
	UoqlNanbmwSIxz8dpypIrdDZw9Eo3fB9F4N4e6vsbHOQt9Yc0BBmv72Uw
	g5kkR/F0F2zHVA+1V3vQO5OINVux85Mm9tfsKSSXzxZ4kxiHh7x2zk8Fw
	xG65SioZDVQXgKAOc49TBQgGERLyRbdJknkPWc4ATCtWsirTAlV1ZeA90 w==;
IronPort-SDR: LUUCazJi2fy8HTJFUHCfOkdCIEMLkLv6sy+kPGEdiCaaQYRqJ2/StnhqIpLTE0f9aGIyOrV/gA
	QrXcKia2YG9tzFBQSXMBgAmboXdPAiTxAarDNe3PwY5EY/oZORFbCSPtohfWoLRHcqC6dKzaf1
	CYh1jABTu/q0BZuikMGJUR7eTsdQfv5bdJcwm4xQI64BuJtHXyitxn5OHXokgENxHYEdRrMpPr
	FR5T7s/3E/aBHt+nNpPRr02/FOyj5qDGKQYe/7VimUw5nAnBv/GQjCIFTrT96qjBu8oNFSIZ/c
	2OY=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="6037701"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] python3-scons: Fix license file collision
Thread-Index: AQHV7xuWQ6yTXbga4EaH73rDwWSGzKg2vOKg
Date: Tue, 3 Mar 2020 11:21:42 +0000
Message-ID: <390fd7bab651456084420a36a41478a4@XBOX03.axis.com>
References: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] python3-scons: Fix license file collision
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
X-List-Received-Date: Tue, 03 Mar 2020 11:21:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 29 februari 2020 17:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] python3-scons: Fix license file collision
>=20
> Downloading a file called "LICENSE" into DL_DIR is 'problematic' and coll=
ides with the
> file from other versions of the recipe at best.
>=20
> Rename it to something more specific to avoid collision problems.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3-scons_3.1.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/r=
ecipes-devtools/python/python3-scons_3.1.2.bb
> index aa7a2a8300d..ce117a92d4f 100644
> --- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> @@ -1,10 +1,10 @@
>  SUMMARY =3D "Software Construction tool (make/autotools replacement)"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE;md5=3De14e1b33428df24a40=
a782ae142785d0"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=
=3De14e1b33428df24a40a782ae142785d0"
>=20
>  # pypi package does not have a valid license file
> -SRC_URI +=3D "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENS=
E;name=3Dlicense"
> +SRC_URI +=3D "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENS=
E;downloadfilename=3DLICENSE-python3-scons-${PV};name=3Dlicense"

Any reason to not use "${BP}" instead of "python3-scons-${PV}" above?
Or should I send a cleanup patch?

>=20
>  SRC_URI[md5sum] =3D "f9c4ad06dcf1427be95472eaf380c81a"
>  SRC_URI[sha256sum] =3D "8aaa483c303efeb678e6f7c776c8444a482f8ddc3ad891f8=
b6cdd35264da9a1f"
> --
> 2.25.0

//Peter


