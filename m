Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFE037716F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:04:11 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ez1so24217882pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=fNVKQtJ311yj8Vh24ySbZX3HFwne0V2CLNHI1DJ8zIM=;
	b=mZIKHnY9FVAefMS6NYACy9W1+5CS8762guSv9O6p2NAbiHrBLsM0fzuOkbsaPXuzbr
	wz7AWiTPNO1aHsynyQCe1y1nvZWgoB/i7PxIgCewnnh3BgPeEaf4YmOOniVrvNptIRjj
	C/nQhdkaNRDlng15bX9YGpGsM3VdL9bfmnUj1DuYp1CqrxkRks1QkB3T5Es+gdUSZ/Oh
	VLUet9MtoggJUl5WK6Aeit3jjZW+GmJktOWhrPz2bx8/LbQC6lzi0xarzyc5jtCOiqtg
	2YG8f/464f5mcF1vtEwMDkoTgXjBQfcsxdvhP6WTPczN/IwALbo8XUaUFnycLHaPE11b
	gi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=fNVKQtJ311yj8Vh24ySbZX3HFwne0V2CLNHI1DJ8zIM=;
	b=bsg3SjpDsqcfpYT1Ovk/MNuK2Y77PENvSPVJhUPSlOADgZrxW11E9eHZ6q151couLN
	q7RFCxpE0+oGfhS63bt7RjwCk8f8hwWhJ4zEiK8pc+PsJ8Ituo+QUeZl++C1pyvNMyoX
	s2yxj9HdZY6pZ58IdPXgPtucMue6ZJ/BwYq0dxfssjOkAeqyu3IGMAZk7Mh3ZOMwq+C5
	iRod8tNqDS+XIylWDxKuSPiw1gs4OAcxz+JPpXU2OaxtGpTXJqhrf99dequGQLDcF7ai
	I67IBnf1mG8u/1m9Kb1etBttHPTTrtNBr82mghLPBAWM2i2fROE4kEpd/UyvYB+3J+CA
	LqCg==
X-Gm-Message-State: AEkoouvTOq7xEtNR5RgWIQkpQXXIZbFdTe5TdW+zlM9csFX/EzHF+B9Ev35Fmw4D1rl1cw==
X-Received: by 10.66.248.165 with SMTP id yn5mr166048082pac.44.1470672252158; 
	Mon, 08 Aug 2016 09:04:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id
	u72sm49206551pfa.31.2016.08.08.09.04.10
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:04:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <C43B640D-3E8C-45B6-99AA-172F7C995E0A@gmail.com>
Date: Mon, 8 Aug 2016 09:04:45 -0700
Message-Id: <BB08872C-6507-4120-9E27-BA7581A148F0@gmail.com>
References: <cover.1470627445.git.brian.avery@intel.com>
	<238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
	<db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
	<1470643460.8166.35.camel@linuxfoundation.org>
	<C43B640D-3E8C-45B6-99AA-172F7C995E0A@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 16:04:11 -0000
X-Groupsio-MsgNum: 85472
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1C55CE45-D984-4B15-9206-C8708555BAAE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1C55CE45-D984-4B15-9206-C8708555BAAE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 9:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Aug 8, 2016, at 1:04 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>> On Mon, 2016-08-08 at 08:27 +0200, Jacob Kroon wrote:
>>> On 08/08/2016 05:43 AM, bavery wrote:
>>>> The openssh-sftp-server was already part of the pakagegroup. Adding
>>>> the openssh-server
>>>> lets the sftp server start up correctly.
>>>=20
>>> If openssh-sftp-server cannot run without openssh, shouldn't it
>>> RDEPEND
>>> on it instead ?
>>=20
>> I suspect you are right and that it needs an RDEPENDS if it doesn't
>> work without it. It also needs a comment explaining the dependency so
>> someone doesn't remove it.
>=20
> I have been using

ignore this wrong thread and sent wrongly.

>=20
>>=20
>> Cheers,
>>=20
>> Richard
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


--Apple-Mail=_1C55CE45-D984-4B15-9206-C8708555BAAE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleorZ4ACgkQuwUzVZGdMxTNRgCfUWSUFDLQ/MGX0QarAVuDfbGO
DicAn3ftmuZ3UtlA8c/rG5X1sdmh7egL
=9Xzl
-----END PGP SIGNATURE-----

--Apple-Mail=_1C55CE45-D984-4B15-9206-C8708555BAAE--
