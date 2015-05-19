Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 937CF601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 03:44:02 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so4978623pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IV8nbDEXSmysYBcgYK5rzm97CzPyn43E1MQN8lKC4zQ=;
	b=tH2EgIFbVZ4Ouiz3w3YeC7jShWNXEm10Ol7bBQOhapomAsqF0cVhW8V/jlpcy9Bb9Q
	pLvnYftJYYDBhsN4fg3C80m92xMmKj38vQuhAsp+bznWWWxt6aabvUhSlHo2JihJ+m+Q
	pnS4q2ojm1PfT8MXhagmhojB+IF1y4vKdcrnw5OkBZ0xtc3NlUfa6CBE/3usr0z4YjDi
	n8jL2DG0FxzZEoaCDn8XRUAXTCEObb307dQIJI1HhDp2nGSZSWgddegRJ+da9ep6HpnB
	mvlWlLsi1o/mEw3IjBXWKOKYn7j3z2U8rAKkC2Gb400arnmO1RJ40Wkglf0hL8JkdmQg
	jYQA==
X-Received: by 10.68.161.99 with SMTP id xr3mr49542147pbb.47.1432007043048;
	Mon, 18 May 2015 20:44:03 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:6195:1fa1:395:1fff?
	([2601:9:3580:84c:6195:1fa1:395:1fff])
	by mx.google.com with ESMTPSA id ob15sm244725pdb.40.2015.05.18.20.44.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 20:44:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALT56yMUTwHc5Z5c_x+V0EqMdpgqMnyu=6y3=UARJ9eCuHswDw@mail.gmail.com>
Date: Mon, 18 May 2015 20:43:57 -0700
Message-Id: <332A42E4-5829-4145-A6E1-4C8531E3B5EC@gmail.com>
References: <CALT56yMUTwHc5Z5c_x+V0EqMdpgqMnyu=6y3=UARJ9eCuHswDw@mail.gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-Mailer: Apple Mail (2.2098)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cortex-A9 vs Thumb configuration
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
X-List-Received-Date: Tue, 19 May 2015 03:44:09 -0000
X-Groupsio-MsgNum: 65697
Content-Type: multipart/signed;
	boundary="Apple-Mail=_86CEBFB9-69F4-4612-B0D0-D6910D311506";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_86CEBFB9-69F4-4612-B0D0-D6910D311506
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 18, 2015, at 7:42 AM, Dmitry Eremin-Solenikov =
<dbaryshkov@gmail.com> wrote:
>=20
> Hello,
>=20
> I was hit by one of changes in the package arch/tune/etc. naming. I'm
> building an image
> for the qemuarma9 (well, the error will be applicable to any
> ARMv7-based machine).
>=20

you need to select proper DEFAULTTUNE which has =E2=80=99t=E2=80=99 bit =
set, otherwise you are saying that
my machine does not support thumb

> After enabling ARM_INSTRUCTION_SET=3D"thumb" in the config, I received
> the following
> error:
>=20
> ERROR:  OE-core's config sanity checker detected a potential =
misconfiguration.
>    Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>    Following is the list of potential problems / advisories:
>=20
>    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
> (armv7at2-vfp-neon).
>=20
>=20
> --
> With best wishes
> Dmitry
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_86CEBFB9-69F4-4612-B0D0-D6910D311506
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVasYEACgkQuwUzVZGdMxS7PACgihpjMRxvUBwI1AJtN9790qBF
tmYAni+pG1nm6EksdSxu6k8HAMTbFEZf
=w6AE
-----END PGP SIGNATURE-----

--Apple-Mail=_86CEBFB9-69F4-4612-B0D0-D6910D311506--
