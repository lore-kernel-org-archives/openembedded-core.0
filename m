Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B87AE73189;
	Wed,  6 Jan 2016 03:16:06 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 65so185741347pff.3;
	Tue, 05 Jan 2016 19:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=L8mqbqliQX2HZ/SwGRDpvtynQ2ksCIER3knnhT2TB+E=;
	b=lt9ADaNoCDTpsWVCvLqsp0EdXFOEvr6Nr4HyOlnpOENAbopJGuQw1zMT3Jz3S/K+uP
	lgsMlEdX9vTcyORXktRhe0isNnOg6tTIsn5jW+rEdan6T5wEi08vvsLwd4LBJVRfmIAZ
	Xq881pH5bNaNFGzATql/69DAPnWqkLKX+gDtaRs8XhSG+tXmqLciYk/tYGclRgP6wv2y
	Ph5TlU+M6yzio20+3zJlVgnDmq2Dx+HAjDW2hYJhOQUk6Uk35tpVRKIKK8dywXeRZ4vD
	pQm4qe7aKrZWDsq7gVEMEnagrG7f6uPqbmC9ElfOgl+h1nosyhXBFVHOqGZEWh31NEUR
	p2GQ==
X-Received: by 10.98.14.145 with SMTP id 17mr139593452pfo.145.1452050167210;
	Tue, 05 Jan 2016 19:16:07 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d17f:ed53:e760:c0ba?
	([2601:646:8802:5d5c:d17f:ed53:e760:c0ba])
	by smtp.gmail.com with ESMTPSA id
	f12sm69504645pat.20.2016.01.05.19.16.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 19:16:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 5 Jan 2016 19:16:01 -0800
Message-Id: <8AE765C7-71E0-46D1-A086-A86AEEFE3F6B@gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
	<2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 03:16:07 -0000
X-Groupsio-MsgNum: 75489
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FA6830F9-D73F-470C-BDE3-7323B21BEC35";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FA6830F9-D73F-470C-BDE3-7323B21BEC35
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 5, 2016, at 4:01 PM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Tue, 05 Jan 2016 13:08:31 Khem Raj wrote:
>>> On Jan 5, 2016, at 8:17 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>>>=20
>>> On 4 January 2016 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I have done OE-Core only clean world builds for all Qemu machines
>>>> without a single build failure and
>>>> runtime boot tested.
>>>=20
>>> I threw this at the autobuilder and glibc failed to build on one of =
the
>>> runs:
>>>=20
>>> http://errors.yoctoproject.org/Errors/Details/26057/
>>=20
>> Thanks Ross, what MACHINE did you build for ?
>=20
> It's right there in the error report on the right hand side - =
genericx86.

Right, noticed it soon after. I have updated the patchset to fix the =
genericx86
and submitted it for glibc upstream as well.

Same branch now has updated glibc patchset, if you have cycles please =
try once more.

>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


--Apple-Mail=_FA6830F9-D73F-470C-BDE3-7323B21BEC35
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaMhvUACgkQuwUzVZGdMxQesgCbBPjFjM0UF4wBvq2dfDXgFVCB
TcIAmwSceIp21hGp4vRI96ww11nK00dy
=CJVv
-----END PGP SIGNATURE-----

--Apple-Mail=_FA6830F9-D73F-470C-BDE3-7323B21BEC35--
