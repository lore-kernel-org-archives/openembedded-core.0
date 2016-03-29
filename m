Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 65AE96212F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 16:07:48 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tt10so16826760pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Y5qYREiyNCoB/dz5S0NKqhsgY2sLjfgsfPB7hetFgZY=;
	b=msSDdZcXAE0IEkvRMc55ugCPuESb3OWC8zqXW/lQHdOa06ic2MzTGbvIhJKrp6z1Wi
	okEgvC7+Je74RW9dnf1GpJlriv/zOG2z6YVEfH9C9lxyKXRgrTzDrFi6hmsCdPtiJ6ax
	NuPzrOhcyHCS2VDCQG/hUs91GT1EpCcDU9dvZdQg2P/21IbGue2n+dXkBe+aDP2/YFPE
	4YMGwEN/PB0AVcfk14wRKC8FD+mT9MCM3pdDmERerCDjPrvDkEZqmCHkqzGFJUuu55pS
	jbcKY6Y6jLtf9hVvc033EZLbWycG4X80ftNeGTuQ+GnchIHyFEPSA41Ei4ukYO1sht9E
	kJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Y5qYREiyNCoB/dz5S0NKqhsgY2sLjfgsfPB7hetFgZY=;
	b=cgppu2TF0EdYoNZ/56b/6r+an5egQTpnGOpOTnjD3DsbfBo+qlT1NBVaCGqtI1bP8m
	1SsO5JZQMDXINyF66fDZfOWNN4etDDuE0PfjG1TdkM0UwebTkuYcwmzxGgiEEXZhME06
	B0j/a9OSELyO/ePfq6THfj9zcIf4x37ficWaVb47rszgLrThFxdiDQ2TLWhsGHrIc69z
	wiz6/aRo9Af0P8fn5ifMnWg8yTjeU2zQfZ1dZ3UDGDQDFBTJ28ef77reW5pOg5r4DIdi
	qLSdl4Ya7NrBAIYdCO2WzE2LAX39Lbv7FYvf4S85RErW1sf14wMRLJpsGz2uv4xbGdKe
	nvIw==
X-Gm-Message-State: AD7BkJJPFxLaoVeaJPdyaKv8VqTcHyyxYW0l2dAY8KmrQCuHQBP75Clx+xlhQ7ILJoPOqQ==
X-Received: by 10.66.175.110 with SMTP id bz14mr4714927pac.41.1459267668965;
	Tue, 29 Mar 2016 09:07:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5557:97af:e383:d3a6?
	([2601:646:8800:5a9a:5557:97af:e383:d3a6])
	by smtp.gmail.com with ESMTPSA id
	f65sm44272308pfd.47.2016.03.29.09.07.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2016 09:07:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459203003.2322.29.camel@pbcl.net>
Date: Tue, 29 Mar 2016 09:07:43 -0700
Message-Id: <87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Tue, 29 Mar 2016 16:07:50 -0000
X-Groupsio-MsgNum: 80257
Content-Type: multipart/signed;
	boundary="Apple-Mail=_66B730E6-2188-4505-943F-5BED98844174";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_66B730E6-2188-4505-943F-5BED98844174
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>> For AArch64 state, the default tune is aarch32 and include which
>>    include just the aarch64 feature.
>=20
> I don't really understand what this sentence is trying to say.  Can =
you
> re-phrase it so as to be more accessible to non-experts?
>=20
>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>=20
> If you are deleting existing files, please mention that in the commit
> message.  And in particular, if you are removing a file that supports
> generic ARMv8 (if imperfectly) and replacing it with something that is
> specific to ARMv8-A, please explain why this is a good thing.
>=20
>> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', =
'-crc', '', d)}"
>> +ARMPKGSFX_FPU_64 =3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', =
'-crc', '', d)}"
>=20
> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
> related to the fpu.  Also, the fact that you need to duplicate both =
this
> and the crypto one for both FPU and FPU_64 seems like an indication =
that
> something elsewhere is misdesigned.
>=20
>> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'fp-armv8', '-fp-armv8', '', d)}"
>=20
> I don't entirely understand why this one doesn't have an FPU_64
> equivalent.  Are you always enabling vfp for A64?
>=20
>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', =
'aarch32', 'aarch32:', '' ,d)}"
>> +MACHINEOVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', ':aarch64', '' ,d)}"
>=20
> As previously discussed, I am not wild about "aarch32" as the name of =
an
> override which really means "ARMv8 in AArch32 state".  I know there is =
a
> school of thought that says that the execution state of older cpus is
> not AArch32 even if in practice it is indistinguishable, but this
> doesn't seem to match either the expectations that a rational user of =
OE
> is likely to have, or the information in the published literature.

Don=E2=80=99t disagree with technical argument I said that previously =
too. All I am trying
to say is lets take this opportunity to simplify arm tunes starting with =
armv8
we have this opportunity and what you suggest will keep the thread alive =
with
prior tunes. With armv8 we should match what we do for x86 and x86_64 =
ideally.

>=20
>> +ARMPKGARCH_tune-aarch64            ?=3D "aarch64"
>=20
> This seems a tiny bit short-sighted since presumably there will be an
> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be =
then?
>=20
>> +BASE_LIB_tune-aarch64            =3D "lib64"
>=20
> This seems like more a matter of distro policy and I'm not sure it
> belongs in a tune file.  If it does then can't you rely on the aarch64
> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having =
to
> duplicate this for all four of the tunes (and the -be equivalents)?
>=20
>> +# Duplicated from arch-arm.inc
>=20
> Please add a comment explaining why you can't include arch-arm.inc.
>=20
> p.
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_66B730E6-2188-4505-943F-5BED98844174
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb6qFIACgkQuwUzVZGdMxRnigCfchOYFoK52MI5JefR972xUYd1
2gAAoIQsGw+wGS5Fsh70rZO647Aa6nQS
=6oH5
-----END PGP SIGNATURE-----

--Apple-Mail=_66B730E6-2188-4505-943F-5BED98844174--
