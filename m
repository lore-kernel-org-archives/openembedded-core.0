Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 577FE72F54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:57:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c198so7674222pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=KBAswOkRloIc6uheVmKUzFOfXEghs+hH0ktPt5TNd1g=;
	b=VYxwjQXio/pWksEwg5x8kAMrsMSVQgtjh91wdG0RA/rv8rLVdKGsc+nD/x9zw+ZvPj
	N+q1Zj4AFAjT5+Mk4xYM4U8QjqamPTACKKOMcsntFXc6CqmgVuEV8SiKkkIJJSnN6KEx
	ThK4KUpLkl2zpMrkyJG0E9gn7WkGE+uYFUZutX+D4TsphHkwtcxm6Qmc4NoDuS+O+ALT
	Gx9VcNUUkhuU0pqC5f7twq9aTfK8dpKljl65bVXgNV2TQQvIv4zTOIefQn+T34g1+23m
	m0asi+SQNjooQVOvSQCZLRm2+w8/aLzS8PEbU6l93YUsPROWajmym/Dl7w9DIn4W0FQH
	epCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=KBAswOkRloIc6uheVmKUzFOfXEghs+hH0ktPt5TNd1g=;
	b=PVG3UhrAiUwJFIVfJiN6K+I3CzXdqDtOdPDx/dpeUkM3woQkJluiBApy1gnTu1PFaS
	i3wbuQ9OcPlfpPArAFz0qbcS6ngs9kJW2MRdI/H+62Ea9ASVlDvzpLGau31Si0cUW0sJ
	niZxeX8TEwkVB+dwRSS/cRN0j4HC9miW7QxnS4wAN3D5God2auQlGzEBdTvvTSEdvcQk
	kBsj6bp8aDglcJB5C57d28BlG5CLcZx7GMdhKC/FVYzILhzAFDM3OGxpc1GrpMPQ65Mb
	MO2GWCH3EBUYldbTfJxyl9Kaeq/rv63TntqVknTD7FpG8pUPABmnnVWIvKNWGIblJtLP
	8ghw==
X-Gm-Message-State: AFeK/H1poWEkYm6BSdwS5Vl/I5FpLKesDS1M6Uwl06yGbcHt2wKSG/wELTzOcv8Uys+1pQ==
X-Received: by 10.84.178.131 with SMTP id z3mr37492701plb.139.1491854228533;
	Mon, 10 Apr 2017 12:57:08 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:a551:b153:de27:f516])
	by smtp.gmail.com with ESMTPSA id y6sm1073458pfa.83.2017.04.10.12.57.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 12:57:07 -0700 (PDT)
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
Date: Mon, 10 Apr 2017 12:57:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] gnu-efi: copy header files for x32 build
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
X-List-Received-Date: Mon, 10 Apr 2017 19:57:07 -0000
X-Groupsio-MsgNum: 96062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mNf18QsmWlqI8pbDAoAeImSfB5orA6mFL"

--mNf18QsmWlqI8pbDAoAeImSfB5orA6mFL
Content-Type: multipart/mixed; boundary="Pm1QSebSVhHwn9FrcxbrHW7FOwlrQ2iWu";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>,
 openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org
Message-ID: <4c539d8a-083f-b0d2-4343-ece7ae066991@gmail.com>
Subject: Re: [OE-core] [PATCH] gnu-efi: copy header files for x32 build
References: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1491839910-31562-1-git-send-email-sgw@linux.intel.com>

--Pm1QSebSVhHwn9FrcxbrHW7FOwlrQ2iWu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 4/10/17 8:58 AM, Saul Wold wrote:
> Gnu-efi needs to be build for 64bit since it is a boot time tool. It
> needs these 2 headers to be in 64 bit versions, we can use the existing=

> 32bit ones as there is not really any difference.
>=20
> [YOCTO #11051]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb b/meta/recipes-b=
sp/gnu-efi/gnu-efi_3.0.5.bb
> index f46381d..6f235b7 100644
> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
> @@ -24,6 +24,11 @@ SRC_URI[sha256sum] =3D "bd8fcd5914f18fc0e4ba948ab03b=
00013e528504f529c60739b748f6ef
>  COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
>  COMPATIBLE_HOST_armv4 =3D 'null'
> =20
> +do_configure_linux-gnux32_prepend() {
> +	cp ${STAGING_INCDIR}/gnu/stubs-x32.h ${STAGING_INCDIR}/gnu/stubs-64.h=

> +	cp ${STAGING_INCDIR}/bits/long-double-32.h ${STAGING_INCDIR}/bits/lon=
g-double-64.h
> +}
> +
making long-double-32.h pretend long-double-64.h seems wrong to me. but
if you were to do that then symlinking might be better

>  def gnu_efi_arch(d):
>      import re
>      tarch =3D d.getVar("TARGET_ARCH")
>=20


--Pm1QSebSVhHwn9FrcxbrHW7FOwlrQ2iWu--

--mNf18QsmWlqI8pbDAoAeImSfB5orA6mFL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljr45IACgkQuwUzVZGdMxRmPACfXFOKaNqZg2CKc/ATx6zVYRr6
HqgAn0jTRChxIJ/BSk5AuV8JJyRWythr
=if6f
-----END PGP SIGNATURE-----

--mNf18QsmWlqI8pbDAoAeImSfB5orA6mFL--
