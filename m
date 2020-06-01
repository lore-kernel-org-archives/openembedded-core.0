Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.49278.1591049539515050967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 15:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=KXynqAVc;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1612; q=dns/txt; s=axis-central1;
  t=1591049539; x=1622585539;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fTE+kt89vjx3TmlGLLykYB3Jz6J6oFck+TyTwSMaVVs=;
  b=KXynqAVcaa3o4nE1deVjtWX0J5LKp3eDTllsdDCZDiE4Ob7mOxTst/dc
   7SutwddGmwWGa2Mz9F/mLZkjY01ehSCz78+oQW/J8kgl5sy09mn8wqyab
   CUOzl4DR8BKvDYs+l3dOuNAP7Jd3+Z9qGf2Ofg0JHXt7jsurXwkwN8KQ5
   EsJnJn7mUZ1vf+eZ6+kOrYFpuwKuPt2+pBw3VUTBsqXBSXJ/OOtV+lEjb
   QNXgeBWX/iN5zZ105S9G1YL3+p5kZEs4xKTETFlggr/0Kc4SzjMhipq+x
   +6ncZk/A63osb987ooN8aspcRASxBUqTbkOBAng6nrvb3CxWzUJymfFFX
   A==;
IronPort-SDR: TAUyXaYx5OdmnsVHnbF22zA5J1h1KsEC8UyoJLUz/1t6kv2ZL/Gnme39HO2cWz1/YwGS3aQElT
 whQi5oBEIV9e1fN+q0aaiybT5ipOQzlDFA04npi7/eAcy302S3q0bD3K8oENpfHBtGANOAZHuL
 WyNAhs0IqT5+sM47BCsK6WWwpDA0Qql0gY0sPlSfxBpqx5Vc4EZ1fvJ1SGp3kqp+KES5kMaLS6
 OrUOL6Fwa5gu/1gPYHAFjvUIQG8oVjbw0IQWNfQ+4g5iXK6kdOF7w5TtLLF57PKGjr620M0Xuv
 T+U=
X-IronPort-AV: E=Sophos;i="5.73,462,1583190000"; 
   d="scan'208";a="9372817"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
Thread-Topic: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
 copyright year lines.
Thread-Index: AQHWN2Ue81/0BuJcrkeHoTmFj/MVKajEUx1Q
Date: Mon, 1 Jun 2020 22:12:16 +0000
Message-ID: <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-65-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 31 maj 2020 17:53
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
> copyright year lines.

Eh, what? That's definitely not the right thing to do. For a license=20
that says "The above copyright notice and this permission notice shall=20
be included in all copies or substantial portions of the Software.",=20
removing the copyright information makes the file useless as part of,=20
e.g., ${PN}-lic.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/libyaml/libyaml_0.2.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.4.bb
> b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
> index e1817748bc..b0f85cda0e 100644
> --- a/meta/recipes-support/libyaml/libyaml_0.2.4.bb
> +++ b/meta/recipes-support/libyaml/libyaml_0.2.4.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://pyyaml.org/wiki/LibYAML"
>  SECTION =3D "libs/devel"
>=20
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f486472366=
63d"
> +LIC_FILES_CHKSUM =3D "file://License;md5=3D51591594753f05018680f6db765d5=
a46;beginline=3D3"
>=20
>  SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "0532bb32548ee92f1c0328aa8a87dec7"
> --
> 2.26.2

//Peter
