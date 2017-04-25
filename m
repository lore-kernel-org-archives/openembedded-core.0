Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C98CE71A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 23:53:33 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v1so6834597pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=q/Ky55sH5tiLZYGz6zMuvjHOmXtF4G6a3fxhNR9j0U4=;
	b=WpiTDcJZa86eGf6CwqwOsSG7eybzTFqTnyjuNfukGW2J/4IowQhPgcpFDKO9iPZiPL
	FZ2Mnl4ENUc5GCeCo73P6H4xx3+V/2R8PhCX7TZ6RmLgy5KG2gqHaoz6mUueRK8P99Sv
	8sLya2nQ1YKNvQEDKfzV4SpHDkLbN7c3f4VGR1VEse5lIZcXMKA2PUSKJGlSLO72D08F
	L69y2wY4+dD4MYzoW0+ahmwJASN7aa0ZQ0hKuYI2krwu8J5n8gcgHSDpOAPGs8AarMT7
	fLFRA8gdAlthRiqTh9+5lspts2lSjT6IuMuS1hNoclyS0jPGP/+YTGQahpVW6g5oRn6H
	JWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=q/Ky55sH5tiLZYGz6zMuvjHOmXtF4G6a3fxhNR9j0U4=;
	b=o1MsT5Ue6AHl39cpXf/3T8Xi1cfZ4mmdBD7ThPduE9IMa7pULqApmLUeMzEokMylX3
	0n6RsJFJp485fpZ5bxjYIaIMUC4XcnE7ZRlNPmh4UYouZBVx67rP2KSmi26t+CoiZnqM
	TXxzPxUk7bvmPx7NdBljhFLAtMJiNllkfjIJsXAUvExNiHXAZm9UEenDtx7m79Jzxj2f
	yJW6ksHq5ioqCGesUYLxbRS4noXQUtCFYWV5RoQnXoa6OiPLe4qQyGNjIla4ykjbpjm0
	yYRfQCadjI9sA13yTZ1kzt5mCI4QbJyXWipTfr0/8n0bfqGzjV5/hSNz656rAG72uxmU
	pZsg==
X-Gm-Message-State: AN3rC/4qN5jLJD/lsGC50xydoKCca5ajLZJZAkAWAKHungzdHdXL0LJP
	gFDetjmg268riQ==
X-Received: by 10.99.117.19 with SMTP id q19mr24923349pgc.106.1493164414605;
	Tue, 25 Apr 2017 16:53:34 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d876:38a0:5ac:19e6])
	by smtp.gmail.com with ESMTPSA id
	u15sm20932612pgc.66.2017.04.25.16.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Apr 2017 16:53:33 -0700 (PDT)
To: Nathan Lynch <nathan_lynch@mentor.com>,
	openembedded-core@lists.openembedded.org
References: <20170425223355.13155-1-nathan_lynch@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <2d8db75b-1ca7-8480-a125-fa0eff48d899@gmail.com>
Date: Tue, 25 Apr 2017 16:53:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.0.1
MIME-Version: 1.0
In-Reply-To: <20170425223355.13155-1-nathan_lynch@mentor.com>
Subject: Re: [PATCH] lttng-modules: work around GCC 7 changes
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
X-List-Received-Date: Tue, 25 Apr 2017 23:53:34 -0000
X-Groupsio-MsgNum: 96692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="xIOq6pIE6NTjK5a1JmpgE2F9pQo0Cl3RK"

--xIOq6pIE6NTjK5a1JmpgE2F9pQo0Cl3RK
Content-Type: multipart/mixed; boundary="WwX2XGsF3qJAocUx1wQQm45sQI5hkg9gF";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <2d8db75b-1ca7-8480-a125-fa0eff48d899@gmail.com>
Subject: Re: [PATCH] lttng-modules: work around GCC 7 changes
References: <20170425223355.13155-1-nathan_lynch@mentor.com>
In-Reply-To: <20170425223355.13155-1-nathan_lynch@mentor.com>

--WwX2XGsF3qJAocUx1wQQm45sQI5hkg9gF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/25/17 3:33 PM, Nathan Lynch wrote:
> Avoid using LTTng's BUILD_RUNTIME_BUG_ON macro, as it appears to run
> into a similar problem as Linux experienced with __builtin_constant_p
> and dead code elimination.
>=20

Thanks for contributing. this patch looks ok to me.

> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> ---
>  .../BUILD_RUNTIME_BUG_ON-vs-gcc7.patch             | 43 ++++++++++++++=
++++++++
>  meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb   |  3 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTI=
ME_BUG_ON-vs-gcc7.patch
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_=
ON-vs-gcc7.patch b/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_=
BUG_ON-vs-gcc7.patch
> new file mode 100644
> index 000000000000..76063607a831
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-g=
cc7.patch
> @@ -0,0 +1,43 @@
> +From ab07574ef90fa510f293c37897d577066a88fe0d Mon Sep 17 00:00:00 2001=

> +From: Nathan Lynch <nathan_lynch@mentor.com>
> +Date: Tue, 25 Apr 2017 16:26:57 -0500
> +Subject: [PATCH] BUILD_RUNTIME_BUG_ON vs gcc7
> +
> +Avoid using LTTng's BUILD_RUNTIME_BUG_ON macro, as it appears to run
> +into a similar problem as Linux experienced with ilog2.
> +
> +See:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D474c90156c8dcc2fa815e6716cc9394d7930cb9c
> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D72785
> +
> +Upstream-Status: Pending
> +Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
> +---
> + lib/align.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/align.h b/lib/align.h
> +index 5b91ae87410b..5e134cd485fe 100644
> +--- a/lib/align.h
> ++++ b/lib/align.h
> +@@ -48,7 +48,7 @@
> +  */
> + #define offset_align(align_drift, alignment)				       \
> + 	({								       \
> +-		BUILD_RUNTIME_BUG_ON((alignment) =3D=3D 0			       \
> ++		BUG_ON((alignment) =3D=3D 0					       \
> + 				   || ((alignment) & ((alignment) - 1)));      \
> + 		(((alignment) - (align_drift)) & ((alignment) - 1));	       \
> + 	})
> +@@ -63,7 +63,7 @@
> +  */
> + #define offset_align_floor(align_drift, alignment)			       \
> + 	({								       \
> +-		BUILD_RUNTIME_BUG_ON((alignment) =3D=3D 0			       \
> ++		BUG_ON((alignment) =3D=3D 0					       \
> + 				   || ((alignment) & ((alignment) - 1)));      \
> + 		(((align_drift) - (alignment)) & ((alignment) - 1));	       \
> + 	})
> +--=20
> +2.9.3
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb b/meta/re=
cipes-kernel/lttng/lttng-modules_2.9.1.bb
> index abff79d06f26..b48f9cff9a78 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.9.1.bb
> @@ -11,7 +11,8 @@ inherit module
>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm).*-li=
nux'
> =20
>  SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
> -           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en=
=2Epatch"
> +           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en=
=2Epatch \
> +           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch"
> =20
>  SRC_URI[md5sum] =3D "5a16bca52233cc2bdff572b1120a88f6"
>  SRC_URI[sha256sum] =3D "62078fe3254ca65969db4b72e59042cd797dbf2740848f=
8f82384877ae460d54"
>=20


--WwX2XGsF3qJAocUx1wQQm45sQI5hkg9gF--

--xIOq6pIE6NTjK5a1JmpgE2F9pQo0Cl3RK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlj/4XsACgkQuwUzVZGdMxSb6wCfbC89hmO+N9u/JkvRKH5vGCly
TekAnRyHy+KLOyIO4NRJaPgihXdAcYhZ
=/F0X
-----END PGP SIGNATURE-----

--xIOq6pIE6NTjK5a1JmpgE2F9pQo0Cl3RK--
