Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91A126FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 22:50:10 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so6786005pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=TP6nppYkrddV31Qttn6hdb9KJXxrleYTTXIha7gI7Bs=;
	b=W0RA6tIAgxPLJBKaUCw1i+4hMfqSleenXqrp6NnAqlDgIBVNslkQZgQ5wP59zuid1z
	I1dJ8h6U9NuPb03UmS4W9aZ41kVdXnq2SOxLRnVsbC8SLygSVTRAGAnBLuIGZRsSMP02
	UfmIZHzPGpgK1DZxRpSv72OeUY5khzoUBzlJv7JSy757VF+UkrVhNHPGxOvjk1gkYlAM
	TR3SDYbo9bqY7Ll8j3fFUoFvwZbuWyzrTocHQR4iX0dyiRjJd94/ftnzHaTC5P9bJgiY
	Vut48MWSFAi2/99H0uDcb91j+gq/0+uMiLDmA49+E27j2Mmzpf0tiUM7qkD2wzNc6bxZ
	FHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=TP6nppYkrddV31Qttn6hdb9KJXxrleYTTXIha7gI7Bs=;
	b=ClkQF/Z1cwH/C3Q5lUEKzvov+9r2YyZFwxLWz3uxD2zITt0duBKbOhNLINJAQq38At
	WinEKQeeSETrIPNN+GYoZ4JIs+JkBEUd+X6GQWnLMvEm6x0YX/Dr8ScPm7payLTTX/sa
	36sKYdsI8xOflNZqauorL9ayo+h/GcSDVn3cUNIpDTyPEeX6j8mRIQ8ObPnfx31dzqKf
	f+2PsKHmFnX2ScfGshdbPl6+nN5tmHO+MAu6xIsaey0jDB27lmvKJmJUqxOtrmcH4rfb
	nqR/5zTVWW5jCtW4RWlxr0fcjy6XnFfTo/XVk1SvYPqdmSAEJv0npKu5ndUBn0hPaGmg
	p+iQ==
X-Gm-Message-State: ABUngveIErBPZ2irUj9U0tWZyJWO3diUpdXZZJ9AjuZj+rbOt9/JKKERAHpsTbWQr+/9oQ==
X-Received: by 10.98.11.198 with SMTP id 67mr40020320pfl.90.1479163811880;
	Mon, 14 Nov 2016 14:50:11 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d8e8:a625:64a7:acd8])
	by smtp.gmail.com with ESMTPSA id
	z189sm37618213pfb.2.2016.11.14.14.50.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Nov 2016 14:50:11 -0800 (PST)
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
Date: Mon, 14 Nov 2016 14:50:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH] rmc: Fix compiling issue with musl
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
X-List-Received-Date: Mon, 14 Nov 2016 22:50:10 -0000
X-Groupsio-MsgNum: 89365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="5STa6hFPLuuXLVRB1KDmFXjhg9KJCLhlq"

--5STa6hFPLuuXLVRB1KDmFXjhg9KJCLhlq
Content-Type: multipart/mixed; boundary="kJhsTS50oqiBoAOsaMXHcWjM6DV6DNq4Q";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <41ae9aed-3c93-09dc-bdde-5553fe5d5fbc@gmail.com>
Subject: Re: [OE-core] [PATCH] rmc: Fix compiling issue with musl
References: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>
In-Reply-To: <1479161454-236511-1-git-send-email-jianxun.zhang@linux.intel.com>

--kJhsTS50oqiBoAOsaMXHcWjM6DV6DNq4Q
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/14/16 2:10 PM, Jianxun Zhang wrote:
> | src/rmcl/rmcl.c: In function 'query_policy_from_db':
> | src/rmcl/rmcl.c:254:25: error: unknown type name 'ssize_t'
> | ssize_t cmd_name_len =3D strlen((char *)&rmc_db[policy_idx]) + 1;
> | ^~~~~~~~
>=20
> The musl C lib provides ssize_t but we need to enable it
> with a macro.
>=20
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> ---
> Before maintainer(s) push "merge" button, please read this short summar=
y.
> I feel there could be a better syntax to do it. And We could need to ge=
t
> an ack from Hernandez, Alejandro who reported this issue and seems stil=
l
> have (other) compiling errors even with this patch.
>=20
> I submit this patch based on my thoughts and test out of tiny config.
>=20
> Tests:
> () Specify TCLIBC =3D "musl" in local.conf in my build dir.
> () Build quark
> () I can see this issue happens without the fix
> () With this patch and do clean builds for quark and corei7-64,
> Compiling passes. Boot test passed on RMC targets quark and Broxton-m.
>=20
> Thanks
>=20
>=20
>  common/recipes-bsp/rmc/rmc.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/common/recipes-bsp/rmc/rmc.bb b/common/recipes-bsp/rmc/rmc=
=2Ebb
> index aeaf12e..61a1bdb 100644
> --- a/common/recipes-bsp/rmc/rmc.bb
> +++ b/common/recipes-bsp/rmc/rmc.bb
> @@ -24,6 +24,8 @@ COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux*"
> =20
>  EXTRA_OEMAKE=3D'RMC_CFLAGS=3D"-Wl,--hash-style=3Dboth"'
> =20
> +EXTRA_OEMAKE_append_libc-musl =3D '" -D__NEED_ssize_t"'

this is not right way to handle it. you should be doing something like
#include <sys/types.h> in your source file


> +
>  # from gnu-efi, we should align arch-mapping with it.
>  def rmc_efi_arch(d):
>      import re
>=20


--kJhsTS50oqiBoAOsaMXHcWjM6DV6DNq4Q--

--5STa6hFPLuuXLVRB1KDmFXjhg9KJCLhlq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAlgqP6IACgkQuwUzVZGdMxR60gCXbFu4UZAblwDJoinYjX71M17q
hwCfcnyKEPyTf5Yqil0dOPI8XUed4vo=
=yUPi
-----END PGP SIGNATURE-----

--5STa6hFPLuuXLVRB1KDmFXjhg9KJCLhlq--
