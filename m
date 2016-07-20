Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id F11276212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:41:03 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id q2so3832117pap.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=zqAPCg3DbFicdTAtKfm1JLxM0jRDaGo3UIoKkYFpev4=;
	b=F6S/rcEinrpbZzS5LRVM2jLFJVJkPT00EBSPXJjdUoN4Xu3ZSLNI5KISUNzXg1KmBE
	Pr/NQ71IMZQ5vhoAHjkLEKcMGako+ZT9nDDwjT70B0QqL9aEhvYR0W8J85L0TeF7VX7P
	0NEg/9N56SBVdn4CMzG4wpk0QVciBkkJoVcTS10tLFQxezUd1gumrgM2wIdigOvuzU0s
	JrHKG0ZfE9+3Ny5BDycCgjZD20HoaFm6whuQqJoccS5O7QBzyoV+5c972e0W0AxoKuvH
	lYcocL8UMcd72B3C+20P5on3RihXfQItneMQlqOdVzpgZURuqH4j7PMZ74TEFYy0LmvM
	VITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=zqAPCg3DbFicdTAtKfm1JLxM0jRDaGo3UIoKkYFpev4=;
	b=LYVKnNbaWlSyB86OrIUqphrryKdwL/SuIVc+9sTAsbx54hsPRort2pYiN2ttkOHdaU
	QaWT51FizStahp/M8cLyLHxMuWHHJQBoveYFhgBVxacPExQ1U9OYYLmteJMM8a1Rou9G
	jYnzxONu3LE0F3oMXgg7kPmCv9JgjWN6LHdh6GWW9D9Ld37NJ8kxCF1L3aQb6ohsUJt4
	7/ZlW8/PB2anLWtHchnS311qQu5mtETWxNXZOG/mdcfIEqiR1ND3j4Ty7cTcoqqdUh8z
	efx0Nnc8WtyEzcW1yXawCNYk/1Gh8sUqFAunQwaX6ij/gUSkZdU60FttyOSVvhlokDzI
	kMBg==
X-Gm-Message-State: ALyK8tLJe5sa5vHvjDUei8UXCLBM6aTBKVNuNOB1Cdc8BxY/KTIzSl+87Eg0WpycuK0zSg==
X-Received: by 10.67.3.164 with SMTP id bx4mr78177931pad.9.1469043664688;
	Wed, 20 Jul 2016 12:41:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:e800:ab06:7d73:85ce?
	([2601:646:8882:b8c:e800:ab06:7d73:85ce])
	by smtp.gmail.com with ESMTPSA id q1sm6485249pfd.48.2016.07.20.12.41.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 12:41:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1dae681b38dac84b2febd93bdea237c8fc516c1f.1469043317.git.raj.khem@gmail.com>
Date: Wed, 20 Jul 2016 12:40:59 -0700
Message-Id: <A2C6F72E-AF0B-44AC-A153-FAB676299668@gmail.com>
References: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
	<cover.1469043317.git.raj.khem@gmail.com>
	<1dae681b38dac84b2febd93bdea237c8fc516c1f.1469043317.git.raj.khem@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 2/3] webkitgtk: Do not use gold with clang
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
X-List-Received-Date: Wed, 20 Jul 2016 19:41:04 -0000
X-Groupsio-MsgNum: 84736
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B827C26D-77EB-47D7-B4B0-A8266743B464";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B827C26D-77EB-47D7-B4B0-A8266743B464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 20, 2016, at 12:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> clang cross compiler fails to detect gold linker from
> cross-binutils, instead it defaults to ld.gold from build
> host, lets disable using gold when clang is active to avoid
> this issue
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> index 28517c4..2e5a1e4 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> @@ -79,6 +79,8 @@ EXTRA_OECMAKE_append_armv7a =3D " -DENABLE_JIT=3DOFF =
"
> # binutils 2.25.1 has a bug on aarch64:
> # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
> EXTRA_OECMAKE_append_aarch64 =3D " -DUSE_LD_GOLD=3DOFF "
> +EXTRA_OECMAKE_append_toolchain-clang =3D " -DUSE_LD_GOLD=3DOFF "
> +EXTRA_OECMAKE_append_toolchain-clang =3D " -DUSE_LD_GOLD=3DOFF =E2=80=9C=


redundant line. It has been fixed in pull tree.

>=20
> # JIT not supported on MIPS either
> EXTRA_OECMAKE_append_mips =3D " -DENABLE_JIT=3DOFF "
> --
> 2.9.0
>=20


--Apple-Mail=_B827C26D-77EB-47D7-B4B0-A8266743B464
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleP088ACgkQuwUzVZGdMxQPXACeK4YIUcxlpiWgOSrZ+RViqSBo
z4IAoIiF5jm2rUIuB/Qv1Aie4hX9rYgR
=m53/
-----END PGP SIGNATURE-----

--Apple-Mail=_B827C26D-77EB-47D7-B4B0-A8266743B464--
