Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7C29273FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:19:11 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so17821381pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LGjGPyuP52e6zBCFHMOQut6gWjUL6pG4eGWYh5fDlbg=;
	b=sH79ZdVUy/owLzql+/Zq75Jpp040BFj+cV2dBcu9Fw+QtVF0TQUPB/zI5c/+38YFPs
	pRSzyJhhkx5pufEaxbO3gq9YbFDPS1ngdf0mdTKa0oTdqzj/f5UB0uycjuM9p++k8u75
	SOlJtmN90B5Z5WZW9UplswPkMSx1/JjPALOWtsAmQOhcxi3WLJsJiY7fN9tkaeIAjQnd
	1P+5pXd9idtoeFIJYeiYS8ObgZ7YLLcx7VxPsLBL8MA4+1RpiF77uQCKwQOyFrUjdl0t
	w3nCjU1buXD/UEdWU/hTDxzx11dAA4zrlx23qznYvFcXDr1gVZrqgKJlR7/nHkm4/dBM
	PCQQ==
X-Received: by 10.70.46.74 with SMTP id t10mr15162938pdm.118.1431447552657;
	Tue, 12 May 2015 09:19:12 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	lc14sm16758100pab.33.2015.05.12.09.19.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:19:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3030d69a4aa172f6af394a142075414bba95e61d.1431411478.git.Qi.Chen@windriver.com>
Date: Tue, 12 May 2015 09:19:05 -0700
Message-Id: <6BA6B5A3-7785-4130-AE6E-42436EF2D8A3@gmail.com>
References: <cover.1431411478.git.Qi.Chen@windriver.com>
	<3030d69a4aa172f6af394a142075414bba95e61d.1431411478.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Tue, 12 May 2015 16:19:11 -0000
X-Groupsio-MsgNum: 65463
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0E001CFF-2975-4E1D-8C42-E0B510A67E8A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0E001CFF-2975-4E1D-8C42-E0B510A67E8A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 11, 2015, at 11:19 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>=20
> -	install =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PK=
GARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh =
${SDK_OUTPUT}/${SDKPATH}
> +	# find latest buildtools-tarball and install it
> +	buildtools_path=3D`ls -t1 =
${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PK=
GARCH}-buildtools-nativesdk-standalone-*.sh | head -n1`
> +	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
>=20

why not create a symink instead of poking using wild chars

--Apple-Mail=_0E001CFF-2975-4E1D-8C42-E0B510A67E8A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJ/4ACgkQuwUzVZGdMxQZtgCdFqGhozmbP6kbTxomGVYkmRR2
JL8AnihQ3aB/hoewZGX3vsTV56Lbxne1
=LNyR
-----END PGP SIGNATURE-----

--Apple-Mail=_0E001CFF-2975-4E1D-8C42-E0B510A67E8A--
