Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.439.1794500895174017977
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 08:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SGcYp9ev;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso464377b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 08:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794500894; cv=none;
        d=google.com; s=arc-20260327;
        b=OAVpeaLy6SfWWrXI17ihoLNk5KSu/xTrUSJbVsRHPzP65j6kTuVKO3FFqchO8x5mAc
         Xkzfy+0xOfZP5xtYy7wrMinnDIyHmgzaQpKN0MySO4WHWwXEOyVhy9SF0ERW3ZESnxQs
         b3732jnn7+jYHyNTCLN6Obd1zoOR8qtoqtW+kGOZH2GPjxiYMgv975xHVoB4t7ob6dbN
         BRwUMHBQq0EoyQFTb8fHKKVnntoh4UdDeWzWiM1meqOOoJ9fv8dvpH6Gcx3mwCwH9Wng
         HNh38JB79hEEfNCP7OSFzYHUFuxI/3uwVOrvxFdWmkJfkgSvwESQGCrIqgDrSs6rmxbA
         d55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=py+f9FXmEkVDQjsBZrtDM5nWm07c+Lm/R5Z/GvK9suk=;
        fh=JJMDP9qz8DwA5GLagdkB3JuG2LmOTUKwKEgpuUvUjoE=;
        b=hLrOfEhMm12np1X0CXthgzEe1qh9FzOsT1W8+g4iwVim28azMtWr9FOK90wEa8Vm7a
         e/6FGUFZs4e8Yt1S0mTdyNlVOaMv1t6leV47La1AuQXdwUu7HgBPIFOiE7D+wVXRq1U0
         tBtRpzUgGcdEqeVaSnlveqElOWIDEo4FCDrik4vf9Ak+Ij8kdxIiXe1fA7tdtLE9MBVo
         AYNYXnhkUJCkYek2hU89S9gT7TVRxDDSkXHKV0gHJ3BXlJPV3iNQUptUKX+9CKNce76F
         2vJ8bT/SzPv1mdDjQyCHDbgCJgNO6/6CWjozHFM9YygMQCbfuZ3yN+kCq1Vw75qFONO0
         xIpg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794500894; x=1795105694; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=py+f9FXmEkVDQjsBZrtDM5nWm07c+Lm/R5Z/GvK9suk=;
        b=SGcYp9evsyfompRaZMIbqWm0ZAMF7b66TkdhXtbsv9vZihqaAQZO5QR1s/COT5MSwQ
         lbZF0o9vgXfEnlp0bHLhZbE2jPzoaC5wnJhMBZRJiwMFxy2Q4AwW0qcw+VpqgeK3Fytk
         JqEdatNOoi/yXMjoHNAQhrxj1MtoLH74t2f6z/hSGnLNwwqNngEOIrdvBwMNLKNYip1x
         OlFBquIYk5b0gmFUMGk0fAuIuYMwPl1Yl5JUSEmVh+gNfLDdoKlJy02NlpNLJU5PxKll
         Qj53NcoClMVIE14+58UxsWRlFa8WRU09Z4wLKlk1dHS1J+v1tjwCv2iycNR5BcpNdnzd
         uT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500894; x=1795105694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=py+f9FXmEkVDQjsBZrtDM5nWm07c+Lm/R5Z/GvK9suk=;
        b=bmQTt1rddE6U3aNKfLhWaTupAOzkkXhIhfyuLbxQoqgV2ih9sLVkZ0mhADyXOvI6J4
         16hmOJtTGBEuPVN8nPABY7lU/VS6Ry/WGJRFAvYk69kihHyrUqxpjgC5yXwsLgcUgrvo
         nJio/l9ndPIv1ziB4CibWFscNvF73LfZ90jFEsVfSUkqoNLpW8n0EE1Jq9huAAMBbitf
         EvRdpUT1NpXXhkY78n4EwoprEoDMv/t1f09LoqOCJrPZhFTTrrOoiaGfTRvbEg/bP70V
         VB+a4ka0P5TSfnu8JQ5fahIWUhkJ/u9Pn1IdgcL4W+V8tCas6pWOXsmz4gRD1HVt4pOa
         CFEQ==
X-Gm-Message-State: APuU4Z9yU8vwDkSgbKa6PWJNiZMj2JrttMWltkMww5nJgHPVJyib5oyX
	+RNonw1CmPCf5JQW+ZGJ3PlOUuaWyBFo//a49p/q51MNDh8pjR1JfSQoJ1TwOQ1iw89fTML8ZrQ
	iiW49D/JJX+3390xOgMF2Lupj0V6bof1VTg==
X-Gm-Gg: AYBFou0wEH+OxpyNNYJRm9J4niYbCOqUmEnr2tR9QOFCc2fgv34N60aAAm6NRxvJQxX
	35zWIRkzS6zpp0E3mIeeNhId2UDnoqBcRmzsv60QOtmFdagyigy9Lx4p8Z7elv6iwH3+mUz1NxC
	NcKnFTQdEeLcq/RCnPdq1vsHAA/iMPk9ktj07gxtgRUMEi26//q3M2Gr3SJ1rarpROaR34SCK6U
	6BEgCMF2/euRLHQ2aCVUgpjCBlKK3J3+P4eFoOG1KXyU6Il/lJwqVPNQO8V7xgBLLCP+SzYh+BK
	lJ0QRKvGaUbch0YjKnWjshliFFPIiO1kLEVluTGvzEz3xpT0eHd+xwHwQrVL8LTa3joWQvXspQu
	swU66RXJsYAFa9ueHMHItU+dAq0WR4QmxfA88g6k1ShoHjBuDEnlo8CjZBLojAGl24QHhEQiEzn
	tIuoqzZNjtbxmVtFP78qwyUNHVQyVtnbFGS9hfV5bAgd1a5dy2ORb7kAN/wWO7vJ8A9ac6/n1RI
	zEIz7MV5ji72cwKTYqfv2PlINaCPoLEfP+spKvuQFmmQVHvs2bUIVdwI4xv3LNLJryqcWdbiIcT
	CqlXhvI9Gb4L/mTGvXMVnsrcrsfdiw0xN3zTagrdWKTi5P+WynEO1NQ1/TotoUqplL5B+ERyuGi
	9iRqlOBBydJYrxiRQHIsrMzY=
X-Received: by 2002:a05:690e:1309:b0:67c:cab:bd73 with SMTP id
 956f58d0204a3-67c67fdf3d3mr3981176d50.96.1794500893958; Thu, 12 Nov 2026
 08:28:13 -0800 (PST)
MIME-Version: 1.0
References: <20261111083711.549321-1-khem.raj@oss.qualcomm.com> <20261111083711.549321-3-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261111083711.549321-3-khem.raj@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Nov 2026 08:27:46 -0800
X-Gm-Features: AclHuK9rVLmTsgnXjygAe5WeuVaycYiT7lwTZwfLY6vKXZXGXGYBig90cpTpz5I
Message-ID: <CAMKF1spNnQ=Ej+LNDFamDJWObj0mWMS=e6yqR6aSaSm1i=oSvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] libc-test: Re-enable yn test
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000055669d066016cc56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250108

--00000000000055669d066016cc56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW I see this one is merged but it depends on musl patches that were sent
before it which are not yet applied

On Wed, Nov 11, 2026 at 12:37=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> its now fixed in musl
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  .../0001-math-Delete-failing-tests.patch      | 51 -------------------
>  1 file changed, 51 deletions(-)
>
> diff --git
> a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
> b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch
> index 96ff279fa6..814d7bcb64 100644
> --- a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.pat=
ch
> +++ b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.pat=
ch
> @@ -15,13 +15,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   src/math/fmaf.c | 47 --------------------------------------------
>   src/math/fmal.c | 52 -------------------------------------------------
>   src/math/powf.c | 47 --------------------------------------------
> - src/math/yn.c   | 43 ----------------------------------------
>   5 files changed, 236 deletions(-)
>   delete mode 100644 src/math/fma.c
>   delete mode 100644 src/math/fmaf.c
>   delete mode 100644 src/math/fmal.c
>   delete mode 100644 src/math/powf.c
> - delete mode 100644 src/math/yn.c
>
>  diff --git a/src/math/fma.c b/src/math/fma.c
>  deleted file mode 100644
> @@ -240,52 +238,3 @@ index 4778c2f..0000000
>  -      }
>  -      return !!err;
>  -}
> -diff --git a/src/math/yn.c b/src/math/yn.c
> -deleted file mode 100644
> -index 244dbb8..0000000
> ---- a/src/math/yn.c
> -+++ /dev/null
> -@@ -1,43 +0,0 @@
> --#define _XOPEN_SOURCE 700
> --#include <stdint.h>
> --#include <stdio.h>
> --#include "mtest.h"
> --
> --static struct di_d t[] =3D {
> --#include "sanity/yn.h"
> --#include "special/yn.h"
> --};
> --
> --int main(void)
> --{
> --      #pragma STDC FENV_ACCESS ON
> --      double y;
> --      float d;
> --      int e, i, err =3D 0;
> --      struct di_d *p;
> --
> --      for (i =3D 0; i < sizeof t/sizeof *t; i++) {
> --              p =3D t + i;
> --
> --              if (p->r < 0)
> --                      continue;
> --              fesetround(p->r);
> --              feclearexcept(FE_ALL_EXCEPT);
> --              y =3D yn(p->i, p->x);
> --              e =3D
> fetestexcept(INEXACT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);
> --
> --              if (!checkexcept(e, p->e, p->r)) {
> --                      printf("%s:%d: bad fp exception: %s yn(%lld,
> %a)=3D%a, want %s",
> --                              p->file, p->line, rstr(p->r), p->i, p->x,
> p->y, estr(p->e));
> --                      printf(" got %s\n", estr(e));
> --                      err++;
> --              }
> --              d =3D ulperr(y, p->y, p->dy);
> --              if ((!(p->x < 0) && !checkulp(d, p->r)) || (p->x < 0 &&
> !isnan(y) && y !=3D -inf)) {
> --                      printf("%s:%d: %s yn(%lld, %a) want %a got %a,
> ulperr %.3f =3D %a + %a\n",
> --                              p->file, p->line, rstr(p->r), p->i, p->x,
> p->y, y, d, d-p->dy, p->dy);
> --                      err++;
> --              }
> --      }
> --      return !!err;
> --}
>

--00000000000055669d066016cc56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW I see this one is merged but it depends on musl patch=
es that were sent before it which are not yet applied</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Nov 11, 2026 at 12:37=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">its now fixed in musl<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" ta=
rget=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0.../0001-math-Delete-failing-tests.patch=C2=A0 =C2=A0 =C2=A0 | 51 ---=
----------------<br>
=C2=A01 file changed, 51 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-test=
s.patch b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.p=
atch<br>
index 96ff279fa6..814d7bcb64 100644<br>
--- a/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch=
<br>
+++ b/meta/recipes-core/musl/libc-test/0001-math-Delete-failing-tests.patch=
<br>
@@ -15,13 +15,11 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 src/math/fmaf.c | 47 --------------------------------------------<br=
>
=C2=A0 src/math/fmal.c | 52 -----------------------------------------------=
--<br>
=C2=A0 src/math/powf.c | 47 --------------------------------------------<br=
>
- src/math/yn.c=C2=A0 =C2=A0| 43 ----------------------------------------<b=
r>
=C2=A0 5 files changed, 236 deletions(-)<br>
=C2=A0 delete mode 100644 src/math/fma.c<br>
=C2=A0 delete mode 100644 src/math/fmaf.c<br>
=C2=A0 delete mode 100644 src/math/fmal.c<br>
=C2=A0 delete mode 100644 src/math/powf.c<br>
- delete mode 100644 src/math/yn.c<br>
<br>
=C2=A0diff --git a/src/math/fma.c b/src/math/fma.c<br>
=C2=A0deleted file mode 100644<br>
@@ -240,52 +238,3 @@ index 4778c2f..0000000<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 return !!err;<br>
=C2=A0-}<br>
-diff --git a/src/math/yn.c b/src/math/yn.c<br>
-deleted file mode 100644<br>
-index 244dbb8..0000000<br>
---- a/src/math/yn.c<br>
-+++ /dev/null<br>
-@@ -1,43 +0,0 @@<br>
--#define _XOPEN_SOURCE 700<br>
--#include &lt;stdint.h&gt;<br>
--#include &lt;stdio.h&gt;<br>
--#include &quot;mtest.h&quot;<br>
--<br>
--static struct di_d t[] =3D {<br>
--#include &quot;sanity/yn.h&quot;<br>
--#include &quot;special/yn.h&quot;<br>
--};<br>
--<br>
--int main(void)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 #pragma STDC FENV_ACCESS ON<br>
--=C2=A0 =C2=A0 =C2=A0 double y;<br>
--=C2=A0 =C2=A0 =C2=A0 float d;<br>
--=C2=A0 =C2=A0 =C2=A0 int e, i, err =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 struct di_d *p;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; sizeof t/sizeof *t; i++) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D t + i;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p-&gt;r &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fesetround(p-&gt;r);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feclearexcept(FE_ALL_EXC=
EPT);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y =3D yn(p-&gt;i, p-&gt;=
x);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e =3D fetestexcept(INEXA=
CT|INVALID|DIVBYZERO|UNDERFLOW|OVERFLOW);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!checkexcept(e, p-&g=
t;e, p-&gt;r)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s:%d: bad fp exception: %s yn(%lld, %a)=3D%a, want %s&quo=
t;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;file, p-&gt;line, rstr(p-&gt;r), p-&g=
t;i, p-&gt;x, p-&gt;y, estr(p-&gt;e));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot; got %s\n&quot;, estr(e));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err++;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d =3D ulperr(y, p-&gt;y,=
 p-&gt;dy);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((!(p-&gt;x &lt; 0) &=
amp;&amp; !checkulp(d, p-&gt;r)) || (p-&gt;x &lt; 0 &amp;&amp; !isnan(y) &a=
mp;&amp; y !=3D -inf)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;%s:%d: %s yn(%lld, %a) want %a got %a, ulperr %.3f =3D %a =
+ %a\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;file, p-&gt;line, rstr(p-&gt;r), p-&g=
t;i, p-&gt;x, p-&gt;y, y, d, d-p-&gt;dy, p-&gt;dy);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 err++;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 return !!err;<br>
--}<br>
</blockquote></div>

--00000000000055669d066016cc56--
