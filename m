Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B1BAC731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:34:36 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bt5so78269330pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=lgXG35Wt0eHEBVqco0DIgqBzzcFbu6dcJHFaXWEK1Uc=;
	b=A8FD+OwfKxvrWeUQ/DAofnTyLERBK9dMI7qzEo3s2sENGs01okL//gGxNHNASF1ZwJ
	ro1b3HmjWH8F390w7Tyn6K6XYs1BxTiWEzbBfHAucaIqH2uC39m62A6WBDTKaP8VIg9e
	Gx8cYo9wb5SMd5JJkuHLo1QjfZotLkXqT0nlo/+2lB5Yza6MQ325WBNfSVr8KLPTd9zt
	aGxQcWzc/gfDDx72emen0uynX/vkUTe9+kt263i37TxWZlw7JhtBNCYe28vbsMHG9Eg1
	VW7+WLaUV2TOVdtL42f0rPkRrh6/G67jyDXZ5qIEFsyxvppG7bYMiuQrak6fQDeS4Ig0
	v3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=lgXG35Wt0eHEBVqco0DIgqBzzcFbu6dcJHFaXWEK1Uc=;
	b=B2CL74mvcQ83us/NDz3eAIxTWvlrYAGckq9as8XhxGayKbFA6DMPN2ldMgxmmqV76T
	L1rUJb/fcyJPWqRXnn+8RNrUc2TPvmAdXvArRtV2vCxZ8SEEmQFR1zBcKCSTIivYpRtp
	skjcY8ZvxnVhQzrJTf+oP6RGZ7j9oZI3uysbM1joqaEhl99z/Fv77fQ0WPa1ume32yNu
	AGTZ1+h3aYTy541QKBz5j6ZABYRqJ7IWF0Bdj6ZoilriAh74pufGTZoWEhUF38HMZs9u
	M4Ba4bQc3LKonwuslV9ZqauZCIqandZ8XlpxVT879bHwG8QrHzI7jstxaDMctp08y3Iu
	dWRg==
X-Gm-Message-State: AOPr4FWM7C8QNq4+dBqlKn0jdmLD7L662mFLjFgY4McBo0Yz+UH2s8Mz2i8opHZ3oPrEyA==
X-Received: by 10.66.246.71 with SMTP id xu7mr53968475pac.17.1462221276946;
	Mon, 02 May 2016 13:34:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:8dc7:7f44:e6aa:c692?
	([2601:646:8800:5a9a:8dc7:7f44:e6aa:c692])
	by smtp.gmail.com with ESMTPSA id
	f16sm41943791pfj.71.2016.05.02.13.34.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 13:34:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
Date: Mon, 2 May 2016 13:34:30 -0700
Message-Id: <B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 02 May 2016 20:34:38 -0000
X-Groupsio-MsgNum: 81474
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B41DB511-8196-459A-BA67-501154AC86C1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B41DB511-8196-459A-BA67-501154AC86C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com> =
wrote:
>=20
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> We explicitly set the hash style to gnu in our LDFLAGS. Setting the =
default to
> this in the toolchain, while convenient, actually hides bugs, as a =
failure to
> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to =
how we
> poison the sysroot -- rather than relying on the default, notice right =
away if
> somoeone isn't obeying the needed flags.
>=20
> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA =
failure,
> which is what's often seen with external toolchains. This brings us =
all on the
> same page, and makes sure a failure to obey LDFLAGS is seen early.
>=20


Default or gnu linkers is to use sysv for legacy reasons and by passing =
this option
to configuring the toolchain we want to make sure that components are =
using sane defaults
even if they have not configured these options.

if you do not pass the right linker flags from compiler driver and also =
ignore
the LDFLAGS then you now have a safe pass for the app to build without =
GNU hash
while I understand it will spread the external toolchain=E2=80=99s pains =
into internal toolchain
I fail to understand the benefit of doing this otherwise.

> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> meta/recipes-devtools/gcc/gcc-4.9.inc | 1 -
> meta/recipes-devtools/gcc/gcc-5.3.inc | 1 -
> 2 files changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc =
b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 7e03f31..c187918 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -111,7 +111,6 @@ EXTRA_OECONF_BASE =3D "\
>     --disable-bootstrap \
>     --disable-libmudflap \
>     --with-system-zlib \
> -    --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>     --enable-linker-build-id \
>     --with-ppl=3Dno \
>     --with-cloog=3Dno \
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc =
b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 9808be1..f2eda18 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -112,7 +112,6 @@ EXTRA_OECONF_BASE =3D "\
>     --disable-bootstrap \
>     --disable-libmudflap \
>     --with-system-zlib \
> -    --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>     --enable-linker-build-id \
>     --with-ppl=3Dno \
>     --with-cloog=3Dno \
> --
> 2.8.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B41DB511-8196-459A-BA67-501154AC86C1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcnudoACgkQuwUzVZGdMxRunACfZgsMMM0usWX0RtZeNyjKoD1/
qB0AnAqu1AP5b0Wzoy1jVWhqsGY4smX9
=kqbk
-----END PGP SIGNATURE-----

--Apple-Mail=_B41DB511-8196-459A-BA67-501154AC86C1--
