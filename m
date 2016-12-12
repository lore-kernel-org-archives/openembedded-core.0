Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 636E7719A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 17:46:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so1624686pga.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=R4exaRuHcziFtDw3CQIJqBEGgxinM1USeDQxMi3Jtfw=;
	b=B5/hqUE4DwP5rpc2X1KlZXY2YzBxu0cSzX0wGY79DjKxCgFB+EG8neuRbnZJlx+2DP
	cC9vvaad0AKspDD/TtOQOtHLBSTsZkWJEOExw4Gv612Z6nWEsmgLqzPHZmYDWb2IIwOL
	4zuiZu4lCptPHoDMVaWcw3NbvTi3iIGJMYM52G3px3JpSsW9Lo9kjjb5qZJMuIYi174d
	7lYm6jkCTyXZOMIqp41eqlo2A+4YP8jvTlQIw+EvMzjrgutXlKjx8C+tOKhmoq8bSYKx
	bENnTEhEYTwOa9qyzaO26Rv/mLhTRcOSeeD/BX+/J+urqbhP1rS1B7YRxtNKuL02y9+9
	Wggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=R4exaRuHcziFtDw3CQIJqBEGgxinM1USeDQxMi3Jtfw=;
	b=GZS4LFNNFV2SfAllFBRccxHhX22V1ZkDYmjlGqee3Lyc5B2YbSkL6L3z4ZrgCh3/7t
	KA7CxSq7uhpAdhzUKVr72Sz/cdjrhS6BnxWcFMGZTB7RckOO0Jv6yfmMP6PaPNn4Muz/
	5RlUfId4AiClvMpQTuRfsiTgTw3YeXrPjeFaQOQXfztGiWceEjfF37/nCiW02oCYrUkR
	R9l5nc3BNgaIJVH+RoHliysBD9lWJdsSUsNfxst3cYuXsT/Pk+sBoySytYuI14mT+cfk
	oVfr3WkjuR816d/I0LNKUz1dcRDsWXBMlqldNfJABWcCOCkXOzS4+qkcj86hFp0mGzU3
	dggA==
X-Gm-Message-State: AKaTC01kVS/Hewy1zf+fOEcDii0h4Ej8b5wZ0VPmcXNgYh2axkOUeVZWj/IclsDimNgZlQ==
X-Received: by 10.84.175.234 with SMTP id t97mr187803800plb.145.1481564809501; 
	Mon, 12 Dec 2016 09:46:49 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:c5da:5e91:a866:bc94?
	([2601:646:8882:b8c:c5da:5e91:a866:bc94])
	by smtp.gmail.com with ESMTPSA id
	a22sm77223214pfg.7.2016.12.12.09.46.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Dec 2016 09:46:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <D05F496B-1241-409B-B2C7-D0BCBAA53EE9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Mon, 12 Dec 2016 09:47:12 -0800
In-Reply-To: <CAJTo0La2dNp3SQ3AurR+QOq9mt-YgsMz6PVra56eJQVwXfvjpA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161211230719.28765-1-raj.khem@gmail.com>
	<CAJTo0La2dNp3SQ3AurR+QOq9mt-YgsMz6PVra56eJQVwXfvjpA@mail.gmail.com>
X-Mailer: Apple Mail (2.3251)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontconfig: Fix namespace conflicts with glibc
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
X-List-Received-Date: Mon, 12 Dec 2016 17:46:49 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_ACF3C0DA-291D-44C0-A6B4-A24B03E57647"

--Apple-Mail=_ACF3C0DA-291D-44C0-A6B4-A24B03E57647
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 12, 2016, at 4:45 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Has fallout, for example libxft:
>=20
> | ../../libXft-2.3.2/src/xftfreetype.c:675:43: error: =
=E2=80=98FC_CHAR_WIDTH=E2=80=99 undeclared (first use in this function)
>=20

OK, I wasn=E2=80=99t aware this is exported API, I will tweak the patch =
accordingly.

> Ross
>=20
> On 11 December 2016 at 23:07, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> glibc 2.25 will come with TS 18661-1 macro definitions in limits.h =
which ends with following errors
>=20
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:63: error: =
'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, =
PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |                                                                ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of =
macro 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:84: error: =
'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, =
PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |                                                                      =
               ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of =
macro 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | make[3]: *** [Makefile:632: fcmatch.lo] Error 1
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
> ---
>  ...icts-with-integer-width-macros-from-TS-18.patch | 74 =
++++++++++++++++++++++
>  .../fontconfig/fontconfig_2.12.1.bb <http://fontconfig_2.12.1.bb/>    =
            |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 =
meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-inte=
ger-width-macros-from-TS-18.patch
>=20
> diff --git =
a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-in=
teger-width-macros-from-TS-18.patch =
b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-in=
teger-width-macros-from-TS-18.patch
> new file mode 100644
> index 0000000..326ff3c
> --- /dev/null
> +++ =
b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-in=
teger-width-macros-from-TS-18.patch
> @@ -0,0 +1,74 @@
> +=46rom 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 =
2001
> +From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> +Date: Sun, 11 Dec 2016 14:32:00 -0800
> +Subject: [PATCH] Avoid conflicts with integer width macros from TS
> + 18661-1:2014
> +
> +glibc 2.25+ has now defined these macros in <limits.h>
> =
+https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5b17fd0da62bf923=
cb61d1bb7b08cf2e1f1f9c1a =
<https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5b17fd0da62bf923=
cb61d1bb7b08cf2e1f1f9c1a>
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
> +---
> +Upstream-Status: Submitted
> +
> + fontconfig/fontconfig.h | 2 +-
> + src/fcobjs.h            | 2 +-
> + src/fcobjshash.gperf    | 2 +-
> + src/fcobjshash.h        | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
> +index 5c72b22..843c532 100644
> +--- a/fontconfig/fontconfig.h
> ++++ b/fontconfig/fontconfig.h
> +@@ -128,7 +128,7 @@ typedef int                FcBool;
> + #define FC_USER_CACHE_FILE        ".fonts.cache-" FC_CACHE_VERSION
> +
> + /* Adjust outline rasterizer */
> +-#define FC_CHAR_WIDTH     "charwidth" /* Int */
> ++#define FC_CHARWIDTH      "charwidth" /* Int */
> + #define FC_CHAR_HEIGHT            "charheight"/* Int */
> + #define FC_MATRIX         "matrix"    /* FcMatrix */
> +
> +diff --git a/src/fcobjs.h b/src/fcobjs.h
> +index 1fc4f65..d27864b 100644
> +--- a/src/fcobjs.h
> ++++ b/src/fcobjs.h
> +@@ -51,7 +51,7 @@ FC_OBJECT (DPI,                      FcTypeDouble,  =
 NULL)
> + FC_OBJECT (RGBA,              FcTypeInteger,  NULL)
> + FC_OBJECT (SCALE,             FcTypeDouble,   NULL)
> + FC_OBJECT (MINSPACE,          FcTypeBool,     NULL)
> +-FC_OBJECT (CHAR_WIDTH,                FcTypeInteger,  NULL)
> ++FC_OBJECT (CHARWIDTH,         FcTypeInteger,  NULL)
> + FC_OBJECT (CHAR_HEIGHT,               FcTypeInteger,  NULL)
> + FC_OBJECT (MATRIX,            FcTypeMatrix,   NULL)
> + FC_OBJECT (CHARSET,           FcTypeCharSet,  FcCompareCharSet)
> +diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf
> +index 80a0237..eb4ad84 100644
> +--- a/src/fcobjshash.gperf
> ++++ b/src/fcobjshash.gperf
> +@@ -44,7 +44,7 @@ int id;
> + "rgba",FC_RGBA_OBJECT
> + "scale",FC_SCALE_OBJECT
> + "minspace",FC_MINSPACE_OBJECT
> +-"charwidth",FC_CHAR_WIDTH_OBJECT
> ++"charwidth",FC_CHARWIDTH_OBJECT
> + "charheight",FC_CHAR_HEIGHT_OBJECT
> + "matrix",FC_MATRIX_OBJECT
> + "charset",FC_CHARSET_OBJECT
> +diff --git a/src/fcobjshash.h b/src/fcobjshash.h
> +index 5a4d1ea..4e66bb0 100644
> +--- a/src/fcobjshash.h
> ++++ b/src/fcobjshash.h
> +@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str, =
register unsigned int len)
> +       {(int)(long)&((struct FcObjectTypeNamePool_t =
*)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
> +       {-1},
> + #line 47 "fcobjshash.gperf"
> +-      {(int)(long)&((struct FcObjectTypeNamePool_t =
*)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
> ++      {(int)(long)&((struct FcObjectTypeNamePool_t =
*)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
> + #line 48 "fcobjshash.gperf"
> +       {(int)(long)&((struct FcObjectTypeNamePool_t =
*)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
> + #line 55 "fcobjshash.gperf"
> +--
> +2.10.2
> +
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb =
<http://fontconfig_2.12.1.bb/> =
b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb =
<http://fontconfig_2.12.1.bb/>
> index 115f558..8616154 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb =
<http://fontconfig_2.12.1.bb/>
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb =
<http://fontconfig_2.12.1.bb/>
> @@ -22,6 +22,7 @@ DEPENDS =3D "expat freetype zlib"
>=20
>  SRC_URI =3D "http://fontconfig.org/release/fontconfig-${PV}.tar.gz =
<http://fontconfig.org/release/fontconfig-${PV}.tar.gz> \
>             file://revert-static-pkgconfig.patch \
> +           =
file://0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch \
>             "
>  SRC_URI[md5sum] =3D "ce55e525c37147eee14cc2de6cc09f6c"
>  SRC_URI[sha256sum] =3D =
"a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"
> --
> 2.10.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20


--Apple-Mail=_ACF3C0DA-291D-44C0-A6B4-A24B03E57647
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 12, 2016, at 4:45 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Has fallout, for example libxft:<div class=3D""><br =
class=3D""></div><div class=3D"">| =
../../libXft-2.3.2/src/xftfreetype.c:675:43: error: =E2=80=98FC_CHAR_WIDTH=
=E2=80=99 undeclared (first use in this function)<br class=3D""></div><div=
 class=3D""><br class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>OK, I wasn=E2=80=99t aware this is exported API, I =
will tweak the patch accordingly.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"">Ross</div></div><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 11 December 2016 at 23:07, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">glibc 2.25 will come =
with TS 18661-1 macro definitions in limits.h which ends with following =
errors<br class=3D"">
<br class=3D"">
| ../../fontconfig-2.12.1/src/<wbr class=3D"">fcmatch.c:324:63: error: =
'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)<br class=3D"">=

|&nbsp; #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, =
PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },<br class=3D"">
|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; ^<br class=3D"">
| ../../fontconfig-2.12.1/src/<wbr class=3D"">fcobjs.h:54:1: note: in =
expansion of macro 'FC_OBJECT'<br class=3D"">
|&nbsp; FC_OBJECT (CHAR_WIDTH,&nbsp; FcTypeInteger, NULL)<br class=3D"">
|&nbsp; ^~~~~~~~~<br class=3D"">
| ../../fontconfig-2.12.1/src/<wbr class=3D"">fcmatch.c:324:84: error: =
'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)<br class=3D"">
|&nbsp; #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, =
PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },<br class=3D"">
|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;^<br class=3D"">
| ../../fontconfig-2.12.1/src/<wbr class=3D"">fcobjs.h:54:1: note: in =
expansion of macro 'FC_OBJECT'<br class=3D"">
|&nbsp; FC_OBJECT (CHAR_WIDTH,&nbsp; FcTypeInteger, NULL)<br class=3D"">
|&nbsp; ^~~~~~~~~<br class=3D"">
| make[3]: *** [Makefile:632: fcmatch.lo] Error 1<br class=3D"">
<br class=3D"">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">
---<br class=3D"">
&nbsp;...icts-with-integer-width-<wbr class=3D"">macros-from-TS-18.patch =
| 74 ++++++++++++++++++++++<br class=3D"">
&nbsp;.../fontconfig/<a href=3D"http://fontconfig_2.12.1.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">fontconfig_2.<wbr =
class=3D"">12.1.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; |&nbsp; 1 +<br class=3D"">
&nbsp;2 files changed, 75 insertions(+)<br class=3D"">
&nbsp;create mode 100644 meta/recipes-graphics/<wbr =
class=3D"">fontconfig/fontconfig/0001-<wbr =
class=3D"">Avoid-conflicts-with-integer-<wbr =
class=3D"">width-macros-from-TS-18.patch<br class=3D"">
<br class=3D"">
diff --git a/meta/recipes-graphics/<wbr =
class=3D"">fontconfig/fontconfig/0001-<wbr =
class=3D"">Avoid-conflicts-with-integer-<wbr =
class=3D"">width-macros-from-TS-18.patch b/meta/recipes-graphics/<wbr =
class=3D"">fontconfig/fontconfig/0001-<wbr =
class=3D"">Avoid-conflicts-with-integer-<wbr =
class=3D"">width-macros-from-TS-18.patch<br class=3D"">
new file mode 100644<br class=3D"">
index 0000000..326ff3c<br class=3D"">
--- /dev/null<br class=3D"">
+++ b/meta/recipes-graphics/<wbr =
class=3D"">fontconfig/fontconfig/0001-<wbr =
class=3D"">Avoid-conflicts-with-integer-<wbr =
class=3D"">width-macros-from-TS-18.patch<br class=3D"">
@@ -0,0 +1,74 @@<br class=3D"">
+=46rom 20cddc824c6501c2082cac41b162c3<wbr class=3D"">4cd5fcc530 Mon Sep =
17 00:00:00 2001<br class=3D"">
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">
+Date: Sun, 11 Dec 2016 14:32:00 -0800<br class=3D"">
+Subject: [PATCH] Avoid conflicts with integer width macros from TS<br =
class=3D"">
+ 18661-1:2014<br class=3D"">
+<br class=3D"">
+glibc 2.25+ has now defined these macros in &lt;limits.h&gt;<br =
class=3D"">
+<a =
href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5b17fd0da=
62bf923cb61d1bb7b08cf2e1f1f9c1a" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://sourceware.org/git/?<wbr =
class=3D"">p=3Dglibc.git;a=3Dcommit;h=3D<wbr =
class=3D"">5b17fd0da62bf923cb61d1bb7b08cf<wbr class=3D"">2e1f1f9c1a</a><br=
 class=3D"">
+<br class=3D"">
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">
+---<br class=3D"">
+Upstream-Status: Submitted<br class=3D"">
+<br class=3D"">
+ fontconfig/fontconfig.h | 2 +-<br class=3D"">
+ src/fcobjs.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br =
class=3D"">
+ src/fcobjshash.gperf&nbsp; &nbsp; | 2 +-<br class=3D"">
+ src/fcobjshash.h&nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br class=3D"">
+ 4 files changed, 4 insertions(+), 4 deletions(-)<br class=3D"">
+<br class=3D"">
+diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h<br =
class=3D"">
+index 5c72b22..843c532 100644<br class=3D"">
+--- a/fontconfig/fontconfig.h<br class=3D"">
++++ b/fontconfig/fontconfig.h<br class=3D"">
+@@ -128,7 +128,7 @@ typedef int&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; FcBool;<br class=3D"">
+ #define FC_USER_CACHE_FILE&nbsp; &nbsp; &nbsp; &nbsp; ".fonts.cache-" =
FC_CACHE_VERSION<br class=3D"">
+<br class=3D"">
+ /* Adjust outline rasterizer */<br class=3D"">
+-#define FC_CHAR_WIDTH&nbsp; &nbsp; &nbsp;"charwidth" /* Int */<br =
class=3D"">
++#define FC_CHARWIDTH&nbsp; &nbsp; &nbsp; "charwidth" /* Int */<br =
class=3D"">
+ #define FC_CHAR_HEIGHT&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
"charheight"/* Int */<br class=3D"">
+ #define FC_MATRIX&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"matrix"&nbsp; =
&nbsp; /* FcMatrix */<br class=3D"">
+<br class=3D"">
+diff --git a/src/fcobjs.h b/src/fcobjs.h<br class=3D"">
+index 1fc4f65..d27864b 100644<br class=3D"">
+--- a/src/fcobjs.h<br class=3D"">
++++ b/src/fcobjs.h<br class=3D"">
+@@ -51,7 +51,7 @@ FC_OBJECT (DPI,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FcTypeDouble,&nbsp; =
&nbsp;NULL)<br class=3D"">
+ FC_OBJECT (RGBA,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
FcTypeInteger,&nbsp; NULL)<br class=3D"">
+ FC_OBJECT (SCALE,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;FcTypeDouble,&nbsp; &nbsp;NULL)<br class=3D"">
+ FC_OBJECT (MINSPACE,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
FcTypeBool,&nbsp; &nbsp; &nbsp;NULL)<br class=3D"">
+-FC_OBJECT (CHAR_WIDTH,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; FcTypeInteger,&nbsp; NULL)<br class=3D"">
++FC_OBJECT (CHARWIDTH,&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;FcTypeInteger,&nbsp; NULL)<br class=3D"">
+ FC_OBJECT (CHAR_HEIGHT,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;FcTypeInteger,&nbsp; NULL)<br class=3D"">
+ FC_OBJECT (MATRIX,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
FcTypeMatrix,&nbsp; &nbsp;NULL)<br class=3D"">
+ FC_OBJECT (CHARSET,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;FcTypeCharSet,&nbsp; FcCompareCharSet)<br class=3D"">
+diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf<br class=3D"">
+index 80a0237..eb4ad84 100644<br class=3D"">
+--- a/src/fcobjshash.gperf<br class=3D"">
++++ b/src/fcobjshash.gperf<br class=3D"">
+@@ -44,7 +44,7 @@ int id;<br class=3D"">
+ "rgba",FC_RGBA_OBJECT<br class=3D"">
+ "scale",FC_SCALE_OBJECT<br class=3D"">
+ "minspace",FC_MINSPACE_OBJECT<br class=3D"">
+-"charwidth",FC_CHAR_WIDTH_<wbr class=3D"">OBJECT<br class=3D"">
++"charwidth",FC_CHARWIDTH_<wbr class=3D"">OBJECT<br class=3D"">
+ "charheight",FC_CHAR_HEIGHT_<wbr class=3D"">OBJECT<br class=3D"">
+ "matrix",FC_MATRIX_OBJECT<br class=3D"">
+ "charset",FC_CHARSET_OBJECT<br class=3D"">
+diff --git a/src/fcobjshash.h b/src/fcobjshash.h<br class=3D"">
+index 5a4d1ea..4e66bb0 100644<br class=3D"">
+--- a/src/fcobjshash.h<br class=3D"">
++++ b/src/fcobjshash.h<br class=3D"">
+@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str, =
register unsigned int len)<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;{(int)(long)&amp;((struct =
FcObjectTypeNamePool_t *)0)-&gt;FcObjectTypeNamePool_<wbr =
class=3D"">str43,FC_CHARSET_OBJECT},<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;{-1},<br class=3D"">
+ #line 47 "fcobjshash.gperf"<br class=3D"">
+-&nbsp; &nbsp; &nbsp; {(int)(long)&amp;((struct FcObjectTypeNamePool_t =
*)0)-&gt;FcObjectTypeNamePool_<wbr =
class=3D"">str45,FC_CHAR_WIDTH_OBJECT},<br class=3D"">
++&nbsp; &nbsp; &nbsp; {(int)(long)&amp;((struct FcObjectTypeNamePool_t =
*)0)-&gt;FcObjectTypeNamePool_<wbr =
class=3D"">str45,FC_CHARWIDTH_OBJECT},<br class=3D"">
+ #line 48 "fcobjshash.gperf"<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp;{(int)(long)&amp;((struct =
FcObjectTypeNamePool_t *)0)-&gt;FcObjectTypeNamePool_<wbr =
class=3D"">str46,FC_CHAR_HEIGHT_OBJECT},<br class=3D"">
+ #line 55 "fcobjshash.gperf"<br class=3D"">
+--<br class=3D"">
+2.10.2<br class=3D"">
+<br class=3D"">
diff --git a/meta/recipes-graphics/<wbr class=3D"">fontconfig/<a =
href=3D"http://fontconfig_2.12.1.bb/" rel=3D"noreferrer" target=3D"_blank"=
 class=3D"">fontconfig_2.12.1.<wbr class=3D"">bb</a> =
b/meta/recipes-graphics/<wbr class=3D"">fontconfig/<a =
href=3D"http://fontconfig_2.12.1.bb/" rel=3D"noreferrer" target=3D"_blank"=
 class=3D"">fontconfig_2.12.1.<wbr class=3D"">bb</a><br class=3D"">
index 115f558..8616154 100644<br class=3D"">
--- a/meta/recipes-graphics/<wbr class=3D"">fontconfig/<a =
href=3D"http://fontconfig_2.12.1.bb/" rel=3D"noreferrer" target=3D"_blank"=
 class=3D"">fontconfig_2.12.1.<wbr class=3D"">bb</a><br class=3D"">
+++ b/meta/recipes-graphics/<wbr class=3D"">fontconfig/<a =
href=3D"http://fontconfig_2.12.1.bb/" rel=3D"noreferrer" target=3D"_blank"=
 class=3D"">fontconfig_2.12.1.<wbr class=3D"">bb</a><br class=3D"">
@@ -22,6 +22,7 @@ DEPENDS =3D "expat freetype zlib"<br class=3D"">
<br class=3D"">
&nbsp;SRC_URI =3D "<a =
href=3D"http://fontconfig.org/release/fontconfig-${PV}.tar.gz" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">http://fontconfig.org/<wbr=
 class=3D"">release/fontconfig-${PV}.tar.<wbr class=3D"">gz</a> \<br =
class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a =
href=3D"file:///revert-static-" class=3D"">file://revert-static-</a><wbr =
class=3D"">pkgconfig.patch \<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
href=3D"file:///0001-Avoid-conflicts-" =
class=3D"">file://0001-Avoid-conflicts-</a><wbr =
class=3D"">with-integer-width-macros-<wbr class=3D"">from-TS-18.patch =
\<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "<br class=3D"">
&nbsp;SRC_URI[md5sum] =3D "<wbr =
class=3D"">ce55e525c37147eee14cc2de6cc09f<wbr class=3D"">6c"<br =
class=3D"">
&nbsp;SRC_URI[sha256sum] =3D "<wbr =
class=3D"">a9f42d03949f948a3a4f762287dbc1<wbr =
class=3D"">6e53a927c91a07ee64207ebd90a9e5<wbr class=3D"">e292"<br =
class=3D"">
<span class=3D"HOEnZb"><font color=3D"#888888" class=3D"">--<br =
class=3D"">
2.10.2<br class=3D"">
<br class=3D"">
--<br class=3D"">
______________________________<wbr class=3D"">_________________<br =
class=3D"">
Openembedded-core mailing list<br class=3D"">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.<wbr class=3D"">openembedded.org</a><br=
 class=3D"">
<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr class=3D"">core</a><br =
class=3D"">
</font></span></blockquote></div><br class=3D""></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_ACF3C0DA-291D-44C0-A6B4-A24B03E57647--
