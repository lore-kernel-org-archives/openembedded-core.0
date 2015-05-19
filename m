Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D1DF960962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 03:54:25 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so5579485pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=W2kL4ggW912Yu2wTaztAY2G8TnOTYG9H9xMbBd/lFJ0=;
	b=SOByG/+Azfj4m1i9E7feZ37l930EZMpg/9+2Jxa9LwUGH9ml64KWBGrQwJ5Uytb6bt
	+QCNjr+xeYlUgwvt/vjJoA7pOfI2Tg0xX1ZCG4dQQ6rjoF0T39TVEdnA5JJahUvQfZny
	B2Xd11SNh1xUOkFHHFpDjnhphCq4cNzaWxUfxkHi6R9lt0/Z+fWIbhxoCcnqW2sO3n+e
	B5vt3NrNk2L3ZhX/uRs5Xq1tirhWK3xbPvDmZzLoNLm+v4S/nBx4X0LnoAu4CvPzseou
	tMTFF1hOXWh4tlOS9wbqWwa5oZuiTDRc/Aoo+yrO81OaSsgadrP51rPm+fqxQUSx8Zbj
	ZhCQ==
X-Received: by 10.70.95.228 with SMTP id dn4mr50180374pdb.89.1432007666913;
	Mon, 18 May 2015 20:54:26 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:6195:1fa1:395:1fff?
	([2601:9:3580:84c:6195:1fa1:395:1fff])
	by mx.google.com with ESMTPSA id
	ol3sm11442032pbb.70.2015.05.18.20.54.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 20:54:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
Date: Mon, 18 May 2015 20:54:20 -0700
Message-Id: <59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Tue, 19 May 2015 03:54:26 -0000
X-Groupsio-MsgNum: 65698
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1AD4329F-C95E-4C21-A198-10C5C1E37613";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1AD4329F-C95E-4C21-A198-10C5C1E37613
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 18, 2015, at 6:12 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> On Mon, May 18, 2015 at 10:08 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, May 18, 2015 at 2:50 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
> ...
>> overestimate please. Still what about angstrom + imx6qsabresd?
>=20
> No clue. I personally don't use Angstrom and I don't know what the
> distro does. You can instrument the class code to see if you find
> something useful and I can assist in how to address the issue. I just
> don't have enough time to debug this myself.

It has nothing to do with Angstrom, I checked meta-fsl-arm and here it =
goes

conf/machine/imx6qsabresd.conf
=E2=80=A6.
SOC_FAMILY =3D "mx6:mx6q=E2=80=9D
=E2=80=A6

Then

conf/machine/include/imx-base.inc

=E2=80=A6.
# Float-Point setting
# handled by software
# DEFAULTTUNE_mx6 ?=3D "cortexa9-neon"
# handled by hardware
DEFAULTTUNE_mx6 ?=3D "cortexa9hf-neon=E2=80=9D
=E2=80=A6.

Here you are saying all mx6 machines which don=E2=80=99t choose their =
DEFAULTTUNE are not thumb capable
and hence =E2=80=98thumb=E2=80=99 does not get into TUNE_FEATURES

IMO changing defaults for mx6 to use cortexa9t2hf-vfp-neon would be most =
close to h/w capabilities.

and when we say my default instruction set is thumb then it errors out. =
Ofcours one could argue
that message could have been better but atleast it did not do the wrong =
thing



--Apple-Mail=_1AD4329F-C95E-4C21-A198-10C5C1E37613
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVas/AACgkQuwUzVZGdMxQ7ewCfRpjESivryj04L4ck450cWtPN
CVcAn18wSLU0GyCV98CvfwUFDobEyZbf
=7L1D
-----END PGP SIGNATURE-----

--Apple-Mail=_1AD4329F-C95E-4C21-A198-10C5C1E37613--
