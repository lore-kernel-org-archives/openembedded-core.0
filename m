Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 243D271A3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 21:30:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 81so27231782pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=G7vi7nLaAHvkNUiHvQurrD49UF0pOIKM1XUdnqjbS88=;
	b=mqnJOPJA2B+EoT970BfPjmTsZ5ilLJsaN480Eb4ywz1ft++cKyFk/xFsKgjq/tqlGq
	m/CtmHE7FnUB7MsUdlZ18WEC9+UQfzKnRJ2pw7PVvforbk7WiqtH4OMIb9/9LOG3CJu3
	oc1/U/iA3rx9necFfpLebl3iIf29uX4E9P0dXrNvtQeeSTnUcaz8iLJxf7HO9+JWaEwT
	Zz8QEIwElm/hfY+tE9V68wQHJzjAcKA9PSGlfLUN31e+L4LdlQJg/nYFPOXHJuFN38jf
	P4MwH3n4oBaQiYNNenSywKqFGysM1keenzFBPUsKOl15bWR5eknIrucrrUH2qigYgU13
	go6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=G7vi7nLaAHvkNUiHvQurrD49UF0pOIKM1XUdnqjbS88=;
	b=Wp4MDjp/n3xAfYpsts7gVd5/aNZNdhCTeWCih8U2E/j9NuYUJtGa0Y9ZZIlKjWeXT6
	nWDQiP+td0BqkKI+5wk7fMzOXZyYFWWZJSXzoMtUY/8Jpmn6p0xj2feZxgnyWLRuoefp
	RbQZZJlBUugrarYjiqqSgT/jPyCpaQs6k8/rjabJ8H02ZwoTkQfbuuNZfLRFUQhk8FJh
	+F+n7eltTIIaskvDO6CzMacKraCItyntV6UCXMKqJ1FPsEpfmcU/9caSMx2SW7Sw/Kof
	uSc0TUOZF58HHhuSZyFc/zJQlgTRgNWDyJl9q+RZ40025iiHxlG9bjNBisKYLv11GqKc
	2T6A==
X-Gm-Message-State: AN3rC/4xANvakBCjV4HicYdgSNOprzaVcyOng1kUjnH3eY+qmHkVJsWDx96L6E0voye8DQ==
X-Received: by 10.98.59.9 with SMTP id i9mr9782094pfa.50.1491859806458;
	Mon, 10 Apr 2017 14:30:06 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:a17b:c5eb:7ae1:32d8])
	by smtp.gmail.com with ESMTPSA id
	b5sm13353334pfb.21.2017.04.10.14.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 14:30:04 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20170410205828.93764-1-mark.hatle@windriver.com>
	<20170410205828.93764-2-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b39aebbf-a59b-5e7f-d62f-c155ef77a30a@gmail.com>
Date: Mon, 10 Apr 2017 14:29:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170410205828.93764-2-mark.hatle@windriver.com>
Subject: Re: [PATCH 1/1] libsolve: 0001-Add-fallback-fopencookie-implementation.patch fix attribution
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
X-List-Received-Date: Mon, 10 Apr 2017 21:30:06 -0000
X-Groupsio-MsgNum: 96068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="42Js2WAI5dVD5lXUJ4EOogt1LLtbCuHse"

--42Js2WAI5dVD5lXUJ4EOogt1LLtbCuHse
Content-Type: multipart/mixed; boundary="gcLkPlBFBGsbWsi8tKDXwsdUbvkTlbemw";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <b39aebbf-a59b-5e7f-d62f-c155ef77a30a@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] libsolve:
 0001-Add-fallback-fopencookie-implementation.patch fix attribution
References: <20170410205828.93764-1-mark.hatle@windriver.com>
 <20170410205828.93764-2-mark.hatle@windriver.com>
In-Reply-To: <20170410205828.93764-2-mark.hatle@windriver.com>

--gcLkPlBFBGsbWsi8tKDXwsdUbvkTlbemw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/10/17 1:58 PM, Mark Hatle wrote:
> This patch has no technical change, but attempts to properly restore th=
e
> attribution of the original patch to Neal Gompa.
>=20

I think it will be good to add some guidelines for OE devs around this
kind of situation, since there will be cases where patches are imported
from other locations than upstream.

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  ...1-Add-fallback-fopencookie-implementation.patch | 186 +++++++++++++=
++++----
>  1 file changed, 150 insertions(+), 36 deletions(-)
>=20
> diff --git a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fo=
pencookie-implementation.patch b/meta/recipes-extended/libsolv/libsolv/00=
01-Add-fallback-fopencookie-implementation.patch
> index 851fe57569..c75611cfd8 100644
> --- a/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencook=
ie-implementation.patch
> +++ b/meta/recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencook=
ie-implementation.patch
> @@ -1,30 +1,48 @@
> -From 0a8e50f7322832efdaf33da87839fbba05a755de Mon Sep 17 00:00:00 2001=

> -From: "Maxin B. John" <maxin.john@intel.com>
> -Date: Mon, 21 Nov 2016 11:46:00 +0200
> -Subject: [PATCH] Add fallback fopencookie() implementation
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> +Add the following patch to fix build with musl:
> +
> +Original patch from:
> + https://patch-diff.githubusercontent.com/raw/openSUSE/libsolv/pull/11=
2.patch
> +
> +Patch was original integrated (dcc5d6bc2e3e5848f36fe1001b8cb65576047b7=
d)
> + by Maxin B. John <maxin.john@intel.com>:
> +    0.6.19 -> 0.6.20
> +
> +    Added the following patch to fix build with musl:
> +        0001-Add-fallback-fopencookie-implementation.patch
> +
> +Later updated (60d6c0018c6855e669ced66c420b761d9e7ddd78)
> + by Maxin B. John <maxin.john@intel.com>:
> +    libsolv: upgrade to 0.6.24
> +    Refreshed the following patch:
> +        a) 0001-Add-fallback-fopencookie-implementation.patch
> +
> +The later update modified the ext/CMakeLists.txt.
> +
> +Upstream-Status: Submitted [ https://github.com/openSUSE/libsolv/pull/=
112 ]
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +From 63ab8d928ab38f9686405d186d427f2496a9cce5 Mon Sep 17 00:00:00 2001=

> +From: =3D?UTF-8?q?Neal=3D20Gompa=3D20=3D28=3DE3=3D83=3D8B=3DE3=3D83=3D=
BC=3DE3=3D83=3DAB=3DE3=3D83=3DBB?=3D
> + =3D?UTF-8?q?=3DE3=3D82=3DB3=3DE3=3D82=3D99=3DE3=3D83=3DB3=3DE3=3D83=3D=
8F=3DE3=3D82=3D9A=3D29?=3D
> + <ngompa13@gmail.com>
> +Date: Wed, 11 Nov 2015 20:32:17 -0500
> +Subject: [PATCH 1/2] Add fallback fopencookie() implementation
> =20
>  In environments where neither fopencookie() nor funopen()
>  are implemented, we need to provide a suitable implementation
>  of fopencookie() that we can use.
> -
> -Upstream-Status: Denied [ https://github.com/openSUSE/libsolv/pull/112=
 ]
> -
> -Signed-off-by: Neal Gompa (=E3=83=8B=E3=83=BC=E3=83=AB=E3=83=BB=E3=82=B3=
=E3=82=99=E3=83=B3=E3=83=8F=E3=82=9A) <ngompa13@gmail.com>
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
>  ---
>   ext/CMakeLists.txt                     |   7 ++
>   ext/solv_xfopen.c                      |  10 +--
> - ext/solv_xfopen_fallback_fopencookie.c | 124 ++++++++++++++++++++++++=
+++++++++
> + ext/solv_xfopen_fallback_fopencookie.c | 123 ++++++++++++++++++++++++=
+++++++++
>   ext/solv_xfopen_fallback_fopencookie.h |  28 ++++++++
> - 4 files changed, 165 insertions(+), 4 deletions(-)
> + 4 files changed, 164 insertions(+), 4 deletions(-)
>   create mode 100644 ext/solv_xfopen_fallback_fopencookie.c
>   create mode 100644 ext/solv_xfopen_fallback_fopencookie.h
> =20
>  diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
> -index 586eda8..477a2ef 100644
> +index ad52495..4f282ce 100644
>  --- a/ext/CMakeLists.txt
>  +++ b/ext/CMakeLists.txt
>  @@ -4,6 +4,13 @@ SET (libsolvext_SRCS
> @@ -38,7 +56,8 @@ index 586eda8..477a2ef 100644
>  +        solv_xfopen_fallback_fopencookie.h)
>  +ENDIF (NOT HAVE_FOPENCOOKIE AND NOT HAVE_FUNOPEN)
>  +
> - IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
> +-IF (ENABLE_RPMDB)
> ++IF (ENABLE_RPMDB OR ENABLE_RPMPKG)
>       SET (libsolvext_SRCS ${libsolvext_SRCS}
>           pool_fileconflicts.c repo_rpmdb.c)
>  diff --git a/ext/solv_xfopen.c b/ext/solv_xfopen.c
> @@ -85,17 +104,17 @@ index b0421bf..31345dd 100644
>  =20
>  diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_=
fallback_fopencookie.c
>  new file mode 100644
> -index 0000000..89426a9
> +index 0000000..0ce2571
>  --- /dev/null
>  +++ b/ext/solv_xfopen_fallback_fopencookie.c
> -@@ -0,0 +1,124 @@
> -+/*
> +@@ -0,0 +1,123 @@
> ++/*=20
>  + *	Provides a very limited fopencookie() for environments with a libc=

>  + *	that lacks it.
> -+ *
> -+ *	Authors: zhasha & nsz
> ++ *=09
> ++ *	Author: zhasha
>  + *	Modified for libsolv by Neal Gompa
> -+ *
> ++ *=09
>  + *	This program is licensed under the BSD license, read LICENSE.BSD
>  + *	for further information.
>  + *
> @@ -124,7 +143,7 @@ index 0000000..89426a9
>  +{
>  +    struct ctx *ctx =3D arg;
>  +    ssize_t r;
> -+    size_t n, k;
> ++    size_t n;
>  +
>  +    pthread_detach(pthread_self());
>  +
> @@ -138,18 +157,17 @@ index 0000000..89426a9
>  +        }
>  +        if (r =3D=3D 0) { break; }
>  +
> -+        n =3D r, k =3D 0;
>  +        while (n > 0) {
>  +            r =3D ctx->io.write ?
> -+                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
> -+                write(ctx->fd, ctx->buf + k, n);
> ++                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - =
n), n) :
> ++                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
>  +            if (r < 0) {
>  +                if (errno !=3D EINTR) { break; }
>  +                continue;
>  +            }
>  +            if (r =3D=3D 0) { break; }
>  +
> -+            n -=3D r, k +=3D r;
> ++            n -=3D (size_t)r;
>  +        }
>  +        if (n > 0) { break; }
>  +    }
> @@ -169,8 +187,8 @@ index 0000000..89426a9
>  +
>  +    switch (mode[0]) {
>  +        case 'a':
> -+        case 'w': wr =3D 1; break;
>  +        case 'r': rd =3D 1; break;
> ++        case 'w': wr =3D 1; break;
>  +        default:
>  +            errno =3D EINVAL;
>  +            return NULL;
> @@ -215,20 +233,20 @@ index 0000000..89426a9
>  +}
>  diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_=
fallback_fopencookie.h
>  new file mode 100644
> -index 0000000..7223e3f
> +index 0000000..6a7bfee
>  --- /dev/null
>  +++ b/ext/solv_xfopen_fallback_fopencookie.h
>  @@ -0,0 +1,28 @@
> -+/*
> ++/*=20
>  + *	Provides a very limited fopencookie() for environments with a libc=

>  + *	that lacks it.
> -+ *
> -+ *	Authors: zhasha & nsz
> ++ *=09
> ++ *	Author: zhasha
>  + *	Modified for libsolv by Neal Gompa
> -+ *
> ++ *=09
>  + *	This program is licensed under the BSD license, read LICENSE.BSD
>  + *	for further information.
> -+ *
> ++ *=09
>  + */
>  +
>  +#ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
> @@ -247,6 +265,102 @@ index 0000000..7223e3f
>  +FILE *fopencookie(void *cookie, const char *mode, struct cookie_io_fu=
nctions_t io);
>  +
>  +#endif
> ---=20
> -2.4.0
> =20
> +From 18987b909007435ca878289d0e7d516052710f73 Mon Sep 17 00:00:00 2001=

> +From: =3D?UTF-8?q?Neal=3D20Gompa=3D20=3D28=3DE3=3D83=3D8B=3DE3=3D83=3D=
BC=3DE3=3D83=3DAB=3DE3=3D83=3DBB?=3D
> + =3D?UTF-8?q?=3DE3=3D82=3DB3=3DE3=3D82=3D99=3DE3=3D83=3DB3=3DE3=3D83=3D=
8F=3DE3=3D82=3D9A=3D29?=3D
> + <ngompa13@gmail.com>
> +Date: Mon, 23 Nov 2015 18:19:41 -0500
> +Subject: [PATCH 2/2] Fixes to internal fopencookie() implementation
> +
> +Credits to the fixes go to nsz on #musl on Freenode,
> +who gloriously fixed the implementation such that
> +the tests all pass.
> +---
> + ext/solv_xfopen_fallback_fopencookie.c | 19 ++++++++++---------
> + ext/solv_xfopen_fallback_fopencookie.h | 10 +++++-----
> + 2 files changed, 15 insertions(+), 14 deletions(-)
> +
> +diff --git a/ext/solv_xfopen_fallback_fopencookie.c b/ext/solv_xfopen_=
fallback_fopencookie.c
> +index 0ce2571..89426a9 100644
> +--- a/ext/solv_xfopen_fallback_fopencookie.c
> ++++ b/ext/solv_xfopen_fallback_fopencookie.c
> +@@ -1,10 +1,10 @@
> +-/*=20
> ++/*
> +  *	Provides a very limited fopencookie() for environments with a libc=

> +  *	that lacks it.
> +- *=09
> +- *	Author: zhasha
> ++ *
> ++ *	Authors: zhasha & nsz
> +  *	Modified for libsolv by Neal Gompa
> +- *=09
> ++ *
> +  *	This program is licensed under the BSD license, read LICENSE.BSD
> +  *	for further information.
> +  *
> +@@ -33,7 +33,7 @@ static void *proxy(void *arg)
> + {
> +     struct ctx *ctx =3D arg;
> +     ssize_t r;
> +-    size_t n;
> ++    size_t n, k;
> +=20
> +     pthread_detach(pthread_self());
> +=20
> +@@ -47,17 +47,18 @@ static void *proxy(void *arg)
> +         }
> +         if (r =3D=3D 0) { break; }
> +=20
> ++        n =3D r, k =3D 0;
> +         while (n > 0) {
> +             r =3D ctx->io.write ?
> +-                (ctx->io.write)(ctx->cookie, ctx->buf + ((size_t)r - =
n), n) :
> +-                write(ctx->fd, ctx->buf + ((size_t)r - n), n);
> ++                (ctx->io.write)(ctx->cookie, ctx->buf + k, n) :
> ++                write(ctx->fd, ctx->buf + k, n);
> +             if (r < 0) {
> +                 if (errno !=3D EINTR) { break; }
> +                 continue;
> +             }
> +             if (r =3D=3D 0) { break; }
> +=20
> +-            n -=3D (size_t)r;
> ++            n -=3D r, k +=3D r;
> +         }
> +         if (n > 0) { break; }
> +     }
> +@@ -77,8 +78,8 @@ FILE *fopencookie(void *cookie, const char *mode, st=
ruct cookie_io_functions_t i
> +=20
> +     switch (mode[0]) {
> +         case 'a':
> +-        case 'r': rd =3D 1; break;
> +         case 'w': wr =3D 1; break;
> ++        case 'r': rd =3D 1; break;
> +         default:
> +             errno =3D EINVAL;
> +             return NULL;
> +diff --git a/ext/solv_xfopen_fallback_fopencookie.h b/ext/solv_xfopen_=
fallback_fopencookie.h
> +index 6a7bfee..7223e3f 100644
> +--- a/ext/solv_xfopen_fallback_fopencookie.h
> ++++ b/ext/solv_xfopen_fallback_fopencookie.h
> +@@ -1,13 +1,13 @@
> +-/*=20
> ++/*
> +  *	Provides a very limited fopencookie() for environments with a libc=

> +  *	that lacks it.
> +- *=09
> +- *	Author: zhasha
> ++ *
> ++ *	Authors: zhasha & nsz
> +  *	Modified for libsolv by Neal Gompa
> +- *=09
> ++ *
> +  *	This program is licensed under the BSD license, read LICENSE.BSD
> +  *	for further information.
> +- *=09
> ++ *
> +  */
> +=20
> + #ifndef SOLV_XFOPEN_FALLBACK_FOPENCOOKIE_H
>=20


--gcLkPlBFBGsbWsi8tKDXwsdUbvkTlbemw--

--42Js2WAI5dVD5lXUJ4EOogt1LLtbCuHse
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljr+VsACgkQuwUzVZGdMxRM6ACglDKMR0YUnrtNYVrmd40GicMR
v1gAn1PGa7I/lEU3A3jrkCdNAPAtplnL
=CUIK
-----END PGP SIGNATURE-----

--42Js2WAI5dVD5lXUJ4EOogt1LLtbCuHse--
