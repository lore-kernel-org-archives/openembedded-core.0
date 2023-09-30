Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A41E77377
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 15:41:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.43224.1696088501545965267
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 08:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=A8N4Av8R;
 spf=pass (domain: mvista.com, ip: 209.85.208.170, mailfrom: skulkarni@mvista.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9338e4695so241086771fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696088499; x=1696693299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZKXhC5zenkW7Ata4Uhz8E/CLsumEJfIK4DnF4mh+oQ=;
        b=A8N4Av8RdkiaZZdIMfuVBYXf2QzNIq/t0w4zgazyOuDi70rT8DYzbLA5KdFNeAg7QJ
         yyziONvuM5TmuJfN5M8AcYYkAsD9gNgHVIxRGm0gCTrk1FVocEclQdUZPP3JS4oBUAdw
         +k8VGvZW0+xCfx+BifoYS2mjBAlXpUcLTAnmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696088499; x=1696693299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZKXhC5zenkW7Ata4Uhz8E/CLsumEJfIK4DnF4mh+oQ=;
        b=dpJWnb8Ql9lkIxQ+TCH7KgnyFTQ3Gzo7nwweuRDSY3gaV6eUtOB0X7d1EuGRfhY9XW
         ANtE7/C+Tl0vKMYngJwCasE6DoQklSP54EeSFU06QwXTE1Uq2ze/0fAnHAgKU1AF04FZ
         +2I/SCK80qH0rz+zg+zouAs6WKDQPPjWqkt7Lbv1pUgxe9x/buMpWRfw8KB8WEzC9CWT
         AFFzbJeph6HCIPiXMsQlYX3gi5sR0Ls9NVDSKM4b6P5Um1QJxM+I8I1vcRBKRJ7TLL7C
         JDw1Bin5KFIqN2yS4fMBwIrdTVaz8aNxes/JGUsY5ztz8DzyM2btLAoDcxmsr8maS+rK
         zsJw==
X-Gm-Message-State: AOJu0YxsOKSApCiFJEPDllUMnvxZUOJLJB83H/jIHLT9SvBngcWvtNnR
	QXVoQUOfpEFwwe3v3G8vtm4cLVb0skzmtaoCcMj23cKrMJD8YGW6obg=
X-Google-Smtp-Source: AGHT+IHaVPHCsoLtbrzbUkFgI4Gq310koBgqbinluaSfVcatjF7I+LE7wJjngdtdC+sW2NW/jI3ai84RcUDOSQhKLR8=
X-Received: by 2002:a05:6512:220d:b0:503:28cb:c087 with SMTP id
 h13-20020a056512220d00b0050328cbc087mr8133025lfu.29.1696088497849; Sat, 30
 Sep 2023 08:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230929192133.14948-1-skulkarni@mvista.com> <CAOSpxdb_BidyVE-4z6wciy0LpTr9sJpOq5fmbghrbVmYV6khjw@mail.gmail.com>
In-Reply-To: <CAOSpxdb_BidyVE-4z6wciy0LpTr9sJpOq5fmbghrbVmYV6khjw@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Sat, 30 Sep 2023 21:11:25 +0530
Message-ID: <CAKzga+woh5=FBs9Qhg0Xm1K1bFwKg42YOJbZ9THER2AXfRcnSw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v3] go: Update fix for CVE-2023-24538 & CVE-2023-39318
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c1a850606956099"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 15:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188460

--0000000000006c1a850606956099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies Steve,

I will look into the issue and send a new patch for Dunfell. It worked for
me on my machine. Maybe something I missed.

Thanks,
Shubham Kulkarni

On Sat, Sep 30, 2023 at 8:02=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> Sorry, this patch doesn't apply:
>
> Applying: go: Update fix for CVE-2023-24538 & CVE-2023-39318
> error: corrupt patch at line 478
> error: could not build fake ancestor
> Patch failed at 0001 go: Update fix for CVE-2023-24538 & CVE-2023-39318
>
> Steve
>
> On Fri, Sep 29, 2023 at 9:21=E2=80=AFAM Shubham Kulkarni via
> lists.openembedded.org <skulkarni=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Shubham Kulkarni <skulkarni@mvista.com>
> >
> > Add missing files in fix for CVE-2023-24538 & CVE-2023-39318
> >
> > Upstream Link -
> > CVE-2023-24538:
> https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303a=
d9b
> > CVE-2023-39318:
> https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401=
b4c
> >
> > Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > ---
> >  meta/recipes-devtools/go/go-1.14.inc          |   5 +-
> >  .../go/go-1.14/CVE-2023-24538-1.patch         |   4 +-
> >  .../go/go-1.14/CVE-2023-24538-2.patch         | 447 ++++++++++++-
> >  .../go/go-1.14/CVE-2023-24538_3.patch         | 393 ++++++++++++
> >  .../go/go-1.14/CVE-2023-24538_4.patch         | 497 +++++++++++++++
> >  .../go/go-1.14/CVE-2023-24538_5.patch         | 585 ++++++++++++++++++
> >  ...3-24538-3.patch =3D> CVE-2023-24538_6.patch} | 175 +++++-
> >  .../go/go-1.14/CVE-2023-39318.patch           |  38 +-
> >  8 files changed, 2124 insertions(+), 20 deletions(-)
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> >  rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch =3D>
> CVE-2023-24538_6.patch} (53%)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> > index be63f64825..091b778de8 100644
> > --- a/meta/recipes-devtools/go/go-1.14.inc
> > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > @@ -60,7 +60,10 @@ SRC_URI +=3D "\
> >      file://CVE-2023-24534.patch \
> >      file://CVE-2023-24538-1.patch \
> >      file://CVE-2023-24538-2.patch \
> > -    file://CVE-2023-24538-3.patch \
> > +    file://CVE-2023-24538_3.patch \
> > +    file://CVE-2023-24538_4.patch \
> > +    file://CVE-2023-24538_5.patch \
> > +    file://CVE-2023-24538_6.patch \
> >      file://CVE-2023-24539.patch \
> >      file://CVE-2023-24540.patch \
> >      file://CVE-2023-29405-1.patch \
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > index eda26e5ff6..23c5075e41 100644
> > --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > @@ -1,7 +1,7 @@
> >  From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:00 2001
> >  From: Brad Fitzpatrick <bradfitz@golang.org>
> >  Date: Mon, 2 Aug 2021 14:55:51 -0700
> > -Subject: [PATCH 1/3] net/netip: add new IP address package
> > +Subject: [PATCH 1/6] net/netip: add new IP address package
> >
> >  Co-authored-by: Alex Willmer <alex@moreati.org.uk> (GitHub @moreati)
> >  Co-authored-by: Alexander Yastrebov <yastrebov.alex@gmail.com>
> > @@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick <bradfitz@golang.org>
> >
> >  Dependency Patch #1
> >
> > -Upstream-Status: Backport [
> https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa=
3d0
> ]
> > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa=
3d0
> >  CVE: CVE-2023-24538
> >  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >  ---
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > index 5036f2890b..3840617a32 100644
> > --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > @@ -1,7 +1,7 @@
> >  From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:00 2001
> >  From: empijei <robclap8@gmail.com>
> >  Date: Fri, 27 Mar 2020 19:27:55 +0100
> > -Subject: [PATCH 2/3] html/template,text/template: switch to Unicode
> escapes
> > +Subject: [PATCH 2/6] html/template,text/template: switch to Unicode
> escapes
> >   for JSON compatibility
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> > @@ -31,10 +31,238 @@ Upstream-Status: Backport from
> https://github.com/golang/go/commit/d4d298040d072
> >  CVE: CVE-2023-24538
> >  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >  ---
> > - src/html/template/js.go    | 70
> +++++++++++++++++++++++++++-------------------
> > - src/text/template/funcs.go |  8 +++---
> > - 2 files changed, 46 insertions(+), 32 deletions(-)
> > + src/html/template/content_test.go  | 70
> +++++++++++++++++++-------------------
> > + src/html/template/escape_test.go   |  6 ++--
> > + src/html/template/example_test.go  |  6 ++--
> > + src/html/template/js.go            | 70
> +++++++++++++++++++++++---------------
> > + src/html/template/js_test.go       | 68
> ++++++++++++++++++------------------
> > + src/html/template/template_test.go | 39 +++++++++++++++++++++
> > + src/text/template/exec_test.go     |  6 ++--
> > + src/text/template/funcs.go         |  8 ++---
> > + 8 files changed, 163 insertions(+), 110 deletions(-)
> >
> > +diff --git a/src/html/template/content_test.go
> b/src/html/template/content_test.go
> > +index 72d56f5..bd86527 100644
> > +--- a/src/html/template/content_test.go
> > ++++ b/src/html/template/content_test.go
> > +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
> > +               HTML(`Hello, <b>World</b> &amp;tc!`),
> > +               HTMLAttr(` dir=3D"ltr"`),
> > +               JS(`c && alert("Hello, World!");`),
> > +-              JSStr(`Hello, World & O'Reilly\x21`),
> > ++              JSStr(`Hello, World & O'Reilly\u0021`),
> > +               URL(`greeting=3DH%69,&addressee=3D(World)`),
> > +               Srcset(`greeting=3DH%69,&addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w`),
> > +               URL(`,foo/,`),
> > +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
> > +                               `Hello, <b>World</b> &amp;tc!`,
> > +                               ` dir=3D&#34;ltr&#34;`,
> > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> > ++                              `Hello, World &amp; O&#39;Reilly\u0021`=
,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)`,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > +                               `,foo/,`,
> > +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
> > +                               `Hello,&#32;World&#32;&amp;tc!`,
> > +                               `&#32;dir&#61;&#34;ltr&#34;`,
> > +
>  `c&#32;&amp;&amp;&#32;alert(&#34;Hello,&#32;World!&#34;);`,
> > +-
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\x21`,
> > ++
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\u0021`,
> > +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)`,
> > +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)&#32;2x,&#32;
> https://golang.org/favicon.ico&#32;500.5w`
> <https://golang.org/favicon.ico&#32;500.5w>,
> > +                               `,foo/,`,
> > +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
> > +                               `Hello, World &amp;tc!`,
> > +                               ` dir=3D&#34;ltr&#34;`,
> > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> > ++                              `Hello, World &amp; O&#39;Reilly\u0021`=
,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)`,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > +                               `,foo/,`,
> > +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
> > +                               `Hello, &lt;b&gt;World&lt;/b&gt;
> &amp;tc!`,
> > +                               ` dir=3D&#34;ltr&#34;`,
> > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> > ++                              `Hello, World &amp; O&#39;Reilly\u0021`=
,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)`,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > +                               `,foo/,`,
> > +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
> > +                               // Not escaped.
> > +                               `c && alert("Hello, World!");`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `"Hello, World & O'Reilly\x21"`,
> > ++                              `"Hello, World & O'Reilly\u0021"`,
> > +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > +                               `"greeting=3DH%69,\u0026addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w"`,
> > +                               `",foo/,"`,
> > +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
> > +                               // Not JS escaped but HTML escaped.
> > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `&#34;Hello, World &amp;
> O&#39;Reilly\x21&#34;`,
> > ++                              `&#34;Hello, World &amp;
> O&#39;Reilly\u0021&#34;`,
> > +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World)&#34;`,
> > +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w&#34;`,
> > +                               `&#34;,foo/,&#34;`,
> > +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
> > +               {
> > +                       `<script>alert("{{.}}")</script>`,
> > +                       []string{
> > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > +-                              ` dir=3D\x22ltr\x22`,
> > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > ++                              ` dir=3D\u0022ltr\u0022`,
> > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
)`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
) 2x,
> https:\/\/golang.org\/favicon.ico 500.5w`,
> > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > +                               `,foo\/,`,
> > +                       },
> > +               },
> > +               {
> > +                       `<script
> type=3D"text/javascript">alert("{{.}}")</script>`,
> > +                       []string{
> > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > +-                              ` dir=3D\x22ltr\x22`,
> > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > ++                              ` dir=3D\u0022ltr\u0022`,
> > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
)`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
) 2x,
> https:\/\/golang.org\/favicon.ico 500.5w`,
> > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > +                               `,foo\/,`,
> > +                       },
> > +               },
> > +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
> > +                               // Not escaped.
> > +                               `c && alert("Hello, World!");`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `"Hello, World & O'Reilly\x21"`,
> > ++                              `"Hello, World & O'Reilly\u0021"`,
> > +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > +                               `"greeting=3DH%69,\u0026addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w"`,
> > +                               `",foo/,"`,
> > +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
> > +                               `Hello, <b>World</b> &amp;tc!`,
> > +                               ` dir=3D&#34;ltr&#34;`,
> > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > +-                              `Hello, World &amp; O&#39;Reilly\x21`,
> > ++                              `Hello, World &amp; O&#39;Reilly\u0021`=
,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)`,
> > +                               `greeting=3DH%69,&amp;addressee=3D(Worl=
d)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > +                               `,foo/,`,
> > +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
> > +               {
> > +                       `<button onclick=3D'alert("{{.}}")'>`,
> > +                       []string{
> > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > +-                              ` dir=3D\x22ltr\x22`,
> > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > ++                              ` dir=3D\u0022ltr\u0022`,
> > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > +                               // Escape sequence not over-escaped.
> > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
)`,
> > +-                              `greeting=3DH%69,\x26addressee=3D(World=
) 2x,
> https:\/\/golang.org\/favicon.ico 500.5w`,
> > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)`,
> > ++                              `greeting=3DH%69,\u0026addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > +                               `,foo\/,`,
> > +                       },
> > +               },
> > +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
> > +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > +                               `%20dir%3d%22ltr%22`,
> > +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > +                               // Quotes and parens are escaped but %6=
9
> is not over-escaped. HTML escaping is done.
> > +
>  `greeting=3DH%69,&amp;addressee=3D%28World%29`,
> > +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
> > +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > +                               `%20dir%3d%22ltr%22`,
> > +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > +                               // Quotes and parens are escaped but %6=
9
> is not over-escaped. HTML escaping is not done.
> > +                               `greeting=3DH%69,&addressee=3D%28World%=
29`,
> > +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > +index e72a9ba..c709660 100644
> > +--- a/src/html/template/escape_test.go
> > ++++ b/src/html/template/escape_test.go
> > +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
> > +               {
> > +                       "jsStr",
> > +                       "<button onclick=3D'alert(&quot;{{.H}}&quot;)'>=
",
> > +-                      `<button
> onclick=3D'alert(&quot;\x3cHello\x3e&quot;)'>`,
> > ++                      `<button
> onclick=3D'alert(&quot;\u003cHello\u003e&quot;)'>`,
> > +               },
> > +               {
> > +                       "badMarshaler",
> > +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
> > +               {
> > +                       "jsRe",
> > +                       `<button
> onclick=3D'alert(/{{"foo+bar"}}/.test(""))'>`,
> > +-                      `<button
> onclick=3D'alert(/foo\x2bbar/.test(""))'>`,
> > ++                      `<button
> onclick=3D'alert(/foo\u002bbar/.test(""))'>`,
> > +               },
> > +               {
> > +                       "jsReBlank",
> > +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
> > +                               "main":   `<button
> onclick=3D"title=3D'{{template "helper"}}'; ...">{{template
> "helper"}}</button>`,
> > +                               "helper": `{{11}} of {{"<100>"}}`,
> > +                       },
> > +-                      `<button onclick=3D"title=3D'11 of \x3c100\x3e'=
;
> ...">11 of &lt;100&gt;</button>`,
> > ++                      `<button onclick=3D"title=3D'11 of \u003c100\u0=
03e';
> ...">11 of &lt;100&gt;</button>`,
> > +               },
> > +               // A non-recursive template that ends in a different
> context.
> > +               // helper starts in jsCtxRegexp and ends in jsCtxDivOp.
> > +diff --git a/src/html/template/example_test.go
> b/src/html/template/example_test.go
> > +index 9d965f1..6cf936f 100644
> > +--- a/src/html/template/example_test.go
> > ++++ b/src/html/template/example_test.go
> > +@@ -116,9 +116,9 @@ func Example_escape() {
> > +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > +       // &#34;Fran &amp; Freddie&#39;s Diner&#
> 34;32&lt;tasty@example.com&gt;
> > +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> > +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> > +-      // \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com\x3E
> > ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com
> \u003E
> > ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com
> \u003E
> > ++      // \"Fran \u0026 Freddie\'s Diner\"32\u003Ctasty@example.com
> \u003E
> > +       // %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.com%3E
> > +
> > + }
> >  diff --git a/src/html/template/js.go b/src/html/template/js.go
> >  index 0e91458..ea9c183 100644
> >  --- a/src/html/template/js.go
> > @@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644
> >         '?':  `\?`,
> >         '[':  `\[`,
> >         '\\': `\\`,
> > +diff --git a/src/html/template/js_test.go b/src/html/template/js_test.=
go
> > +index 075adaa..d7ee47b 100644
> > +--- a/src/html/template/js_test.go
> > ++++ b/src/html/template/js_test.go
> > +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
> > +               {"foo", `"foo"`},
> > +               // Newlines.
> > +               {"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
> > +-              // "\v" =3D=3D "v" on IE 6 so use "\x0b" instead.
> > ++              // "\v" =3D=3D "v" on IE 6 so use "\u000b" instead.
> > +               {"\t\x0b", `"\t\u000b"`},
> > +               {struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
> > +               {[]interface{}{}, "[]"},
> > +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
> > +       }{
> > +               {"", ``},
> > +               {"foo", `foo`},
> > +-              {"\u0000", `\0`},
> > ++              {"\u0000", `\u0000`},
> > +               {"\t", `\t`},
> > +               {"\n", `\n`},
> > +               {"\r", `\r`},
> > +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
> > +               {"\\n", `\\n`},
> > +               {"foo\r\nbar", `foo\r\nbar`},
> > +               // Preserve attribute boundaries.
> > +-              {`"`, `\x22`},
> > +-              {`'`, `\x27`},
> > ++              {`"`, `\u0022`},
> > ++              {`'`, `\u0027`},
> > +               // Allow embedding in HTML without further escaping.
> > +-              {`&amp;`, `\x26amp;`},
> > ++              {`&amp;`, `\u0026amp;`},
> > +               // Prevent breaking out of text node and element
> boundaries.
> > +-              {"</script>", `\x3c\/script\x3e`},
> > +-              {"<![CDATA[", `\x3c![CDATA[`},
> > +-              {"]]>", `]]\x3e`},
> > ++              {"</script>", `\u003c\/script\u003e`},
> > ++              {"<![CDATA[", `\u003c![CDATA[`},
> > ++              {"]]>", `]]\u003e`},
> > +               //
> https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span
> > +               //   "The text in style, script, title, and textarea
> elements
> > +               //   must not have an escaping text span start that is
> not
> > +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
> > +               // allow regular text content to be interpreted as scri=
pt
> > +               // allowing script execution via a combination of a JS
> string
> > +               // injection followed by an HTML text injection.
> > +-              {"<!--", `\x3c!--`},
> > +-              {"-->", `--\x3e`},
> > ++              {"<!--", `\u003c!--`},
> > ++              {"-->", `--\u003e`},
> > +               // From
> https://code.google.com/p/doctype/wiki/ArticleUtf7
> > +               {"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
> > +-
> `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,
> > ++
> `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD4-`,
> > +               },
> > +               // Invalid UTF-8 sequence
> > +               {"foo\xA0bar", "foo\xA0bar"},
> > +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
> > +       }{
> > +               {"", `(?:)`},
> > +               {"foo", `foo`},
> > +-              {"\u0000", `\0`},
> > ++              {"\u0000", `\u0000`},
> > +               {"\t", `\t`},
> > +               {"\n", `\n`},
> > +               {"\r", `\r`},
> > +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
> > +               {"\\n", `\\n`},
> > +               {"foo\r\nbar", `foo\r\nbar`},
> > +               // Preserve attribute boundaries.
> > +-              {`"`, `\x22`},
> > +-              {`'`, `\x27`},
> > ++              {`"`, `\u0022`},
> > ++              {`'`, `\u0027`},
> > +               // Allow embedding in HTML without further escaping.
> > +-              {`&amp;`, `\x26amp;`},
> > ++              {`&amp;`, `\u0026amp;`},
> > +               // Prevent breaking out of text node and element
> boundaries.
> > +-              {"</script>", `\x3c\/script\x3e`},
> > +-              {"<![CDATA[", `\x3c!\[CDATA\[`},
> > +-              {"]]>", `\]\]\x3e`},
> > ++              {"</script>", `\u003c\/script\u003e`},
> > ++              {"<![CDATA[", `\u003c!\[CDATA\[`},
> > ++              {"]]>", `\]\]\u003e`},
> > +               // Escaping text spans.
> > +-              {"<!--", `\x3c!\-\-`},
> > +-              {"-->", `\-\-\x3e`},
> > ++              {"<!--", `\u003c!\-\-`},
> > ++              {"-->", `\-\-\u003e`},
> > +               {"*", `\*`},
> > +-              {"+", `\x2b`},
> > ++              {"+", `\u002b`},
> > +               {"?", `\?`},
> > +               {"[](){}", `\[\]\(\)\{\}`},
> > +               {"$foo|x.y", `\$foo\|x\.y`},
> > +@@ -284,27 +284,27 @@ func
> TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
> > +               {
> > +                       "jsStrEscaper",
> > +                       jsStrEscaper,
> > +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> > +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> > +-                              ` !\x22#$%\x26\x27()*\x2b,-.\/` +
> > +-                              `0123456789:;\x3c=3D\x3e?` +
> > ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> > ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > ++                              ` !\u0022#$%\u0026\u0027()*\u002b,-.\/`=
 +
> > ++                              `0123456789:;\u003c=3D\u003e?` +
> > +                               `@ABCDEFGHIJKLMNO` +
> > +                               `PQRSTUVWXYZ[\\]^_` +
> > +                               "`abcdefghijklmno" +
> > +-                              "pqrstuvwxyz{|}~\x7f" +
> > ++                              "pqrstuvwxyz{|}~\u007f" +
> > +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > +               },
> > +               {
> > +                       "jsRegexpEscaper",
> > +                       jsRegexpEscaper,
> > +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> > +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> > +-                              ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/` +
> > +-                              `0123456789:;\x3c=3D\x3e\?` +
> > ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> > ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > ++                              `
> !\u0022#\$%\u0026\u0027\(\)\*\u002b,\-\.\/` +
> > ++                              `0123456789:;\u003c=3D\u003e\?` +
> > +                               `@ABCDEFGHIJKLMNO` +
> > +                               `PQRSTUVWXYZ\[\\\]\^_` +
> > +                               "`abcdefghijklmno" +
> > +diff --git a/src/html/template/template_test.go
> b/src/html/template/template_test.go
> > +index 13e6ba4..86bd4db 100644
> > +--- a/src/html/template/template_test.go
> > ++++ b/src/html/template/template_test.go
> > +@@ -6,6 +6,7 @@ package template_test
> > +
> > + import (
> > +       "bytes"
> > ++      "encoding/json"
> > +       . "html/template"
> > +       "strings"
> > +       "testing"
> > +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
> > +       c.mustExecute(c.root, nil, "12.34 7.5")
> > + }
> > +
> > ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t
> *testing.T) {
> > ++      // See #33671 and #37634 for more context on this.
> > ++      tests :=3D []struct{ name, in string }{
> > ++              {"empty", ""},
> > ++              {"invalid", string(rune(-1))},
> > ++              {"null", "\u0000"},
> > ++              {"unit separator", "\u001F"},
> > ++              {"tab", "\t"},
> > ++              {"gt and lt", "<>"},
> > ++              {"quotes", `'"`},
> > ++              {"ASCII letters", "ASCII letters"},
> > ++              {"Unicode", "=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94"},
> > ++              {"Pizza", "=F0=9F=8D=95"},
> > ++      }
> > ++      const (
> > ++              prefix =3D `<script type=3D"application/ld+json">`
> > ++              suffix =3D `</script>`
> > ++              templ  =3D prefix + `"{{.}}"` + suffix
> > ++      )
> > ++      tpl :=3D Must(New("JS string is JSON string").Parse(templ))
> > ++      for _, tt :=3D range tests {
> > ++              t.Run(tt.name, func(t *testing.T) {
> > ++                      var buf bytes.Buffer
> > ++                      if err :=3D tpl.Execute(&buf, tt.in); err !=3D =
nil {
> > ++                              t.Fatalf("Cannot render template: %v",
> err)
> > ++                      }
> > ++                      trimmed :=3D
> bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), []byte(prefix)),
> []byte(suffix))
> > ++                      var got string
> > ++                      if err :=3D json.Unmarshal(trimmed, &got); err =
!=3D
> nil {
> > ++                              t.Fatalf("Cannot parse JS string %q as
> JSON: %v", trimmed[1:len(trimmed)-1], err)
> > ++                      }
> > ++                      if got !=3D tt.in {
> > ++                              t.Errorf("Serialization changed the
> string value: got %q want %q", got, tt.in)
> > ++                      }
> > ++              })
> > ++      }
> > ++}
> > ++
> > + type testCase struct {
> > +       t    *testing.T
> > +       root *Template
> > +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > +index 77294ed..b8a809e 100644
> > +--- a/src/text/template/exec_test.go
> > ++++ b/src/text/template/exec_test.go
> > +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
> > +               {`Go "jump" \`, `Go \"jump\" \\`},
> > +               {`Yukihiro says "=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=
=E7=95=8C"`, `Yukihiro says \"=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C=
\"`},
> > +               {"unprintable \uFDFF", `unprintable \uFDFF`},
> > +-              {`<html>`, `\x3Chtml\x3E`},
> > +-              {`no =3D in attributes`, `no \x3D in attributes`},
> > +-              {`&#x27; does not become HTML entity`, `\x26#x27; does
> not become HTML entity`},
> > ++              {`<html>`, `\u003Chtml\u003E`},
> > ++              {`no =3D in attributes`, `no \u003D in attributes`},
> > ++              {`&#x27; does not become HTML entity`, `\u0026#x27; doe=
s
> not become HTML entity`},
> > +       }
> > +       for _, tc :=3D range testCases {
> > +               s :=3D JSEscapeString(tc.in)
> >  diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
> >  index 46125bc..f3de9fb 100644
> >  --- a/src/text/template/funcs.go
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> > new file mode 100644
> > index 0000000000..cd7dd0957c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
> > @@ -0,0 +1,393 @@
> > +From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 17 00:00:00 2001
> > +From: Ariel Mashraki <ariel@mashraki.co.il>
> > +Date: Wed, 22 Apr 2020 22:17:56 +0300
> > +Subject: [PATCH 3/6] text/template: add CommentNode to template parse
> tree
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Fixes #34652
> > +
> > +Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/229398
> > +Reviewed-by: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > +Run-TryBot: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > +TryBot-Result: Gobot Gobot <gobot@golang.org>
> > +
> > +Dependency Patch #3
> > +
> > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/c8ea03828b0645b1fd5725888e44873b75fcf=
bb6
> > +CVE: CVE-2023-24538
> > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > +---
> > + api/next.txt                          | 19 +++++++++++++++++++
> > + src/html/template/escape.go           |  2 ++
> > + src/html/template/template_test.go    | 16 ++++++++++++++++
> > + src/text/template/exec.go             |  1 +
> > + src/text/template/parse/lex.go        |  8 +++++++-
> > + src/text/template/parse/lex_test.go   |  7 +++++--
> > + src/text/template/parse/node.go       | 33
> +++++++++++++++++++++++++++++++++
> > + src/text/template/parse/parse.go      | 22 +++++++++++++++++++---
> > + src/text/template/parse/parse_test.go | 25 +++++++++++++++++++++++++
> > + 9 files changed, 127 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/api/next.txt b/api/next.txt
> > +index e69de29..076f39e 100644
> > +--- a/api/next.txt
> > ++++ b/api/next.txt
> > +@@ -0,0 +1,19 @@
> > ++pkg unicode, const Version =3D "13.0.0"
> > ++pkg unicode, var Chorasmian *RangeTable
> > ++pkg unicode, var Dives_Akuru *RangeTable
> > ++pkg unicode, var Khitan_Small_Script *RangeTable
> > ++pkg unicode, var Yezidi *RangeTable
> > ++pkg text/template/parse, const NodeComment =3D 20
> > ++pkg text/template/parse, const NodeComment NodeType
> > ++pkg text/template/parse, const ParseComments =3D 1
> > ++pkg text/template/parse, const ParseComments Mode
> > ++pkg text/template/parse, method (*CommentNode) Copy() Node
> > ++pkg text/template/parse, method (*CommentNode) String() string
> > ++pkg text/template/parse, method (CommentNode) Position() Pos
> > ++pkg text/template/parse, method (CommentNode) Type() NodeType
> > ++pkg text/template/parse, type CommentNode struct
> > ++pkg text/template/parse, type CommentNode struct, Text string
> > ++pkg text/template/parse, type CommentNode struct, embedded NodeType
> > ++pkg text/template/parse, type CommentNode struct, embedded Pos
> > ++pkg text/template/parse, type Mode uint
> > ++pkg text/template/parse, type Tree struct, Mode Mode
> > +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> > +index f12dafa..8739735 100644
> > +--- a/src/html/template/escape.go
> > ++++ b/src/html/template/escape.go
> > +@@ -124,6 +124,8 @@ func (e *escaper) escape(c context, n parse.Node)
> context {
> > +       switch n :=3D n.(type) {
> > +       case *parse.ActionNode:
> > +               return e.escapeAction(c, n)
> > ++      case *parse.CommentNode:
> > ++              return c
> > +       case *parse.IfNode:
> > +               return e.escapeBranch(c, &n.BranchNode, "if")
> > +       case *parse.ListNode:
> > +diff --git a/src/html/template/template_test.go
> b/src/html/template/template_test.go
> > +index 86bd4db..1f2c888 100644
> > +--- a/src/html/template/template_test.go
> > ++++ b/src/html/template/template_test.go
> > +@@ -10,6 +10,7 @@ import (
> > +       . "html/template"
> > +       "strings"
> > +       "testing"
> > ++      "text/template/parse"
> > + )
> > +
> > + func TestTemplateClone(t *testing.T) {
> > +@@ -160,6 +161,21 @@ func
> TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T) =
{
> > +       }
> > + }
> > +
> > ++func TestSkipEscapeComments(t *testing.T) {
> > ++      c :=3D newTestCase(t)
> > ++      tr :=3D parse.New("root")
> > ++      tr.Mode =3D parse.ParseComments
> > ++      newT, err :=3D tr.Parse("{{/* A comment */}}{{ 1 }}{{/* Another
> comment */}}", "", "", make(map[string]*parse.Tree))
> > ++      if err !=3D nil {
> > ++              t.Fatalf("Cannot parse template text: %v", err)
> > ++      }
> > ++      c.root, err =3D c.root.AddParseTree("root", newT)
> > ++      if err !=3D nil {
> > ++              t.Fatalf("Cannot add parse tree to template: %v", err)
> > ++      }
> > ++      c.mustExecute(c.root, nil, "1")
> > ++}
> > ++
> > + type testCase struct {
> > +       t    *testing.T
> > +       root *Template
> > +diff --git a/src/text/template/exec.go b/src/text/template/exec.go
> > +index ac3e741..7ac5175 100644
> > +--- a/src/text/template/exec.go
> > ++++ b/src/text/template/exec.go
> > +@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Value, node
> parse.Node) {
> > +               if len(node.Pipe.Decl) =3D=3D 0 {
> > +                       s.printValue(node, val)
> > +               }
> > ++      case *parse.CommentNode:
> > +       case *parse.IfNode:
> > +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List,
> node.ElseList)
> > +       case *parse.ListNode:
> > +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > +index 30371f2..e41373a 100644
> > +--- a/src/text/template/parse/lex.go
> > ++++ b/src/text/template/parse/lex.go
> > +@@ -41,6 +41,7 @@ const (
> > +       itemBool                         // boolean constant
> > +       itemChar                         // printable ASCII character;
> grab bag for comma etc.
> > +       itemCharConstant                 // character constant
> > ++      itemComment                      // comment text
> > +       itemComplex                      // complex constant (1+2i);
> imaginary is just a number
> > +       itemAssign                       // equals ('=3D') introducing =
an
> assignment
> > +       itemDeclare                      // colon-equals (':=3D')
> introducing a declaration
> > +@@ -112,6 +113,7 @@ type lexer struct {
> > +       leftDelim      string    // start of action
> > +       rightDelim     string    // end of action
> > +       trimRightDelim string    // end of action with trim marker
> > ++      emitComment    bool      // emit itemComment tokens.
> > +       pos            Pos       // current position in the input
> > +       start          Pos       // start position of this item
> > +       width          Pos       // width of last rune read from input
> > +@@ -203,7 +205,7 @@ func (l *lexer) drain() {
> > + }
> > +
> > + // lex creates a new scanner for the input string.
> > +-func lex(name, input, left, right string) *lexer {
> > ++func lex(name, input, left, right string, emitComment bool) *lexer {
> > +       if left =3D=3D "" {
> > +               left =3D leftDelim
> > +       }
> > +@@ -216,6 +218,7 @@ func lex(name, input, left, right string) *lexer {
> > +               leftDelim:      left,
> > +               rightDelim:     right,
> > +               trimRightDelim: rightTrimMarker + right,
> > ++              emitComment:    emitComment,
> > +               items:          make(chan item),
> > +               line:           1,
> > +               startLine:      1,
> > +@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {
> > +       if !delim {
> > +               return l.errorf("comment ends before closing delimiter"=
)
> > +       }
> > ++      if l.emitComment {
> > ++              l.emit(itemComment)
> > ++      }
> > +       if trimSpace {
> > +               l.pos +=3D trimMarkerLen
> > +       }
> > +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > +index 563c4fc..f6d5f28 100644
> > +--- a/src/text/template/parse/lex_test.go
> > ++++ b/src/text/template/parse/lex_test.go
> > +@@ -15,6 +15,7 @@ var itemName =3D map[itemType]string{
> > +       itemBool:         "bool",
> > +       itemChar:         "char",
> > +       itemCharConstant: "charconst",
> > ++      itemComment:      "comment",
> > +       itemComplex:      "complex",
> > +       itemDeclare:      ":=3D",
> > +       itemEOF:          "EOF",
> > +@@ -90,6 +91,7 @@ var lexTests =3D []lexTest{
> > +       {"text", `now is the time`, []item{mkItem(itemText, "now is the
> time"), tEOF}},
> > +       {"text with comment", "hello-{{/* this is a comment */}}-world"=
,
> []item{
> > +               mkItem(itemText, "hello-"),
> > ++              mkItem(itemComment, "/* this is a comment */"),
> > +               mkItem(itemText, "-world"),
> > +               tEOF,
> > +       }},
> > +@@ -311,6 +313,7 @@ var lexTests =3D []lexTest{
> > +       }},
> > +       {"trimming spaces before and after comment", "hello- {{- /*
> hello */ -}} -world", []item{
> > +               mkItem(itemText, "hello-"),
> > ++              mkItem(itemComment, "/* hello */"),
> > +               mkItem(itemText, "-world"),
> > +               tEOF,
> > +       }},
> > +@@ -389,7 +392,7 @@ var lexTests =3D []lexTest{
> > +
> > + // collect gathers the emitted items into a slice.
> > + func collect(t *lexTest, left, right string) (items []item) {
> > +-      l :=3D lex(t.name, t.input, left, right)
> > ++      l :=3D lex(t.name, t.input, left, right, true)
> > +       for {
> > +               item :=3D l.nextItem()
> > +               items =3D append(items, item)
> > +@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {
> > + func TestShutdown(t *testing.T) {
> > +       // We need to duplicate template.Parse here to hold on to the
> lexer.
> > +       const text =3D "erroneous{{define}}{{else}}1234"
> > +-      lexer :=3D lex("foo", text, "{{", "}}")
> > ++      lexer :=3D lex("foo", text, "{{", "}}", false)
> > +       _, err :=3D New("root").parseLexer(lexer)
> > +       if err =3D=3D nil {
> > +               t.Fatalf("expected error")
> > +diff --git a/src/text/template/parse/node.go
> b/src/text/template/parse/node.go
> > +index 1c116ea..a9dad5e 100644
> > +--- a/src/text/template/parse/node.go
> > ++++ b/src/text/template/parse/node.go
> > +@@ -70,6 +70,7 @@ const (
> > +       NodeTemplate                   // A template invocation action.
> > +       NodeVariable                   // A $ variable.
> > +       NodeWith                       // A with action.
> > ++      NodeComment                    // A comment.
> > + )
> > +
> > + // Nodes.
> > +@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {
> > +       return &TextNode{tr: t.tr, NodeType: NodeText, Pos: t.Pos,
> Text: append([]byte{}, t.Text...)}
> > + }
> > +
> > ++// CommentNode holds a comment.
> > ++type CommentNode struct {
> > ++      NodeType
> > ++      Pos
> > ++      tr   *Tree
> > ++      Text string // Comment text.
> > ++}
> > ++
> > ++func (t *Tree) newComment(pos Pos, text string) *CommentNode {
> > ++      return &CommentNode{tr: t, NodeType: NodeComment, Pos: pos,
> Text: text}
> > ++}
> > ++
> > ++func (c *CommentNode) String() string {
> > ++      var sb strings.Builder
> > ++      c.writeTo(&sb)
> > ++      return sb.String()
> > ++}
> > ++
> > ++func (c *CommentNode) writeTo(sb *strings.Builder) {
> > ++      sb.WriteString("{{")
> > ++      sb.WriteString(c.Text)
> > ++      sb.WriteString("}}")
> > ++}
> > ++
> > ++func (c *CommentNode) tree() *Tree {
> > ++      return c.tr
> > ++}
> > ++
> > ++func (c *CommentNode) Copy() Node {
> > ++      return &CommentNode{tr: c.tr, NodeType: NodeComment, Pos:
> c.Pos, Text: c.Text}
> > ++}
> > ++
> > + // PipeNode holds a pipeline with optional declaration
> > + type PipeNode struct {
> > +       NodeType
> > +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > +index c9b80f4..496d8bf 100644
> > +--- a/src/text/template/parse/parse.go
> > ++++ b/src/text/template/parse/parse.go
> > +@@ -21,6 +21,7 @@ type Tree struct {
> > +       Name      string    // name of the template represented by the
> tree.
> > +       ParseName string    // name of the top-level template during
> parsing, for error messages.
> > +       Root      *ListNode // top-level root of the tree.
> > ++      Mode      Mode      // parsing mode.
> > +       text      string    // text parsed to create the template (or
> its parent)
> > +       // Parsing only; cleared after parse.
> > +       funcs     []map[string]interface{}
> > +@@ -29,8 +30,16 @@ type Tree struct {
> > +       peekCount int
> > +       vars      []string // variables defined at the moment.
> > +       treeSet   map[string]*Tree
> > ++      mode      Mode
> > + }
> > +
> > ++// A mode value is a set of flags (or 0). Modes control parser
> behavior.
> > ++type Mode uint
> > ++
> > ++const (
> > ++      ParseComments Mode =3D 1 << iota // parse comments and add them=
 to
> AST
> > ++)
> > ++
> > + // Copy returns a copy of the Tree. Any parsing state is discarded.
> > + func (t *Tree) Copy() *Tree {
> > +       if t =3D=3D nil {
> > +@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {
> > + func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet
> map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error=
) {
> > +       defer t.recover(&err)
> > +       t.ParseName =3D t.Name
> > +-      t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim),
> treeSet)
> > ++      emitComment :=3D t.Mode&ParseComments !=3D 0
> > ++      t.startParse(funcs, lex(t.Name, text, leftDelim, rightDelim,
> emitComment), treeSet)
> > +       t.text =3D text
> > +       t.parse()
> > +       t.add()
> > +@@ -240,12 +250,14 @@ func (t *Tree) add() {
> > +       }
> > + }
> > +
> > +-// IsEmptyTree reports whether this tree (node) is empty of everythin=
g
> but space.
> > ++// IsEmptyTree reports whether this tree (node) is empty of everythin=
g
> but space or comments.
> > + func IsEmptyTree(n Node) bool {
> > +       switch n :=3D n.(type) {
> > +       case nil:
> > +               return true
> > +       case *ActionNode:
> > ++      case *CommentNode:
> > ++              return true
> > +       case *IfNode:
> > +       case *ListNode:
> > +               for _, node :=3D range n.Nodes {
> > +@@ -276,6 +288,7 @@ func (t *Tree) parse() {
> > +                       if t.nextNonSpace().typ =3D=3D itemDefine {
> > +                               newT :=3D New("definition") // name wil=
l
> be updated once we know it.
> > +                               newT.text =3D t.text
> > ++                              newT.Mode =3D t.Mode
> > +                               newT.ParseName =3D t.ParseName
> > +                               newT.startParse(t.funcs, t.lex,
> t.treeSet)
> > +                               newT.parseDefinition()
> > +@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *ListNode, next
> Node) {
> > + }
> > +
> > + // textOrAction:
> > +-//    text | action
> > ++//    text | comment | action
> > + func (t *Tree) textOrAction() Node {
> > +       switch token :=3D t.nextNonSpace(); token.typ {
> > +       case itemText:
> > +               return t.newText(token.pos, token.val)
> > +       case itemLeftDelim:
> > +               return t.action()
> > ++      case itemComment:
> > ++              return t.newComment(token.pos, token.val)
> > +       default:
> > +               t.unexpected(token, "input")
> > +       }
> > +@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node {
> > +
> > +       block :=3D New(name) // name will be updated once we know it.
> > +       block.text =3D t.text
> > ++      block.Mode =3D t.Mode
> > +       block.ParseName =3D t.ParseName
> > +       block.startParse(t.funcs, t.lex, t.treeSet)
> > +       var end Node
> > +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > +index 4e09a78..d9c13c5 100644
> > +--- a/src/text/template/parse/parse_test.go
> > ++++ b/src/text/template/parse/parse_test.go
> > +@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {
> > +       testParse(true, t)
> > + }
> > +
> > ++func TestParseWithComments(t *testing.T) {
> > ++      textFormat =3D "%q"
> > ++      defer func() { textFormat =3D "%s" }()
> > ++      tests :=3D [...]parseTest{
> > ++              {"comment", "{{/*\n\n\n*/}}", noError, "{{/*\n\n\n*/}}"=
},
> > ++              {"comment trim left", "x \r\n\t{{- /* hi */}}", noError=
,
> `"x"{{/* hi */}}`},
> > ++              {"comment trim right", "{{/* hi */ -}}\n\n\ty", noError=
,
> `{{/* hi */}}"y"`},
> > ++              {"comment trim left and right", "x \r\n\t{{- /* */
> -}}\n\n\ty", noError, `"x"{{/* */}}"y"`},
> > ++      }
> > ++      for _, test :=3D range tests {
> > ++              t.Run(test.name, func(t *testing.T) {
> > ++                      tr :=3D New(test.name)
> > ++                      tr.Mode =3D ParseComments
> > ++                      tmpl, err :=3D tr.Parse(test.input, "", "",
> make(map[string]*Tree))
> > ++                      if err !=3D nil {
> > ++                              t.Errorf("%q: expected error; got none"=
,
> test.name)
> > ++                      }
> > ++                      if result :=3D tmpl.Root.String(); result !=3D
> test.result {
> > ++                              t.Errorf("%s=3D(%q):
> got\n\t%v\nexpected\n\t%v", test.name, test.input, result, test.result)
> > ++                      }
> > ++              })
> > ++      }
> > ++}
> > ++
> > + type isEmptyTest struct {
> > +       name  string
> > +       input string
> > +@@ -358,6 +382,7 @@ var isEmptyTests =3D []isEmptyTest{
> > +       {"empty", ``, true},
> > +       {"nonempty", `hello`, false},
> > +       {"spaces only", " \t\n \t\n", true},
> > ++      {"comment only", "{{/* comment */}}", true},
> > +       {"definition", `{{define "x"}}something{{end}}`, true},
> > +       {"definitions and space", "{{define
> `x`}}something{{end}}\n\n{{define `y`}}something{{end}}\n\n", true},
> > +       {"definitions and text", "{{define
> `x`}}something{{end}}\nx\n{{define `y`}}something{{end}}\ny\n", false},
> > +--
> > +2.7.4
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> > new file mode 100644
> > index 0000000000..d5e2eb6684
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
> > @@ -0,0 +1,497 @@
> > +From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 17 00:00:00 2001
> > +From: Russ Cox <rsc@golang.org>
> > +Date: Thu, 10 Sep 2020 18:53:26 -0400
> > +Subject: [PATCH 4/6] text/template: allow newlines inside action
> delimiters
> > +
> > +This allows multiline constructs like:
> > +
> > +       {{"hello" |
> > +         printf}}
> > +
> > +Now that unclosed actions can span multiple lines,
> > +track and report the start of the action when reporting errors.
> > +
> > +Also clean up a few "unexpected <error message>" to be just "<error
> message>".
> > +
> > +Fixes #29770.
> > +
> > +Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/254257
> > +Trust: Russ Cox <rsc@golang.org>
> > +Run-TryBot: Russ Cox <rsc@golang.org>
> > +TryBot-Result: Go Bot <gobot@golang.org>
> > +Reviewed-by: Rob Pike <r@golang.org>
> > +
> > +Dependency Patch #4
> > +
> > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/9384d34c58099657bb1b133beaf3ff37ada9b=
017
> > +CVE: CVE-2023-24538
> > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > +---
> > + src/text/template/doc.go              | 21 ++++-----
> > + src/text/template/exec_test.go        |  2 +-
> > + src/text/template/parse/lex.go        | 84
> +++++++++++++++++------------------
> > + src/text/template/parse/lex_test.go   |  2 +-
> > + src/text/template/parse/parse.go      | 59 +++++++++++++-----------
> > + src/text/template/parse/parse_test.go | 36 ++++++++++++---
> > + 6 files changed, 117 insertions(+), 87 deletions(-)
> > +
> > +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> > +index 4b0efd2..7b30294 100644
> > +--- a/src/text/template/doc.go
> > ++++ b/src/text/template/doc.go
> > +@@ -40,16 +40,17 @@ More intricate examples appear below.
> > + Text and spaces
> > +
> > + By default, all text between actions is copied verbatim when the
> template is
> > +-executed. For example, the string " items are made of " in the exampl=
e
> above appears
> > +-on standard output when the program is run.
> > +-
> > +-However, to aid in formatting template source code, if an action's
> left delimiter
> > +-(by default "{{") is followed immediately by a minus sign and ASCII
> space character
> > +-("{{- "), all trailing white space is trimmed from the immediately
> preceding text.
> > +-Similarly, if the right delimiter ("}}") is preceded by a space and
> minus sign
> > +-(" -}}"), all leading white space is trimmed from the immediately
> following text.
> > +-In these trim markers, the ASCII space must be present; "{{-3}}"
> parses as an
> > +-action containing the number -3.
> > ++executed. For example, the string " items are made of " in the exampl=
e
> above
> > ++appears on standard output when the program is run.
> > ++
> > ++However, to aid in formatting template source code, if an action's le=
ft
> > ++delimiter (by default "{{") is followed immediately by a minus sign
> and white
> > ++space, all trailing white space is trimmed from the immediately
> preceding text.
> > ++Similarly, if the right delimiter ("}}") is preceded by white space
> and a minus
> > ++sign, all leading white space is trimmed from the immediately
> following text.
> > ++In these trim markers, the white space must be present:
> > ++"{{- 3}}" is like "{{3}}" but trims the immediately preceding text,
> while
> > ++"{{-3}}" parses as an action containing the number -3.
> > +
> > + For instance, when executing the template whose source is
> > +
> > +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > +index b8a809e..3309b33 100644
> > +--- a/src/text/template/exec_test.go
> > ++++ b/src/text/template/exec_test.go
> > +@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(t *testing.T) {
> > +               t.Fatal("expected error")
> > +       }
> > +       str :=3D err.Error()
> > +-      if !strings.Contains(str, "X:3: unexpected unterminated raw
> quoted string") {
> > ++      if !strings.Contains(str, "X:3: unterminated raw quoted string"=
)
> {
> > +               t.Fatalf("unexpected error: %s", str)
> > +       }
> > + }
> > +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > +index e41373a..6784071 100644
> > +--- a/src/text/template/parse/lex.go
> > ++++ b/src/text/template/parse/lex.go
> > +@@ -92,15 +92,14 @@ const eof =3D -1
> > + // If the action begins "{{- " rather than "{{", then all
> space/tab/newlines
> > + // preceding the action are trimmed; conversely if it ends " -}}" the
> > + // leading spaces are trimmed. This is done entirely in the lexer; th=
e
> > +-// parser never sees it happen. We require an ASCII space to be
> > +-// present to avoid ambiguity with things like "{{-3}}". It reads
> > ++// parser never sees it happen. We require an ASCII space (' ', \t,
> \r, \n)
> > ++// to be present to avoid ambiguity with things like "{{-3}}". It rea=
ds
> > + // better with the space present anyway. For simplicity, only ASCII
> > +-// space does the job.
> > ++// does the job.
> > + const (
> > +-      spaceChars      =3D " \t\r\n" // These are the space characters
> defined by Go itself.
> > +-      leftTrimMarker  =3D "- "      // Attached to left delimiter, tr=
ims
> trailing spaces from preceding text.
> > +-      rightTrimMarker =3D " -"      // Attached to right delimiter,
> trims leading spaces from following text.
> > +-      trimMarkerLen   =3D Pos(len(leftTrimMarker))
> > ++      spaceChars    =3D " \t\r\n"  // These are the space characters
> defined by Go itself.
> > ++      trimMarker    =3D '-'        // Attached to left/right delimite=
r,
> trims trailing spaces from preceding/following text.
> > ++      trimMarkerLen =3D Pos(1 + 1) // marker plus space before or aft=
er
> > + )
> > +
> > + // stateFn represents the state of the scanner as a function that
> returns the next state.
> > +@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn
> > +
> > + // lexer holds the state of the scanner.
> > + type lexer struct {
> > +-      name           string    // the name of the input; used only fo=
r
> error reports
> > +-      input          string    // the string being scanned
> > +-      leftDelim      string    // start of action
> > +-      rightDelim     string    // end of action
> > +-      trimRightDelim string    // end of action with trim marker
> > +-      emitComment    bool      // emit itemComment tokens.
> > +-      pos            Pos       // current position in the input
> > +-      start          Pos       // start position of this item
> > +-      width          Pos       // width of last rune read from input
> > +-      items          chan item // channel of scanned items
> > +-      parenDepth     int       // nesting depth of ( ) exprs
> > +-      line           int       // 1+number of newlines seen
> > +-      startLine      int       // start line of this item
> > ++      name        string    // the name of the input; used only for
> error reports
> > ++      input       string    // the string being scanned
> > ++      leftDelim   string    // start of action
> > ++      rightDelim  string    // end of action
> > ++      emitComment bool      // emit itemComment tokens.
> > ++      pos         Pos       // current position in the input
> > ++      start       Pos       // start position of this item
> > ++      width       Pos       // width of last rune read from input
> > ++      items       chan item // channel of scanned items
> > ++      parenDepth  int       // nesting depth of ( ) exprs
> > ++      line        int       // 1+number of newlines seen
> > ++      startLine   int       // start line of this item
> > + }
> > +
> > + // next returns the next rune in the input.
> > +@@ -213,15 +211,14 @@ func lex(name, input, left, right string,
> emitComment bool) *lexer {
> > +               right =3D rightDelim
> > +       }
> > +       l :=3D &lexer{
> > +-              name:           name,
> > +-              input:          input,
> > +-              leftDelim:      left,
> > +-              rightDelim:     right,
> > +-              trimRightDelim: rightTrimMarker + right,
> > +-              emitComment:    emitComment,
> > +-              items:          make(chan item),
> > +-              line:           1,
> > +-              startLine:      1,
> > ++              name:        name,
> > ++              input:       input,
> > ++              leftDelim:   left,
> > ++              rightDelim:  right,
> > ++              emitComment: emitComment,
> > ++              items:       make(chan item),
> > ++              line:        1,
> > ++              startLine:   1,
> > +       }
> > +       go l.run()
> > +       return l
> > +@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {
> > +               ldn :=3D Pos(len(l.leftDelim))
> > +               l.pos +=3D Pos(x)
> > +               trimLength :=3D Pos(0)
> > +-              if strings.HasPrefix(l.input[l.pos+ldn:],
> leftTrimMarker) {
> > ++              if hasLeftTrimMarker(l.input[l.pos+ldn:]) {
> > +                       trimLength =3D
> rightTrimLength(l.input[l.start:l.pos])
> > +               }
> > +               l.pos -=3D trimLength
> > +@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos {
> > +
> > + // atRightDelim reports whether the lexer is at a right delimiter,
> possibly preceded by a trim marker.
> > + func (l *lexer) atRightDelim() (delim, trimSpaces bool) {
> > +-      if strings.HasPrefix(l.input[l.pos:], l.trimRightDelim) { //
> With trim marker.
> > ++      if hasRightTrimMarker(l.input[l.pos:]) &&
> strings.HasPrefix(l.input[l.pos+trimMarkerLen:], l.rightDelim) { // With
> trim marker.
> > +               return true, true
> > +       }
> > +       if strings.HasPrefix(l.input[l.pos:], l.rightDelim) { // Withou=
t
> trim marker.
> > +@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {
> > + // lexLeftDelim scans the left delimiter, which is known to be
> present, possibly with a trim marker.
> > + func lexLeftDelim(l *lexer) stateFn {
> > +       l.pos +=3D Pos(len(l.leftDelim))
> > +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:], leftTrimMarke=
r)
> > ++      trimSpace :=3D hasLeftTrimMarker(l.input[l.pos:])
> > +       afterMarker :=3D Pos(0)
> > +       if trimSpace {
> > +               afterMarker =3D trimMarkerLen
> > +@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {
> > +
> > + // lexRightDelim scans the right delimiter, which is known to be
> present, possibly with a trim marker.
> > + func lexRightDelim(l *lexer) stateFn {
> > +-      trimSpace :=3D strings.HasPrefix(l.input[l.pos:], rightTrimMark=
er)
> > ++      trimSpace :=3D hasRightTrimMarker(l.input[l.pos:])
> > +       if trimSpace {
> > +               l.pos +=3D trimMarkerLen
> > +               l.ignore()
> > +@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stateFn {
> > +               return l.errorf("unclosed left paren")
> > +       }
> > +       switch r :=3D l.next(); {
> > +-      case r =3D=3D eof || isEndOfLine(r):
> > ++      case r =3D=3D eof:
> > +               return l.errorf("unclosed action")
> > +       case isSpace(r):
> > +               l.backup() // Put space back in case we have " -}}".
> > +@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {
> > +       }
> > +       // Be careful about a trim-marked closing delimiter, which has =
a
> minus
> > +       // after a space. We know there is a space, so check for the '-=
'
> that might follow.
> > +-      if strings.HasPrefix(l.input[l.pos-1:], l.trimRightDelim) {
> > ++      if hasRightTrimMarker(l.input[l.pos-1:]) &&
> strings.HasPrefix(l.input[l.pos-1+trimMarkerLen:], l.rightDelim) {
> > +               l.backup() // Before the space.
> > +               if numSpaces =3D=3D 1 {
> > +                       return lexRightDelim // On the delim, so go
> right to that.
> > +@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, typ itemType)
> stateFn {
> > + // day to implement arithmetic.
> > + func (l *lexer) atTerminator() bool {
> > +       r :=3D l.peek()
> > +-      if isSpace(r) || isEndOfLine(r) {
> > ++      if isSpace(r) {
> > +               return true
> > +       }
> > +       switch r {
> > +@@ -657,15 +654,18 @@ Loop:
> > +
> > + // isSpace reports whether r is a space character.
> > + func isSpace(r rune) bool {
> > +-      return r =3D=3D ' ' || r =3D=3D '\t'
> > +-}
> > +-
> > +-// isEndOfLine reports whether r is an end-of-line character.
> > +-func isEndOfLine(r rune) bool {
> > +-      return r =3D=3D '\r' || r =3D=3D '\n'
> > ++      return r =3D=3D ' ' || r =3D=3D '\t' || r =3D=3D '\r' || r =3D=
=3D '\n'
> > + }
> > +
> > + // isAlphaNumeric reports whether r is an alphabetic, digit, or
> underscore.
> > + func isAlphaNumeric(r rune) bool {
> > +       return r =3D=3D '_' || unicode.IsLetter(r) || unicode.IsDigit(r=
)
> > + }
> > ++
> > ++func hasLeftTrimMarker(s string) bool {
> > ++      return len(s) >=3D 2 && s[0] =3D=3D trimMarker && isSpace(rune(=
s[1]))
> > ++}
> > ++
> > ++func hasRightTrimMarker(s string) bool {
> > ++      return len(s) >=3D 2 && isSpace(rune(s[0])) && s[1] =3D=3D trim=
Marker
> > ++}
> > +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > +index f6d5f28..6510eed 100644
> > +--- a/src/text/template/parse/lex_test.go
> > ++++ b/src/text/template/parse/lex_test.go
> > +@@ -323,7 +323,7 @@ var lexTests =3D []lexTest{
> > +               tLeft,
> > +               mkItem(itemError, "unrecognized character in action:
> U+0001"),
> > +       }},
> > +-      {"unclosed action", "{{\n}}", []item{
> > ++      {"unclosed action", "{{", []item{
> > +               tLeft,
> > +               mkItem(itemError, "unclosed action"),
> > +       }},
> > +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > +index 496d8bf..5e6e512 100644
> > +--- a/src/text/template/parse/parse.go
> > ++++ b/src/text/template/parse/parse.go
> > +@@ -24,13 +24,14 @@ type Tree struct {
> > +       Mode      Mode      // parsing mode.
> > +       text      string    // text parsed to create the template (or
> its parent)
> > +       // Parsing only; cleared after parse.
> > +-      funcs     []map[string]interface{}
> > +-      lex       *lexer
> > +-      token     [3]item // three-token lookahead for parser.
> > +-      peekCount int
> > +-      vars      []string // variables defined at the moment.
> > +-      treeSet   map[string]*Tree
> > +-      mode      Mode
> > ++      funcs      []map[string]interface{}
> > ++      lex        *lexer
> > ++      token      [3]item // three-token lookahead for parser.
> > ++      peekCount  int
> > ++      vars       []string // variables defined at the moment.
> > ++      treeSet    map[string]*Tree
> > ++      actionLine int // line of left delim starting action
> > ++      mode       Mode
> > + }
> > +
> > + // A mode value is a set of flags (or 0). Modes control parser
> behavior.
> > +@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expected1, expected2
> itemType, context string) item {
> > +
> > + // unexpected complains about the token and terminates processing.
> > + func (t *Tree) unexpected(token item, context string) {
> > ++      if token.typ =3D=3D itemError {
> > ++              extra :=3D ""
> > ++              if t.actionLine !=3D 0 && t.actionLine !=3D token.line =
{
> > ++                      extra =3D fmt.Sprintf(" in action started at
> %s:%d", t.ParseName, t.actionLine)
> > ++                      if strings.HasSuffix(token.val, " action") {
> > ++                              extra =3D extra[len(" in action"):] //
> avoid "action in action"
> > ++                      }
> > ++              }
> > ++              t.errorf("%s%s", token, extra)
> > ++      }
> > +       t.errorf("unexpected %s in %s", token, context)
> > + }
> > +
> > +@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node {
> > +       case itemText:
> > +               return t.newText(token.pos, token.val)
> > +       case itemLeftDelim:
> > ++              t.actionLine =3D token.line
> > ++              defer t.clearActionLine()
> > +               return t.action()
> > +       case itemComment:
> > +               return t.newComment(token.pos, token.val)
> > +@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node {
> > +       return nil
> > + }
> > +
> > ++func (t *Tree) clearActionLine() {
> > ++      t.actionLine =3D 0
> > ++}
> > ++
> > + // Action:
> > + //    control
> > + //    command ("|" command)*
> > +@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) {
> > +       t.backup()
> > +       token :=3D t.peek()
> > +       // Do not pop variables; they persist until "end".
> > +-      return t.newAction(token.pos, token.line, t.pipeline("command")=
)
> > ++      return t.newAction(token.pos, token.line, t.pipeline("command",
> itemRightDelim))
> > + }
> > +
> > + // Pipeline:
> > + //    declarations? command ('|' command)*
> > +-func (t *Tree) pipeline(context string) (pipe *PipeNode) {
> > ++func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode=
)
> {
> > +       token :=3D t.peekNonSpace()
> > +       pipe =3D t.newPipeline(token.pos, token.line, nil)
> > +       // Are there declarations or assignments?
> > +@@ -430,12 +447,9 @@ decls:
> > +       }
> > +       for {
> > +               switch token :=3D t.nextNonSpace(); token.typ {
> > +-              case itemRightDelim, itemRightParen:
> > ++              case end:
> > +                       // At this point, the pipeline is complete
> > +                       t.checkPipeline(pipe, context)
> > +-                      if token.typ =3D=3D itemRightParen {
> > +-                              t.backup()
> > +-                      }
> > +                       return
> > +               case itemBool, itemCharConstant, itemComplex, itemDot,
> itemField, itemIdentifier,
> > +                       itemNumber, itemNil, itemRawString, itemString,
> itemVariable, itemLeftParen:
> > +@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *PipeNode,
> context string) {
> > +
> > + func (t *Tree) parseControl(allowElseIf bool, context string) (pos
> Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
> > +       defer t.popVars(len(t.vars))
> > +-      pipe =3D t.pipeline(context)
> > ++      pipe =3D t.pipeline(context, itemRightDelim)
> > +       var next Node
> > +       list, next =3D t.itemList()
> > +       switch next.Type() {
> > +@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node {
> > +
> > +       token :=3D t.nextNonSpace()
> > +       name :=3D t.parseTemplateName(token, context)
> > +-      pipe :=3D t.pipeline(context)
> > ++      pipe :=3D t.pipeline(context, itemRightDelim)
> > +
> > +       block :=3D New(name) // name will be updated once we know it.
> > +       block.text =3D t.text
> > +@@ -580,7 +594,7 @@ func (t *Tree) templateControl() Node {
> > +       if t.nextNonSpace().typ !=3D itemRightDelim {
> > +               t.backup()
> > +               // Do not pop variables; they persist until "end".
> > +-              pipe =3D t.pipeline(context)
> > ++              pipe =3D t.pipeline(context, itemRightDelim)
> > +       }
> > +       return t.newTemplate(token.pos, token.line, name, pipe)
> > + }
> > +@@ -614,13 +628,12 @@ func (t *Tree) command() *CommandNode {
> > +               switch token :=3D t.next(); token.typ {
> > +               case itemSpace:
> > +                       continue
> > +-              case itemError:
> > +-                      t.errorf("%s", token.val)
> > +               case itemRightDelim, itemRightParen:
> > +                       t.backup()
> > +               case itemPipe:
> > ++                      // nothing here; break loop below
> > +               default:
> > +-                      t.errorf("unexpected %s in operand", token)
> > ++                      t.unexpected(token, "operand")
> > +               }
> > +               break
> > +       }
> > +@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {
> > + // A nil return means the next item is not a term.
> > + func (t *Tree) term() Node {
> > +       switch token :=3D t.nextNonSpace(); token.typ {
> > +-      case itemError:
> > +-              t.errorf("%s", token.val)
> > +       case itemIdentifier:
> > +               if !t.hasFunction(token.val) {
> > +                       t.errorf("function %q not defined", token.val)
> > +@@ -699,11 +710,7 @@ func (t *Tree) term() Node {
> > +               }
> > +               return number
> > +       case itemLeftParen:
> > +-              pipe :=3D t.pipeline("parenthesized pipeline")
> > +-              if token :=3D t.next(); token.typ !=3D itemRightParen {
> > +-                      t.errorf("unclosed right paren: unexpected %s",
> token)
> > +-              }
> > +-              return pipe
> > ++              return t.pipeline("parenthesized pipeline",
> itemRightParen)
> > +       case itemString, itemRawString:
> > +               s, err :=3D strconv.Unquote(token.val)
> > +               if err !=3D nil {
> > +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > +index d9c13c5..220f984 100644
> > +--- a/src/text/template/parse/parse_test.go
> > ++++ b/src/text/template/parse/parse_test.go
> > +@@ -250,6 +250,13 @@ var parseTests =3D []parseTest{
> > +       {"comment trim left and right", "x \r\n\t{{- /* */ -}}\n\n\ty",
> noError, `"x""y"`},
> > +       {"block definition", `{{block "foo" .}}hello{{end}}`, noError,
> > +               `{{template "foo" .}}`},
> > ++
> > ++      {"newline in assignment", "{{ $x \n :=3D \n 1 \n }}", noError,
> "{{$x :=3D 1}}"},
> > ++      {"newline in empty action", "{{\n}}", hasError, "{{\n}}"},
> > ++      {"newline in pipeline", "{{\n\"x\"\n|\nprintf\n}}", noError,
> `{{"x" | printf}}`},
> > ++      {"newline in comment", "{{/*\nhello\n*/}}", noError, ""},
> > ++      {"newline in comment", "{{-\n/*\nhello\n*/\n-}}", noError, ""},
> > ++
> > +       // Errors.
> > +       {"unclosed action", "hello{{range", hasError, ""},
> > +       {"unmatched end", "{{end}}", hasError, ""},
> > +@@ -426,23 +433,38 @@ var errorTests =3D []parseTest{
> > +       // Check line numbers are accurate.
> > +       {"unclosed1",
> > +               "line1\n{{",
> > +-              hasError, `unclosed1:2: unexpected unclosed action in
> command`},
> > ++              hasError, `unclosed1:2: unclosed action`},
> > +       {"unclosed2",
> > +               "line1\n{{define `x`}}line2\n{{",
> > +-              hasError, `unclosed2:3: unexpected unclosed action in
> command`},
> > ++              hasError, `unclosed2:3: unclosed action`},
> > ++      {"unclosed3",
> > ++              "line1\n{{\"x\"\n\"y\"\n",
> > ++              hasError, `unclosed3:4: unclosed action started at
> unclosed3:2`},
> > ++      {"unclosed4",
> > ++              "{{\n\n\n\n\n",
> > ++              hasError, `unclosed4:6: unclosed action started at
> unclosed4:1`},
> > ++      {"var1",
> > ++              "line1\n{{\nx\n}}",
> > ++              hasError, `var1:3: function "x" not defined`},
> > +       // Specific errors.
> > +       {"function",
> > +               "{{foo}}",
> > +               hasError, `function "foo" not defined`},
> > +-      {"comment",
> > ++      {"comment1",
> > +               "{{/*}}",
> > +-              hasError, `unclosed comment`},
> > ++              hasError, `comment1:1: unclosed comment`},
> > ++      {"comment2",
> > ++              "{{/*\nhello\n}}",
> > ++              hasError, `comment2:1: unclosed comment`},
> > +       {"lparen",
> > +               "{{.X (1 2 3}}",
> > +               hasError, `unclosed left paren`},
> > +       {"rparen",
> > +-              "{{.X 1 2 3)}}",
> > +-              hasError, `unexpected ")"`},
> > ++              "{{.X 1 2 3 ) }}",
> > ++              hasError, `unexpected ")" in command`},
> > ++      {"rparen2",
> > ++              "{{(.X 1 2 3",
> > ++              hasError, `unclosed action`},
> > +       {"space",
> > +               "{{`x`3}}",
> > +               hasError, `in operand`},
> > +@@ -488,7 +510,7 @@ var errorTests =3D []parseTest{
> > +               hasError, `missing value for parenthesized pipeline`},
> > +       {"multilinerawstring",
> > +               "{{ $v :=3D `\n` }} {{",
> > +-              hasError, `multilinerawstring:2: unexpected unclosed
> action`},
> > ++              hasError, `multilinerawstring:2: unclosed action`},
> > +       {"rangeundefvar",
> > +               "{{range $k}}{{end}}",
> > +               hasError, `undefined variable`},
> > +--
> > +2.7.4
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> > new file mode 100644
> > index 0000000000..fc38929648
> > --- /dev/null
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
> > @@ -0,0 +1,585 @@
> > +From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 17 00:00:00 2001
> > +From: Russ Cox <rsc@golang.org>
> > +Date: Thu, 20 May 2021 12:46:33 -0400
> > +Subject: [PATCH 5/6] html/template, text/template: implement break and
> > + continue for range loops
> > +
> > +Break and continue for range loops was accepted as a proposal in June
> 2017.
> > +It was implemented in CL 66410 (Oct 2017)
> > +but then rolled back in CL 92155 (Feb 2018)
> > +because html/template changes had not been implemented.
> > +
> > +This CL reimplements break and continue in text/template
> > +and then adds support for them in html/template as well.
> > +
> > +Fixes #20531.
> > +
> > +Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616
> > +Reviewed-on: https://go-review.googlesource.com/c/go/+/321491
> > +Trust: Russ Cox <rsc@golang.org>
> > +Run-TryBot: Russ Cox <rsc@golang.org>
> > +TryBot-Result: Go Bot <gobot@golang.org>
> > +Reviewed-by: Rob Pike <r@golang.org>
> > +
> > +Dependency Patch #5
> > +
> > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/d0dd26a88c019d54f22463daae81e785f5867=
565
> > +CVE: CVE-2023-24538
> > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > +---
> > + src/html/template/context.go          |  4 ++
> > + src/html/template/escape.go           | 71
> ++++++++++++++++++++++++++++++++++-
> > + src/html/template/escape_test.go      | 24 ++++++++++++
> > + src/text/template/doc.go              |  8 ++++
> > + src/text/template/exec.go             | 24 +++++++++++-
> > + src/text/template/exec_test.go        |  2 +
> > + src/text/template/parse/lex.go        | 13 ++++++-
> > + src/text/template/parse/lex_test.go   |  2 +
> > + src/text/template/parse/node.go       | 36 ++++++++++++++++++
> > + src/text/template/parse/parse.go      | 42 ++++++++++++++++++++-
> > + src/text/template/parse/parse_test.go |  8 ++++
> > + 11 files changed, 230 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/html/template/context.go b/src/html/template/context.=
go
> > +index f7d4849..aaa7d08 100644
> > +--- a/src/html/template/context.go
> > ++++ b/src/html/template/context.go
> > +@@ -6,6 +6,7 @@ package template
> > +
> > + import (
> > +       "fmt"
> > ++      "text/template/parse"
> > + )
> > +
> > + // context describes the state an HTML parser must be in when it
> reaches the
> > +@@ -22,6 +23,7 @@ type context struct {
> > +       jsCtx   jsCtx
> > +       attr    attr
> > +       element element
> > ++      n       parse.Node // for range break/continue
> > +       err     *Error
> > + }
> > +
> > +@@ -141,6 +143,8 @@ const (
> > +       // stateError is an infectious error state outside any valid
> > +       // HTML/CSS/JS construct.
> > +       stateError
> > ++      // stateDead marks unreachable code after a {{break}} or
> {{continue}}.
> > ++      stateDead
> > + )
> > +
> > + // isComment is true for any state that contains content meant for
> template
> > +diff --git a/src/html/template/escape.go b/src/html/template/escape.go
> > +index 8739735..6dea79c 100644
> > +--- a/src/html/template/escape.go
> > ++++ b/src/html/template/escape.go
> > +@@ -97,6 +97,15 @@ type escaper struct {
> > +       actionNodeEdits   map[*parse.ActionNode][]string
> > +       templateNodeEdits map[*parse.TemplateNode]string
> > +       textNodeEdits     map[*parse.TextNode][]byte
> > ++      // rangeContext holds context about the current range loop.
> > ++      rangeContext *rangeContext
> > ++}
> > ++
> > ++// rangeContext holds information about the current range loop.
> > ++type rangeContext struct {
> > ++      outer     *rangeContext // outer loop
> > ++      breaks    []context     // context at each break action
> > ++      continues []context     // context at each continue action
> > + }
> > +
> > + // makeEscaper creates a blank escaper for the given set.
> > +@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {
> > +               map[*parse.ActionNode][]string{},
> > +               map[*parse.TemplateNode]string{},
> > +               map[*parse.TextNode][]byte{},
> > ++              nil,
> > +       }
> > + }
> > +
> > +@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n parse.Node)
> context {
> > +       switch n :=3D n.(type) {
> > +       case *parse.ActionNode:
> > +               return e.escapeAction(c, n)
> > ++      case *parse.BreakNode:
> > ++              c.n =3D n
> > ++              e.rangeContext.breaks =3D append(e.rangeContext.breaks,=
 c)
> > ++              return context{state: stateDead}
> > +       case *parse.CommentNode:
> > +               return c
> > ++      case *parse.ContinueNode:
> > ++              c.n =3D n
> > ++              e.rangeContext.continues =3D append(e.rangeContext.brea=
ks,
> c)
> > ++              return context{state: stateDead}
> > +       case *parse.IfNode:
> > +               return e.escapeBranch(c, &n.BranchNode, "if")
> > +       case *parse.ListNode:
> > +@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node, nodeName
> string) context {
> > +       if b.state =3D=3D stateError {
> > +               return b
> > +       }
> > ++      if a.state =3D=3D stateDead {
> > ++              return b
> > ++      }
> > ++      if b.state =3D=3D stateDead {
> > ++              return a
> > ++      }
> > +       if a.eq(b) {
> > +               return a
> > +       }
> > +@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node, nodeNam=
e
> string) context {
> > +
> > + // escapeBranch escapes a branch template node: "if", "range" and
> "with".
> > + func (e *escaper) escapeBranch(c context, n *parse.BranchNode,
> nodeName string) context {
> > ++      if nodeName =3D=3D "range" {
> > ++              e.rangeContext =3D &rangeContext{outer: e.rangeContext}
> > ++      }
> > +       c0 :=3D e.escapeList(c, n.List)
> > +-      if nodeName =3D=3D "range" && c0.state !=3D stateError {
> > ++      if nodeName =3D=3D "range" {
> > ++              if c0.state !=3D stateError {
> > ++                      c0 =3D joinRange(c0, e.rangeContext)
> > ++              }
> > ++              e.rangeContext =3D e.rangeContext.outer
> > ++              if c0.state =3D=3D stateError {
> > ++                      return c0
> > ++              }
> > ++
> > +               // The "true" branch of a "range" node can execute
> multiple times.
> > +               // We check that executing n.List once results in the
> same context
> > +               // as executing n.List twice.
> > ++              e.rangeContext =3D &rangeContext{outer: e.rangeContext}
> > +               c1, _ :=3D e.escapeListConditionally(c0, n.List, nil)
> > +               c0 =3D join(c0, c1, n, nodeName)
> > +               if c0.state =3D=3D stateError {
> > ++                      e.rangeContext =3D e.rangeContext.outer
> > +                       // Make clear that this is a problem on loop
> re-entry
> > +                       // since developers tend to overlook that branc=
h
> when
> > +                       // debugging templates.
> > +@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n
> *parse.BranchNode, nodeName string)
> > +                       c0.err.Description =3D "on range loop re-entry:=
 "
> + c0.err.Description
> > +                       return c0
> > +               }
> > ++              c0 =3D joinRange(c0, e.rangeContext)
> > ++              e.rangeContext =3D e.rangeContext.outer
> > ++              if c0.state =3D=3D stateError {
> > ++                      return c0
> > ++              }
> > +       }
> > +       c1 :=3D e.escapeList(c, n.ElseList)
> > +       return join(c0, c1, n, nodeName)
> > + }
> > +
> > ++func joinRange(c0 context, rc *rangeContext) context {
> > ++      // Merge contexts at break and continue statements into overall
> body context.
> > ++      // In theory we could treat breaks differently from continues,
> but for now it is
> > ++      // enough to treat them both as going back to the start of the
> loop (which may then stop).
> > ++      for _, c :=3D range rc.breaks {
> > ++              c0 =3D join(c0, c, c.n, "range")
> > ++              if c0.state =3D=3D stateError {
> > ++                      c0.err.Line =3D c.n.(*parse.BreakNode).Line
> > ++                      c0.err.Description =3D "at range loop break: " =
+
> c0.err.Description
> > ++                      return c0
> > ++              }
> > ++      }
> > ++      for _, c :=3D range rc.continues {
> > ++              c0 =3D join(c0, c, c.n, "range")
> > ++              if c0.state =3D=3D stateError {
> > ++                      c0.err.Line =3D c.n.(*parse.ContinueNode).Line
> > ++                      c0.err.Description =3D "at range loop continue:=
 "
> + c0.err.Description
> > ++                      return c0
> > ++              }
> > ++      }
> > ++      return c0
> > ++}
> > ++
> > + // escapeList escapes a list template node.
> > + func (e *escaper) escapeList(c context, n *parse.ListNode) context {
> > +       if n =3D=3D nil {
> > +@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n
> *parse.ListNode) context {
> > +       }
> > +       for _, m :=3D range n.Nodes {
> > +               c =3D e.escape(c, m)
> > ++              if c.state =3D=3D stateDead {
> > ++                      break
> > ++              }
> > +       }
> > +       return c
> > + }
> > +@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n
> *parse.ListNode) context {
> > + // which is the same as whether e was updated.
> > + func (e *escaper) escapeListConditionally(c context, n
> *parse.ListNode, filter func(*escaper, context) bool) (context, bool) {
> > +       e1 :=3D makeEscaper(e.ns)
> > ++      e1.rangeContext =3D e.rangeContext
> > +       // Make type inferences available to f.
> > +       for k, v :=3D range e.output {
> > +               e1.output[k] =3D v
> > +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > +index c709660..fa2b84a 100644
> > +--- a/src/html/template/escape_test.go
> > ++++ b/src/html/template/escape_test.go
> > +@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {
> > +                       "<a href=3D'/foo?{{range
> .Items}}&{{.K}}=3D{{.V}}{{end}}'>",
> > +                       "",
> > +               },
> > ++              {
> > ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{end}}",
> > ++                      "",
> > ++              },
> > ++              {
> > ++                      "{{range .Items}}<a{{if
> .X}}{{end}}>{{continue}}{{end}}",
> > ++                      "",
> > ++              },
> > ++              {
> > ++                      "{{range .Items}}<a{{if
> .X}}{{end}}>{{break}}{{end}}",
> > ++                      "",
> > ++              },
> > ++              {
> > ++                      "{{range .Items}}<a{{if .X}}{{end}}>{{if
> .X}}{{break}}{{end}}{{end}}",
> > ++                      "",
> > ++              },
> > +               // Error cases.
> > +               {
> > +                       "{{if .Cond}}<a{{end}}",
> > +@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {
> > +                       "z:2:8: on range loop re-entry: {{range}}
> branches",
> > +               },
> > +               {
> > ++                      "{{range .Items}}<a{{if
> .X}}{{break}}{{end}}>{{end}}",
> > ++                      "z:1:29: at range loop break: {{range}} branche=
s
> end in different contexts",
> > ++              },
> > ++              {
> > ++                      "{{range .Items}}<a{{if
> .X}}{{continue}}{{end}}>{{end}}",
> > ++                      "z:1:29: at range loop continue: {{range}}
> branches end in different contexts",
> > ++              },
> > ++              {
> > +                       "<a b=3D1 c=3D{{.H}}",
> > +                       "z: ends in a non-text context: {stateAttr
> delimSpaceOrTagEnd",
> > +               },
> > +diff --git a/src/text/template/doc.go b/src/text/template/doc.go
> > +index 7b30294..0228b15 100644
> > +--- a/src/text/template/doc.go
> > ++++ b/src/text/template/doc.go
> > +@@ -112,6 +112,14 @@ data, defined in detail in the corresponding
> sections that follow.
> > +               T0 is executed; otherwise, dot is set to the successive
> elements
> > +               of the array, slice, or map and T1 is executed.
> > +
> > ++      {{break}}
> > ++              The innermost {{range pipeline}} loop is ended early,
> stopping the
> > ++              current iteration and bypassing all remaining iteration=
s.
> > ++
> > ++      {{continue}}
> > ++              The current iteration of the innermost {{range
> pipeline}} loop is
> > ++              stopped, and the loop starts the next iteration.
> > ++
> > +       {{template "name"}}
> > +               The template with the specified name is executed with
> nil data.
> > +
> > +diff --git a/src/text/template/exec.go b/src/text/template/exec.go
> > +index 7ac5175..6cb140a 100644
> > +--- a/src/text/template/exec.go
> > ++++ b/src/text/template/exec.go
> > +@@ -5,6 +5,7 @@
> > + package template
> > +
> > + import (
> > ++      "errors"
> > +       "fmt"
> > +       "internal/fmtsort"
> > +       "io"
> > +@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplates() string {
> > +       return b.String()
> > + }
> > +
> > ++// Sentinel errors for use with panic to signal early exits from rang=
e
> loops.
> > ++var (
> > ++      walkBreak    =3D errors.New("break")
> > ++      walkContinue =3D errors.New("continue")
> > ++)
> > ++
> > + // Walk functions step through the major pieces of the template
> structure,
> > + // generating output as they go.
> > + func (s *state) walk(dot reflect.Value, node parse.Node) {
> > +@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.Value, node
> parse.Node) {
> > +               if len(node.Pipe.Decl) =3D=3D 0 {
> > +                       s.printValue(node, val)
> > +               }
> > ++      case *parse.BreakNode:
> > ++              panic(walkBreak)
> > +       case *parse.CommentNode:
> > ++      case *parse.ContinueNode:
> > ++              panic(walkContinue)
> > +       case *parse.IfNode:
> > +               s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List,
> node.ElseList)
> > +       case *parse.ListNode:
> > +@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (truth, ok bool) {
> > +
> > + func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
> > +       s.at(r)
> > ++      defer func() {
> > ++              if r :=3D recover(); r !=3D nil && r !=3D walkBreak {
> > ++                      panic(r)
> > ++              }
> > ++      }()
> > +       defer s.pop(s.mark())
> > +       val, _ :=3D indirect(s.evalPipeline(dot, r.Pipe))
> > +       // mark top of stack before any variables in the body are pushe=
d.
> > +@@ -348,8 +364,14 @@ func (s *state) walkRange(dot reflect.Value, r
> *parse.RangeNode) {
> > +               if len(r.Pipe.Decl) > 1 {
> > +                       s.setTopVar(2, index)
> > +               }
> > ++              defer s.pop(mark)
> > ++              defer func() {
> > ++                      // Consume panic(walkContinue)
> > ++                      if r :=3D recover(); r !=3D nil && r !=3D walkC=
ontinue
> {
> > ++                              panic(r)
> > ++                      }
> > ++              }()
> > +               s.walk(elem, r.List)
> > +-              s.pop(mark)
> > +       }
> > +       switch val.Kind() {
> > +       case reflect.Array, reflect.Slice:
> > +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > +index 3309b33..a639f44 100644
> > +--- a/src/text/template/exec_test.go
> > ++++ b/src/text/template/exec_test.go
> > +@@ -563,6 +563,8 @@ var execTests =3D []execTest{
> > +       {"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}", "",
> tVal, true},
> > +       {"range []int else", "{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}"=
,
> "-3--4--5-", tVal, true},
> > +       {"range empty else", "{{range
> .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}", "EMPTY", tVal, true},
> > ++      {"range []int break else", "{{range
> .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
> > ++      {"range []int continue else", "{{range
> .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVa=
l,
> true},
> > +       {"range []bool", "{{range .SB}}-{{.}}-{{end}}", "-true--false-"=
,
> tVal, true},
> > +       {"range []int method", "{{range .SI | .MAdd .I}}-{{.}}-{{end}}"=
,
> "-20--21--22-", tVal, true},
> > +       {"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-", tVal=
,
> true},
> > +diff --git a/src/text/template/parse/lex.go
> b/src/text/template/parse/lex.go
> > +index 6784071..95e3377 100644
> > +--- a/src/text/template/parse/lex.go
> > ++++ b/src/text/template/parse/lex.go
> > +@@ -62,6 +62,8 @@ const (
> > +       // Keywords appear after all the rest.
> > +       itemKeyword  // used only to delimit the keywords
> > +       itemBlock    // block keyword
> > ++      itemBreak    // break keyword
> > ++      itemContinue // continue keyword
> > +       itemDot      // the cursor, spelled '.'
> > +       itemDefine   // define keyword
> > +       itemElse     // else keyword
> > +@@ -76,6 +78,8 @@ const (
> > + var key =3D map[string]itemType{
> > +       ".":        itemDot,
> > +       "block":    itemBlock,
> > ++      "break":    itemBreak,
> > ++      "continue": itemContinue,
> > +       "define":   itemDefine,
> > +       "else":     itemElse,
> > +       "end":      itemEnd,
> > +@@ -119,6 +123,8 @@ type lexer struct {
> > +       parenDepth  int       // nesting depth of ( ) exprs
> > +       line        int       // 1+number of newlines seen
> > +       startLine   int       // start line of this item
> > ++      breakOK     bool      // break keyword allowed
> > ++      continueOK  bool      // continue keyword allowed
> > + }
> > +
> > + // next returns the next rune in the input.
> > +@@ -461,7 +467,12 @@ Loop:
> > +                       }
> > +                       switch {
> > +                       case key[word] > itemKeyword:
> > +-                              l.emit(key[word])
> > ++                              item :=3D key[word]
> > ++                              if item =3D=3D itemBreak && !l.breakOK =
||
> item =3D=3D itemContinue && !l.continueOK {
> > ++                                      l.emit(itemIdentifier)
> > ++                              } else {
> > ++                                      l.emit(item)
> > ++                              }
> > +                       case word[0] =3D=3D '.':
> > +                               l.emit(itemField)
> > +                       case word =3D=3D "true", word =3D=3D "false":
> > +diff --git a/src/text/template/parse/lex_test.go
> b/src/text/template/parse/lex_test.go
> > +index 6510eed..df6aabf 100644
> > +--- a/src/text/template/parse/lex_test.go
> > ++++ b/src/text/template/parse/lex_test.go
> > +@@ -35,6 +35,8 @@ var itemName =3D map[itemType]string{
> > +       // keywords
> > +       itemDot:      ".",
> > +       itemBlock:    "block",
> > ++      itemBreak:    "break",
> > ++      itemContinue: "continue",
> > +       itemDefine:   "define",
> > +       itemElse:     "else",
> > +       itemIf:       "if",
> > +diff --git a/src/text/template/parse/node.go
> b/src/text/template/parse/node.go
> > +index a9dad5e..c398da0 100644
> > +--- a/src/text/template/parse/node.go
> > ++++ b/src/text/template/parse/node.go
> > +@@ -71,6 +71,8 @@ const (
> > +       NodeVariable                   // A $ variable.
> > +       NodeWith                       // A with action.
> > +       NodeComment                    // A comment.
> > ++      NodeBreak                      // A break action.
> > ++      NodeContinue                   // A continue action.
> > + )
> > +
> > + // Nodes.
> > +@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {
> > +       return i.tr.newIf(i.Pos, i.Line, i.Pipe.CopyPipe(),
> i.List.CopyList(), i.ElseList.CopyList())
> > + }
> > +
> > ++// BreakNode represents a {{break}} action.
> > ++type BreakNode struct {
> > ++      tr *Tree
> > ++      NodeType
> > ++      Pos
> > ++      Line int
> > ++}
> > ++
> > ++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {
> > ++      return &BreakNode{tr: t, NodeType: NodeBreak, Pos: pos, Line:
> line}
> > ++}
> > ++
> > ++func (b *BreakNode) Copy() Node                  { return
> b.tr.newBreak(b.Pos, b.Line) }
> > ++func (b *BreakNode) String() string              { return "{{break}}"=
 }
> > ++func (b *BreakNode) tree() *Tree                 { return b.tr }
> > ++func (b *BreakNode) writeTo(sb *strings.Builder) {
> sb.WriteString("{{break}}") }
> > ++
> > ++// ContinueNode represents a {{continue}} action.
> > ++type ContinueNode struct {
> > ++      tr *Tree
> > ++      NodeType
> > ++      Pos
> > ++      Line int
> > ++}
> > ++
> > ++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {
> > ++      return &ContinueNode{tr: t, NodeType: NodeContinue, Pos: pos,
> Line: line}
> > ++}
> > ++
> > ++func (c *ContinueNode) Copy() Node                  { return
> c.tr.newContinue(c.Pos, c.Line) }
> > ++func (c *ContinueNode) String() string              { return
> "{{continue}}" }
> > ++func (c *ContinueNode) tree() *Tree                 { return c.tr }
> > ++func (c *ContinueNode) writeTo(sb *strings.Builder) {
> sb.WriteString("{{continue}}") }
> > ++
> > + // RangeNode represents a {{range}} action and its commands.
> > + type RangeNode struct {
> > +       BranchNode
> > +diff --git a/src/text/template/parse/parse.go
> b/src/text/template/parse/parse.go
> > +index 5e6e512..7f78b56 100644
> > +--- a/src/text/template/parse/parse.go
> > ++++ b/src/text/template/parse/parse.go
> > +@@ -31,6 +31,7 @@ type Tree struct {
> > +       vars       []string // variables defined at the moment.
> > +       treeSet    map[string]*Tree
> > +       actionLine int // line of left delim starting action
> > ++      rangeDepth int
> > +       mode       Mode
> > + }
> > +
> > +@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs
> []map[string]interface{}, lex *lexer, treeSet ma
> > +       t.vars =3D []string{"$"}
> > +       t.funcs =3D funcs
> > +       t.treeSet =3D treeSet
> > ++      lex.breakOK =3D !t.hasFunction("break")
> > ++      lex.continueOK =3D !t.hasFunction("continue")
> > + }
> > +
> > + // stopParse terminates parsing.
> > +@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {
> > +       switch token :=3D t.nextNonSpace(); token.typ {
> > +       case itemBlock:
> > +               return t.blockControl()
> > ++      case itemBreak:
> > ++              return t.breakControl(token.pos, token.line)
> > ++      case itemContinue:
> > ++              return t.continueControl(token.pos, token.line)
> > +       case itemElse:
> > +               return t.elseControl()
> > +       case itemEnd:
> > +@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {
> > +       return t.newAction(token.pos, token.line, t.pipeline("command",
> itemRightDelim))
> > + }
> > +
> > ++// Break:
> > ++//    {{break}}
> > ++// Break keyword is past.
> > ++func (t *Tree) breakControl(pos Pos, line int) Node {
> > ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> > ++              t.unexpected(token, "in {{break}}")
> > ++      }
> > ++      if t.rangeDepth =3D=3D 0 {
> > ++              t.errorf("{{break}} outside {{range}}")
> > ++      }
> > ++      return t.newBreak(pos, line)
> > ++}
> > ++
> > ++// Continue:
> > ++//    {{continue}}
> > ++// Continue keyword is past.
> > ++func (t *Tree) continueControl(pos Pos, line int) Node {
> > ++      if token :=3D t.next(); token.typ !=3D itemRightDelim {
> > ++              t.unexpected(token, "in {{continue}}")
> > ++      }
> > ++      if t.rangeDepth =3D=3D 0 {
> > ++              t.errorf("{{continue}} outside {{range}}")
> > ++      }
> > ++      return t.newContinue(pos, line)
> > ++}
> > ++
> > + // Pipeline:
> > + //    declarations? command ('|' command)*
> > + func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode=
)
> {
> > +@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode,
> context string) {
> > + func (t *Tree) parseControl(allowElseIf bool, context string) (pos
> Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
> > +       defer t.popVars(len(t.vars))
> > +       pipe =3D t.pipeline(context, itemRightDelim)
> > ++      if context =3D=3D "range" {
> > ++              t.rangeDepth++
> > ++      }
> > +       var next Node
> > +       list, next =3D t.itemList()
> > ++      if context =3D=3D "range" {
> > ++              t.rangeDepth--
> > ++      }
> > +       switch next.Type() {
> > +       case nodeEnd: //done
> > +       case nodeElse:
> > +@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {
> > + //    {{range pipeline}} itemList {{else}} itemList {{end}}
> > + // Range keyword is past.
> > + func (t *Tree) rangeControl() Node {
> > +-      return t.newRange(t.parseControl(false, "range"))
> > ++      r :=3D t.newRange(t.parseControl(false, "range"))
> > ++      return r
> > + }
> > +
> > + // With:
> > +diff --git a/src/text/template/parse/parse_test.go
> b/src/text/template/parse/parse_test.go
> > +index 220f984..ba45636 100644
> > +--- a/src/text/template/parse/parse_test.go
> > ++++ b/src/text/template/parse/parse_test.go
> > +@@ -230,6 +230,10 @@ var parseTests =3D []parseTest{
> > +               `{{range $x :=3D .SI}}{{.}}{{end}}`},
> > +       {"range 2 vars", "{{range $x, $y :=3D .SI}}{{.}}{{end}}", noErr=
or,
> > +               `{{range $x, $y :=3D .SI}}{{.}}{{end}}`},
> > ++      {"range with break", "{{range .SI}}{{.}}{{break}}{{end}}",
> noError,
> > ++              `{{range .SI}}{{.}}{{break}}{{end}}`},
> > ++      {"range with continue", "{{range .SI}}{{.}}{{continue}}{{end}}"=
,
> noError,
> > ++              `{{range .SI}}{{.}}{{continue}}{{end}}`},
> > +       {"constants", "{{range .SI 1 -3.2i true false 'a' nil}}{{end}}"=
,
> noError,
> > +               `{{range .SI 1 -3.2i true false 'a' nil}}{{end}}`},
> > +       {"template", "{{template `x`}}", noError,
> > +@@ -279,6 +283,10 @@ var parseTests =3D []parseTest{
> > +       {"adjacent args", "{{printf 3`x`}}", hasError, ""},
> > +       {"adjacent args with .", "{{printf `x`.}}", hasError, ""},
> > +       {"extra end after if", "{{if .X}}a{{else if
> .Y}}b{{end}}{{end}}", hasError, ""},
> > ++      {"break outside range", "{{range .}}{{end}} {{break}}",
> hasError, ""},
> > ++      {"continue outside range", "{{range .}}{{end}} {{continue}}",
> hasError, ""},
> > ++      {"break in range else", "{{range .}}{{else}}{{break}}{{end}}",
> hasError, ""},
> > ++      {"continue in range else", "{{range
> .}}{{else}}{{continue}}{{end}}", hasError, ""},
> > +       // Other kinds of assignments and operators aren't available ye=
t.
> > +       {"bug0a", "{{$x :=3D 0}}{{$x}}", noError, "{{$x :=3D 0}}{{$x}}"=
},
> > +       {"bug0b", "{{$x +=3D 1}}{{$x}}", hasError, ""},
> > +--
> > +2.7.4
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > similarity index 53%
> > rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> > rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > index d5bb33e091..baf400b891 100644
> > --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch
> > @@ -1,7 +1,7 @@
> >  From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:00 2001
> >  From: Roland Shoemaker <bracewell@google.com>
> >  Date: Mon, 20 Mar 2023 11:01:13 -0700
> > -Subject: [PATCH 3/3] html/template: disallow actions in JS template
> literals
> > +Subject: [PATCH 6/6] html/template: disallow actions in JS template
> literals
> >
> >  ECMAScript 6 introduced template literals[0][1] which are delimited wi=
th
> >  backticks. These need to be escaped in a similar fashion to the
> > @@ -52,12 +52,15 @@ CVE: CVE-2023-24538
> >  Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> >  ---
> >   src/html/template/context.go      |  2 ++
> > - src/html/template/error.go        | 13 +++++++++++++
> > - src/html/template/escape.go       | 11 +++++++++++
> > + src/html/template/error.go        | 13 ++++++++
> > + src/html/template/escape.go       | 11 +++++++
> > + src/html/template/escape_test.go  | 66
> ++++++++++++++++++++++-----------------
> >   src/html/template/js.go           |  2 ++
> > - src/html/template/jsctx_string.go |  9 +++++++++
> > - src/html/template/transition.go   |  7 ++++++-
> > - 6 files changed, 43 insertions(+), 1 deletion(-)
> > + src/html/template/js_test.go      |  2 +-
> > + src/html/template/jsctx_string.go |  9 ++++++
> > + src/html/template/state_string.go | 37 ++++++++++++++++++++--
> > + src/html/template/transition.go   |  7 ++++-
> > + 9 files changed, 116 insertions(+), 33 deletions(-)
> >
> >  diff --git a/src/html/template/context.go b/src/html/template/context.=
go
> >  index f7d4849..0b65313 100644
> > @@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644
> >         case stateJSRegexp:
> >                 s =3D append(s, "_html_template_jsregexpescaper")
> >         case stateCSS:
> > +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > +index fa2b84a..1b150e9 100644
> > +--- a/src/html/template/escape_test.go
> > ++++ b/src/html/template/escape_test.go
> > +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
> > +       }
> > +
> > +       for _, test :=3D range tests {
> > +-              tmpl :=3D New(test.name)
> > +-              tmpl =3D Must(tmpl.Parse(test.input))
> > +-              // Check for bug 6459: Tree field was not set in Parse.
> > +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > +-                      t.Errorf("%s: tree not set properly", test.name=
)
> > +-                      continue
> > +-              }
> > +-              b :=3D new(bytes.Buffer)
> > +-              if err :=3D tmpl.Execute(b, data); err !=3D nil {
> > +-                      t.Errorf("%s: template execution failed: %s",
> test.name, err)
> > +-                      continue
> > +-              }
> > +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > +-                      t.Errorf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > +-                      continue
> > +-              }
> > +-              b.Reset()
> > +-              if err :=3D tmpl.Execute(b, pdata); err !=3D nil {
> > +-                      t.Errorf("%s: template execution failed for
> pointer: %s", test.name, err)
> > +-                      continue
> > +-              }
> > +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > +-                      t.Errorf("%s: escaped output for pointer:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > +-                      continue
> > +-              }
> > +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > +-                      t.Errorf("%s: tree mismatch", test.name)
> > +-                      continue
> > +-              }
> > ++              t.Run(test.name, func(t *testing.T) {
> > ++                      tmpl :=3D New(test.name)
> > ++                      tmpl =3D Must(tmpl.Parse(test.input))
> > ++                      // Check for bug 6459: Tree field was not set i=
n
> Parse.
> > ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > ++                              t.Fatalf("%s: tree not set properly",
> test.name)
> > ++                      }
> > ++                      b :=3D new(strings.Builder)
> > ++                      if err :=3D tmpl.Execute(b, data); err !=3D nil=
 {
> > ++                              t.Fatalf("%s: template execution failed=
:
> %s", test.name, err)
> > ++                      }
> > ++                      if w, g :=3D test.output, b.String(); w !=3D g =
{
> > ++                              t.Fatalf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > ++                      }
> > ++                      b.Reset()
> > ++                      if err :=3D tmpl.Execute(b, pdata); err !=3D ni=
l {
> > ++                              t.Fatalf("%s: template execution failed
> for pointer: %s", test.name, err)
> > ++                      }
> > ++                      if w, g :=3D test.output, b.String(); w !=3D g =
{
> > ++                              t.Fatalf("%s: escaped output for
> pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
> > ++                      }
> > ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > ++                              t.Fatalf("%s: tree mismatch", test.name=
)
> > ++                      }
> > ++              })
> > +       }
> > + }
> > +
> > +@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {
> > +                       "{{range .Items}}<a{{if .X}}{{end}}>{{if
> .X}}{{break}}{{end}}{{end}}",
> > +                       "",
> > +               },
> > ++              {
> > ++                      "<script>var a =3D `${a+b}`</script>`",
> > ++                      "",
> > ++              },
> > +               // Error cases.
> > +               {
> > +                       "{{if .Cond}}<a{{end}}",
> > +@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {
> > +                       // html is allowed since it is the last command
> in the pipeline, but urlquery is not.
> > +                       `predefined escaper "urlquery" disallowed in
> template`,
> > +               },
> > ++              {
> > ++                      "<script>var tmpl =3D `asd {{.}}`;</script>",
> > ++                      `{{.}} appears in a JS template literal`,
> > ++              },
> > +       }
> > +       for _, test :=3D range tests {
> > +               buf :=3D new(bytes.Buffer)
> > +@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {
> > +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > +               },
> > +               {
> > ++                      "<a onclick=3D\"`foo",
> > ++                      context{state: stateJSBqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > ++              },
> > ++              {
> > +                       `<A ONCLICK=3D"'`,
> > +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > +               },
> >  diff --git a/src/html/template/js.go b/src/html/template/js.go
> >  index ea9c183..b888eaf 100644
> >  --- a/src/html/template/js.go
> > @@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644
> >         '+':  `\u002b`,
> >         '/':  `\/`,
> >         '<':  `\u003c`,
> > +diff --git a/src/html/template/js_test.go b/src/html/template/js_test.=
go
> > +index d7ee47b..7d963ae 100644
> > +--- a/src/html/template/js_test.go
> > ++++ b/src/html/template/js_test.go
> > +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t
> *testing.T) {
> > +                               `0123456789:;\u003c=3D\u003e?` +
> > +                               `@ABCDEFGHIJKLMNO` +
> > +                               `PQRSTUVWXYZ[\\]^_` +
> > +-                              "`abcdefghijklmno" +
> > ++                              "\\u0060abcdefghijklmno" +
> > +                               "pqrstuvwxyz{|}~\u007f" +
> > +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > +               },
> >  diff --git a/src/html/template/jsctx_string.go
> b/src/html/template/jsctx_string.go
> >  index dd1d87e..2394893 100644
> >  --- a/src/html/template/jsctx_string.go
> > @@ -165,6 +279,55 @@ index dd1d87e..2394893 100644
> >   const _jsCtx_name =3D "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
> >
> >   var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}
> > +diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.go
> > +index 05104be..6fb1a6e 100644
> > +--- a/src/html/template/state_string.go
> > ++++ b/src/html/template/state_string.go
> > +@@ -4,9 +4,42 @@ package template
> > +
> > + import "strconv"
> > +
> > +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> > ++func _() {
> > ++      // An "invalid array index" compiler error signifies that the
> constant values have changed.
> > ++      // Re-run the stringer command to generate them again.
> > ++      var x [1]struct{}
> > ++      _ =3D x[stateText-0]
> > ++      _ =3D x[stateTag-1]
> > ++      _ =3D x[stateAttrName-2]
> > ++      _ =3D x[stateAfterName-3]
> > ++      _ =3D x[stateBeforeValue-4]
> > ++      _ =3D x[stateHTMLCmt-5]
> > ++      _ =3D x[stateRCDATA-6]
> > ++      _ =3D x[stateAttr-7]
> > ++      _ =3D x[stateURL-8]
> > ++      _ =3D x[stateSrcset-9]
> > ++      _ =3D x[stateJS-10]
> > ++      _ =3D x[stateJSDqStr-11]
> > ++      _ =3D x[stateJSSqStr-12]
> > ++      _ =3D x[stateJSBqStr-13]
> > ++      _ =3D x[stateJSRegexp-14]
> > ++      _ =3D x[stateJSBlockCmt-15]
> > ++      _ =3D x[stateJSLineCmt-16]
> > ++      _ =3D x[stateCSS-17]
> > ++      _ =3D x[stateCSSDqStr-18]
> > ++      _ =3D x[stateCSSSqStr-19]
> > ++      _ =3D x[stateCSSDqURL-20]
> > ++      _ =3D x[stateCSSSqURL-21]
> > ++      _ =3D x[stateCSSURL-22]
> > ++      _ =3D x[stateCSSBlockCmt-23]
> > ++      _ =3D x[stateCSSLineCmt-24]
> > ++      _ =3D x[stateError-25]
> > ++      _ =3D x[stateDead-26]
> > ++}
> > ++
> > ++const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstate=
CSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCm=
tstateErrorstateDead"
> > +
> > +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 10=
0,
> 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286=
,
> 296}
> > ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 10=
0,
> 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283=
,
> 298, 308, 317}
> > +
> > + func (i state) String() string {
> > +       if i >=3D state(len(_state_index)-1) {
> >  diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> >  index 06df679..92eb351 100644
> >  --- a/src/html/template/transition.go
> > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > index 20e70c0485..00def8fcda 100644
> > --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
> > @@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> >   src/html/template/context.go      |  6 ++-
> >   src/html/template/escape.go       |  5 +-
> >   src/html/template/escape_test.go  | 10 ++++
> > - src/html/template/state_string.go |  4 +-
> > + src/html/template/state_string.go | 26 +++++-----
> >   src/html/template/transition.go   | 80 ++++++++++++++++++++----------=
-
> > - 5 files changed, 72 insertions(+), 33 deletions(-)
> > + 5 files changed, 84 insertions(+), 43 deletions(-)
> >
> >  diff --git a/src/html/template/context.go b/src/html/template/context.=
go
> >  index 0b65313..4eb7891 100644
> > @@ -105,14 +105,38 @@ diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.
> >  index 05104be..b5cfe70 100644
> >  --- a/src/html/template/state_string.go
> >  +++ b/src/html/template/state_string.go
> > -@@ -4,9 +4,9 @@ package template
> > -
> > - import "strconv"
> > +@@ -25,21 +25,23 @@ func _() {
> > +       _ =3D x[stateJSRegexp-14]
> > +       _ =3D x[stateJSBlockCmt-15]
> > +       _ =3D x[stateJSLineCmt-16]
> > +-      _ =3D x[stateCSS-17]
> > +-      _ =3D x[stateCSSDqStr-18]
> > +-      _ =3D x[stateCSSSqStr-19]
> > +-      _ =3D x[stateCSSDqURL-20]
> > +-      _ =3D x[stateCSSSqURL-21]
> > +-      _ =3D x[stateCSSURL-22]
> > +-      _ =3D x[stateCSSBlockCmt-23]
> > +-      _ =3D x[stateCSSLineCmt-24]
> > +-      _ =3D x[stateError-25]
> > +-      _ =3D x[stateDead-26]
> > ++      _ =3D x[stateJSHTMLOpenCmt-17]
> > ++      _ =3D x[stateJSHTMLCloseCmt-18]
> > ++      _ =3D x[stateCSS-19]
> > ++      _ =3D x[stateCSSDqStr-20]
> > ++      _ =3D x[stateCSSSqStr-21]
> > ++      _ =3D x[stateCSSDqURL-22]
> > ++      _ =3D x[stateCSSSqURL-23]
> > ++      _ =3D x[stateCSSURL-24]
> > ++      _ =3D x[stateCSSBlockCmt-25]
> > ++      _ =3D x[stateCSSLineCmt-26]
> > ++      _ =3D x[stateError-27]
> > ++      _ =3D x[stateDead-28]
> > + }
> >
> > --const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> > +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstate=
CSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCm=
tstateErrorstateDead"
> >  +const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSH=
TMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstat=
eCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
> >
> > --var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 10=
0,
> 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286=
,
> 296}
> > +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 10=
0,
> 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283=
,
> 298, 308, 317}
> >  +var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 10=
0,
> 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293=
,
> 304, 320, 335, 345, 354}
> >
> >   func (i state) String() string {
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188415):
> https://lists.openembedded.org/g/openembedded-core/message/188415
> > Mute This Topic: https://lists.openembedded.org/mt/101664679/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000006c1a850606956099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies Steve,<div><br></div><div>I will look into the i=
ssue and send a new patch for Dunfell. It worked for me on my machine. Mayb=
e something I missed.</div><div><br></div><div>Thanks,</div><div>Shubham Ku=
lkarni</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sat, Sep 30, 2023 at 8:02=E2=80=AFAM Steve Sakoman &lt;<a hr=
ef=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Sorry, this patch doesn&#3=
9;t apply:<br>
<br>
Applying: go: Update fix for CVE-2023-24538 &amp; CVE-2023-39318<br>
error: corrupt patch at line 478<br>
error: could not build fake ancestor<br>
Patch failed at 0001 go: Update fix for CVE-2023-24538 &amp; CVE-2023-39318=
<br>
<br>
Steve<br>
<br>
On Fri, Sep 29, 2023 at 9:21=E2=80=AFAM Shubham Kulkarni via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;skulkarni=3D<a href=3D"mailto:mvista.com=
@lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.or=
g</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com" tar=
get=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Add missing files in fix for CVE-2023-24538 &amp; CVE-2023-39318<br>
&gt;<br>
&gt; Upstream Link -<br>
&gt; CVE-2023-24538: <a href=3D"https://github.com/golang/go/commit/b1e3ecf=
a06b67014429a197ec5e134ce4303ad9b" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b</=
a><br>
&gt; CVE-2023-39318: <a href=3D"https://github.com/golang/go/commit/023b542=
edf38e2a1f87fcefb9f75ff2f99401b4c" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c</=
a><br>
&gt;<br>
&gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista=
.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 447 ++++++++++++-<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 393 ++++++++++++<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 497 +++++++++++++++<br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-24538_5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 585 ++++++++++++++++++<br>
&gt;=C2=A0 ...3-24538-3.patch =3D&gt; CVE-2023-24538_6.patch} | 175 +++++-<=
br>
&gt;=C2=A0 .../go/go-1.14/CVE-2023-39318.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 38 +-<br>
&gt;=C2=A0 8 files changed, 2124 insertions(+), 20 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-245=
38_3.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-245=
38_4.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-245=
38_5.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch =
=3D&gt; CVE-2023-24538_6.patch} (53%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devto=
ols/go/go-1.14.inc<br>
&gt; index be63f64825..091b778de8 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; @@ -60,7 +60,10 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24534.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24538-1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24538-2.patch \<br>
&gt; -=C2=A0 =C2=A0 file://CVE-2023-24538-3.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_3.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_4.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_5.patch \<br>
&gt; +=C2=A0 =C2=A0 file://CVE-2023-24538_6.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24539.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24540.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-29405-1.patch \<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; index eda26e5ff6..23c5075e41 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Brad Fitzpatrick &lt;<a href=3D"mailto:bradfitz@golang.org=
" target=3D"_blank">bradfitz@golang.org</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Aug 2021 14:55:51 -0700<br>
&gt; -Subject: [PATCH 1/3] net/netip: add new IP address package<br>
&gt; +Subject: [PATCH 1/6] net/netip: add new IP address package<br>
&gt;<br>
&gt;=C2=A0 Co-authored-by: Alex Willmer &lt;<a href=3D"mailto:alex@moreati.=
org.uk" target=3D"_blank">alex@moreati.org.uk</a>&gt; (GitHub @moreati)<br>
&gt;=C2=A0 Co-authored-by: Alexander Yastrebov &lt;<a href=3D"mailto:yastre=
bov.alex@gmail.com" target=3D"_blank">yastrebov.alex@gmail.com</a>&gt;<br>
&gt; @@ -31,7 +31,7 @@ Trust: Brad Fitzpatrick &lt;<a href=3D"mailto:bradfi=
tz@golang.org" target=3D"_blank">bradfitz@golang.org</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 Dependency Patch #1<br>
&gt;<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/golang/go/co=
mmit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b7=
4eb6aaa3d0</a>]<br>
&gt; +Upstream-Status: Backport from <a href=3D"https://github.com/golang/g=
o/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45=
e1b74eb6aaa3d0</a><br>
&gt;=C2=A0 CVE: CVE-2023-24538<br>
&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@=
mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; index 5036f2890b..3840617a32 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: empijei &lt;<a href=3D"mailto:robclap8@gmail.com" target=
=3D"_blank">robclap8@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 27 Mar 2020 19:27:55 +0100<br>
&gt; -Subject: [PATCH 2/3] html/template,text/template: switch to Unicode e=
scapes<br>
&gt; +Subject: [PATCH 2/6] html/template,text/template: switch to Unicode e=
scapes<br>
&gt;=C2=A0 =C2=A0for JSON compatibility<br>
&gt;=C2=A0 MIME-Version: 1.0<br>
&gt;=C2=A0 Content-Type: text/plain; charset=3DUTF-8<br>
&gt; @@ -31,10 +31,238 @@ Upstream-Status: Backport from <a href=3D"https:/=
/github.com/golang/go/commit/d4d298040d072" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/golang/go/commit/d4d298040d072</a><br>
&gt;=C2=A0 CVE: CVE-2023-24538<br>
&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@=
mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - src/html/template/js.go=C2=A0 =C2=A0 | 70 ++++++++++++++++++++++++++=
+-------------------<br>
&gt; - src/text/template/funcs.go |=C2=A0 8 +++---<br>
&gt; - 2 files changed, 46 insertions(+), 32 deletions(-)<br>
&gt; + src/html/template/content_test.go=C2=A0 | 70 +++++++++++++++++++----=
---------------<br>
&gt; + src/html/template/escape_test.go=C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt; + src/html/template/example_test.go=C2=A0 |=C2=A0 6 ++--<br>
&gt; + src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7=
0 +++++++++++++++++++++++---------------<br>
&gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 68 ++++++++=
++++++++++------------------<br>
&gt; + src/html/template/template_test.go | 39 +++++++++++++++++++++<br>
&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt; + src/text/template/funcs.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
8 ++---<br>
&gt; + 8 files changed, 163 insertions(+), 110 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/html/template/content_test.go b/src/html/template/co=
ntent_test.go<br>
&gt; +index 72d56f5..bd86527 100644<br>
&gt; +--- a/src/html/template/content_test.go<br>
&gt; ++++ b/src/html/template/content_test.go<br>
&gt; +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTML(`Hello, &=
lt;b&gt;World&lt;/b&gt; &amp;amp;tc!`),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTMLAttr(` dir=
=3D&quot;ltr&quot;`),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JS(`c &amp;&am=
p; alert(&quot;Hello, World!&quot;);`),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr(`Hello, World=
 &amp; O&#39;Reilly\x21`),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr(`Hello, World=
 &amp; O&#39;Reilly\u0021`),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0URL(`greeting=
=3DH%69,&amp;addressee=3D(World)`),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Srcset(`greeti=
ng=3DH%69,&amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/favico=
n.ico" rel=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico<=
/a> 500.5w`),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0URL(`,foo/,`),=
<br>
&gt; +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;World&lt;/b&gt; =
&amp;amp;tc!`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#34;`,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert(&amp;=
#34;Hello, World!&amp;#34;);`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\x21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\u0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World)`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noreferr=
er" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello,&amp;#32;World&amp;#32;&am=
p;amp;tc!`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#32;dir&amp;#61;&amp;#34;lt=
r&amp;#34;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c&amp;#32;&amp;amp;&amp;amp;&amp=
;#32;alert(&amp;#34;Hello,&amp;#32;World!&amp;#34;);`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&amp;#32;&amp;a=
mp;&amp;#32;O&amp;#39;Reilly\x21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&amp;#32;&amp;a=
mp;&amp;#32;O&amp;#39;Reilly\u0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H%69,&amp;amp;a=
ddressee&amp;#61;(World)`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H%69,&amp;amp;a=
ddressee&amp;#61;(World)&amp;#32;2x,&amp;#32;<a href=3D"https://golang.org/=
favicon.ico&amp;#32;500.5w" rel=3D"noreferrer" target=3D"_blank">https://go=
lang.org/favicon.ico&amp;#32;500.5w`</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, World &amp;amp;tc!`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#34;`,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert(&amp;=
#34;Hello, World!&amp;#34;);`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\x21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\u0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World)`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noreferr=
er" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &amp;lt;b&amp;gt;World&am=
p;lt;/b&amp;gt; &amp;amp;tc!`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#34;`,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert(&amp;=
#34;Hello, World!&amp;#34;);`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\x21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\u0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World)`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noreferr=
er" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert(&quot;Hello, =
World!&quot;);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;Reil=
ly\x21&quot;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;Reil=
ly\u0021&quot;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u0026addr=
essee=3D(World)&quot;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u0026addr=
essee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noref=
errer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w&quot;`,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;`,<br>
&gt; +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not JS escaped but HTML escape=
d.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert(&amp;=
#34;Hello, World!&amp;#34;);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World &amp;amp; O&a=
mp;#39;Reilly\x21&amp;#34;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World &amp;amp; O&a=
mp;#39;Reilly\u0021&amp;#34;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=3DH%69,\u0026a=
ddressee=3D(World)&amp;#34;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=3DH%69,\u0026a=
ddressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w&amp;#=
34;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;,foo/,&amp;#34;`,<br>
&gt; +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`&lt;script&gt;alert(&quot;{{.}}&quot;)&lt;/script&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0[]string{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reilly =
\x26bar;`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"http=
://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22]#f=
oo`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x=
26amp;tc!`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, World!\=
x22);`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O\u0=
027Reilly \u0026bar;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D"ht=
tp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u002=
2]#foo`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\/b\=
u003e \u0026amp;tc!`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello, W=
orld!\u0022);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x21`,=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld)`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" target=
=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reilly\u=
0021`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World)`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`&lt;script type=3D&quot;text/javascript&quot;&gt;alert(&quot=
;{{.}}&quot;)&lt;/script&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0[]string{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reilly =
\x26bar;`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"http=
://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22]#f=
oo`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x=
26amp;tc!`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, World!\=
x22);`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O\u0=
027Reilly \u0026bar;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D"ht=
tp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u002=
2]#foo`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\/b\=
u003e \u0026amp;tc!`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello, W=
orld!\u0022);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x21`,=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld)`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" target=
=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reilly\u=
0021`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World)`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert(&quot;Hello, =
World!&quot;);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;Reil=
ly\x21&quot;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;Reil=
ly\u0021&quot;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u0026addr=
essee=3D(World)&quot;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u0026addr=
essee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noref=
errer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w&quot;`,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;`,<br>
&gt; +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;World&lt;/b&gt; =
&amp;amp;tc!`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#34;`,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert(&amp;=
#34;Hello, World!&amp;#34;);`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\x21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39;Re=
illy\u0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World)`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"noreferr=
er" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(&quot;{{.}}&quot;)&#39;&gt;`=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0[]string{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reilly =
\x26bar;`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"http=
://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22]#f=
oo`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e \x=
26amp;tc!`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, World!\=
x22);`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O\u0=
027Reilly \u0026bar;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D"ht=
tp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u002=
2]#foo`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\/b\=
u003e \u0026amp;tc!`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello, W=
orld!\u0022);`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over-escap=
ed.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x21`,=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld)`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D(Wo=
rld) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" target=
=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reilly\u=
0021`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World)`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=3D(=
World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targe=
t=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3eWorld%3c%2fb%3=
e%20%26amp%3btc%21`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert%28%22Hello%2c=
%20World%21%22%29%3b`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Reilly=
%5cx21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Reilly=
%5cu0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and parens are escaped =
but %69 is not over-escaped. HTML escaping is done.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;address=
ee=3D%28World%29`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%2c%26addressee=
%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgolang.org" rel=3D=
"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico%20500.5w`,<br=
>
&gt; +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3eWorld%3c%2fb%3=
e%20%26amp%3btc%21`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert%28%22Hello%2c=
%20World%21%22%29%3b`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Reilly=
%5cx21`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Reilly=
%5cu0021`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and parens are escaped =
but %69 is not over-escaped. HTML escaping is not done.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;addressee=
=3D%28World%29`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%2c%26addressee=
%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgolang.org" rel=3D=
"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico%20500.5w`,<br=
>
&gt; +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go<br>
&gt; +index e72a9ba..c709660 100644<br>
&gt; +--- a/src/html/template/escape_test.go<br>
&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;jsStr&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;&lt;button onclick=3D&#39;alert(&amp;quot;{{.H}}&amp;qu=
ot;)&#39;&gt;&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\x3cHello\x3e&amp;quo=
t;)&#39;&gt;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\u003cHello\u003e&amp=
;quot;)&#39;&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;badMarshaler&quot;,<br>
&gt; +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;jsRe&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(/{{&quot;foo+bar&quot;}}/.te=
st(&quot;&quot;))&#39;&gt;`,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\x2bbar/.test(&quot;&quot;)=
)&#39;&gt;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\u002bbar/.test(&quot;&quot=
;))&#39;&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;jsReBlank&quot;,<br>
&gt; +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;main&quot;:=C2=A0 =C2=A0`&l=
t;button onclick=3D&quot;title=3D&#39;{{template &quot;helper&quot;}}&#39;;=
 ...&quot;&gt;{{template &quot;helper&quot;}}&lt;/button&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;helper&quot;: `{{11}} of {{=
&quot;&lt;100&gt;&quot;}}`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \x3c100\x3e&#39;;=
 ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \u003c100\u003e&#=
39;; ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A non-recur=
sive template that ends in a different context.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// helper star=
ts in jsCtxRegexp and ends in jsCtxDivOp.<br>
&gt; +diff --git a/src/html/template/example_test.go b/src/html/template/ex=
ample_test.go<br>
&gt; +index 9d965f1..6cf936f 100644<br>
&gt; +--- a/src/html/template/example_test.go<br>
&gt; ++++ b/src/html/template/example_test.go<br>
&gt; +@@ -116,9 +116,9 @@ func Example_escape() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&amp;#39=
;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.com" target=3D"=
_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&amp;#39=
;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.com" target=3D"=
_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&amp;#39=
;s Diner&amp;#<a href=3D"mailto:34%3B32%26lt%3Btasty@example.com" target=3D=
"_blank">34;32&amp;lt;tasty@example.com</a>&amp;gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&quot;=
 \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@exampl=
e.com</a>\x3E<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&quot;=
 \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@exampl=
e.com</a>\x3E<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&quot;=
32\<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@examp=
le.com</a>\x3E<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner\&quo=
t; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003Ctasty@=
example.com</a>\u003E<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner\&quo=
t; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003Ctasty@=
example.com</a>\u003E<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner\&quo=
t;32\<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003Ctasty=
@example.com</a>\u003E<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// %22Fran+%26+Freddie%27s+Diner%2232%3Cta=
sty%<a href=3D"http://40example.com" rel=3D"noreferrer" target=3D"_blank">4=
0example.com</a>%3E<br>
&gt; +<br>
&gt; + }<br>
&gt;=C2=A0 diff --git a/src/html/template/js.go b/src/html/template/js.go<b=
r>
&gt;=C2=A0 index 0e91458..ea9c183 100644<br>
&gt;=C2=A0 --- a/src/html/template/js.go<br>
&gt; @@ -173,6 +401,217 @@ index 0e91458..ea9c183 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;?&#39;:=C2=A0 `\?`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;[&#39;:=C2=A0 `\[`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\\&#39;: `\\`,<br>
&gt; +diff --git a/src/html/template/js_test.go b/src/html/template/js_test=
.go<br>
&gt; +index 075adaa..d7ee47b 100644<br>
&gt; +--- a/src/html/template/js_test.go<br>
&gt; ++++ b/src/html/template/js_test.go<br>
&gt; +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo&quo=
t;, `&quot;foo&quot;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Newlines.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r\n\u2=
028\u2029&quot;, `&quot;\r\n\u2028\u2029&quot;`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6 so use &quot;\x0b&quot; instead.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6 so use &quot;\u000b&quot; instead.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t\x0b&=
quot;, `&quot;\t\u000b&quot;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{struct{ X, Y =
int }{1, 2}, `{&quot;X&quot;:1,&quot;Y&quot;:2}`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{[]interface{}=
{}, &quot;[]&quot;},<br>
&gt; +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;&quot;,=
 ``},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo&quo=
t;, `foo`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&quot;=
, `\0`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&quot;=
, `\u0000`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t&quot=
;, `\t`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\n&quot=
;, `\n`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r&quot=
;, `\r`},<br>
&gt; +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\\n&quo=
t;, `\\n`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\r\n=
bar&quot;, `foo\r\nbar`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preserve at=
tribute boundaries.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\x22`},=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\x27`},<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\u0022`=
},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\u0027`}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Allow embed=
ding in HTML without further escaping.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, `\x26=
amp;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, `\u00=
26amp;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Prevent bre=
aking out of text node and element boundaries.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/script&=
gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![CDATA[=
&quot;, `\x3c![CDATA[`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&quot;=
, `]]\x3e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/script&=
gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![CDATA[=
&quot;, `\u003c![CDATA[`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&quot;=
, `]]\u003e`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// <a href=3D"=
https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span" rel=3D=
"noreferrer" target=3D"_blank">https://dev.w3.org/html5/markup/aria/syntax.=
html#escaping-text-span</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=
=A0&quot;The text in style, script, title, and textarea elements<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=
=A0must not have an escaping text span start that is not<br>
&gt; +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// allow regul=
ar text content to be interpreted as script<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// allowing sc=
ript execution via a combination of a JS string<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// injection f=
ollowed by an HTML text injection.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--&quot=
;, `\x3c!--`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&quot;=
, `--\x3e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--&quot=
;, `\u003c!--`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&quot;=
, `--\u003e`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// From <a hre=
f=3D"https://code.google.com/p/doctype/wiki/ArticleUtf7" rel=3D"noreferrer"=
 target=3D"_blank">https://code.google.com/p/doctype/wiki/ArticleUtf7</a><b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;+ADw-sc=
ript+AD4-alert(1)+ADw-/script+AD4-&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD4-`=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Invalid UTF=
-8 sequence<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\xA0=
bar&quot;, &quot;foo\xA0bar&quot;},<br>
&gt; +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;&quot;,=
 `(?:)`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo&quo=
t;, `foo`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&quot;=
, `\0`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&quot;=
, `\u0000`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t&quot=
;, `\t`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\n&quot=
;, `\n`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r&quot=
;, `\r`},<br>
&gt; +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\\n&quo=
t;, `\\n`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;foo\r\n=
bar&quot;, `foo\r\nbar`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preserve at=
tribute boundaries.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\x22`},=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\x27`},<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\u0022`=
},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\u0027`}=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Allow embed=
ding in HTML without further escaping.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, `\x26=
amp;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, `\u00=
26amp;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Prevent bre=
aking out of text node and element boundaries.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/script&=
gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![CDATA[=
&quot;, `\x3c!\[CDATA\[`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&quot;=
, `\]\]\x3e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/script&=
gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![CDATA[=
&quot;, `\u003c!\[CDATA\[`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&quot;=
, `\]\]\u003e`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escaping te=
xt spans.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--&quot=
;, `\x3c!\-\-`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&quot;=
, `\-\-\x3e`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--&quot=
;, `\u003c!\-\-`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&quot;=
, `\-\-\u003e`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;*&quot;=
, `\*`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;+&quot;, `\x=
2b`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;+&quot;, `\u=
002b`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;?&quot;=
, `\?`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;[](){}&=
quot;, `\[\]\(\)\{\}`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;$foo|x.=
y&quot;, `\$foo\|x\.y`},<br>
&gt; +@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelectHighCodepoint=
s(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;jsStrEscaper&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0jsStrEscaper,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\\f\\r\x0E\x0F&=
quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13\x14\x15\x16\x=
17&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b\x1c\x1d\x1e\x=
1f&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#$%\x26\x27()*\x2b,-.\/` +<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x3e?` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\u000e\u000f` +=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0013\u0014\u001=
5\u0016\u0017` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u001b\u001c\u001=
d\u001e\u001f` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#$%\u0026\u0027()*\u002b,-.=
\/` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D\u003e?` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijklmno&quot; +<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\x7f&quot; +<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\u007f&quot; +<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\\u2028\\u2029\=
ufeff\U0001D11E&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;jsRegexpEscaper&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0jsRegexpEscaper,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\\f\\r\x0E\x0F&=
quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13\x14\x15\x16\x=
17&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b\x1c\x1d\x1e\x=
1f&quot; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/=
` +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x3e\?` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\u000e\u000f` +=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0013\u0014\u001=
5\u0016\u0017` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u001b\u001c\u001=
d\u001e\u001f` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#\$%\u0026\u0027\(\)\*\u002=
b,\-\.\/` +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D\u003e\?` +<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ\[\\\]\^_` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijklmno&quot; +<br=
>
&gt; +diff --git a/src/html/template/template_test.go b/src/html/template/t=
emplate_test.go<br>
&gt; +index 13e6ba4..86bd4db 100644<br>
&gt; +--- a/src/html/template/template_test.go<br>
&gt; ++++ b/src/html/template/template_test.go<br>
&gt; +@@ -6,6 +6,7 @@ package template_test<br>
&gt; +<br>
&gt; + import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;encoding/json&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. &quot;html/template&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;testing&quot;<br>
&gt; +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c.mustExecute(c.root, nil, &quot;12.34 7.5=
&quot;)<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *t=
esting.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // See #33671 and #37634 for more context on th=
is.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tests :=3D []struct{ name, in string }{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;empty&quot;,=
 &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;invalid&quot=
;, string(rune(-1))},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;null&quot;, =
&quot;\u0000&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;unit separat=
or&quot;, &quot;\u001F&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;tab&quot;, &=
quot;\t&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;gt and lt&qu=
ot;, &quot;&lt;&gt;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;quotes&quot;=
, `&#39;&quot;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;ASCII letter=
s&quot;, &quot;ASCII letters&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Unicode&quot=
;, &quot;=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Pizza&quot;,=
 &quot;=F0=9F=8D=95&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D `&lt;scr=
ipt type=3D&quot;application/ld+json&quot;&gt;`<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D `&lt;/sc=
ript&gt;`<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 templ=C2=A0 =3D pre=
fix + `&quot;{{.}}&quot;` + suffix<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tpl :=3D Must(New(&quot;JS string is JSON strin=
g&quot;).Parse(templ))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, tt :=3D range tests {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(<a href=3D"ht=
tp://tt.name" rel=3D"noreferrer" target=3D"_blank">tt.name</a>, func(t *tes=
ting.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 var buf bytes.Buffer<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err :=3D tpl.Execute(&amp;buf, <a href=3D"http://tt.in" rel=
=3D"noreferrer" target=3D"_blank">tt.in</a>); err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot render templat=
e: %v&quot;, err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 trimmed :=3D bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), []by=
te(prefix)), []byte(suffix))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 var got string<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err :=3D json.Unmarshal(trimmed, &amp;got); err !=3D nil {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot parse JS strin=
g %q as JSON: %v&quot;, trimmed[1:len(trimmed)-1], err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if got !=3D <a href=3D"http://tt.in" rel=3D"noreferrer" target=
=3D"_blank">tt.in</a> {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Serialization changed=
 the string value: got %q want %q&quot;, got, <a href=3D"http://tt.in" rel=
=3D"noreferrer" target=3D"_blank">tt.in</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + type testCase struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t=C2=A0 =C2=A0 *testing.T<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0root *Template<br>
&gt; +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go<br>
&gt; +index 77294ed..b8a809e 100644<br>
&gt; +--- a/src/text/template/exec_test.go<br>
&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{`Go &quot;jum=
p&quot; \`, `Go \&quot;jump\&quot; \\`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{`Yukihiro say=
s &quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C&quot;`, `Yukihiro say=
s \&quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C\&quot;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unprint=
able \uFDFF&quot;, `unprintable \uFDFF`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt;html&gt;`, `\=
x3Chtml\x3E`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =3D in attribu=
tes`, `no \x3D in attributes`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;#x27; does n=
ot become HTML entity`, `\x26#x27; does not become HTML entity`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt;html&gt;`, `\=
u003Chtml\u003E`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =3D in attribu=
tes`, `no \u003D in attributes`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;#x27; does n=
ot become HTML entity`, `\u0026#x27; does not become HTML entity`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, tc :=3D range testCases {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s :=3D JSEscap=
eString(<a href=3D"http://tc.in" rel=3D"noreferrer" target=3D"_blank">tc.in=
</a>)<br>
&gt;=C2=A0 diff --git a/src/text/template/funcs.go b/src/text/template/func=
s.go<br>
&gt;=C2=A0 index 46125bc..f3de9fb 100644<br>
&gt;=C2=A0 --- a/src/text/template/funcs.go<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cd7dd0957c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch<br>
&gt; @@ -0,0 +1,393 @@<br>
&gt; +From 7ddce23c7d5b728acf8482f5006497c7b9915f8a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ariel Mashraki &lt;<a href=3D"mailto:ariel@mashraki.co.il" targ=
et=3D"_blank">ariel@mashraki.co.il</a>&gt;<br>
&gt; +Date: Wed, 22 Apr 2020 22:17:56 +0300<br>
&gt; +Subject: [PATCH 3/6] text/template: add CommentNode to template parse=
 tree<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +Fixes #34652<br>
&gt; +<br>
&gt; +Change-Id: Icf6e3eda593fed826736f34f95a9d66f5450cc98<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/229=
398" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/229398</a><br>
&gt; +Reviewed-by: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mvdan@mvdan.cc" =
target=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; +Run-TryBot: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mvdan@mvdan.cc" t=
arget=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; +TryBot-Result: Gobot Gobot &lt;<a href=3D"mailto:gobot@golang.org" ta=
rget=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Dependency Patch #3<br>
&gt; +<br>
&gt; +Upstream-Status: Backport from <a href=3D"https://github.com/golang/g=
o/commit/c8ea03828b0645b1fd5725888e44873b75fcfbb6" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/golang/go/commit/c8ea03828b0645b1fd5725888e=
44873b75fcfbb6</a><br>
&gt; +CVE: CVE-2023-24538<br>
&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvist=
a.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + api/next.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 ++<br>
&gt; + src/html/template/template_test.go=C2=A0 =C2=A0 | 16 +++++++++++++++=
+<br>
&gt; + src/text/template/exec.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 =
+++++++-<br>
&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=A0 7 +++++--<br=
>
&gt; + src/text/template/parse/node.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++=
++++++++++++++++++++++++++++<br>
&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 | 22 ++++++++++=
+++++++++---<br>
&gt; + src/text/template/parse/parse_test.go | 25 +++++++++++++++++++++++++=
<br>
&gt; + 9 files changed, 127 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/api/next.txt b/api/next.txt<br>
&gt; +index e69de29..076f39e 100644<br>
&gt; +--- a/api/next.txt<br>
&gt; ++++ b/api/next.txt<br>
&gt; +@@ -0,0 +1,19 @@<br>
&gt; ++pkg unicode, const Version =3D &quot;13.0.0&quot;<br>
&gt; ++pkg unicode, var Chorasmian *RangeTable<br>
&gt; ++pkg unicode, var Dives_Akuru *RangeTable<br>
&gt; ++pkg unicode, var Khitan_Small_Script *RangeTable<br>
&gt; ++pkg unicode, var Yezidi *RangeTable<br>
&gt; ++pkg text/template/parse, const NodeComment =3D 20<br>
&gt; ++pkg text/template/parse, const NodeComment NodeType<br>
&gt; ++pkg text/template/parse, const ParseComments =3D 1<br>
&gt; ++pkg text/template/parse, const ParseComments Mode<br>
&gt; ++pkg text/template/parse, method (*CommentNode) Copy() Node<br>
&gt; ++pkg text/template/parse, method (*CommentNode) String() string<br>
&gt; ++pkg text/template/parse, method (CommentNode) Position() Pos<br>
&gt; ++pkg text/template/parse, method (CommentNode) Type() NodeType<br>
&gt; ++pkg text/template/parse, type CommentNode struct<br>
&gt; ++pkg text/template/parse, type CommentNode struct, Text string<br>
&gt; ++pkg text/template/parse, type CommentNode struct, embedded NodeType<=
br>
&gt; ++pkg text/template/parse, type CommentNode struct, embedded Pos<br>
&gt; ++pkg text/template/parse, type Mode uint<br>
&gt; ++pkg text/template/parse, type Tree struct, Mode Mode<br>
&gt; +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o<br>
&gt; +index f12dafa..8739735 100644<br>
&gt; +--- a/src/html/template/escape.go<br>
&gt; ++++ b/src/html/template/escape.go<br>
&gt; +@@ -124,6 +124,8 @@ func (e *escaper) escape(c context, n parse.Node)=
 context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ActionNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return e.escap=
eAction(c, n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.CommentNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return c<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return e.escap=
eBranch(c, &amp;n.BranchNode, &quot;if&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; +diff --git a/src/html/template/template_test.go b/src/html/template/t=
emplate_test.go<br>
&gt; +index 86bd4db..1f2c888 100644<br>
&gt; +--- a/src/html/template/template_test.go<br>
&gt; ++++ b/src/html/template/template_test.go<br>
&gt; +@@ -10,6 +10,7 @@ import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. &quot;html/template&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;testing&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;text/template/parse&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; + func TestTemplateClone(t *testing.T) {<br>
&gt; +@@ -160,6 +161,21 @@ func TestStringsInScriptsWithJsonContentTypeAreC=
orrectlyEscaped(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func TestSkipEscapeComments(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 c :=3D newTestCase(t)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tr :=3D parse.New(&quot;root&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tr.Mode =3D parse.ParseComments<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 newT, err :=3D tr.Parse(&quot;{{/* A comment */=
}}{{ 1 }}{{/* Another comment */}}&quot;, &quot;&quot;, &quot;&quot;, make(=
map[string]*parse.Tree))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cann=
ot parse template text: %v&quot;, err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 c.root, err =3D c.root.AddParseTree(&quot;root&=
quot;, newT)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cann=
ot add parse tree to template: %v&quot;, err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 c.mustExecute(c.root, nil, &quot;1&quot;)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + type testCase struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t=C2=A0 =C2=A0 *testing.T<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0root *Template<br>
&gt; +diff --git a/src/text/template/exec.go b/src/text/template/exec.go<br=
>
&gt; +index ac3e741..7ac5175 100644<br>
&gt; +--- a/src/text/template/exec.go<br>
&gt; ++++ b/src/text/template/exec.go<br>
&gt; +@@ -256,6 +256,7 @@ func (s *state) walk(dot reflect.Value, node pars=
e.Node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(node.Pi=
pe.Decl) =3D=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s.printValue(node, val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.CommentNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.walkIfOrWith=
(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go<br>
&gt; +index 30371f2..e41373a 100644<br>
&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; +@@ -41,6 +41,7 @@ const (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// boolean constant=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemChar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// printable ASCII =
character; grab bag for comma etc.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemCharConstant=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// character constant<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemComment=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // comment text<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemComplex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // complex constant (1+2i); i=
maginary is just a number<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemAssign=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// equals (&#39;=3D&#39=
;) introducing an assignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDeclare=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // colon-equals (&#39;:=3D&#3=
9;) introducing a declaration<br>
&gt; +@@ -112,6 +113,7 @@ type lexer struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0leftDelim=C2=A0 =C2=A0 =C2=A0 string=C2=A0=
 =C2=A0 // start of action<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rightDelim=C2=A0 =C2=A0 =C2=A0string=C2=A0=
 =C2=A0 // end of action<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0trimRightDelim string=C2=A0 =C2=A0 // end =
of action with trim marker<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=
=A0 // emit itemComment tokens.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Pos=C2=A0 =C2=A0 =C2=A0 =C2=A0// current position in the input<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Po=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0// start position of this item<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0width=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Po=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0// width of last rune read from input<br>
&gt; +@@ -203,7 +205,7 @@ func (l *lexer) drain() {<br>
&gt; + }<br>
&gt; +<br>
&gt; + // lex creates a new scanner for the input string.<br>
&gt; +-func lex(name, input, left, right string) *lexer {<br>
&gt; ++func lex(name, input, left, right string, emitComment bool) *lexer {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if left =3D=3D &quot;&quot; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0left =3D leftD=
elim<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -216,6 +218,7 @@ func lex(name, input, left, right string) *lexer =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0leftDelim:=C2=
=A0 =C2=A0 =C2=A0 left,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rightDelim:=C2=
=A0 =C2=A0 =C2=A0right,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trimRightDelim=
: rightTrimMarker + right,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitComment:=C2=A0 =
=C2=A0 emitComment,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make(chan item),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0line:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0startLine:=C2=
=A0 =C2=A0 =C2=A0 1,<br>
&gt; +@@ -323,6 +326,9 @@ func lexComment(l *lexer) stateFn {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if !delim {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return l.error=
f(&quot;comment ends before closing delimiter&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if l.emitComment {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emit(itemComment)=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos +=3D tri=
mMarkerLen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go<br>
&gt; +index 563c4fc..f6d5f28 100644<br>
&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; +@@ -15,6 +15,7 @@ var itemName =3D map[itemType]string{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBool:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;bool&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemChar:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;char&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemCharConstant: &quot;charconst&quot;,<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemComment:=C2=A0 =C2=A0 =C2=A0 &quot;comment&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemComplex:=C2=A0 =C2=A0 =C2=A0 &quot;com=
plex&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDeclare:=C2=A0 =C2=A0 =C2=A0 &quot;:=
=3D&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemEOF:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;EOF&quot;,<br>
&gt; +@@ -90,6 +91,7 @@ var lexTests =3D []lexTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;text&quot;, `now is the time`, []it=
em{mkItem(itemText, &quot;now is the time&quot;), tEOF}},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;text with comment&quot;, &quot;hell=
o-{{/* this is a comment */}}-world&quot;, []item{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemTex=
t, &quot;hello-&quot;),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkItem(itemComment,=
 &quot;/* this is a comment */&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemTex=
t, &quot;-world&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tEOF,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; +@@ -311,6 +313,7 @@ var lexTests =3D []lexTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;trimming spaces before and after co=
mment&quot;, &quot;hello- {{- /* hello */ -}} -world&quot;, []item{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemTex=
t, &quot;hello-&quot;),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkItem(itemComment,=
 &quot;/* hello */&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemTex=
t, &quot;-world&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tEOF,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; +@@ -389,7 +392,7 @@ var lexTests =3D []lexTest{<br>
&gt; +<br>
&gt; + // collect gathers the emitted items into a slice.<br>
&gt; + func collect(t *lexTest, left, right string) (items []item) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 l :=3D lex(<a href=3D"http://t.name" rel=3D"nor=
eferrer" target=3D"_blank">t.name</a>, t.input, left, right)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 l :=3D lex(<a href=3D"http://t.name" rel=3D"nor=
eferrer" target=3D"_blank">t.name</a>, t.input, left, right, true)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item :=3D l.ne=
xtItem()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items =3D appe=
nd(items, item)<br>
&gt; +@@ -529,7 +532,7 @@ func TestPos(t *testing.T) {<br>
&gt; + func TestShutdown(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// We need to duplicate template.Parse her=
e to hold on to the lexer.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const text =3D &quot;erroneous{{define}}{{=
else}}1234&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 lexer :=3D lex(&quot;foo&quot;, text, &quot;{{&=
quot;, &quot;}}&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 lexer :=3D lex(&quot;foo&quot;, text, &quot;{{&=
quot;, &quot;}}&quot;, false)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_, err :=3D New(&quot;root&quot;).parseLex=
er(lexer)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot=
;expected error&quot;)<br>
&gt; +diff --git a/src/text/template/parse/node.go b/src/text/template/pars=
e/node.go<br>
&gt; +index 1c116ea..a9dad5e 100644<br>
&gt; +--- a/src/text/template/parse/node.go<br>
&gt; ++++ b/src/text/template/parse/node.go<br>
&gt; +@@ -70,6 +70,7 @@ const (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeTemplate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A template invocation action.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeVariable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A $ variable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeWith=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A with action.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeComment=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A comment.<br>
&gt; + )<br>
&gt; +<br>
&gt; + // Nodes.<br>
&gt; +@@ -149,6 +150,38 @@ func (t *TextNode) Copy() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;TextNode{tr: <a href=3D"http:/=
/t.tr" rel=3D"noreferrer" target=3D"_blank">t.tr</a>, NodeType: NodeText, P=
os: t.Pos, Text: append([]byte{}, t.Text...)}<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// CommentNode holds a comment.<br>
&gt; ++type CommentNode struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tr=C2=A0 =C2=A0*Tree<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Text string // Comment text.<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (t *Tree) newComment(pos Pos, text string) *CommentNode {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;CommentNode{tr: t, NodeType: NodeCo=
mment, Pos: pos, Text: text}<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (c *CommentNode) String() string {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var sb strings.Builder<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 c.writeTo(&amp;sb)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return sb.String()<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (c *CommentNode) writeTo(sb *strings.Builder) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(&quot;{{&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(c.Text)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sb.WriteString(&quot;}}&quot;)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (c *CommentNode) tree() *Tree {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://c.tr" rel=3D"noreferre=
r" target=3D"_blank">c.tr</a><br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (c *CommentNode) Copy() Node {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;CommentNode{tr: <a href=3D"http://c=
.tr" rel=3D"noreferrer" target=3D"_blank">c.tr</a>, NodeType: NodeComment, =
Pos: c.Pos, Text: c.Text}<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // PipeNode holds a pipeline with optional declaration<br>
&gt; + type PipeNode struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeType<br>
&gt; +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go<br>
&gt; +index c9b80f4..496d8bf 100644<br>
&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; +@@ -21,6 +21,7 @@ type Tree struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Name=C2=A0 =C2=A0 =C2=A0 string=C2=A0 =C2=
=A0 // name of the template represented by the tree.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ParseName string=C2=A0 =C2=A0 // name of t=
he top-level template during parsing, for error messages.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Root=C2=A0 =C2=A0 =C2=A0 *ListNode // top-=
level root of the tree.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Mode=C2=A0 =C2=A0 =C2=A0 Mode=C2=A0 =C2=A0 =C2=
=A0 // parsing mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0text=C2=A0 =C2=A0 =C2=A0 string=C2=A0 =C2=
=A0 // text parsed to create the template (or its parent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Parsing only; cleared after parse.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0funcs=C2=A0 =C2=A0 =C2=A0[]map[string]inte=
rface{}<br>
&gt; +@@ -29,8 +30,16 @@ type Tree struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0peekCount int<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vars=C2=A0 =C2=A0 =C2=A0 []string // varia=
bles defined at the moment.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0treeSet=C2=A0 =C2=A0map[string]*Tree<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 Mode<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// A mode value is a set of flags (or 0). Modes control parser behav=
ior.<br>
&gt; ++type Mode uint<br>
&gt; ++<br>
&gt; ++const (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ParseComments Mode =3D 1 &lt;&lt; iota // parse=
 comments and add them to AST<br>
&gt; ++)<br>
&gt; ++<br>
&gt; + // Copy returns a copy of the Tree. Any parsing state is discarded.<=
br>
&gt; + func (t *Tree) Copy() *Tree {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if t =3D=3D nil {<br>
&gt; +@@ -220,7 +229,8 @@ func (t *Tree) stopParse() {<br>
&gt; + func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map=
[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.recover(&amp;err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.ParseName =3D t.Name<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 t.startParse(funcs, lex(t.Name, text, leftDelim=
, rightDelim), treeSet)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment :=3D t.Mode&amp;ParseComments !=3D =
0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t.startParse(funcs, lex(t.Name, text, leftDelim=
, rightDelim, emitComment), treeSet)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.text =3D text<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.parse()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.add()<br>
&gt; +@@ -240,12 +250,14 @@ func (t *Tree) add() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +-// IsEmptyTree reports whether this tree (node) is empty of everythi=
ng but space.<br>
&gt; ++// IsEmptyTree reports whether this tree (node) is empty of everythi=
ng but space or comments.<br>
&gt; + func IsEmptyTree(n Node) bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nil:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *ActionNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *CommentNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *IfNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *ListNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for _, node :=
=3D range n.Nodes {<br>
&gt; +@@ -276,6 +288,7 @@ func (t *Tree) parse() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if t.nextNonSpace().typ =3D=3D itemDefine {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT :=3D New(&quot;definition&qu=
ot;) // name will be updated once we know it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.text =3D t.text<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newT.Mode =3D t.Mode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.ParseName =3D t.ParseName<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.startParse(t.funcs, t.lex, t=
.treeSet)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newT.parseDefinition()<br>
&gt; +@@ -331,13 +344,15 @@ func (t *Tree) itemList() (list *ListNode, next=
 Node) {<br>
&gt; + }<br>
&gt; +<br>
&gt; + // textOrAction:<br>
&gt; +-//=C2=A0 =C2=A0 text | action<br>
&gt; ++//=C2=A0 =C2=A0 text | comment | action<br>
&gt; + func (t *Tree) textOrAction() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonSpace(); token.=
typ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemText:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newTe=
xt(token.pos, token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftDelim:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.actio=
n()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemComment:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return t.newComment=
(token.pos, token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.unexpected(t=
oken, &quot;input&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -539,6 +554,7 @@ func (t *Tree) blockControl() Node {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block :=3D New(name) // name will be updat=
ed once we know it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.text =3D t.text<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 block.Mode =3D t.Mode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.ParseName =3D t.ParseName<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.startParse(t.funcs, t.lex, t.treeSet=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var end Node<br>
&gt; +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go<br>
&gt; +index 4e09a78..d9c13c5 100644<br>
&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; +@@ -348,6 +348,30 @@ func TestParseCopy(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0testParse(true, t)<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func TestParseWithComments(t *testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 textFormat =3D &quot;%q&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 defer func() { textFormat =3D &quot;%s&quot; }(=
)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tests :=3D [...]parseTest{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;comment&quot=
;, &quot;{{/*\n\n\n*/}}&quot;, noError, &quot;{{/*\n\n\n*/}}&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;comment trim=
 left&quot;, &quot;x \r\n\t{{- /* hi */}}&quot;, noError, `&quot;x&quot;{{/=
* hi */}}`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;comment trim=
 right&quot;, &quot;{{/* hi */ -}}\n\n\ty&quot;, noError, `{{/* hi */}}&quo=
t;y&quot;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;comment trim=
 left and right&quot;, &quot;x \r\n\t{{- /* */ -}}\n\n\ty&quot;, noError, `=
&quot;x&quot;{{/* */}}&quot;y&quot;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, test :=3D range tests {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(<a href=3D"ht=
tp://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>, func(t =
*testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tr :=3D New(<a href=3D"http://test.name" rel=3D"noreferrer" targ=
et=3D"_blank">test.name</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tr.Mode =3D ParseComments<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmpl, err :=3D tr.Parse(test.input, &quot;&quot;, &quot;&quot;, =
make(map[string]*Tree))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%q: expected error; g=
ot none&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_b=
lank">test.name</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if result :=3D tmpl.Root.String(); result !=3D test.result {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;%s=3D(%q): got\n\t%v\=
nexpected\n\t%v&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" targ=
et=3D"_blank">test.name</a>, test.input, result, test.result)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + type isEmptyTest struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0name=C2=A0 string<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0input string<br>
&gt; +@@ -358,6 +382,7 @@ var isEmptyTests =3D []isEmptyTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;empty&quot;, ``, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;nonempty&quot;, `hello`, false},<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;spaces only&quot;, &quot; \t\n \t\n=
&quot;, true},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment only&quot;, &quot;{{/* comment *=
/}}&quot;, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definition&quot;, `{{define &quot;x=
&quot;}}something{{end}}`, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definitions and space&quot;, &quot;=
{{define `x`}}something{{end}}\n\n{{define `y`}}something{{end}}\n\n&quot;,=
 true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;definitions and text&quot;, &quot;{=
{define `x`}}something{{end}}\nx\n{{define `y`}}something{{end}}\ny\n&quot;=
, false},<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d5e2eb6684<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch<br>
&gt; @@ -0,0 +1,497 @@<br>
&gt; +From 760d88497091fb5d6d231a18e6f4e06ecb9af9b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"_blank=
">rsc@golang.org</a>&gt;<br>
&gt; +Date: Thu, 10 Sep 2020 18:53:26 -0400<br>
&gt; +Subject: [PATCH 4/6] text/template: allow newlines inside action deli=
miters<br>
&gt; +<br>
&gt; +This allows multiline constructs like:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{{&quot;hello&quot; |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf}}<br>
&gt; +<br>
&gt; +Now that unclosed actions can span multiple lines,<br>
&gt; +track and report the start of the action when reporting errors.<br>
&gt; +<br>
&gt; +Also clean up a few &quot;unexpected &lt;error message&gt;&quot; to b=
e just &quot;&lt;error message&gt;&quot;.<br>
&gt; +<br>
&gt; +Fixes #29770.<br>
&gt; +<br>
&gt; +Change-Id: I54c6c016029a8328b7902a4b6d85eab713ec3285<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/254=
257" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/254257</a><br>
&gt; +Trust: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"_blan=
k">rsc@golang.org</a>&gt;<br>
&gt; +Run-TryBot: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"=
_blank">rsc@golang.org</a>&gt;<br>
&gt; +TryBot-Result: Go Bot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Reviewed-by: Rob Pike &lt;<a href=3D"mailto:r@golang.org" target=3D"_=
blank">r@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Dependency Patch #4<br>
&gt; +<br>
&gt; +Upstream-Status: Backport from <a href=3D"https://github.com/golang/g=
o/commit/9384d34c58099657bb1b133beaf3ff37ada9b017" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/golang/go/commit/9384d34c58099657bb1b133bea=
f3ff37ada9b017</a><br>
&gt; +CVE: CVE-2023-24538<br>
&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvist=
a.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/text/template/doc.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 21 ++++-----<br>
&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 =
+-<br>
&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 84 +++++=
++++++++++++------------------<br>
&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 | 59 ++++++++++=
+++-----------<br>
&gt; + src/text/template/parse/parse_test.go | 36 ++++++++++++---<br>
&gt; + 6 files changed, 117 insertions(+), 87 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/text/template/doc.go b/src/text/template/doc.go<br>
&gt; +index 4b0efd2..7b30294 100644<br>
&gt; +--- a/src/text/template/doc.go<br>
&gt; ++++ b/src/text/template/doc.go<br>
&gt; +@@ -40,16 +40,17 @@ More intricate examples appear below.<br>
&gt; + Text and spaces<br>
&gt; +<br>
&gt; + By default, all text between actions is copied verbatim when the tem=
plate is<br>
&gt; +-executed. For example, the string &quot; items are made of &quot; in=
 the example above appears<br>
&gt; +-on standard output when the program is run.<br>
&gt; +-<br>
&gt; +-However, to aid in formatting template source code, if an action&#39=
;s left delimiter<br>
&gt; +-(by default &quot;{{&quot;) is followed immediately by a minus sign =
and ASCII space character<br>
&gt; +-(&quot;{{- &quot;), all trailing white space is trimmed from the imm=
ediately preceding text.<br>
&gt; +-Similarly, if the right delimiter (&quot;}}&quot;) is preceded by a =
space and minus sign<br>
&gt; +-(&quot; -}}&quot;), all leading white space is trimmed from the imme=
diately following text.<br>
&gt; +-In these trim markers, the ASCII space must be present; &quot;{{-3}}=
&quot; parses as an<br>
&gt; +-action containing the number -3.<br>
&gt; ++executed. For example, the string &quot; items are made of &quot; in=
 the example above<br>
&gt; ++appears on standard output when the program is run.<br>
&gt; ++<br>
&gt; ++However, to aid in formatting template source code, if an action&#39=
;s left<br>
&gt; ++delimiter (by default &quot;{{&quot;) is followed immediately by a m=
inus sign and white<br>
&gt; ++space, all trailing white space is trimmed from the immediately prec=
eding text.<br>
&gt; ++Similarly, if the right delimiter (&quot;}}&quot;) is preceded by wh=
ite space and a minus<br>
&gt; ++sign, all leading white space is trimmed from the immediately follow=
ing text.<br>
&gt; ++In these trim markers, the white space must be present:<br>
&gt; ++&quot;{{- 3}}&quot; is like &quot;{{3}}&quot; but trims the immediat=
ely preceding text, while<br>
&gt; ++&quot;{{-3}}&quot; parses as an action containing the number -3.<br>
&gt; +<br>
&gt; + For instance, when executing the template whose source is<br>
&gt; +<br>
&gt; +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go<br>
&gt; +index b8a809e..3309b33 100644<br>
&gt; +--- a/src/text/template/exec_test.go<br>
&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; +@@ -1295,7 +1295,7 @@ func TestUnterminatedStringError(t *testing.T) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatal(&quot;=
expected error&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0str :=3D err.Error()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if !strings.Contains(str, &quot;X:3: unexpected=
 unterminated raw quoted string&quot;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if !strings.Contains(str, &quot;X:3: unterminat=
ed raw quoted string&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.Fatalf(&quot=
;unexpected error: %s&quot;, str)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go<br>
&gt; +index e41373a..6784071 100644<br>
&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; +@@ -92,15 +92,14 @@ const eof =3D -1<br>
&gt; + // If the action begins &quot;{{- &quot; rather than &quot;{{&quot;,=
 then all space/tab/newlines<br>
&gt; + // preceding the action are trimmed; conversely if it ends &quot; -}=
}&quot; the<br>
&gt; + // leading spaces are trimmed. This is done entirely in the lexer; t=
he<br>
&gt; +-// parser never sees it happen. We require an ASCII space to be<br>
&gt; +-// present to avoid ambiguity with things like &quot;{{-3}}&quot;. I=
t reads<br>
&gt; ++// parser never sees it happen. We require an ASCII space (&#39; &#3=
9;, \t, \r, \n)<br>
&gt; ++// to be present to avoid ambiguity with things like &quot;{{-3}}&qu=
ot;. It reads<br>
&gt; + // better with the space present anyway. For simplicity, only ASCII<=
br>
&gt; +-// space does the job.<br>
&gt; ++// does the job.<br>
&gt; + const (<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 spaceChars=C2=A0 =C2=A0 =C2=A0 =3D &quot; \t\r\=
n&quot; // These are the space characters defined by Go itself.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 leftTrimMarker=C2=A0 =3D &quot;- &quot;=C2=A0 =
=C2=A0 =C2=A0 // Attached to left delimiter, trims trailing spaces from pre=
ceding text.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rightTrimMarker =3D &quot; -&quot;=C2=A0 =C2=A0=
 =C2=A0 // Attached to right delimiter, trims leading spaces from following=
 text.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 trimMarkerLen=C2=A0 =C2=A0=3D Pos(len(leftTrimM=
arker))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 spaceChars=C2=A0 =C2=A0 =3D &quot; \t\r\n&quot;=
=C2=A0 // These are the space characters defined by Go itself.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 trimMarker=C2=A0 =C2=A0 =3D &#39;-&#39;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 // Attached to left/right delimiter, trims trailing sp=
aces from preceding/following text.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 trimMarkerLen =3D Pos(1 + 1) // marker plus spa=
ce before or after<br>
&gt; + )<br>
&gt; +<br>
&gt; + // stateFn represents the state of the scanner as a function that re=
turns the next state.<br>
&gt; +@@ -108,19 +107,18 @@ type stateFn func(*lexer) stateFn<br>
&gt; +<br>
&gt; + // lexer holds the state of the scanner.<br>
&gt; + type lexer struct {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ring=C2=A0 =C2=A0 // the name of the input; used only for error reports<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 input=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string=
=C2=A0 =C2=A0 // the string being scanned<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 leftDelim=C2=A0 =C2=A0 =C2=A0 string=C2=A0 =C2=
=A0 // start of action<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rightDelim=C2=A0 =C2=A0 =C2=A0string=C2=A0 =C2=
=A0 // end of action<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 trimRightDelim string=C2=A0 =C2=A0 // end of ac=
tion with trim marker<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 emitComment=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=
=A0 // emit itemComment tokens.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 pos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Po=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0// current position in the input<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 start=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pos=C2=
=A0 =C2=A0 =C2=A0 =C2=A0// start position of this item<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 width=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pos=C2=
=A0 =C2=A0 =C2=A0 =C2=A0// width of last rune read from input<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 items=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chan it=
em // channel of scanned items<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 parenDepth=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =
=C2=A0 =C2=A0// nesting depth of ( ) exprs<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 startLine=C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =
=C2=A0 =C2=A0// start line of this item<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 name=C2=A0 =C2=A0 =C2=A0 =C2=A0 string=C2=A0 =
=C2=A0 // the name of the input; used only for error reports<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 input=C2=A0 =C2=A0 =C2=A0 =C2=A0string=C2=A0 =
=C2=A0 // the string being scanned<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 leftDelim=C2=A0 =C2=A0string=C2=A0 =C2=A0 // st=
art of action<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rightDelim=C2=A0 string=C2=A0 =C2=A0 // end of =
action<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 emitComment bool=C2=A0 =C2=A0 =C2=A0 // emit it=
emComment tokens.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pos=C2=A0 =
=C2=A0 =C2=A0 =C2=A0// current position in the input<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 start=C2=A0 =C2=A0 =C2=A0 =C2=A0Pos=C2=A0 =C2=
=A0 =C2=A0 =C2=A0// start position of this item<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 width=C2=A0 =C2=A0 =C2=A0 =C2=A0Pos=C2=A0 =C2=
=A0 =C2=A0 =C2=A0// width of last rune read from input<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 items=C2=A0 =C2=A0 =C2=A0 =C2=A0chan item // ch=
annel of scanned items<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 parenDepth=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0=
// nesting depth of ( ) exprs<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 line=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=
=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 startLine=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =
=C2=A0// start line of this item<br>
&gt; + }<br>
&gt; +<br>
&gt; + // next returns the next rune in the input.<br>
&gt; +@@ -213,15 +211,14 @@ func lex(name, input, left, right string, emitC=
omment bool) *lexer {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0right =3D righ=
tDelim<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0l :=3D &amp;lexer{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0name,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 input,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leftDelim:=C2=A0 =
=C2=A0 =C2=A0 left,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rightDelim:=C2=A0 =
=C2=A0 =C2=A0right,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trimRightDelim: rig=
htTrimMarker + right,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitComment:=C2=A0 =
=C2=A0 emitComment,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 items:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 make(chan item),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A01,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 startLine:=C2=A0 =
=C2=A0 =C2=A0 1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 name,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0input,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leftDelim:=C2=A0 =
=C2=A0left,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rightDelim:=C2=A0 r=
ight,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emitComment: emitCo=
mment,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 items:=C2=A0 =C2=A0=
 =C2=A0 =C2=A0make(chan item),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 startLine:=C2=A0 =
=C2=A01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0go l.run()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return l<br>
&gt; +@@ -251,7 +248,7 @@ func lexText(l *lexer) stateFn {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldn :=3D Pos(l=
en(l.leftDelim))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos +=3D Pos=
(x)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trimLength :=
=3D Pos(0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.HasPrefi=
x(l.input[l.pos+ldn:], leftTrimMarker) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if hasLeftTrimMarke=
r(l.input[l.pos+ldn:]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0trimLength =3D rightTrimLength(l.input[l.start:l.pos])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos -=3D tri=
mLength<br>
&gt; +@@ -280,7 +277,7 @@ func rightTrimLength(s string) Pos {<br>
&gt; +<br>
&gt; + // atRightDelim reports whether the lexer is at a right delimiter, p=
ossibly preceded by a trim marker.<br>
&gt; + func (l *lexer) atRightDelim() (delim, trimSpaces bool) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(l.input[l.pos:], l.trimRig=
htDelim) { // With trim marker.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if hasRightTrimMarker(l.input[l.pos:]) &amp;&am=
p; strings.HasPrefix(l.input[l.pos+trimMarkerLen:], l.rightDelim) { // With=
 trim marker.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true, t=
rue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if strings.HasPrefix(l.input[l.pos:], l.ri=
ghtDelim) { // Without trim marker.<br>
&gt; +@@ -297,7 +294,7 @@ func leftTrimLength(s string) Pos {<br>
&gt; + // lexLeftDelim scans the left delimiter, which is known to be prese=
nt, possibly with a trim marker.<br>
&gt; + func lexLeftDelim(l *lexer) stateFn {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos +=3D Pos(len(l.leftDelim))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D strings.HasPrefix(l.input[l.pos:=
], leftTrimMarker)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D hasLeftTrimMarker(l.input[l.pos:=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0afterMarker :=3D Pos(0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0afterMarker =
=3D trimMarkerLen<br>
&gt; +@@ -342,7 +339,7 @@ func lexComment(l *lexer) stateFn {<br>
&gt; +<br>
&gt; + // lexRightDelim scans the right delimiter, which is known to be pre=
sent, possibly with a trim marker.<br>
&gt; + func lexRightDelim(l *lexer) stateFn {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D strings.HasPrefix(l.input[l.pos:=
], rightTrimMarker)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 trimSpace :=3D hasRightTrimMarker(l.input[l.pos=
:])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if trimSpace {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.pos +=3D tri=
mMarkerLen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.ignore()<br>
&gt; +@@ -369,7 +366,7 @@ func lexInsideAction(l *lexer) stateFn {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return l.error=
f(&quot;unclosed left paren&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch r :=3D l.next(); {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 case r =3D=3D eof || isEndOfLine(r):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case r =3D=3D eof:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return l.error=
f(&quot;unclosed action&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case isSpace(r):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.backup() // =
Put space back in case we have &quot; -}}&quot;.<br>
&gt; +@@ -439,7 +436,7 @@ func lexSpace(l *lexer) stateFn {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Be careful about a trim-marked closing =
delimiter, which has a minus<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// after a space. We know there is a space=
, so check for the &#39;-&#39; that might follow.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if strings.HasPrefix(l.input[l.pos-1:], l.trimR=
ightDelim) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if hasRightTrimMarker(l.input[l.pos-1:]) &amp;&=
amp; strings.HasPrefix(l.input[l.pos-1+trimMarkerLen:], l.rightDelim) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.backup() // =
Before the space.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if numSpaces =
=3D=3D 1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return lexRightDelim // On the delim, so go right to that.<br=
>
&gt; +@@ -526,7 +523,7 @@ func lexFieldOrVariable(l *lexer, typ itemType) s=
tateFn {<br>
&gt; + // day to implement arithmetic.<br>
&gt; + func (l *lexer) atTerminator() bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0r :=3D l.peek()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if isSpace(r) || isEndOfLine(r) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if isSpace(r) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch r {<br>
&gt; +@@ -657,15 +654,18 @@ Loop:<br>
&gt; +<br>
&gt; + // isSpace reports whether r is a space character.<br>
&gt; + func isSpace(r rune) bool {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39; &#39; || r =3D=3D &#39;\t=
&#39;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-// isEndOfLine reports whether r is an end-of-line character.<br>
&gt; +-func isEndOfLine(r rune) bool {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39;\r&#39; || r =3D=3D &#39;\=
n&#39;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return r =3D=3D &#39; &#39; || r =3D=3D &#39;\t=
&#39; || r =3D=3D &#39;\r&#39; || r =3D=3D &#39;\n&#39;<br>
&gt; + }<br>
&gt; +<br>
&gt; + // isAlphaNumeric reports whether r is an alphabetic, digit, or unde=
rscore.<br>
&gt; + func isAlphaNumeric(r rune) bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return r =3D=3D &#39;_&#39; || unicode.IsL=
etter(r) || unicode.IsDigit(r)<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++func hasLeftTrimMarker(s string) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return len(s) &gt;=3D 2 &amp;&amp; s[0] =3D=3D =
trimMarker &amp;&amp; isSpace(rune(s[1]))<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func hasRightTrimMarker(s string) bool {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return len(s) &gt;=3D 2 &amp;&amp; isSpace(rune=
(s[0])) &amp;&amp; s[1] =3D=3D trimMarker<br>
&gt; ++}<br>
&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go<br>
&gt; +index f6d5f28..6510eed 100644<br>
&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; +@@ -323,7 +323,7 @@ var lexTests =3D []lexTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tLeft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemErr=
or, &quot;unrecognized character in action: U+0001&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed action&quot;, &quot;{{\n}}&quot=
;, []item{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed action&quot;, &quot;{{&quot;, [=
]item{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tLeft,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkItem(itemErr=
or, &quot;unclosed action&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}},<br>
&gt; +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go<br>
&gt; +index 496d8bf..5e6e512 100644<br>
&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; +@@ -24,13 +24,14 @@ type Tree struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Mode=C2=A0 =C2=A0 =C2=A0 Mode=C2=A0 =C2=A0=
 =C2=A0 // parsing mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0text=C2=A0 =C2=A0 =C2=A0 string=C2=A0 =C2=
=A0 // text parsed to create the template (or its parent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Parsing only; cleared after parse.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 funcs=C2=A0 =C2=A0 =C2=A0[]map[string]interface=
{}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 lex=C2=A0 =C2=A0 =C2=A0 =C2=A0*lexer<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 token=C2=A0 =C2=A0 =C2=A0[3]item // three-token=
 lookahead for parser.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 peekCount int<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 vars=C2=A0 =C2=A0 =C2=A0 []string // variables =
defined at the moment.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 treeSet=C2=A0 =C2=A0map[string]*Tree<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 Mode<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 funcs=C2=A0 =C2=A0 =C2=A0 []map[string]interfac=
e{}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 lex=C2=A0 =C2=A0 =C2=A0 =C2=A0 *lexer<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 token=C2=A0 =C2=A0 =C2=A0 [3]item // three-toke=
n lookahead for parser.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 peekCount=C2=A0 int<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 vars=C2=A0 =C2=A0 =C2=A0 =C2=A0[]string // vari=
ables defined at the moment.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 treeSet=C2=A0 =C2=A0 map[string]*Tree<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 actionLine int // line of left delim starting a=
ction<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mode=C2=A0 =C2=A0 =C2=A0 =C2=A0Mode<br>
&gt; + }<br>
&gt; +<br>
&gt; + // A mode value is a set of flags (or 0). Modes control parser behav=
ior.<br>
&gt; +@@ -187,6 +188,16 @@ func (t *Tree) expectOneOf(expected1, expected2 =
itemType, context string) item {<br>
&gt; +<br>
&gt; + // unexpected complains about the token and terminates processing.<b=
r>
&gt; + func (t *Tree) unexpected(token item, context string) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if token.typ =3D=3D itemError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra :=3D &quot;&q=
uot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if t.actionLine !=
=3D 0 &amp;&amp; t.actionLine !=3D token.line {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 extra =3D fmt.Sprintf(&quot; in action started at %s:%d&quot;, t=
.ParseName, t.actionLine)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if strings.HasSuffix(token.val, &quot; action&quot;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra =3D extra[len(&quot; in action=
&quot;):] // avoid &quot;action in action&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;%s%s=
&quot;, token, extra)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.errorf(&quot;unexpected %s in %s&quot;, =
token, context)<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -350,6 +361,8 @@ func (t *Tree) textOrAction() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemText:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newTe=
xt(token.pos, token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftDelim:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.actionLine =3D to=
ken.line<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer t.clearAction=
Line()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.actio=
n()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemComment:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newCo=
mment(token.pos, token.val)<br>
&gt; +@@ -359,6 +372,10 @@ func (t *Tree) textOrAction() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return nil<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func (t *Tree) clearActionLine() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 t.actionLine =3D 0<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // Action:<br>
&gt; + //=C2=A0 =C2=A0 control<br>
&gt; + //=C2=A0 =C2=A0 command (&quot;|&quot; command)*<br>
&gt; +@@ -384,12 +401,12 @@ func (t *Tree) action() (n Node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.backup()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.peek()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Do not pop variables; they persist unti=
l &quot;end&quot;.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return t.newAction(token.pos, token.line, t.pip=
eline(&quot;command&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newAction(token.pos, token.line, t.pip=
eline(&quot;command&quot;, itemRightDelim))<br>
&gt; + }<br>
&gt; +<br>
&gt; + // Pipeline:<br>
&gt; + //=C2=A0 =C2=A0 declarations? command (&#39;|&#39; command)*<br>
&gt; +-func (t *Tree) pipeline(context string) (pipe *PipeNode) {<br>
&gt; ++func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNod=
e) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.peekNonSpace()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe =3D t.newPipeline(token.pos, token.li=
ne, nil)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Are there declarations or assignments?<=
br>
&gt; +@@ -430,12 +447,9 @@ decls:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=
=3D t.nextNonSpace(); token.typ {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case itemRightDelim=
, itemRightParen:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case end:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// At this point, the pipeline is complete<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0t.checkPipeline(pipe, context)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if token.typ =3D=3D itemRightParen {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.backup()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case itemBool,=
 itemCharConstant, itemComplex, itemDot, itemField, itemIdentifier,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0itemNumber, itemNil, itemRawString, itemString, itemVariable,=
 itemLeftParen:<br>
&gt; +@@ -464,7 +478,7 @@ func (t *Tree) checkPipeline(pipe *PipeNode, cont=
ext string) {<br>
&gt; +<br>
&gt; + func (t *Tree) parseControl(allowElseIf bool, context string) (pos P=
os, line int, pipe *PipeNode, list, elseList *ListNode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.popVars(len(t.vars))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline(context)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline(context, itemRightDelim)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var next Node<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list, next =3D t.itemList()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch next.Type() {<br>
&gt; +@@ -550,7 +564,7 @@ func (t *Tree) blockControl() Node {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0token :=3D t.nextNonSpace()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0name :=3D t.parseTemplateName(token, conte=
xt)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 pipe :=3D t.pipeline(context)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 pipe :=3D t.pipeline(context, itemRightDelim)<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block :=3D New(name) // name will be updat=
ed once we know it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0block.text =3D t.text<br>
&gt; +@@ -580,7 +594,7 @@ func (t *Tree) templateControl() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if t.nextNonSpace().typ !=3D itemRightDeli=
m {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.backup()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Do not pop =
variables; they persist until &quot;end&quot;.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline=
(context)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe =3D t.pipeline=
(context, itemRightDelim)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newTemplate(token.pos, token.line=
, name, pipe)<br>
&gt; + }<br>
&gt; +@@ -614,13 +628,12 @@ func (t *Tree) command() *CommandNode {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=
=3D t.next(); token.typ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case itemSpace=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case itemError:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.errorf(&quot;%s&quot;, token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case itemRight=
Delim, itemRightParen:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0t.backup()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case itemPipe:=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // nothing here; break loop below<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.errorf(&quot;unexpected %s in operand&quot;, token)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.unexpected(token, &quot;operand&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -675,8 +688,6 @@ func (t *Tree) operand() Node {<br>
&gt; + // A nil return means the next item is not a term.<br>
&gt; + func (t *Tree) term() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonSpace(); token.=
typ {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 case itemError:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;%s&q=
uot;, token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemIdentifier:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !t.hasFunct=
ion(token.val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0t.errorf(&quot;function %q not defined&quot;, token.val)<br>
&gt; +@@ -699,11 +710,7 @@ func (t *Tree) term() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return number<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemLeftParen:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pipe :=3D t.pipelin=
e(&quot;parenthesized pipeline&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if token :=3D t.nex=
t(); token.typ !=3D itemRightParen {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.errorf(&quot;unclosed right paren: unexpected %s&quot;, token)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pipe<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return t.pipeline(&=
quot;parenthesized pipeline&quot;, itemRightParen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemString, itemRawString:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s, err :=3D st=
rconv.Unquote(token.val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D ni=
l {<br>
&gt; +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go<br>
&gt; +index d9c13c5..220f984 100644<br>
&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; +@@ -250,6 +250,13 @@ var parseTests =3D []parseTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;comment trim left and right&quot;, =
&quot;x \r\n\t{{- /* */ -}}\n\n\ty&quot;, noError, `&quot;x&quot;&quot;y&qu=
ot;`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;block definition&quot;, `{{block &q=
uot;foo&quot; .}}hello{{end}}`, noError,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`{{template &q=
uot;foo&quot; .}}`},<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in assignment&quot;, &quot;{{ $x=
 \n :=3D \n 1 \n }}&quot;, noError, &quot;{{$x :=3D 1}}&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in empty action&quot;, &quot;{{\=
n}}&quot;, hasError, &quot;{{\n}}&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in pipeline&quot;, &quot;{{\n\&q=
uot;x\&quot;\n|\nprintf\n}}&quot;, noError, `{{&quot;x&quot; | printf}}`},<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in comment&quot;, &quot;{{/*\nhe=
llo\n*/}}&quot;, noError, &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;newline in comment&quot;, &quot;{{-\n/*\=
nhello\n*/\n-}}&quot;, noError, &quot;&quot;},<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Errors.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed action&quot;, &quot;hello{=
{range&quot;, hasError, &quot;&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unmatched end&quot;, &quot;{{end}}&=
quot;, hasError, &quot;&quot;},<br>
&gt; +@@ -426,23 +433,38 @@ var errorTests =3D []parseTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check line numbers are accurate.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;line1\n{=
{&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
1:2: unexpected unclosed action in command`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
1:2: unclosed action`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;unclosed2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;line1\n{=
{define `x`}}line2\n{{&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
2:3: unexpected unclosed action in command`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
2:3: unclosed action`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed3&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;line1\n{{\&qu=
ot;x\&quot;\n\&quot;y\&quot;\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
3:4: unclosed action started at unclosed3:2`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;unclosed4&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{\n\n\n\n\n&=
quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
4:6: unclosed action started at unclosed4:1`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;var1&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;line1\n{{\nx\=
n}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `var1:3: =
function &quot;x&quot; not defined`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Specific errors.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;function&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{foo}}&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasError, `fun=
ction &quot;foo&quot; not defined`},<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;comment&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{/*}}&q=
uot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
 comment`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `comment1=
:1: unclosed comment`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;comment2&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{/*\nhello\n=
}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `comment2=
:1: unclosed comment`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;lparen&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{.X (1 =
2 3}}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasError, `unc=
losed left paren`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;rparen&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{.X 1 2 3)}}=
&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unexpect=
ed &quot;)&quot;`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{.X 1 2 3 ) =
}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unexpect=
ed &quot;)&quot; in command`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;rparen2&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{{(.X 1 2 3&q=
uot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `unclosed=
 action`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;space&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{`x`3}}=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasError, `in =
operand`},<br>
&gt; +@@ -488,7 +510,7 @@ var errorTests =3D []parseTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasError, `mis=
sing value for parenthesized pipeline`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;multilinerawstring&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{ $v :=
=3D `\n` }} {{&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `multilin=
erawstring:2: unexpected unclosed action`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hasError, `multilin=
erawstring:2: unclosed action`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;rangeundefvar&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;{{range =
$k}}{{end}}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hasError, `und=
efined variable`},<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fc38929648<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch<br>
&gt; @@ -0,0 +1,585 @@<br>
&gt; +From e0e6bca6ddc0e6d9fa3a5b644af9b446924fbf83 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"_blank=
">rsc@golang.org</a>&gt;<br>
&gt; +Date: Thu, 20 May 2021 12:46:33 -0400<br>
&gt; +Subject: [PATCH 5/6] html/template, text/template: implement break an=
d<br>
&gt; + continue for range loops<br>
&gt; +<br>
&gt; +Break and continue for range loops was accepted as a proposal in June=
 2017.<br>
&gt; +It was implemented in CL 66410 (Oct 2017)<br>
&gt; +but then rolled back in CL 92155 (Feb 2018)<br>
&gt; +because html/template changes had not been implemented.<br>
&gt; +<br>
&gt; +This CL reimplements break and continue in text/template<br>
&gt; +and then adds support for them in html/template as well.<br>
&gt; +<br>
&gt; +Fixes #20531.<br>
&gt; +<br>
&gt; +Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616<br>
&gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/+/321=
491" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesource.co=
m/c/go/+/321491</a><br>
&gt; +Trust: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"_blan=
k">rsc@golang.org</a>&gt;<br>
&gt; +Run-TryBot: Russ Cox &lt;<a href=3D"mailto:rsc@golang.org" target=3D"=
_blank">rsc@golang.org</a>&gt;<br>
&gt; +TryBot-Result: Go Bot &lt;<a href=3D"mailto:gobot@golang.org" target=
=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; +Reviewed-by: Rob Pike &lt;<a href=3D"mailto:r@golang.org" target=3D"_=
blank">r@golang.org</a>&gt;<br>
&gt; +<br>
&gt; +Dependency Patch #5<br>
&gt; +<br>
&gt; +Upstream-Status: Backport from <a href=3D"https://github.com/golang/g=
o/commit/d0dd26a88c019d54f22463daae81e785f5867565" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/golang/go/commit/d0dd26a88c019d54f22463daae=
81e785f5867565</a><br>
&gt; +CVE: CVE-2023-24538<br>
&gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvist=
a.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++<br>
&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 71 ++++++++++++++++++++++++++++++++++-<br>
&gt; + src/html/template/escape_test.go=C2=A0 =C2=A0 =C2=A0 | 24 ++++++++++=
++<br>
&gt; + src/text/template/doc.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++<br>
&gt; + src/text/template/exec.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 24 +++++++++++-<br>
&gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 =
+<br>
&gt; + src/text/template/parse/lex.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++=
+-<br>
&gt; + src/text/template/parse/lex_test.go=C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt; + src/text/template/parse/node.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 36 +++++=
+++++++++++++<br>
&gt; + src/text/template/parse/parse.go=C2=A0 =C2=A0 =C2=A0 | 42 ++++++++++=
++++++++++-<br>
&gt; + src/text/template/parse/parse_test.go |=C2=A0 8 ++++<br>
&gt; + 11 files changed, 230 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/html/template/context.go b/src/html/template/context=
.go<br>
&gt; +index f7d4849..aaa7d08 100644<br>
&gt; +--- a/src/html/template/context.go<br>
&gt; ++++ b/src/html/template/context.go<br>
&gt; +@@ -6,6 +6,7 @@ package template<br>
&gt; +<br>
&gt; + import (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;text/template/parse&quot;<br>
&gt; + )<br>
&gt; +<br>
&gt; + // context describes the state an HTML parser must be in when it rea=
ches the<br>
&gt; +@@ -22,6 +23,7 @@ type context struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0jsCtx=C2=A0 =C2=A0jsCtx<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0attr=C2=A0 =C2=A0 attr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0element element<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 n=C2=A0 =C2=A0 =C2=A0 =C2=A0parse.Node // for r=
ange break/continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err=C2=A0 =C2=A0 =C2=A0*Error<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -141,6 +143,8 @@ const (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateError is an infectious error state=
 outside any valid<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// HTML/CSS/JS construct.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateError<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // stateDead marks unreachable code after a {{b=
reak}} or {{continue}}.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 stateDead<br>
&gt; + )<br>
&gt; +<br>
&gt; + // isComment is true for any state that contains content meant for t=
emplate<br>
&gt; +diff --git a/src/html/template/escape.go b/src/html/template/escape.g=
o<br>
&gt; +index 8739735..6dea79c 100644<br>
&gt; +--- a/src/html/template/escape.go<br>
&gt; ++++ b/src/html/template/escape.go<br>
&gt; +@@ -97,6 +97,15 @@ type escaper struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0actionNodeEdits=C2=A0 =C2=A0map[*parse.Act=
ionNode][]string<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0templateNodeEdits map[*parse.TemplateNode]=
string<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0textNodeEdits=C2=A0 =C2=A0 =C2=A0map[*pars=
e.TextNode][]byte<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // rangeContext holds context about the current=
 range loop.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rangeContext *rangeContext<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// rangeContext holds information about the current range loop.<br>
&gt; ++type rangeContext struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 outer=C2=A0 =C2=A0 =C2=A0*rangeContext // outer=
 loop<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 breaks=C2=A0 =C2=A0 []context=C2=A0 =C2=A0 =C2=
=A0// context at each break action<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 continues []context=C2=A0 =C2=A0 =C2=A0// conte=
xt at each continue action<br>
&gt; + }<br>
&gt; +<br>
&gt; + // makeEscaper creates a blank escaper for the given set.<br>
&gt; +@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map[*parse.Act=
ionNode][]string{},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map[*parse.Tem=
plateNode]string{},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map[*parse.Tex=
tNode][]byte{},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nil,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n parse.Node=
) context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch n :=3D n.(type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ActionNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return e.escap=
eAction(c, n)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.BreakNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.n =3D n<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext.brea=
ks =3D append(e.rangeContext.breaks, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return context{stat=
e: stateDead}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.CommentNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return c<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.ContinueNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.n =3D n<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext.cont=
inues =3D append(e.rangeContext.breaks, c)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return context{stat=
e: stateDead}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return e.escap=
eBranch(c, &amp;n.BranchNode, &quot;if&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; +@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node, nodeNam=
e string) context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if b.state =3D=3D stateError {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return b<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if a.state =3D=3D stateDead {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return b<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if b.state =3D=3D stateDead {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return a<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if a.eq(b) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node, nodeNa=
me string) context {<br>
&gt; +<br>
&gt; + // escapeBranch escapes a branch template node: &quot;if&quot;, &quo=
t;range&quot; and &quot;with&quot;.<br>
&gt; + func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeN=
ame string) context {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&quot; {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext =3D =
&amp;rangeContext{outer: e.rangeContext}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c0 :=3D e.escapeList(c, n.List)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&quot; &amp;&amp;=
 c0.state !=3D stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if nodeName =3D=3D &quot;range&quot; {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0.state !=3D st=
ateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c0 =3D joinRange(c0, e.rangeContext)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext =3D =
e.rangeContext.outer<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0.state =3D=3D =
stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return c0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// The &quot;t=
rue&quot; branch of a &quot;range&quot; node can execute multiple times.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We check th=
at executing n.List once results in the same context<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// as executin=
g n.List twice.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext =3D =
&amp;rangeContext{outer: e.rangeContext}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c1, _ :=3D e.e=
scapeListConditionally(c0, n.List, nil)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c0 =3D join(c0=
, c1, n, nodeName)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if c0.state =
=3D=3D stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 e.rangeContext =3D e.rangeContext.outer<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// Make clear that this is a problem on loop re-entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// since developers tend to overlook that branch when<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// debugging templates.<br>
&gt; +@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n *pa=
rse.BranchNode, nodeName string)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0c0.err.Description =3D &quot;on range loop re-entry: &quot; +=
 c0.err.Description<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return c0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =3D joinRange(c0=
, e.rangeContext)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.rangeContext =3D =
e.rangeContext.outer<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0.state =3D=3D =
stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return c0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c1 :=3D e.escapeList(c, n.ElseList)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return join(c0, c1, n, nodeName)<br>
&gt; + }<br>
&gt; +<br>
&gt; ++func joinRange(c0 context, rc *rangeContext) context {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Merge contexts at break and continue stateme=
nts into overall body context.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // In theory we could treat breaks differently =
from continues, but for now it is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // enough to treat them both as going back to t=
he start of the loop (which may then stop).<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, c :=3D range rc.breaks {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =3D join(c0, c, =
c.n, &quot;range&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0.state =3D=3D =
stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c0.err.Line =3D c.n.(*parse.BreakNode).Line<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c0.err.Description =3D &quot;at range loop break: &quot; + c0.er=
r.Description<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return c0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for _, c :=3D range rc.continues {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c0 =3D join(c0, c, =
c.n, &quot;range&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c0.state =3D=3D =
stateError {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c0.err.Line =3D c.n.(*parse.ContinueNode).Line<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 c0.err.Description =3D &quot;at range loop continue: &quot; + c0=
.err.Description<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return c0<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return c0<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // escapeList escapes a list template node.<br>
&gt; + func (e *escaper) escapeList(c context, n *parse.ListNode) context {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if n =3D=3D nil {<br>
&gt; +@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n *parse.=
ListNode) context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, m :=3D range n.Nodes {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D e.escape=
(c, m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if c.state =3D=3D s=
tateDead {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return c<br>
&gt; + }<br>
&gt; +@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n *parse.=
ListNode) context {<br>
&gt; + // which is the same as whether e was updated.<br>
&gt; + func (e *escaper) escapeListConditionally(c context, n *parse.ListNo=
de, filter func(*escaper, context) bool) (context, bool) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0e1 :=3D makeEscaper(e.ns)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 e1.rangeContext =3D e.rangeContext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Make type inferences available to f.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for k, v :=3D range e.output {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e1.output[k] =
=3D v<br>
&gt; +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go<br>
&gt; +index c709660..fa2b84a 100644<br>
&gt; +--- a/src/html/template/escape_test.go<br>
&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; +@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;&lt;a href=3D&#39;/foo?{{range .Items}}&amp;{{.K}}=3D{{=
.V}}{{end}}&#39;&gt;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{end}}&quot;,<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{continue}}{{end=
}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{break}}{{end}}&=
quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{if .X}}{{break}=
}{{end}}{{end}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Error cases=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;{{if .Cond}}&lt;a{{end}}&quot;,<br>
&gt; +@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;z:2:8: on range loop re-entry: {{range}} branches&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{break}}{{end}}&gt;{{end}}&=
quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;z:1:29: at range loop break: {{range}} branches end in dif=
ferent contexts&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;{{range .Items}}&lt;a{{if .X}}{{continue}}{{end}}&gt;{{end=
}}&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;z:1:29: at range loop continue: {{range}} branches end in =
different contexts&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;&lt;a b=3D1 c=3D{{.H}}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;z: ends in a non-text context: {stateAttr delimSpaceOrT=
agEnd&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +diff --git a/src/text/template/doc.go b/src/text/template/doc.go<br>
&gt; +index 7b30294..0228b15 100644<br>
&gt; +--- a/src/text/template/doc.go<br>
&gt; ++++ b/src/text/template/doc.go<br>
&gt; +@@ -112,6 +112,14 @@ data, defined in detail in the corresponding sec=
tions that follow.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T0 is executed=
; otherwise, dot is set to the successive elements<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of the array, =
slice, or map and T1 is executed.<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {{break}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The innermost {{ran=
ge pipeline}} loop is ended early, stopping the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current iteration a=
nd bypassing all remaining iterations.<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {{continue}}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The current iterati=
on of the innermost {{range pipeline}} loop is<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stopped, and the lo=
op starts the next iteration.<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{{template &quot;name&quot;}}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The template w=
ith the specified name is executed with nil data.<br>
&gt; +<br>
&gt; +diff --git a/src/text/template/exec.go b/src/text/template/exec.go<br=
>
&gt; +index 7ac5175..6cb140a 100644<br>
&gt; +--- a/src/text/template/exec.go<br>
&gt; ++++ b/src/text/template/exec.go<br>
&gt; +@@ -5,6 +5,7 @@<br>
&gt; + package template<br>
&gt; +<br>
&gt; + import (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;errors&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;internal/fmtsort&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; +@@ -244,6 +245,12 @@ func (t *Template) DefinedTemplates() string {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.String()<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// Sentinel errors for use with panic to signal early exits from ran=
ge loops.<br>
&gt; ++var (<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 walkBreak=C2=A0 =C2=A0 =3D errors.New(&quot;bre=
ak&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 walkContinue =3D errors.New(&quot;continue&quot=
;)<br>
&gt; ++)<br>
&gt; ++<br>
&gt; + // Walk functions step through the major pieces of the template stru=
cture,<br>
&gt; + // generating output as they go.<br>
&gt; + func (s *state) walk(dot reflect.Value, node parse.Node) {<br>
&gt; +@@ -256,7 +263,11 @@ func (s *state) walk(dot reflect.Value, node par=
se.Node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(node.Pi=
pe.Decl) =3D=3D 0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s.printValue(node, val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.BreakNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(walkBreak)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.CommentNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case *parse.ContinueNode:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(walkContinue)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.IfNode:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.walkIfOrWith=
(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case *parse.ListNode:<br>
&gt; +@@ -335,6 +346,11 @@ func isTrue(val reflect.Value) (truth, ok bool) =
{<br>
&gt; +<br>
&gt; + func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://s.at" rel=3D"noreferrer"=
 target=3D"_blank">s.at</a>(r)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 defer func() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r :=3D recover()=
; r !=3D nil &amp;&amp; r !=3D walkBreak {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 panic(r)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer s.pop(s.mark())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0val, _ :=3D indirect(s.evalPipeline(dot, r=
.Pipe))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// mark top of stack before any variables =
in the body are pushed.<br>
&gt; +@@ -348,8 +364,14 @@ func (s *state) walkRange(dot reflect.Value, r *=
parse.RangeNode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(r.Pipe.=
Decl) &gt; 1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0s.setTopVar(2, index)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer s.pop(mark)<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defer func() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Consume panic(walkContinue)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if r :=3D recover(); r !=3D nil &amp;&amp; r !=3D walkContinue {=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(r)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s.walk(elem, r=
.List)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s.pop(mark)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch val.Kind() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case reflect.Array, reflect.Slice:<br>
&gt; +diff --git a/src/text/template/exec_test.go b/src/text/template/exec_=
test.go<br>
&gt; +index 3309b33..a639f44 100644<br>
&gt; +--- a/src/text/template/exec_test.go<br>
&gt; ++++ b/src/text/template/exec_test.go<br>
&gt; +@@ -563,6 +563,8 @@ var execTests =3D []execTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range empty no else&quot;, &quot;{{=
range .SIEmpty}}-{{.}}-{{end}}&quot;, &quot;&quot;, tVal, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []int else&quot;, &quot;{{ran=
ge .SI}}-{{.}}-{{else}}EMPTY{{end}}&quot;, &quot;-3--4--5-&quot;, tVal, tru=
e},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range empty else&quot;, &quot;{{ran=
ge .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}&quot;, &quot;EMPTY&quot;, tVal, tr=
ue},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range []int break else&quot;, &quot;{{ra=
nge .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}&quot;, &quot;-3-&qu=
ot;, tVal, true},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range []int continue else&quot;, &quot;{=
{range .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}&quot;, &quot;=
-3--4--5-&quot;, tVal, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []bool&quot;, &quot;{{range .=
SB}}-{{.}}-{{end}}&quot;, &quot;-true--false-&quot;, tVal, true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range []int method&quot;, &quot;{{r=
ange .SI | .MAdd .I}}-{{.}}-{{end}}&quot;, &quot;-20--21--22-&quot;, tVal, =
true},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range map&quot;, &quot;{{range .MSI=
}}-{{.}}-{{end}}&quot;, &quot;-1--3--2-&quot;, tVal, true},<br>
&gt; +diff --git a/src/text/template/parse/lex.go b/src/text/template/parse=
/lex.go<br>
&gt; +index 6784071..95e3377 100644<br>
&gt; +--- a/src/text/template/parse/lex.go<br>
&gt; ++++ b/src/text/template/parse/lex.go<br>
&gt; +@@ -62,6 +62,8 @@ const (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Keywords appear after all the rest.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemKeyword=C2=A0 // used only to delimit =
the keywords<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBlock=C2=A0 =C2=A0 // block keyword<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemBreak=C2=A0 =C2=A0 // break keyword<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemContinue // continue keyword<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDot=C2=A0 =C2=A0 =C2=A0 // the cursor,=
 spelled &#39;.&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDefine=C2=A0 =C2=A0// define keyword<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemElse=C2=A0 =C2=A0 =C2=A0// else keywor=
d<br>
&gt; +@@ -76,6 +78,8 @@ const (<br>
&gt; + var key =3D map[string]itemType{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;.&quot;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
itemDot,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;block&quot;:=C2=A0 =C2=A0 itemBlock,=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;break&quot;:=C2=A0 =C2=A0 itemBreak,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;continue&quot;: itemContinue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;define&quot;:=C2=A0 =C2=A0itemDefine=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;else&quot;:=C2=A0 =C2=A0 =C2=A0itemE=
lse,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;end&quot;:=C2=A0 =C2=A0 =C2=A0 itemE=
nd,<br>
&gt; +@@ -119,6 +123,8 @@ type lexer struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0parenDepth=C2=A0 int=C2=A0 =C2=A0 =C2=A0 =
=C2=A0// nesting depth of ( ) exprs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0line=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =
=C2=A0 =C2=A0 =C2=A0// 1+number of newlines seen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0startLine=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=
=A0 =C2=A0// start line of this item<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 breakOK=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =
=C2=A0 // break keyword allowed<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 continueOK=C2=A0 bool=C2=A0 =C2=A0 =C2=A0 // co=
ntinue keyword allowed<br>
&gt; + }<br>
&gt; +<br>
&gt; + // next returns the next rune in the input.<br>
&gt; +@@ -461,7 +467,12 @@ Loop:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0switch {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0case key[word] &gt; itemKeyword:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emit(key[word])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 item :=3D key[word]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if item =3D=3D itemBreak &amp;&amp; =
!l.breakOK || item =3D=3D itemContinue &amp;&amp; !l.continueOK {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emit(i=
temIdentifier)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l.emit(i=
tem)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0case word[0] =3D=3D &#39;.&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l.emit(itemField)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0case word =3D=3D &quot;true&quot;, word =3D=3D &quot;false&qu=
ot;:<br>
&gt; +diff --git a/src/text/template/parse/lex_test.go b/src/text/template/=
parse/lex_test.go<br>
&gt; +index 6510eed..df6aabf 100644<br>
&gt; +--- a/src/text/template/parse/lex_test.go<br>
&gt; ++++ b/src/text/template/parse/lex_test.go<br>
&gt; +@@ -35,6 +35,8 @@ var itemName =3D map[itemType]string{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// keywords<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDot:=C2=A0 =C2=A0 =C2=A0 &quot;.&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemBlock:=C2=A0 =C2=A0 &quot;block&quot;,=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemBreak:=C2=A0 =C2=A0 &quot;break&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 itemContinue: &quot;continue&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemDefine:=C2=A0 =C2=A0&quot;define&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemElse:=C2=A0 =C2=A0 =C2=A0&quot;else&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0itemIf:=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;if=
&quot;,<br>
&gt; +diff --git a/src/text/template/parse/node.go b/src/text/template/pars=
e/node.go<br>
&gt; +index a9dad5e..c398da0 100644<br>
&gt; +--- a/src/text/template/parse/node.go<br>
&gt; ++++ b/src/text/template/parse/node.go<br>
&gt; +@@ -71,6 +71,8 @@ const (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeVariable=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A $ variable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeWith=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A with action.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NodeComment=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A comment.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeBreak=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // A break action.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeContinue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A continue action.<br>
&gt; + )<br>
&gt; +<br>
&gt; + // Nodes.<br>
&gt; +@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return i.tr.newIf(i.Pos, i.Line, i.Pipe.Co=
pyPipe(), i.List.CopyList(), i.ElseList.CopyList())<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// BreakNode represents a {{break}} action.<br>
&gt; ++type BreakNode struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tr *Tree<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Line int<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;BreakNode{tr: t, NodeType: NodeBrea=
k, Pos: pos, Line: line}<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (b *BreakNode) Copy() Node=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { return b.tr.newBreak(b.Pos, b.Line) }<br>
&gt; ++func (b *BreakNode) String() string=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 { return &quot;{{break}}&quot; }<br>
&gt; ++func (b *BreakNode) tree() *Tree=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ return <a href=3D"http://b.tr" rel=3D"noreferr=
er" target=3D"_blank">b.tr</a> }<br>
&gt; ++func (b *BreakNode) writeTo(sb *strings.Builder) { sb.WriteString(&q=
uot;{{break}}&quot;) }<br>
&gt; ++<br>
&gt; ++// ContinueNode represents a {{continue}} action.<br>
&gt; ++type ContinueNode struct {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tr *Tree<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NodeType<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Pos<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 Line int<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return &amp;ContinueNode{tr: t, NodeType: NodeC=
ontinue, Pos: pos, Line: line}<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++func (c *ContinueNode) Copy() Node=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { return c.tr.newContinue(c.Pos, c.Line) }<br>
&gt; ++func (c *ContinueNode) String() string=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 { return &quot;{{continue}}&quot; }<br>
&gt; ++func (c *ContinueNode) tree() *Tree=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ return <a href=3D"http://c.tr" rel=3D"nore=
ferrer" target=3D"_blank">c.tr</a> }<br>
&gt; ++func (c *ContinueNode) writeTo(sb *strings.Builder) { sb.WriteString=
(&quot;{{continue}}&quot;) }<br>
&gt; ++<br>
&gt; + // RangeNode represents a {{range}} action and its commands.<br>
&gt; + type RangeNode struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BranchNode<br>
&gt; +diff --git a/src/text/template/parse/parse.go b/src/text/template/par=
se/parse.go<br>
&gt; +index 5e6e512..7f78b56 100644<br>
&gt; +--- a/src/text/template/parse/parse.go<br>
&gt; ++++ b/src/text/template/parse/parse.go<br>
&gt; +@@ -31,6 +31,7 @@ type Tree struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vars=C2=A0 =C2=A0 =C2=A0 =C2=A0[]string //=
 variables defined at the moment.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0treeSet=C2=A0 =C2=A0 map[string]*Tree<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0actionLine int // line of left delim start=
ing action<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rangeDepth int<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mode=C2=A0 =C2=A0 =C2=A0 =C2=A0Mode<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -223,6 +224,8 @@ func (t *Tree) startParse(funcs []map[string]inte=
rface{}, lex *lexer, treeSet ma<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.vars =3D []string{&quot;$&quot;}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.funcs =3D funcs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t.treeSet =3D treeSet<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 lex.breakOK =3D !t.hasFunction(&quot;break&quot=
;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 lex.continueOK =3D !t.hasFunction(&quot;continu=
e&quot;)<br>
&gt; + }<br>
&gt; +<br>
&gt; + // stopParse terminates parsing.<br>
&gt; +@@ -385,6 +388,10 @@ func (t *Tree) action() (n Node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch token :=3D t.nextNonSpace(); token.=
typ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemBlock:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.block=
Control()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemBreak:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return t.breakContr=
ol(token.pos, token.line)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 case itemContinue:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return t.continueCo=
ntrol(token.pos, token.line)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemElse:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return t.elseC=
ontrol()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case itemEnd:<br>
&gt; +@@ -404,6 +411,32 @@ func (t *Tree) action() (n Node) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return t.newAction(token.pos, token.line, =
t.pipeline(&quot;command&quot;, itemRightDelim))<br>
&gt; + }<br>
&gt; +<br>
&gt; ++// Break:<br>
&gt; ++//=C2=A0 =C2=A0 {{break}}<br>
&gt; ++// Break keyword is past.<br>
&gt; ++func (t *Tree) breakControl(pos Pos, line int) Node {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if token :=3D t.next(); token.typ !=3D itemRigh=
tDelim {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.unexpected(token,=
 &quot;in {{break}}&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if t.rangeDepth =3D=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;{{br=
eak}} outside {{range}}&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newBreak(pos, line)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++// Continue:<br>
&gt; ++//=C2=A0 =C2=A0 {{continue}}<br>
&gt; ++// Continue keyword is past.<br>
&gt; ++func (t *Tree) continueControl(pos Pos, line int) Node {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if token :=3D t.next(); token.typ !=3D itemRigh=
tDelim {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.unexpected(token,=
 &quot;in {{continue}}&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if t.rangeDepth =3D=3D 0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.errorf(&quot;{{co=
ntinue}} outside {{range}}&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return t.newContinue(pos, line)<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + // Pipeline:<br>
&gt; + //=C2=A0 =C2=A0 declarations? command (&#39;|&#39; command)*<br>
&gt; + func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNod=
e) {<br>
&gt; +@@ -479,8 +512,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode, con=
text string) {<br>
&gt; + func (t *Tree) parseControl(allowElseIf bool, context string) (pos P=
os, line int, pipe *PipeNode, list, elseList *ListNode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0defer t.popVars(len(t.vars))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe =3D t.pipeline(context, itemRightDeli=
m)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if context =3D=3D &quot;range&quot; {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.rangeDepth++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0var next Node<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list, next =3D t.itemList()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if context =3D=3D &quot;range&quot; {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.rangeDepth--<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch next.Type() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nodeEnd: //done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case nodeElse:<br>
&gt; +@@ -522,7 +561,8 @@ func (t *Tree) ifControl() Node {<br>
&gt; + //=C2=A0 =C2=A0 {{range pipeline}} itemList {{else}} itemList {{end}=
}<br>
&gt; + // Range keyword is past.<br>
&gt; + func (t *Tree) rangeControl() Node {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 return t.newRange(t.parseControl(false, &quot;r=
ange&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 r :=3D t.newRange(t.parseControl(false, &quot;r=
ange&quot;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return r<br>
&gt; + }<br>
&gt; +<br>
&gt; + // With:<br>
&gt; +diff --git a/src/text/template/parse/parse_test.go b/src/text/templat=
e/parse/parse_test.go<br>
&gt; +index 220f984..ba45636 100644<br>
&gt; +--- a/src/text/template/parse/parse_test.go<br>
&gt; ++++ b/src/text/template/parse/parse_test.go<br>
&gt; +@@ -230,6 +230,10 @@ var parseTests =3D []parseTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`{{range $x :=
=3D .SI}}{{.}}{{end}}`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;range 2 vars&quot;, &quot;{{range $=
x, $y :=3D .SI}}{{.}}{{end}}&quot;, noError,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`{{range $x, $=
y :=3D .SI}}{{.}}{{end}}`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range with break&quot;, &quot;{{range .S=
I}}{{.}}{{break}}{{end}}&quot;, noError,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `{{range .SI}}{{.}}=
{{break}}{{end}}`},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;range with continue&quot;, &quot;{{range=
 .SI}}{{.}}{{continue}}{{end}}&quot;, noError,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `{{range .SI}}{{.}}=
{{continue}}{{end}}`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;constants&quot;, &quot;{{range .SI =
1 -3.2i true false &#39;a&#39; nil}}{{end}}&quot;, noError,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`{{range .SI 1=
 -3.2i true false &#39;a&#39; nil}}{{end}}`},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;template&quot;, &quot;{{template `x=
`}}&quot;, noError,<br>
&gt; +@@ -279,6 +283,10 @@ var parseTests =3D []parseTest{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;adjacent args&quot;, &quot;{{printf=
 3`x`}}&quot;, hasError, &quot;&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;adjacent args with .&quot;, &quot;{=
{printf `x`.}}&quot;, hasError, &quot;&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;extra end after if&quot;, &quot;{{i=
f .X}}a{{else if .Y}}b{{end}}{{end}}&quot;, hasError, &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;break outside range&quot;, &quot;{{range=
 .}}{{end}} {{break}}&quot;, hasError, &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;continue outside range&quot;, &quot;{{ra=
nge .}}{{end}} {{continue}}&quot;, hasError, &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;break in range else&quot;, &quot;{{range=
 .}}{{else}}{{break}}{{end}}&quot;, hasError, &quot;&quot;},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;continue in range else&quot;, &quot;{{ra=
nge .}}{{else}}{{continue}}{{end}}&quot;, hasError, &quot;&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Other kinds of assignments and operator=
s aren&#39;t available yet.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bug0a&quot;, &quot;{{$x :=3D 0}}{{$=
x}}&quot;, noError, &quot;{{$x :=3D 0}}{{$x}}&quot;},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bug0b&quot;, &quot;{{$x +=3D 1}}{{$=
x}}&quot;, hasError, &quot;&quot;},<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch b=
/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch<br>
&gt; similarity index 53%<br>
&gt; rename from meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch<br=
>
&gt; rename to meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch<br>
&gt; index d5bb33e091..baf400b891 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538_6.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.co=
m" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 20 Mar 2023 11:01:13 -0700<br>
&gt; -Subject: [PATCH 3/3] html/template: disallow actions in JS template l=
iterals<br>
&gt; +Subject: [PATCH 6/6] html/template: disallow actions in JS template l=
iterals<br>
&gt;<br>
&gt;=C2=A0 ECMAScript 6 introduced template literals[0][1] which are delimi=
ted with<br>
&gt;=C2=A0 backticks. These need to be escaped in a similar fashion to the<=
br>
&gt; @@ -52,12 +52,15 @@ CVE: CVE-2023-24538<br>
&gt;=C2=A0 Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@=
mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
 ++<br>
&gt; - src/html/template/error.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++=
++++<br>
&gt; - src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++++=
++<br>
&gt; + src/html/template/error.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++++++<=
br>
&gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++<b=
r>
&gt; + src/html/template/escape_test.go=C2=A0 | 66 ++++++++++++++++++++++--=
---------------<br>
&gt;=C2=A0 =C2=A0src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 ++<br>
&gt; - src/html/template/jsctx_string.go |=C2=A0 9 +++++++++<br>
&gt; - src/html/template/transition.go=C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
&gt; - 6 files changed, 43 insertions(+), 1 deletion(-)<br>
&gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + src/html/template/jsctx_string.go |=C2=A0 9 ++++++<br>
&gt; + src/html/template/state_string.go | 37 ++++++++++++++++++++--<br>
&gt; + src/html/template/transition.go=C2=A0 =C2=A0|=C2=A0 7 ++++-<br>
&gt; + 9 files changed, 116 insertions(+), 33 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/html/template/context.go b/src/html/template/co=
ntext.go<br>
&gt;=C2=A0 index f7d4849..0b65313 100644<br>
&gt; @@ -125,6 +128,104 @@ index f12dafa..29ca5b3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSRegexp:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D app=
end(s, &quot;_html_template_jsregexpescaper&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case stateCSS:<br>
&gt; +diff --git a/src/html/template/escape_test.go b/src/html/template/esc=
ape_test.go<br>
&gt; +index fa2b84a..1b150e9 100644<br>
&gt; +--- a/src/html/template/escape_test.go<br>
&gt; ++++ b/src/html/template/escape_test.go<br>
&gt; +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl :=3D New(<a hr=
ef=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>)=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl =3D Must(tmpl.=
Parse(test.input))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Check for bug 64=
59: Tree field was not set in Parse.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=3D t=
mpl.text.Tree {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: tree not set properly&quot;, <a href=3D"http:=
//test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b :=3D new(bytes.Bu=
ffer)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tmpl.Ex=
ecute(b, data); err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed: %s&quot;, <a href=
=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>, e=
rr)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D test.o=
utput, b.String(); w !=3D g {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: escaped output: want\n\t%q\ngot\n\t%q&quot;, =
<a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name=
</a>, w, g)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b.Reset()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tmpl.Ex=
ecute(b, pdata); err !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed for pointer: %s&quo=
t;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.=
name</a>, err)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D test.o=
utput, b.String(); w !=3D g {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: escaped output for pointer: want\n\t%q\ngot\n=
\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blan=
k">test.name</a>, w, g)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=3D t=
mpl.text.Tree {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t.Errorf(&quot;%s: tree mismatch&quot;, <a href=3D"http://test.n=
ame" rel=3D"noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(<a href=3D"ht=
tp://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>, func(t =
*testing.T) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmpl :=3D New(<a href=3D"http://test.name" rel=3D"noreferrer" ta=
rget=3D"_blank">test.name</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmpl =3D Must(tmpl.Parse(test.input))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Check for bug 6459: Tree field was not set in Parse.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tree not set prop=
erly&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blan=
k">test.name</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b :=3D new(strings.Builder)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err :=3D tmpl.Execute(b, data); err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: template executio=
n failed: %s&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=
=3D"_blank">test.name</a>, err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: escaped output: w=
ant\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferrer"=
 target=3D"_blank">test.name</a>, w, g)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 b.Reset()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if err :=3D tmpl.Execute(b, pdata); err !=3D nil {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: template executio=
n failed for pointer: %s&quot;, <a href=3D"http://test.name" rel=3D"norefer=
rer" target=3D"_blank">test.name</a>, err)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: escaped output fo=
r pointer: want\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=3D=
"noreferrer" target=3D"_blank">test.name</a>, w, g)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tree mismatch&quo=
t;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.=
name</a>)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;{{range .Items}}&lt;a{{if .X}}{{end}}&gt;{{if .X}}{{bre=
ak}}{{end}}{{end}}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&lt;script&gt;var a =3D `${a+b}`&lt;/script&gt;`&quot;,<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Error cases=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;{{if .Cond}}&lt;a{{end}}&quot;,<br>
&gt; +@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0// html is allowed since it is the last command in the pipeli=
ne, but urlquery is not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`predefined escaper &quot;urlquery&quot; disallowed in templa=
te`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&lt;script&gt;var tmpl =3D `asd {{.}}`;&lt;/script&gt;&quo=
t;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `{{.}} appears in a JS template literal`,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D new(b=
ytes.Buffer)<br>
&gt; +@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDoubleQuote, attr: a=
ttrScript},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;&lt;a onclick=3D\&quot;`foo&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 context{state: stateJSBqStr, delim: delimDoubleQuote, attr: attr=
Script},<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0`&lt;A ONCLICK=3D&quot;&#39;`,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDoubleQuote, attr: a=
ttrScript},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 diff --git a/src/html/template/js.go b/src/html/template/js.go<b=
r>
&gt;=C2=A0 index ea9c183..b888eaf 100644<br>
&gt;=C2=A0 --- a/src/html/template/js.go<br>
&gt; @@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&lt;&#39;:=C2=A0 `\u003c`,<br>
&gt; +diff --git a/src/html/template/js_test.go b/src/html/template/js_test=
.go<br>
&gt; +index d7ee47b..7d963ae 100644<br>
&gt; +--- a/src/html/template/js_test.go<br>
&gt; ++++ b/src/html/template/js_test.go<br>
&gt; +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(=
t *testing.T) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`0123456789:;\u003c=3D\u003e?` +<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_` +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`abcdefghijklmno&quot; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\u0060abcdefghijklmno&quot; +=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pqrstuvwxyz{|}~\u007f&quot;=
 +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\\u2028\\u2029\=
ufeff\U0001D11E&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 diff --git a/src/html/template/jsctx_string.go b/src/html/templa=
te/jsctx_string.go<br>
&gt;=C2=A0 index dd1d87e..2394893 100644<br>
&gt;=C2=A0 --- a/src/html/template/jsctx_string.go<br>
&gt; @@ -165,6 +279,55 @@ index dd1d87e..2394893 100644<br>
&gt;=C2=A0 =C2=A0const _jsCtx_name =3D &quot;jsCtxRegexpjsCtxDivOpjsCtxUnkn=
own&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}<br>
&gt; +diff --git a/src/html/template/state_string.go b/src/html/template/st=
ate_string.go<br>
&gt; +index 05104be..6fb1a6e 100644<br>
&gt; +--- a/src/html/template/state_string.go<br>
&gt; ++++ b/src/html/template/state_string.go<br>
&gt; +@@ -4,9 +4,42 @@ package template<br>
&gt; +<br>
&gt; + import &quot;strconv&quot;<br>
&gt; +<br>
&gt; +-const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfter=
NamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstat=
eJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateC=
SSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBl=
ockCmtstateCSSLineCmtstateError&quot;<br>
&gt; ++func _() {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // An &quot;invalid array index&quot; compiler =
error signifies that the constant values have changed.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Re-run the stringer command to generate them=
 again.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 var x [1]struct{}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateText-0]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateTag-1]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttrName-2]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAfterName-3]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateBeforeValue-4]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateHTMLCmt-5]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateRCDATA-6]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttr-7]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateURL-8]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateSrcset-9]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJS-10]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSDqStr-11]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSSqStr-12]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBqStr-13]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSRegexp-14]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBlockCmt-15]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSLineCmt-16]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-17]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-18]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-19]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-20]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-21]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-22]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-23]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-24]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-25]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-26]<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfter=
NamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstat=
eJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSL=
ineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSU=
RLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead&quot;<br>
&gt; +<br>
&gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 2=
86, 296}<br>
&gt; ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 2=
83, 298, 308, 317}<br>
&gt; +<br>
&gt; + func (i state) String() string {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i &gt;=3D state(len(_state_index)-1) {<=
br>
&gt;=C2=A0 diff --git a/src/html/template/transition.go b/src/html/template=
/transition.go<br>
&gt;=C2=A0 index 06df679..92eb351 100644<br>
&gt;=C2=A0 --- a/src/html/template/transition.go<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/m=
eta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt; index 20e70c0485..00def8fcda 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch<br>
&gt; @@ -34,9 +34,9 @@ Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto=
:sdoshi@mvista.com" target=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6=
 ++-<br>
&gt;=C2=A0 =C2=A0src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +-<br>
&gt;=C2=A0 =C2=A0src/html/template/escape_test.go=C2=A0 | 10 ++++<br>
&gt; - src/html/template/state_string.go |=C2=A0 4 +-<br>
&gt; + src/html/template/state_string.go | 26 +++++-----<br>
&gt;=C2=A0 =C2=A0src/html/template/transition.go=C2=A0 =C2=A0| 80 +++++++++=
+++++++++++-----------<br>
&gt; - 5 files changed, 72 insertions(+), 33 deletions(-)<br>
&gt; + 5 files changed, 84 insertions(+), 43 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/html/template/context.go b/src/html/template/co=
ntext.go<br>
&gt;=C2=A0 index 0b65313..4eb7891 100644<br>
&gt; @@ -105,14 +105,38 @@ diff --git a/src/html/template/state_string.go b=
/src/html/template/state_string.<br>
&gt;=C2=A0 index 05104be..b5cfe70 100644<br>
&gt;=C2=A0 --- a/src/html/template/state_string.go<br>
&gt;=C2=A0 +++ b/src/html/template/state_string.go<br>
&gt; -@@ -4,9 +4,9 @@ package template<br>
&gt; -<br>
&gt; - import &quot;strconv&quot;<br>
&gt; +@@ -25,21 +25,23 @@ func _() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSRegexp-14]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSBlockCmt-15]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_ =3D x[stateJSLineCmt-16]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-17]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-18]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-19]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-20]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-21]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-22]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-23]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-24]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-25]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-26]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSHTMLOpenCmt-17]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSHTMLCloseCmt-18]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-19]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-20]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-21]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-22]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-23]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-24]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-25]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-26]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-27]<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-28]<br>
&gt; + }<br>
&gt;<br>
&gt; --const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfter=
NamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstat=
eJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateC=
SSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBl=
ockCmtstateCSSLineCmtstateError&quot;<br>
&gt; +-const _state_name =3D &quot;stateTextstateTagstateAttrNamestateAfter=
NamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstat=
eJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSL=
ineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSU=
RLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead&quot;<br>
&gt;=C2=A0 +const _state_name =3D &quot;stateTextstateTagstateAttrNamestate=
AfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcse=
tstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtsta=
teJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateC=
SSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmt=
stateErrorstateDead&quot;<br>
&gt;<br>
&gt; --var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 2=
86, 296}<br>
&gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 1=
00, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 2=
83, 298, 308, 317}<br>
&gt;=C2=A0 +var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, =
92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 2=
80, 293, 304, 320, 335, 345, 354}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0func (i state) String() string {<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#188415): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/188415" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/188415</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10166467=
9/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101664679/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000006c1a850606956099--

