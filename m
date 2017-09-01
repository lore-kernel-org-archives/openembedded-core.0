Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0FB783FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 01:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v811PCcj024428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 18:25:12 -0700 (PDT)
Received: from pek-khao-d1 (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 Aug 2017 18:25:11 -0700
Date: Fri, 1 Sep 2017 09:27:08 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20170901012708.GB19450@pek-khao-d1>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<c9224d0a2d7a48fa1c60c7c35041cc4c673ddaaa.1504207711.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c9224d0a2d7a48fa1c60c7c35041cc4c673ddaaa.1504207711.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Originating-IP: [147.11.105.121]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] linux-yocto/4.10: fix aufs build
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
X-List-Received-Date: Fri, 01 Sep 2017 01:25:16 -0000
X-Groupsio-MsgNum: 102269
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3199z2xwsLUuj0Hj"
Content-Disposition: inline

--3199z2xwsLUuj0Hj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2017 at 03:30:58PM -0400, Bruce Ashfield wrote:
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_4.10.bb
> index 4107891f6e8a..10b56cda77e7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?=3D "standard/base"
>  KBRANCH_qemux86-64 ?=3D "standard/base"
>  KBRANCH_qemumips64 ?=3D "standard/mti-malta64"
> =20
> -SRCREV_machine_qemuarm ?=3D "4c652d50c67050422da4621cc6421ecb86b31c31"
> -SRCREV_machine_qemuarm64 ?=3D "65370fa249e282e4ce69cf927c01898b4c16f261"
> -SRCREV_machine_qemumips ?=3D "0a632fa7f9615ad1b2488a300846a7e925e6591a"
> -SRCREV_machine_qemuppc ?=3D "65370fa249e282e4ce69cf927c01898b4c16f261"
> -SRCREV_machine_qemux86 ?=3D "65370fa249e282e4ce69cf927c01898b4c16f261"
> -SRCREV_machine_qemux86-64 ?=3D "65370fa249e282e4ce69cf927c01898b4c16f261"
> -SRCREV_machine_qemumips64 ?=3D "75c22c1be83bf7894af78a36b3e3c5af08ce4d7b"
> -SRCREV_machine ?=3D "65370fa249e282e4ce69cf927c01898b4c16f261"
> -SRCREV_meta ?=3D "6ac2680ca4316fe111cddec37def7757843bbe86"
> +SRCREV_machine_qemuarm ?=3D "97253eca8592c9cba7c7665277e1118b048b9639"
> +SRCREV_machine_qemuarm64 ?=3D "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
> +SRCREV_machine_qemumips ?=3D "52e935b59800868731e7620caf49cc257f1b9946"
> +SRCREV_machine_qemuppc ?=3D "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
> +SRCREV_machine_qemux86 ?=3D "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
> +SRCREV_machine_qemux86-64 ?=3D "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
> +SRCREV_machine_qemumips64 ?=3D "7b6d7feb4b0143d6f9146784f6072ffd171dd7ba"
> +SRCREV_machine ?=3D "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"

Hi Bruce,

I didn't get these commits in linux-yocto-4.10 git tee? Did you forget to p=
ush
or I missed something?

Thanks,
Kevin

> +SRCREV_meta ?=3D "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-4.10.git;name=3Dmach=
ine;branch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-4.10;destsuffix=3D${KMETA}"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--3199z2xwsLUuj0Hj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZqLdsAAoJEJNY7TDerrFxvPEIAJTj3HaRTkfaqlJTrTqusSQ7
69zF3FPzkDefzNw2VDYOfZLLRFjRlv8QqpRa/vAzjSu1J0uo9fCXyYdhawnLtZI8
NvPU6P/BE7A+Sj995CNouuodzhNB2O3RvT+bPiTwGRRXguflPOCuE7GZQYbLPxNW
znbHrgcN/k+KouDuVgXgTRJFgaNJk4Zb8LVbKXqoPQtmwqkNuqALxhRqykQHPpEc
3MsuzycoyP7IakDTpsOK+Ho+xEIIuN/wTB9K/UNziKMdBSRoE5AW2yLhnWG0+HH6
aXl84DNHo84cCgdztPbQsVnQmbySAFl+DxX+UKFXQJZNS9L4wnBS0hXfbyntsQ0=
=n5GM
-----END PGP SIGNATURE-----

--3199z2xwsLUuj0Hj--
