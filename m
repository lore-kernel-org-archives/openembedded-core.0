Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD833753E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 16:36:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z24-v6so3504293pfe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Vm9gQbj0MKJTSfBe1Itejfb6+EPDHsLlqcxMUtzgozY=;
	b=eGPijo6rssH4cI7X7eQ9WppBTMW7Jksf52fjjRljYYM+Ne1ATTez25MC5HdQ38uCen
	m9DFULvr1uXrgYE3DOvJPRvoxNqMPNTI7p1ff86jyPSUyWrY745O/ndN1SDkMHyXaiGH
	W0UYK0ykFgzctDc4m9yvVqpzUlq2R+mfExXqeX4LwbBtYJXHJnPS/+r1wC8Xk1edB2lI
	QFqo6JyX//rfjf2qeIpxjDGLcCbA29b1iCL6XTJ7AvHzBzdWm7cGSLZGjXaWoAzh2WzI
	HYtoAx4Tw1REyizNL9MnJq59i5+UAp3E2jmVQSh7cloPhIxHBtlxE3BDIT7rPTrjrUq6
	sHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Vm9gQbj0MKJTSfBe1Itejfb6+EPDHsLlqcxMUtzgozY=;
	b=EIJJ5pGQQQMRnRt5Y4Nj/nsXHLe63hoTyOgzxBcfZij/N+u31L2YrcKMw/rKF7lTZQ
	6JuAY/altR+rPx9QOzj7NRCy4i3vqOepRIFhqQeZX4Lw1hZ7SRmamcWjtdEpUUy5MHB6
	EPYp/zaU4ThbOi0zaAH34DgGly6w07V44+TLd0kTdRHguNnU8dxtWjFa1Z2CA5Bh9Akq
	kjXdZPAUUU3n0JBjmECinVDmydp8ht9tSbwTWHjSRlVvgEjHcYYnaz8Kux9OOu1IQy9v
	IyR7zX5JwSR3MFaG96mtIZIh3XULVSUKgFXsPnfFrDuN+b+00InM6QjcCBBvQiyyR4wA
	8Tdg==
X-Gm-Message-State: APt69E3+N9lAEu0GJMTSUV7ZybkNNuxQ97Y8d7VQFGs0ve852uNuw4CE
	PnnfXRLm2Eqx9TAK+0RmFCNyfk8s
X-Google-Smtp-Source: ADUXVKLmyQ9wke4TTwOuD6mHK19I3N2dT7wNQfbZALI5XORYTuIf82lFP9vBpugwUxQziyYRg4E82Q==
X-Received: by 2002:a63:780b:: with SMTP id
	t11-v6mr2901157pgc.91.1528994182575; 
	Thu, 14 Jun 2018 09:36:22 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:819b:b40b:792d:8193?
	([2601:646:877f:9499:819b:b40b:792d:8193])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm6971875pgp.47.2018.06.14.09.36.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 09:36:21 -0700 (PDT)
To: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
References: <1528968301-3209-1-git-send-email-chunrong.guo@nxp.com>
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
Message-ID: <cfb8f094-4f7a-5816-113d-1014d4180649@gmail.com>
Date: Thu, 14 Jun 2018 09:36:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528968301-3209-1-git-send-email-chunrong.guo@nxp.com>
Subject: Re: [PATCH] tune-ppce500v1: Add a tune file for PowerPC e500v1 cores
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
X-List-Received-Date: Thu, 14 Jun 2018 16:36:21 -0000
X-Groupsio-MsgNum: 112564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="enUAzdMdn47wjg0NG92BhL0j8XzSQomvI"

--enUAzdMdn47wjg0NG92BhL0j8XzSQomvI
Content-Type: multipart/mixed; boundary="gGCGKPLAyfKyryH40uCLKhENfPQjyhRgX";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: chunrong.guo@nxp.com, openembedded-core@lists.openembedded.org
Message-ID: <cfb8f094-4f7a-5816-113d-1014d4180649@gmail.com>
Subject: Re: [OE-core] [PATCH] tune-ppce500v1: Add a tune file for PowerPC
 e500v1 cores
References: <1528968301-3209-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1528968301-3209-1-git-send-email-chunrong.guo@nxp.com>

--gGCGKPLAyfKyryH40uCLKhENfPQjyhRgX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Chunrong

On 6/14/18 2:25 AM, chunrong.guo@nxp.com wrote:
> From: Chunrong Guo <chunrong.guo@nxp.com>
>=20
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/conf/machine/include/tune-ppce500v1.inc | 20 ++++++++++++++++++++=

>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-ppce500v1.inc
>=20
> diff --git a/meta/conf/machine/include/tune-ppce500v1.inc b/meta/conf/m=
achine/include/tune-ppce500v1.inc
> new file mode 100644
> index 0000000..509c81b
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-ppce500v1.inc
> @@ -0,0 +1,20 @@
> +DEFAULTTUNE ?=3D "ppce500v1"
> +
> +require conf/machine/include/powerpc/arch-powerpc.inc
> +
> +TUNEVALID[ppce500v1] =3D "Enable ppce500v1 specific processor optimiza=
tions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'ppce500v1', '=
 -mcpu=3D8540', '', d)}"
> +
> +TUNEVALID[spe] =3D "Enable SPE ABI extensions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v1',=
 'spe' ], ' -mabi=3Dspe -mspe -mfloat-gprs=3Ddouble', '', d)}"
> +TARGET_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v1' ,=
 'spe' ], 'ppc-efd', '', d)}"
> +
> +# spe is defined potentially in two places, so we want to be sure it w=
ill
> +# only write spe once to the ABIEXTENSIONS field.
> +SPEABIEXTENSION =3D "${@bb.utils.filter('TUNE_FEATURES', 'spe', d)}"
> +ABIEXTENSION .=3D "${SPEABIEXTENSION}"
> +
> +AVAILTUNES +=3D "ppce500v1"
> +TUNE_FEATURES_tune-ppce500v1 =3D "m32 spe ppce500v1"
> +TUNE_PKGARCH_tune-ppce500v1 =3D "ppce500v1"
> +PACKAGE_EXTRA_ARCHS_tune-ppce500v1 =3D "ppce500v1"
>=20

I must inform that spe backend is moved into obsoleted backends in gcc
and is slated to be gone in gcc9 unless someone shows up to maintain it.
With that in mind, I think we should wait and not add this to oe-core
since this will also become obsolete as we move to new compiler.


--gGCGKPLAyfKyryH40uCLKhENfPQjyhRgX--

--enUAzdMdn47wjg0NG92BhL0j8XzSQomvI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWyKZgAAKCRC7BTNVkZ0z
FJbAAJ9/OIImMkxZAIJfLemxPe9kYoGTBACgjJYfvrvJ/lZRIp0cX8iThgRRuPY=
=elTP
-----END PGP SIGNATURE-----

--enUAzdMdn47wjg0NG92BhL0j8XzSQomvI--
