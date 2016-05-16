Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED59A700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 16:44:50 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g132so16213524pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=NXtfdAQm9ecISOvWH825qWztMXT01ysVwXAc00OddCM=;
	b=f4lhSX58jeaTSN9kHHS5C9P2hqZIK+PSHBAkgy+vhfeYiqgufcGb22Xtlz0vyHUj4g
	9lGl2HQ+PRK5ps26V3acYa+iOQHzA46b8BVIrzxtveioUgpjSDuOtIc0G5m82hO2HyU7
	rD3TB+1N28kGoRcVg/uZl9Zum0U/0D/KBFUyI4moZRUl/vJTBziCNI3+Q7AyEy44c6dT
	TdBp6/KlQ885PjUvaNppynwaJ9rq2Z325fniQAnLUK/EcimX3ff4zqbrlB8TRk98yefm
	D2rvOodFkL8CGgPHVdYg7LrM6h0kMjLwf/99B77rc0wPh8EJ43Ms/ISvUDQE08shUu70
	Xt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NXtfdAQm9ecISOvWH825qWztMXT01ysVwXAc00OddCM=;
	b=KBrCC1RPoHNAUVXhc+qbSkEvEG3k9ZXbIwCzArhK9jE6JuzwO/gld2HNf7u6XFvgFq
	/s8B3BtzXmUgptn+MmbbM7c20Eo1NvihelK5zOtUNJ16V0t7PHMHvXUP7czi53WxPMFp
	dqNnSjwsqElAbl22sHJ3VHAuSClgYILuUWg1g/AXxG3mzk6RHeC8r/JVg3wV6IVEI6Zf
	d+z3nAq/+pwdaKpjec8OPaFcO4DtUu8nYrO8fE7EZXGt1cWpYWKrETe5rnRQq7xf0ub8
	U6DK02wlA3W1f5KgNCZlJ5WGZnAYBsubLq3k0GYFnXyCGaNO3FyHbomZtVo2H82GcFBf
	Cotg==
X-Gm-Message-State: AOPr4FWrMYt69DNRGSmMzWlO7QizaDpl5+cMfmEOdKo/8BOjDvCot4fBi28ui8zGJXdAjg==
X-Received: by 10.98.55.129 with SMTP id e123mr46983794pfa.4.1463417091166;
	Mon, 16 May 2016 09:44:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:dd3:cb39:a42f:8eaf?
	([2601:646:8800:5a9a:dd3:cb39:a42f:8eaf])
	by smtp.gmail.com with ESMTPSA id
	64sm48474011pfk.69.2016.05.16.09.44.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 09:44:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
Date: Mon, 16 May 2016 09:44:47 -0700
Message-Id: <C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Mon, 16 May 2016 16:44:53 -0000
X-Groupsio-MsgNum: 82162
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DEF7DA9D-7F72-4CB1-9642-BD59F14B5D98";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DEF7DA9D-7F72-4CB1-9642-BD59F14B5D98
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 16, 2016, at 9:17 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>=20
> From: Armin Kuster <akuster@mvista.com>
>=20
> numpy/core/include/numpy/npy_common.h:149:10: error:
> |          #error Unsupported size for type off_t
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
> meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git =
a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h =
b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
> index 191e5a1..109deb0 100644
> --- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
> +++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
> @@ -11,6 +11,7 @@
> #define NPY_SIZEOF_PY_INTPTR_T 8
> #define NPY_SIZEOF_PY_LONG_LONG 8
> #define NPY_SIZEOF_LONGLONG 8
> +#define NPY_SIZEOF_OFF_T 8

Why does the test to select size of off_t fails ?
we might need similar fix for mips64 too.

> #define NPY_NO_SMP 0
> #define NPY_HAVE_DECL_ISNAN
> #define NPY_HAVE_DECL_ISINF
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DEF7DA9D-7F72-4CB1-9642-BD59F14B5D98
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc5+QIACgkQuwUzVZGdMxRadQCfeTluuhyewSkJLB8ab28dKXJi
Cl8AnjvPcmjOTFz0c5rITVbRe6P+c5pH
=Czsg
-----END PGP SIGNATURE-----

--Apple-Mail=_DEF7DA9D-7F72-4CB1-9642-BD59F14B5D98--
