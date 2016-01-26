Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4641C76E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:38:09 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s68so64874077qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qqOJZCNMTFmXGhPxwyq0vTzx5v1lXKq7dp+J9el7Wh0=;
	b=emp2OZfJG9iN0CuAqzDKL6y8upfEfZ/C2bOEvnSRiP/7rtfttBNPxYC5gGe7d5AVSe
	7VBV2fUJ51PwenFWl13xkiFQyR/nfz+Yo5xduMJi3NIY611d0PFS5y8N7QyrkoOZ4rwO
	vZhVGLEaWlvsxD2jlAWlyzH1ylV2wRgaHvJrEpIefOncBqnbzqmp9oG2UJA+4RziRjuQ
	ianljJnWwxDVff7mfHg3ojU/DIVqFen6AkLIHNl9YBgmRSVpJdSvXxpFpRiwCsQLZ4vN
	RobFQ+lmWLNvU/uhnqrQpe2zjbDJQiWnGPzbknszNg1nmIvywRFOw3lJn0SGbDdm5AH2
	FSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=qqOJZCNMTFmXGhPxwyq0vTzx5v1lXKq7dp+J9el7Wh0=;
	b=l0L6/tp4ibG8DWsqwuD4s2vEB8uei/O8pxXSeAKQFbSSmVpLH0uHSP4ksRZyToMw5X
	IkxoYx1sEqtCkzJE1z+ImHLgJ1BjDlTn6aKhjmq57wUZUKP4c0plKquj/rU9FfBdpcF1
	YoZW+P0M6PCgEqdDxZ0xKeTe7T6/sZZe6NLNnFXFYVqWs9L8UNhoMjhAMfr15uZdALSE
	t/D1t1TO7drqiW6rj+fzi2cSX3Ki2J8e5cl8phtL3haYi/rZ1oWoN8K5Q0r+x+sxRL6h
	mAWf/MyhE0ap5JIdRd81umX+gkgzAXmB7304UdlrigG6ABuRRFRCmzlg/DpyIslaFhiF
	bvVA==
X-Gm-Message-State: AG10YOQ8o0NXZ0sg7jzhqrx48F3PXDxcrncQ9Ltz2xtlZTtBhyF+LfZAT3E+fcxvtXn0nA==
X-Received: by 10.55.79.17 with SMTP id d17mr29071727qkb.56.1453826290036;
	Tue, 26 Jan 2016 08:38:10 -0800 (PST)
Received: from [172.20.20.20] ([50.153.94.17])
	by smtp.gmail.com with ESMTPSA id 77sm795081qgg.48.2016.01.26.08.38.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 08:38:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453785046-9017-1-git-send-email-armccurdy@gmail.com>
Date: Tue, 26 Jan 2016 11:38:04 -0500
Message-Id: <7CEFB79F-1AD8-4D5A-B2AD-6EE828F21256@gmail.com>
References: <1453785046-9017-1-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
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
X-List-Received-Date: Tue, 26 Jan 2016 16:38:11 -0000
X-Groupsio-MsgNum: 76924
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A1703A44-576E-49EE-91BA-BD2639F47627";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A1703A44-576E-49EE-91BA-BD2639F47627
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 26, 2016, at 12:10 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Experimental hack, not expected to be merged.
>=20
> Without this, the =
http://www.cplusplus.com/reference/string/string/append/
> example fails to build with -std=3Dc++11 and it's not clear why (it's =
as if we
> build a version of libstdc++ which supports only the old ABI but with =
headers
> which try to use the new ABI when compiled with -std=3Dc++11 ?). As a =
workaround,
> force libstdc++ to provide, and default to using, the old ABI in all =
cases.
>=20
> See also:
>=20
>  https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
>  https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
>  https://wiki.debian.org/GCC5
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/gcc/gcc-runtime.inc | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc =
b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index f20d298..3a476cd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -10,6 +10,19 @@ EXTRA_OECONF_PATHS =3D "\
>=20
> EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
>=20
> +# gcc-runtime.inc: force libstdc++ to always use gcc4 compatible ABI
> +# Experimental hack. Without this, the =
http://www.cplusplus.com/reference/string/string/append/
> +# example fails to build with -std=3Dc++11 and it's not clear why =
(it's as if we
> +# build a version of libstdc++ which supports only the old ABI but =
with headers
> +# which try to use the new ABI when compiled with -std=3Dc++11 ?). As =
a workaround,
> +# force libstdc++ to provide, and default to using, the old ABI in =
all cases.
> +# See also:
> +# https://gcc.gnu.org/onlinedocs/libstdc++/manual/configure.html
> +# https://mail.gnome.org/archives/gtkmm-list/2015-June/msg00026.html
> +# https://wiki.debian.org/GCC5
> +#
> +EXTRA_OECONF_append =3D " --disable-libstdcxx-dual-abi =
--with-default-libstdcxx-abi=3Dgcc4-compatible=E2=80=9D

This change while makes it work compatible to older libstdc++ ABI, we =
should make the defaults to be
forward looking. I would rather keep --with-default-libstdcxx-abi=3Dc++11 =
since gcc6 will switch to newer
c++ std as default. If we revert like you suggest, we will be up for =
more work in gcc6 time.

please define _GLIBCXX_USE_CXX11_ABI=3D0 for your app, where you see the =
problem.

> +

> RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp libatomic \
>     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], =
'libquadmath', '', d)} \
> "
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A1703A44-576E-49EE-91BA-BD2639F47627
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlanoPAACgkQuwUzVZGdMxTFeACfQdhdBpa05bUqiGwnLwLatDAS
yy0An0SfUp3iTmp+3cIJcPEHYgL628YL
=T6ty
-----END PGP SIGNATURE-----

--Apple-Mail=_A1703A44-576E-49EE-91BA-BD2639F47627--
