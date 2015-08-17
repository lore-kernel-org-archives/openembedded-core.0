Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C0FFB60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 15:48:40 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so67440524pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=VWeJ0bRE0c4ZA6BvszZBM0OSfe+vnw3mCdGYzMhr0/8=;
	b=mRUdeQA+4uGRPKr6K8vYT0Eu6YaG++9K3by0z8yJgB8PcLFBh46ztN/oxb7g28ViLQ
	PSpwHPlHEGM3Hh+2tg7vCqwp914Jun2AP4co6b573fv1o4I7CgVtEYGUX0xhFLVZivYK
	KUYv/PL88rD3cZK2CR/Mdd2BjQq1oEytYopTg2hxq1x2R4ABS6lFlcrbehCPyH2Ud0hB
	ymM60BaABL4ukB5VPfEO2EIsTGFmobcvlk+FYiBjW1E/XkBE1OXcO8IoNu/STRHF2GaG
	7knJMglzaolKDoVwRU0SReLMcGV2c1zCyvN/TFCIcZrZ7MrZBYR235Xt11jwkR4dlw5j
	t1Nw==
X-Received: by 10.66.222.161 with SMTP id qn1mr3960957pac.66.1439826521197;
	Mon, 17 Aug 2015 08:48:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a499:ca2e:e839:5908?
	([2601:646:8601:4580:a499:ca2e:e839:5908])
	by smtp.gmail.com with ESMTPSA id
	pe3sm15115916pdb.55.2015.08.17.08.48.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Aug 2015 08:48:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55D1D9E7.6070309@linux.intel.com>
Date: Mon, 17 Aug 2015 08:48:35 -0700
Message-Id: <D110DB7D-32DE-4EA4-9BDF-AAF02AD5C7F1@gmail.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
	<55CEC72D.4060702@windriver.com> <55D1D9E7.6070309@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/22] midori: remove the recipe and replace references to midori with epiphany
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
X-List-Received-Date: Mon, 17 Aug 2015 15:48:42 -0000
X-Groupsio-MsgNum: 69542
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FB97C3B0-5A3D-425C-8B9C-530A7A163BB9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FB97C3B0-5A3D-425C-8B9C-530A7A163BB9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 17, 2015, at 5:56 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 08/15/2015 07:59 AM, Randy MacLeod wrote:
>=20
>>> -# midori depends on webkit-gtk which could not build for mips64
>>> -MIDORI =3D "midori"
>>> -MIDORI_mips64 =3D ""
>>> -MIDORI_mips64n32 =3D ""
>>> +# epiphany depends on webkitgtk which could not build for mips64
>>> +EPIPHANY =3D "epiphany"
>>> +EPIPHANY_mips64 =3D ""
>>> +EPIPHANY_mips64n32 =3D ""
>>=20
>> Mips64 support using the newer webkitgtk may be better.
>> Wenzong please check on that once this code is in master-next
>> and reply here.
>=20
> Latest Webkit (2.8.5) actually does build for MIPS64 (where 2.8.4 =
failed), but I couldn't find a way to test the n32 variant using poky - =
any suggestions?


may be you can use multilib on same mips64 configuration and build =
libn32-epiphany ?

>=20
> I'll drop the above lines for now.
>=20
>=20
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FB97C3B0-5A3D-425C-8B9C-530A7A163BB9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXSAlcACgkQuwUzVZGdMxRJNgCfbfHukuYpjhC6iRrHUpiPszK2
abkAniwL/9b9K9BoOPB4BXfVJL7uWHp4
=o/VX
-----END PGP SIGNATURE-----

--Apple-Mail=_FB97C3B0-5A3D-425C-8B9C-530A7A163BB9--
