Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB29D75316
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 18:12:41 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m5-v6so1662415pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 11:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Zv+2u+wpfO536EvMt19H4ydXM4tbFmYUiW7kWNk8c+k=;
	b=XKl7LIDMOaJDOujGpiZDUovQZ5RXZZR2jQgi1/K8O6w+m4NtFedmdhHblFydpf6WWv
	oRRjs/1z4LZ1sPIvu9nPJwtZPcB/iQk7xsLcZIkVKVyw8VVz1s9sfpmL86l5QLZfVjJw
	dGruvCtx+FWc8kmZzt4CiT3ZKi3/zZLeFJCtGHpxPcCfxyTaD6ml55POzlFJPJqe+vKU
	Wq/kyKKwaeZjim8b+/qADRLrRMehJfH804sr6MC2oTFcV+WaHZ5skk3SAk7BsM0VmtrR
	EiHdRLkZrhfR2EG/9gz2f0nnTkkQ0ciXpkrLPxt5hkfBusKSOtnLHTk3V1cPNacVKSgd
	jr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Zv+2u+wpfO536EvMt19H4ydXM4tbFmYUiW7kWNk8c+k=;
	b=G//xNltlpDjxiEYKMMLysRPy8TlK7CKgZsbms5hQDrkiBkJnil4ewJZPRnoqzyyauw
	xq0Xs419NZej2wHyCZqRmuP/F0eSHZPB8wriT6+9br1Y6TX89tnI5G5H8nqWsfWTvz0z
	vnrLwfyOn+fwAcTFMuydZ/KsEVNliULJ4ttyQQzFOUpW9jx7KC1v/RzvtCiuo3KG6K1b
	hcBUxzBRrPFHQeYYEiIG/ua7SMAilcu5aDbxDs7PcHu1nRS7I+s5o1Jh3D3d9vlyOmeC
	7IFaLKgIT4VlZ0fB0VOrgwb+KXWWf7YBLGK/Ex8UEZyyOkWPnNXa4ZU8Bh2Jxxn+Fqc+
	so1g==
X-Gm-Message-State: APt69E3nd2EKBjt21FzLkVIWMJK9jP56x1VVPgjvrcdbaorJCce/t66S
	yAE5wmIf1czYLzdfwXMdgJ1wYdps
X-Google-Smtp-Source: ADUXVKJNu6QSFTyEtpN78vtqo/WcwXqKD0UGBSQlBf85R+sRE6kbTZM/Ux9sX+7sAAbNXkQoDxAhAA==
X-Received: by 2002:a63:a00a:: with SMTP id
	r10-v6mr5034065pge.222.1528913562334; 
	Wed, 13 Jun 2018 11:12:42 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:793c:8e25:5ce9:d5a7?
	([2601:646:877f:9499:793c:8e25:5ce9:d5a7])
	by smtp.gmail.com with ESMTPSA id
	a20-v6sm4787469pfo.55.2018.06.13.11.12.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 11:12:41 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1528910915-4480-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
	Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
	4evWolFf5cMmp87DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Message-ID: <8aae2bc1-8996-3601-5621-3db589bd7578@gmail.com>
Date: Wed, 13 Jun 2018 11:12:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528910915-4480-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] gcc8: drop stray uClibc specific patch
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
X-List-Received-Date: Wed, 13 Jun 2018 18:12:41 -0000
X-Groupsio-MsgNum: 112517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="QE9tpBKLtZFhh7UHlsja1onnaOpJ3TtXD"

--QE9tpBKLtZFhh7UHlsja1onnaOpJ3TtXD
Content-Type: multipart/mixed; boundary="KJ9zrgAmXaOIP2QrBq5er3T7kruxKUNA6";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <8aae2bc1-8996-3601-5621-3db589bd7578@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc8: drop stray uClibc specific patch
References: <1528910915-4480-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1528910915-4480-1-git-send-email-armccurdy@gmail.com>

--KJ9zrgAmXaOIP2QrBq5er3T7kruxKUNA6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/13/18 10:28 AM, Andre McCurdy wrote:
> The patch was previously removed for gcc7 but came back with gcc8.
>=20
>   http://git.openembedded.org/openembedded-core/commit/?id=3Df71bc69e5b=
7581c53071055b694bb0dbfe4b4a87
>=20

This is ok to apply, thanks for noticing it. I am planning to look into
the patches wholesale and see what we can remove. We have been carrying
several patches for long time.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-8.1.inc              |  1 -
>  .../gcc/gcc-8.1/0002-c99-snprintf.patch            | 28 --------------=
--------
>  2 files changed, 29 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf=
=2Epatch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devto=
ols/gcc/gcc-8.1.inc
> index cb0fbd9..d83ba65 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
> @@ -32,7 +32,6 @@ BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.t=
ar.xz"
>  SRC_URI =3D "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> -           file://0002-c99-snprintf.patch \
>             file://0003-gcc-poison-system-directories.patch \
>             file://0004-gcc-poison-dir-extend.patch \
>             file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch =
b/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
> deleted file mode 100644
> index aa123b4..0000000
> --- a/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 5fbfcf247ed6dd01263639daf0c9c3a291e2fd3a Mon Sep 17 00:00:00 2001=

> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:49:03 +0400
> -Subject: [PATCH 02/39] c99-snprintf
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - libstdc++-v3/include/c_std/cstdio | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/=
c_std/cstdio
> -index 1b9571eaa8d..ad816be4fd1 100644
> ---- a/libstdc++-v3/include/c_std/cstdio
> -+++ b/libstdc++-v3/include/c_std/cstdio
> -@@ -144,7 +144,7 @@ namespace std
> -   using ::vsprintf;
> - } // namespace std
> -=20
> --#if _GLIBCXX_USE_C99_STDIO
> -+#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
> -=20
> - #undef snprintf
> - #undef vfscanf
> ---=20
> -2.17.0
> -
>=20



--KJ9zrgAmXaOIP2QrBq5er3T7kruxKUNA6--

--QE9tpBKLtZFhh7UHlsja1onnaOpJ3TtXD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWyFejwAKCRC7BTNVkZ0z
FBwsAJ9lRIGjXtVcFHKvvl+JNmoLeF1CZQCfRN6GuF6gTBO0gt6ImUJ2DuoKuPY=
=AIic
-----END PGP SIGNATURE-----

--QE9tpBKLtZFhh7UHlsja1onnaOpJ3TtXD--
