Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C63D173695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:11:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g132so454963pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=1jOUu44Sih64lVx8EYC2w/NTM6fbGhvxV27CpnTj4zI=;
	b=tETN0wIgsRscnsqBmQIXkJEoJ+ICh9c6ZBP7sf95sUljBFj5K3WCw0R/CHPtzbE9tv
	wtf1yxX/ai5U/JKM371o8nE0IjOIgXl+wQ0zpvqt0WKkQ+q06vbMd5F75YiQbr+cYzv+
	ENV1Y+YWgNAmkU0zwO1aV9G2UZeSbkP9SpJUwt/cveOVFCwoB/+V9PPmu7Si2dhVoS+H
	WwvDrFsyrFbMW7zY0Kv3ZZ/mUC0l5hJE8I+0Z6G/E06XL3Z2ltfHhrT8ap0P/vzznqOO
	cij5ro+Urx+mfT6Kw1R4IxOiLG4fiVjXtICd/1FCSs6qA830OvvGirXfhJllmpT4bbhQ
	F83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1jOUu44Sih64lVx8EYC2w/NTM6fbGhvxV27CpnTj4zI=;
	b=mtmQ9SUcfXlyPyrkpTAA6sS9dIi8u4rgMKvbc9Q/4NIm/C7P3ARzmFqpDRswiljT9u
	6ExJ1w2ejZylXbRSaJBq/3L7rOuH4v1MwDco76k30xNIm01bXqoydI+n+f3g9DtHIcc2
	IzsSMaq3PTthO3KHRWKQsdGhGvNbjzJ0zUUcNxQPbwdAZi/FvNIoVNpgxCHuM2hqxxt6
	o/53ISAbLGwikxPckCmL+r3BkzNkCTKrtIqU1NQfMGUP+182hjwAfToRVggn68XURvLd
	CfJrV+n2N3p3X9NR4hk5t/ZkChkesepQIDTW67rY8ljZrI+LTtTee7PWt+gOpWS1Z4PW
	T1/A==
X-Gm-Message-State: AOPr4FXHqAO+65EE+FupGA7M189yVLtbtdRsWkLAiBCgQN6vi0yT+WBus0uW2lH4CTyCjg==
X-Received: by 10.98.16.150 with SMTP id 22mr50303265pfq.165.1463454684741;
	Mon, 16 May 2016 20:11:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5587:b1ab:c014:b8fd?
	([2601:646:8800:5a9a:5587:b1ab:c014:b8fd])
	by smtp.gmail.com with ESMTPSA id g70sm511908pfb.7.2016.05.16.20.11.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 20:11:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463451718.2828.16.camel@andred.net>
Date: Mon, 16 May 2016 20:11:23 -0700
Message-Id: <9D3DE53D-7D3A-4E45-BE38-3D00F328AC99@gmail.com>
References: <1463066880-17505-1-git-send-email-git@andred.net>
	<1463126191-24272-1-git-send-email-git@andred.net>
	<55B50CC1-24B9-47C3-8120-1794775A93D0@gmail.com>
	<1463451718.2828.16.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3][krogoth] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Tue, 17 May 2016 03:11:24 -0000
X-Groupsio-MsgNum: 82201
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FEF19C7E-E2DF-42D2-B4DE-760FA41D04C3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FEF19C7E-E2DF-42D2-B4DE-760FA41D04C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2016, at 7:21 PM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> On Fr, 2016-05-13 at 10:08 -0700, Khem Raj wrote:
>>>=20
>>> On May 13, 2016, at 12:56 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>>>=20
>>> Commit 6661718 (feature-arm-{neon,vfp}.inc: refactor and fix issues)
>>> effectively changed the gcc -mfpu=3D option from -mfpu=3Dvfpv3-d16 =
to
>>> -mfpu=3Dvfpv3d16, which gcc doesn't understand.
>>>=20
>>> Restore the original value.
>>>=20
>>> After doing that, we also need to adjust ARMPKGSFX_FPU which should
>>> contain the same value without dash '-' as it is used that way
>>> throughout.
>>=20
>> V1 worked fine for my case. V3 doesnt even apply. Can you rebase it =
on top
>> of master and resend ?
>=20
> V1 on krogoth should have the same issue as the original patch on =
master,
> i.e. should break on your raspberry pi2?
>=20
> Since V1 hasn't made it onto krogoth yet, V3 contains the two patches =
from
> the master branch squashed into one. Maybe you need to undo the V1 =
patch on
> your local krogoth branch?
>=20
> Or should we apply both patches (not squashed) from master onto =
krogoth, so
> as to have fewer diversions?


v1 is already applied. So please send your second patch separately once =
both
are in, then a request to pull them into krogoth should be sent.

>=20
> Cheers,
> Andre
>=20
>>>=20
>>> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>>> ---
>>> meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
>>> meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
>>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc
>>> b/meta/conf/machine/include/arm/feature-arm-neon.inc
>>> index 50d9175..b34af8e 100644
>>> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
>>> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
>>> @@ -8,7 +8,7 @@ TUNEVALID[neon] =3D "Enable Neon SIMD accelerator =
unit."
>>> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', =
'
>>> neon', '', d)}"
>>>=20
>>> TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with =
16
>>> registers (vfpv3-d16) unit."
>>> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3d16',
>>> ' vfpv3d16', '', d)}"
>>> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3d16',
>>> ' vfpv3-d16', '', d)}"
>>>=20
>>> TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32
>>> registers (vfpv3) unit."
>>> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3', '
>>> vfpv3', '' , d)}"
>>> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> index 4247255..9ef31e7 100644
>>> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>>> @@ -6,7 +6,7 @@ TUNEVALID[vfp] =3D "Enable Vector Floating Point =
(vfp)
>>> unit."
>>> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', =
'
>>> vfp', '', d)}"
>>>=20
>>> TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % =
d.getVar('TUNE_CCARGS_MFPU',
>>> True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') =
else
>>> ''}"
>>> -ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
>>> True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') =
else
>>> ''}"
>>> +ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
>>> True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if
>>> (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else ''}"
>>>=20
>>> TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call
>>> convention, requires VFP."
>>> TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES',
>>> 'callconvention-hard', 'hard', 'softfp', d) if
>>> (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else '' }"
>>> --
>>> 2.8.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FEF19C7E-E2DF-42D2-B4DE-760FA41D04C3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc6i9sACgkQuwUzVZGdMxTurACeIoX/CbNjsXnrivC+cQERCMY0
I4gAn3Oo5dV421eWvN7HKIT6GJzWXzdi
=i27+
-----END PGP SIGNATURE-----

--Apple-Mail=_FEF19C7E-E2DF-42D2-B4DE-760FA41D04C3--
