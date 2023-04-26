Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26A3C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 05:05:16 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1037.1682485508616520203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 22:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=VUhd5AOp;
 spf=pass (domain: mvista.com, ip: 209.85.167.41, mailfrom: skulkarni@mvista.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4ec816d64afso28643955e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 22:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682485506; x=1685077506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y342ke0XvkWwyBn+BsUqj/JH3KHe24S3Q1Q5Rs0RF9s=;
        b=VUhd5AOp4jDTDePIQkP+PE6g5nEKgJ2v6Cw7kx40RhZ4lGwa8UpqPMhHata6hOl2oj
         60NsDhDgDkyUc9nfOYkK7/yAY437c/uIt90s2pthmaSsYIbiSVf/WZY2TVlMCjabX3VZ
         XEDpZ3xJROLVuTE6ts6GpGXhpk1XHh0Lyymss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682485506; x=1685077506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y342ke0XvkWwyBn+BsUqj/JH3KHe24S3Q1Q5Rs0RF9s=;
        b=GSDTOoiMLz7TJ/l0A0TZ3Wm23L9hnRylAnl0hE9ASqSu4pYK6ALP4XZqMOfXUjfEgZ
         9mNuiwkPFpvO9pw4Sy4RFuog2NXQp0muHuQQiygatTPKifN1dvEwC4dpDMJDpcWcKn2C
         l0Tc1XWOLx2jXv7YhRt/EynO4zT4u1/pl89+QJg3nC70Dt7u/b8H32voo1Ha2d0Cm+71
         MC1Z3bJwewJGk9B+oWUEdibkEfOUXCgGPn6uO0hJueWNGLQLWH4C4eYJJ/6HrnX01qOQ
         tKzDBjAbQ1Zag+V8B3U0l7NJB/BhHq1hf1QNkk6bbVXD3yaBrdD+0okKiG0VDZH6yPEp
         Khpg==
X-Gm-Message-State: AC+VfDwChT4qyTqULTiBrsiFRiurP4nmDAojUbd90PHGkuG7KdKGGGXb
	Fo1ABZmAAuAq94ghpzCYNGgP3KzOePbduzun68tibw==
X-Google-Smtp-Source: ACHHUZ5fXyuMJ4qjNhOQs4dtrALqhG5BhkF3fn+pFUT1ZulFXJtu/adB93lfnZPXsUy7KGNEy6Thmktjv6yfN8OiB2o=
X-Received: by 2002:a2e:8686:0:b0:2a7:8301:a968 with SMTP id
 l6-20020a2e8686000000b002a78301a968mr227693lji.12.1682485505753; Tue, 25 Apr
 2023 22:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <1682315031-18840-1-git-send-email-skulkarni@mvista.com>
 <1758EFF7FCC1532F.7408@lists.openembedded.org> <CAOSpxdbk=uEgkELJeX_52XyDAp30ksEoz32bKamz6hmcWMqdFg@mail.gmail.com>
In-Reply-To: <CAOSpxdbk=uEgkELJeX_52XyDAp30ksEoz32bKamz6hmcWMqdFg@mail.gmail.com>
From: Shubham Kulkarni <skulkarni@mvista.com>
Date: Wed, 26 Apr 2023 10:34:53 +0530
Message-ID: <CAKzga+yvZui5j1bvtcf7-MUcmSG5ugNSCOVa1fS0N=tC1h419w@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Security fix for CVE-2023-24538
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e917b705fa362e51"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 05:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180404

--000000000000e917b705fa362e51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Apologies for the inconvenience caused. I will look into the issue and will
send v2 for both the branches

Thanks,
Shubham

On Tue, Apr 25, 2023 at 8:02=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Apr 24, 2023 at 7:45=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > Unfortunately the dunfell version of this patch does not apply
> > (kirkstone seems fine):
>
> Ah, I spoke too soon!
>
> The kirkstone version of the patch applies just fine but fails to
> build both locally and on the autobuilder.
>
> An example log of the failure from the autobuilder:
>
> https://errors.yoctoproject.org/Errors/Details/700566/
>
> Steve
>
> > Applying: go: Security fix for CVE-2023-24538
> > error: corrupt patch at line 594
> > error: could not build fake ancestor
> > Patch failed at 0001 go: Security fix for CVE-2023-24538
> > hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> >
> > Steve
> >
> > On Sun, Apr 23, 2023 at 7:43=E2=80=AFPM Shubham Kulkarni <skulkarni@mvi=
sta.com>
> wrote:
> > >
> > > From: Shubham Kulkarni <skulkarni@mvista.com>
> > >
> > > html/template: disallow actions in JS template literals
> > >
> > > Backport from
> https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303a=
d9b
> > >
> > > Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > ---
> > >  meta/recipes-devtools/go/go-1.14.inc               |   2 +
> > >  .../go/go-1.14/CVE-2023-24538-1.patch              | 633
> +++++++++++++++++++++
> > >  .../go/go-1.14/CVE-2023-24538-2.patch              | 371 +++++++++++=
+
> > >  3 files changed, 1006 insertions(+)
> > >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > >  create mode 100644
> meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.14.inc
> b/meta/recipes-devtools/go/go-1.14.inc
> > > index 56f4f12..01f9f1e 100644
> > > --- a/meta/recipes-devtools/go/go-1.14.inc
> > > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > > @@ -57,6 +57,8 @@ SRC_URI +=3D "\
> > >      file://CVE-2022-41722-2.patch \
> > >      file://CVE-2020-29510.patch \
> > >      file://CVE-2023-24537.patch \
> > > +    file://CVE-2023-24538-1.patch \
> > > +    file://CVE-2023-24538-2.patch \
> > >  "
> > >
> > >  SRC_URI_append_libc-musl =3D "
> file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> > > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > > new file mode 100644
> > > index 0000000..4b0d200
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
> > > @@ -0,0 +1,633 @@
> > > +From 64779a6dfb11631133ff3cfba7ae7e449c191a88 Mon Sep 17 00:00:00 20=
01
> > > +From: empijei <robclap8@gmail.com>
> > > +Date: Fri, 27 Mar 2020 19:27:55 +0100
> > > +Subject: [PATCH 1/2] html/template,text/template: switch to Unicode
> escapes
> > > + for JSON compatibility
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +The existing implementation is not compatible with JSON
> > > +escape as it uses hex escaping.
> > > +Unicode escape, instead, is valid for both JSON and JS.
> > > +This fix avoids creating a separate escaping context for
> > > +scripts of type "application/ld+json" and it is more
> > > +future-proof in case more JSON+JS contexts get added
> > > +to the platform (e.g. import maps).
> > > +
> > > +Fixes #33671
> > > +Fixes #37634
> > > +
> > > +Change-Id: Id6f6524b4abc52e81d9d744d46bbe5bf2e081543
> > > +Reviewed-on: https://go-review.googlesource.com/c/go/+/226097
> > > +Reviewed-by: Carl Johnson <me@carlmjohnson.net>
> > > +Reviewed-by: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > > +Run-TryBot: Daniel Mart=C3=AD <mvdan@mvdan.cc>
> > > +TryBot-Result: Gobot Gobot <gobot@golang.org>
> > > +
> > > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/d4d298040d072ddacea0e0d6b55fb148fff18=
070
> > > +CVE: CVE-2023-24538
> > > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > +---
> > > + src/html/template/content_test.go  | 70
> +++++++++++++++++++-------------------
> > > + src/html/template/escape_test.go   |  6 ++--
> > > + src/html/template/example_test.go  |  6 ++--
> > > + src/html/template/js.go            | 70
> +++++++++++++++++++++++---------------
> > > + src/html/template/js_test.go       | 68
> ++++++++++++++++++------------------
> > > + src/html/template/template_test.go | 39 +++++++++++++++++++++
> > > + src/text/template/exec_test.go     |  6 ++--
> > > + src/text/template/funcs.go         |  8 ++---
> > > + 8 files changed, 163 insertions(+), 110 deletions(-)
> > > +
> > > +diff --git a/src/html/template/content_test.go
> b/src/html/template/content_test.go
> > > +index 72d56f5..bd86527 100644
> > > +--- a/src/html/template/content_test.go
> > > ++++ b/src/html/template/content_test.go
> > > +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {
> > > +               HTML(`Hello, <b>World</b> &amp;tc!`),
> > > +               HTMLAttr(` dir=3D"ltr"`),
> > > +               JS(`c && alert("Hello, World!");`),
> > > +-              JSStr(`Hello, World & O'Reilly\x21`),
> > > ++              JSStr(`Hello, World & O'Reilly\u0021`),
> > > +               URL(`greeting=3DH%69,&addressee=3D(World)`),
> > > +               Srcset(`greeting=3DH%69,&addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w`),
> > > +               URL(`,foo/,`),
> > > +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               `Hello, <b>World</b> &amp;tc!`,
> > > +                               ` dir=3D&#34;ltr&#34;`,
> > > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > +-                              `Hello, World &amp; O&#39;Reilly\x21`=
,
> > > ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > > +                               `,foo/,`,
> > > +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               `Hello,&#32;World&#32;&amp;tc!`,
> > > +                               `&#32;dir&#61;&#34;ltr&#34;`,
> > > +
>  `c&#32;&amp;&amp;&#32;alert(&#34;Hello,&#32;World!&#34;);`,
> > > +-
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\x21`,
> > > ++
> `Hello,&#32;World&#32;&amp;&#32;O&#39;Reilly\u0021`,
> > > +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)`,
> > > +
>  `greeting&#61;H%69,&amp;addressee&#61;(World)&#32;2x,&#32;
> https://golang.org/favicon.ico&#32;500.5w`
> <https://golang.org/favicon.ico&#32;500.5w>,
> > > +                               `,foo/,`,
> > > +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               `Hello, World &amp;tc!`,
> > > +                               ` dir=3D&#34;ltr&#34;`,
> > > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > +-                              `Hello, World &amp; O&#39;Reilly\x21`=
,
> > > ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > > +                               `,foo/,`,
> > > +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               `Hello, &lt;b&gt;World&lt;/b&gt;
> &amp;tc!`,
> > > +                               ` dir=3D&#34;ltr&#34;`,
> > > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > +-                              `Hello, World &amp; O&#39;Reilly\x21`=
,
> > > ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > > +                               `,foo/,`,
> > > +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               // Not escaped.
> > > +                               `c && alert("Hello, World!");`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `"Hello, World & O'Reilly\x21"`,
> > > ++                              `"Hello, World & O'Reilly\u0021"`,
> > > +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > > +
>  `"greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w"`,
> > > +                               `",foo/,"`,
> > > +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               // Not JS escaped but HTML escaped.
> > > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `&#34;Hello, World &amp;
> O&#39;Reilly\x21&#34;`,
> > > ++                              `&#34;Hello, World &amp;
> O&#39;Reilly\u0021&#34;`,
> > > +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World)&#34;`,
> > > +
>  `&#34;greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w&#34;`,
> > > +                               `&#34;,foo/,&#34;`,
> > > +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {
> > > +               {
> > > +                       `<script>alert("{{.}}")</script>`,
> > > +                       []string{
> > > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > +-                              ` dir=3D\x22ltr\x22`,
> > > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > ++                              ` dir=3D\u0022ltr\u0022`,
> > > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > ++                              `greeting=3DH%69,\u0026addressee=3D(W=
orld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > +                               `,foo\/,`,
> > > +                       },
> > > +               },
> > > +               {
> > > +                       `<script
> type=3D"text/javascript">alert("{{.}}")</script>`,
> > > +                       []string{
> > > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > +-                              ` dir=3D\x22ltr\x22`,
> > > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > ++                              ` dir=3D\u0022ltr\u0022`,
> > > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > ++                              `greeting=3DH%69,\u0026addressee=3D(W=
orld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > +                               `,foo\/,`,
> > > +                       },
> > > +               },
> > > +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               // Not escaped.
> > > +                               `c && alert("Hello, World!");`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `"Hello, World & O'Reilly\x21"`,
> > > ++                              `"Hello, World & O'Reilly\u0021"`,
> > > +
>  `"greeting=3DH%69,\u0026addressee=3D(World)"`,
> > > +
>  `"greeting=3DH%69,\u0026addressee=3D(World) 2x,
> https://golang.org/favicon.ico 500.5w"`,
> > > +                               `",foo/,"`,
> > > +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {
> > > +                               `Hello, <b>World</b> &amp;tc!`,
> > > +                               ` dir=3D&#34;ltr&#34;`,
> > > +                               `c &amp;&amp; alert(&#34;Hello,
> World!&#34;);`,
> > > +-                              `Hello, World &amp; O&#39;Reilly\x21`=
,
> > > ++                              `Hello, World &amp;
> O&#39;Reilly\u0021`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)`,
> > > +                               `greeting=3DH%69,&amp;addressee=3D(Wo=
rld)
> 2x, https://golang.org/favicon.ico 500.5w`,
> > > +                               `,foo/,`,
> > > +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {
> > > +               {
> > > +                       `<button onclick=3D'alert("{{.}}")'>`,
> > > +                       []string{
> > > +-                              `\x3cb\x3e \x22foo%\x22 O\x27Reilly
> \x26bar;`,
> > > +-                              `a[href =3D~ \x22\/\/example.com
> \x22]#foo`,
> > > +-                              `Hello, \x3cb\x3eWorld\x3c\/b\x3e
> \x26amp;tc!`,
> > > +-                              ` dir=3D\x22ltr\x22`,
> > > +-                              `c \x26\x26 alert(\x22Hello,
> World!\x22);`,
> > > ++                              `\u003cb\u003e \u0022foo%\u0022
> O\u0027Reilly \u0026bar;`,
> > > ++                              `a[href =3D~ \u0022\/\/example.com
> \u0022]#foo`,
> > > ++                              `Hello,
> \u003cb\u003eWorld\u003c\/b\u003e \u0026amp;tc!`,
> > > ++                              ` dir=3D\u0022ltr\u0022`,
> > > ++                              `c \u0026\u0026 alert(\u0022Hello,
> World!\u0022);`,
> > > +                               // Escape sequence not over-escaped.
> > > +-                              `Hello, World \x26 O\x27Reilly\x21`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)`,
> > > +-                              `greeting=3DH%69,\x26addressee=3D(Wor=
ld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > ++                              `Hello, World \u0026
> O\u0027Reilly\u0021`,
> > > ++
> `greeting=3DH%69,\u0026addressee=3D(World)`,
> > > ++                              `greeting=3DH%69,\u0026addressee=3D(W=
orld)
> 2x, https:\/\/golang.org\/favicon.ico 500.5w`,
> > > +                               `,foo\/,`,
> > > +                       },
> > > +               },
> > > +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {
> > > +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > > +                               `%20dir%3d%22ltr%22`,
> > > +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > > +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > > ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > > +                               // Quotes and parens are escaped but
> %69 is not over-escaped. HTML escaping is done.
> > > +
>  `greeting=3DH%69,&amp;addressee=3D%28World%29`,
> > > +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > > +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {
> > > +
>  `Hello%2c%20%3cb%3eWorld%3c%2fb%3e%20%26amp%3btc%21`,
> > > +                               `%20dir%3d%22ltr%22`,
> > > +
>  `c%20%26%26%20alert%28%22Hello%2c%20World%21%22%29%3b`,
> > > +-
> `Hello%2c%20World%20%26%20O%27Reilly%5cx21`,
> > > ++
> `Hello%2c%20World%20%26%20O%27Reilly%5cu0021`,
> > > +                               // Quotes and parens are escaped but
> %69 is not over-escaped. HTML escaping is not done.
> > > +                               `greeting=3DH%69,&addressee=3D%28Worl=
d%29`,
> > > +
>  `greeting%3dH%2569%2c%26addressee%3d%28World%29%202x%2c%20https%3a%2f%
> 2fgolang.org%2ffavicon.ico%20500.5w`,
> > > +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > > +index e72a9ba..c709660 100644
> > > +--- a/src/html/template/escape_test.go
> > > ++++ b/src/html/template/escape_test.go
> > > +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {
> > > +               {
> > > +                       "jsStr",
> > > +                       "<button onclick=3D'alert(&quot;{{.H}}&quot;)=
'>",
> > > +-                      `<button
> onclick=3D'alert(&quot;\x3cHello\x3e&quot;)'>`,
> > > ++                      `<button
> onclick=3D'alert(&quot;\u003cHello\u003e&quot;)'>`,
> > > +               },
> > > +               {
> > > +                       "badMarshaler",
> > > +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {
> > > +               {
> > > +                       "jsRe",
> > > +                       `<button
> onclick=3D'alert(/{{"foo+bar"}}/.test(""))'>`,
> > > +-                      `<button
> onclick=3D'alert(/foo\x2bbar/.test(""))'>`,
> > > ++                      `<button
> onclick=3D'alert(/foo\u002bbar/.test(""))'>`,
> > > +               },
> > > +               {
> > > +                       "jsReBlank",
> > > +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {
> > > +                               "main":   `<button
> onclick=3D"title=3D'{{template "helper"}}'; ...">{{template
> "helper"}}</button>`,
> > > +                               "helper": `{{11}} of {{"<100>"}}`,
> > > +                       },
> > > +-                      `<button onclick=3D"title=3D'11 of \x3c100\x3=
e';
> ...">11 of &lt;100&gt;</button>`,
> > > ++                      `<button onclick=3D"title=3D'11 of
> \u003c100\u003e'; ...">11 of &lt;100&gt;</button>`,
> > > +               },
> > > +               // A non-recursive template that ends in a different
> context.
> > > +               // helper starts in jsCtxRegexp and ends in jsCtxDivO=
p.
> > > +diff --git a/src/html/template/example_test.go
> b/src/html/template/example_test.go
> > > +index 9d965f1..6cf936f 100644
> > > +--- a/src/html/template/example_test.go
> > > ++++ b/src/html/template/example_test.go
> > > +@@ -116,9 +116,9 @@ func Example_escape() {
> > > +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > > +       // &#34;Fran &amp; Freddie&#39;s Diner&#34; &
> lt;tasty@example.com&gt;
> > > +       // &#34;Fran &amp; Freddie&#39;s Diner&#
> 34;32&lt;tasty@example.com&gt;
> > > +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> > > +-      // \"Fran \x26 Freddie\'s Diner\" \x3Ctasty@example.com\x3E
> > > +-      // \"Fran \x26 Freddie\'s Diner\"32\x3Ctasty@example.com\x3E
> > > ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com
> \u003E
> > > ++      // \"Fran \u0026 Freddie\'s Diner\" \u003Ctasty@example.com
> \u003E
> > > ++      // \"Fran \u0026 Freddie\'s Diner\"32\u003Ctasty@example.com
> \u003E
> > > +       // %22Fran+%26+Freddie%27s+Diner%2232%3Ctasty%40example.com%3=
E
> > > +
> > > + }
> > > +diff --git a/src/html/template/js.go b/src/html/template/js.go
> > > +index 0e91458..ea9c183 100644
> > > +--- a/src/html/template/js.go
> > > ++++ b/src/html/template/js.go
> > > +@@ -163,7 +163,6 @@ func jsValEscaper(args ...interface{}) string {
> > > +       }
> > > +       // TODO: detect cycles before calling Marshal which loops
> infinitely on
> > > +       // cyclic data. This may be an unacceptable DoS risk.
> > > +-
> > > +       b, err :=3D json.Marshal(a)
> > > +       if err !=3D nil {
> > > +               // Put a space before comment so that if it is flush
> against
> > > +@@ -178,8 +177,8 @@ func jsValEscaper(args ...interface{}) string {
> > > +       // TODO: maybe post-process output to prevent it from
> containing
> > > +       // "<!--", "-->", "<![CDATA[", "]]>", or "</script"
> > > +       // in case custom marshalers produce output containing those.
> > > +-
> > > +-      // TODO: Maybe abbreviate \u00ab to \xab to produce more
> compact output.
> > > ++      // Note: Do not use \x escaping to save bytes because it is
> not JSON compatible and this escaper
> > > ++      // supports ld+json content-type.
> > > +       if len(b) =3D=3D 0 {
> > > +               // In, `x=3Dy/{{.}}*z` a json.Marshaler that produces=
 ""
> should
> > > +               // not cause the output `x=3Dy/*z`.
> > > +@@ -260,6 +259,8 @@ func replace(s string, replacementTable []string=
)
> string {
> > > +               r, w =3D utf8.DecodeRuneInString(s[i:])
> > > +               var repl string
> > > +               switch {
> > > ++              case int(r) < len(lowUnicodeReplacementTable):
> > > ++                      repl =3D lowUnicodeReplacementTable[r]
> > > +               case int(r) < len(replacementTable) &&
> replacementTable[r] !=3D "":
> > > +                       repl =3D replacementTable[r]
> > > +               case r =3D=3D '\u2028':
> > > +@@ -283,67 +284,80 @@ func replace(s string, replacementTable
> []string) string {
> > > +       return b.String()
> > > + }
> > > +
> > > ++var lowUnicodeReplacementTable =3D []string{
> > > ++      0: `\u0000`, 1: `\u0001`, 2: `\u0002`, 3: `\u0003`, 4:
> `\u0004`, 5: `\u0005`, 6: `\u0006`,
> > > ++      '\a': `\u0007`,
> > > ++      '\b': `\u0008`,
> > > ++      '\t': `\t`,
> > > ++      '\n': `\n`,
> > > ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> > > ++      '\f': `\f`,
> > > ++      '\r': `\r`,
> > > ++      0xe:  `\u000e`, 0xf: `\u000f`, 0x10: `\u0010`, 0x11: `\u0011`=
,
> 0x12: `\u0012`, 0x13: `\u0013`,
> > > ++      0x14: `\u0014`, 0x15: `\u0015`, 0x16: `\u0016`, 0x17:
> `\u0017`, 0x18: `\u0018`, 0x19: `\u0019`,
> > > ++      0x1a: `\u001a`, 0x1b: `\u001b`, 0x1c: `\u001c`, 0x1d:
> `\u001d`, 0x1e: `\u001e`, 0x1f: `\u001f`,
> > > ++}
> > > ++
> > > + var jsStrReplacementTable =3D []string{
> > > +-      0:    `\0`,
> > > ++      0:    `\u0000`,
> > > +       '\t': `\t`,
> > > +       '\n': `\n`,
> > > +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> > > ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> > > +       '\f': `\f`,
> > > +       '\r': `\r`,
> > > +       // Encode HTML specials as hex so the output can be embedded
> > > +       // in HTML attributes without further encoding.
> > > +-      '"':  `\x22`,
> > > +-      '&':  `\x26`,
> > > +-      '\'': `\x27`,
> > > +-      '+':  `\x2b`,
> > > ++      '"':  `\u0022`,
> > > ++      '&':  `\u0026`,
> > > ++      '\'': `\u0027`,
> > > ++      '+':  `\u002b`,
> > > +       '/':  `\/`,
> > > +-      '<':  `\x3c`,
> > > +-      '>':  `\x3e`,
> > > ++      '<':  `\u003c`,
> > > ++      '>':  `\u003e`,
> > > +       '\\': `\\`,
> > > + }
> > > +
> > > + // jsStrNormReplacementTable is like jsStrReplacementTable but does
> not
> > > + // overencode existing escapes since this table has no entry for `\=
`.
> > > + var jsStrNormReplacementTable =3D []string{
> > > +-      0:    `\0`,
> > > ++      0:    `\u0000`,
> > > +       '\t': `\t`,
> > > +       '\n': `\n`,
> > > +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> > > ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> > > +       '\f': `\f`,
> > > +       '\r': `\r`,
> > > +       // Encode HTML specials as hex so the output can be embedded
> > > +       // in HTML attributes without further encoding.
> > > +-      '"':  `\x22`,
> > > +-      '&':  `\x26`,
> > > +-      '\'': `\x27`,
> > > +-      '+':  `\x2b`,
> > > ++      '"':  `\u0022`,
> > > ++      '&':  `\u0026`,
> > > ++      '\'': `\u0027`,
> > > ++      '+':  `\u002b`,
> > > +       '/':  `\/`,
> > > +-      '<':  `\x3c`,
> > > +-      '>':  `\x3e`,
> > > ++      '<':  `\u003c`,
> > > ++      '>':  `\u003e`,
> > > + }
> > > +-
> > > + var jsRegexpReplacementTable =3D []string{
> > > +-      0:    `\0`,
> > > ++      0:    `\u0000`,
> > > +       '\t': `\t`,
> > > +       '\n': `\n`,
> > > +-      '\v': `\x0b`, // "\v" =3D=3D "v" on IE 6.
> > > ++      '\v': `\u000b`, // "\v" =3D=3D "v" on IE 6.
> > > +       '\f': `\f`,
> > > +       '\r': `\r`,
> > > +       // Encode HTML specials as hex so the output can be embedded
> > > +       // in HTML attributes without further encoding.
> > > +-      '"':  `\x22`,
> > > ++      '"':  `\u0022`,
> > > +       '$':  `\$`,
> > > +-      '&':  `\x26`,
> > > +-      '\'': `\x27`,
> > > ++      '&':  `\u0026`,
> > > ++      '\'': `\u0027`,
> > > +       '(':  `\(`,
> > > +       ')':  `\)`,
> > > +       '*':  `\*`,
> > > +-      '+':  `\x2b`,
> > > ++      '+':  `\u002b`,
> > > +       '-':  `\-`,
> > > +       '.':  `\.`,
> > > +       '/':  `\/`,
> > > +-      '<':  `\x3c`,
> > > +-      '>':  `\x3e`,
> > > ++      '<':  `\u003c`,
> > > ++      '>':  `\u003e`,
> > > +       '?':  `\?`,
> > > +       '[':  `\[`,
> > > +       '\\': `\\`,
> > > +diff --git a/src/html/template/js_test.go
> b/src/html/template/js_test.go
> > > +index 075adaa..d7ee47b 100644
> > > +--- a/src/html/template/js_test.go
> > > ++++ b/src/html/template/js_test.go
> > > +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {
> > > +               {"foo", `"foo"`},
> > > +               // Newlines.
> > > +               {"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
> > > +-              // "\v" =3D=3D "v" on IE 6 so use "\x0b" instead.
> > > ++              // "\v" =3D=3D "v" on IE 6 so use "\u000b" instead.
> > > +               {"\t\x0b", `"\t\u000b"`},
> > > +               {struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
> > > +               {[]interface{}{}, "[]"},
> > > +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {
> > > +       }{
> > > +               {"", ``},
> > > +               {"foo", `foo`},
> > > +-              {"\u0000", `\0`},
> > > ++              {"\u0000", `\u0000`},
> > > +               {"\t", `\t`},
> > > +               {"\n", `\n`},
> > > +               {"\r", `\r`},
> > > +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {
> > > +               {"\\n", `\\n`},
> > > +               {"foo\r\nbar", `foo\r\nbar`},
> > > +               // Preserve attribute boundaries.
> > > +-              {`"`, `\x22`},
> > > +-              {`'`, `\x27`},
> > > ++              {`"`, `\u0022`},
> > > ++              {`'`, `\u0027`},
> > > +               // Allow embedding in HTML without further escaping.
> > > +-              {`&amp;`, `\x26amp;`},
> > > ++              {`&amp;`, `\u0026amp;`},
> > > +               // Prevent breaking out of text node and element
> boundaries.
> > > +-              {"</script>", `\x3c\/script\x3e`},
> > > +-              {"<![CDATA[", `\x3c![CDATA[`},
> > > +-              {"]]>", `]]\x3e`},
> > > ++              {"</script>", `\u003c\/script\u003e`},
> > > ++              {"<![CDATA[", `\u003c![CDATA[`},
> > > ++              {"]]>", `]]\u003e`},
> > > +               //
> https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span
> > > +               //   "The text in style, script, title, and textarea
> elements
> > > +               //   must not have an escaping text span start that i=
s
> not
> > > +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {
> > > +               // allow regular text content to be interpreted as
> script
> > > +               // allowing script execution via a combination of a J=
S
> string
> > > +               // injection followed by an HTML text injection.
> > > +-              {"<!--", `\x3c!--`},
> > > +-              {"-->", `--\x3e`},
> > > ++              {"<!--", `\u003c!--`},
> > > ++              {"-->", `--\u003e`},
> > > +               // From
> https://code.google.com/p/doctype/wiki/ArticleUtf7
> > > +               {"+ADw-script+AD4-alert(1)+ADw-/script+AD4-",
> > > +-
> `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,
> > > ++
> `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD4-`,
> > > +               },
> > > +               // Invalid UTF-8 sequence
> > > +               {"foo\xA0bar", "foo\xA0bar"},
> > > +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {
> > > +       }{
> > > +               {"", `(?:)`},
> > > +               {"foo", `foo`},
> > > +-              {"\u0000", `\0`},
> > > ++              {"\u0000", `\u0000`},
> > > +               {"\t", `\t`},
> > > +               {"\n", `\n`},
> > > +               {"\r", `\r`},
> > > +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {
> > > +               {"\\n", `\\n`},
> > > +               {"foo\r\nbar", `foo\r\nbar`},
> > > +               // Preserve attribute boundaries.
> > > +-              {`"`, `\x22`},
> > > +-              {`'`, `\x27`},
> > > ++              {`"`, `\u0022`},
> > > ++              {`'`, `\u0027`},
> > > +               // Allow embedding in HTML without further escaping.
> > > +-              {`&amp;`, `\x26amp;`},
> > > ++              {`&amp;`, `\u0026amp;`},
> > > +               // Prevent breaking out of text node and element
> boundaries.
> > > +-              {"</script>", `\x3c\/script\x3e`},
> > > +-              {"<![CDATA[", `\x3c!\[CDATA\[`},
> > > +-              {"]]>", `\]\]\x3e`},
> > > ++              {"</script>", `\u003c\/script\u003e`},
> > > ++              {"<![CDATA[", `\u003c!\[CDATA\[`},
> > > ++              {"]]>", `\]\]\u003e`},
> > > +               // Escaping text spans.
> > > +-              {"<!--", `\x3c!\-\-`},
> > > +-              {"-->", `\-\-\x3e`},
> > > ++              {"<!--", `\u003c!\-\-`},
> > > ++              {"-->", `\-\-\u003e`},
> > > +               {"*", `\*`},
> > > +-              {"+", `\x2b`},
> > > ++              {"+", `\u002b`},
> > > +               {"?", `\?`},
> > > +               {"[](){}", `\[\]\(\)\{\}`},
> > > +               {"$foo|x.y", `\$foo\|x\.y`},
> > > +@@ -284,27 +284,27 @@ func
> TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
> > > +               {
> > > +                       "jsStrEscaper",
> > > +                       jsStrEscaper,
> > > +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > > +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > > +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> > > +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> > > +-                              ` !\x22#$%\x26\x27()*\x2b,-.\/` +
> > > +-                              `0123456789:;\x3c=3D\x3e?` +
> > > ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > > ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> > > ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > > ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > > ++                              `
> !\u0022#$%\u0026\u0027()*\u002b,-.\/` +
> > > ++                              `0123456789:;\u003c=3D\u003e?` +
> > > +                               `@ABCDEFGHIJKLMNO` +
> > > +                               `PQRSTUVWXYZ[\\]^_` +
> > > +                               "`abcdefghijklmno" +
> > > +-                              "pqrstuvwxyz{|}~\x7f" +
> > > ++                              "pqrstuvwxyz{|}~\u007f" +
> > > +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > > +               },
> > > +               {
> > > +                       "jsRegexpEscaper",
> > > +                       jsRegexpEscaper,
> > > +-                      "\\0\x01\x02\x03\x04\x05\x06\x07" +
> > > +-                              "\x08\\t\\n\\x0b\\f\\r\x0E\x0F" +
> > > +-                              "\x10\x11\x12\x13\x14\x15\x16\x17" +
> > > +-                              "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f" +
> > > +-                              ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\.\/`=
 +
> > > +-                              `0123456789:;\x3c=3D\x3e\?` +
> > > ++
> `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +
> > > ++                              `\u0008\t\n\u000b\f\r\u000e\u000f` +
> > > ++
> `\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017` +
> > > ++
> `\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f` +
> > > ++                              `
> !\u0022#\$%\u0026\u0027\(\)\*\u002b,\-\.\/` +
> > > ++                              `0123456789:;\u003c=3D\u003e\?` +
> > > +                               `@ABCDEFGHIJKLMNO` +
> > > +                               `PQRSTUVWXYZ\[\\\]\^_` +
> > > +                               "`abcdefghijklmno" +
> > > +diff --git a/src/html/template/template_test.go
> b/src/html/template/template_test.go
> > > +index 13e6ba4..86bd4db 100644
> > > +--- a/src/html/template/template_test.go
> > > ++++ b/src/html/template/template_test.go
> > > +@@ -6,6 +6,7 @@ package template_test
> > > +
> > > + import (
> > > +       "bytes"
> > > ++      "encoding/json"
> > > +       . "html/template"
> > > +       "strings"
> > > +       "testing"
> > > +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {
> > > +       c.mustExecute(c.root, nil, "12.34 7.5")
> > > + }
> > > +
> > > ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t
> *testing.T) {
> > > ++      // See #33671 and #37634 for more context on this.
> > > ++      tests :=3D []struct{ name, in string }{
> > > ++              {"empty", ""},
> > > ++              {"invalid", string(rune(-1))},
> > > ++              {"null", "\u0000"},
> > > ++              {"unit separator", "\u001F"},
> > > ++              {"tab", "\t"},
> > > ++              {"gt and lt", "<>"},
> > > ++              {"quotes", `'"`},
> > > ++              {"ASCII letters", "ASCII letters"},
> > > ++              {"Unicode", "=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94"},
> > > ++              {"Pizza", "=F0=9F=8D=95"},
> > > ++      }
> > > ++      const (
> > > ++              prefix =3D `<script type=3D"application/ld+json">`
> > > ++              suffix =3D `</script>`
> > > ++              templ  =3D prefix + `"{{.}}"` + suffix
> > > ++      )
> > > ++      tpl :=3D Must(New("JS string is JSON string").Parse(templ))
> > > ++      for _, tt :=3D range tests {
> > > ++              t.Run(tt.name, func(t *testing.T) {
> > > ++                      var buf bytes.Buffer
> > > ++                      if err :=3D tpl.Execute(&buf, tt.in); err !=
=3D
> nil {
> > > ++                              t.Fatalf("Cannot render template: %v"=
,
> err)
> > > ++                      }
> > > ++                      trimmed :=3D
> bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), []byte(prefix)),
> []byte(suffix))
> > > ++                      var got string
> > > ++                      if err :=3D json.Unmarshal(trimmed, &got); er=
r
> !=3D nil {
> > > ++                              t.Fatalf("Cannot parse JS string %q a=
s
> JSON: %v", trimmed[1:len(trimmed)-1], err)
> > > ++                      }
> > > ++                      if got !=3D tt.in {
> > > ++                              t.Errorf("Serialization changed the
> string value: got %q want %q", got, tt.in)
> > > ++                      }
> > > ++              })
> > > ++      }
> > > ++}
> > > ++
> > > + type testCase struct {
> > > +       t    *testing.T
> > > +       root *Template
> > > +diff --git a/src/text/template/exec_test.go
> b/src/text/template/exec_test.go
> > > +index 77294ed..b8a809e 100644
> > > +--- a/src/text/template/exec_test.go
> > > ++++ b/src/text/template/exec_test.go
> > > +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {
> > > +               {`Go "jump" \`, `Go \"jump\" \\`},
> > > +               {`Yukihiro says "=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=
=E7=95=8C"`, `Yukihiro says \"=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C=
\"`},
> > > +               {"unprintable \uFDFF", `unprintable \uFDFF`},
> > > +-              {`<html>`, `\x3Chtml\x3E`},
> > > +-              {`no =3D in attributes`, `no \x3D in attributes`},
> > > +-              {`&#x27; does not become HTML entity`, `\x26#x27; doe=
s
> not become HTML entity`},
> > > ++              {`<html>`, `\u003Chtml\u003E`},
> > > ++              {`no =3D in attributes`, `no \u003D in attributes`},
> > > ++              {`&#x27; does not become HTML entity`, `\u0026#x27;
> does not become HTML entity`},
> > > +       }
> > > +       for _, tc :=3D range testCases {
> > > +               s :=3D JSEscapeString(tc.in)
> > > +diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
> > > +index 46125bc..f3de9fb 100644
> > > +--- a/src/text/template/funcs.go
> > > ++++ b/src/text/template/funcs.go
> > > +@@ -640,10 +640,10 @@ var (
> > > +       jsBackslash =3D []byte(`\\`)
> > > +       jsApos      =3D []byte(`\'`)
> > > +       jsQuot      =3D []byte(`\"`)
> > > +-      jsLt        =3D []byte(`\x3C`)
> > > +-      jsGt        =3D []byte(`\x3E`)
> > > +-      jsAmp       =3D []byte(`\x26`)
> > > +-      jsEq        =3D []byte(`\x3D`)
> > > ++      jsLt        =3D []byte(`\u003C`)
> > > ++      jsGt        =3D []byte(`\u003E`)
> > > ++      jsAmp       =3D []byte(`\u0026`)
> > > ++      jsEq        =3D []byte(`\u003D`)
> > > + )
> > > +
> > > + // JSEscape writes to w the escaped JavaScript equivalent of the
> plain text data b.
> > > +--
> > > +2.7.4
> > > diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > > new file mode 100644
> > > index 0000000..5f5a2d9
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
> > > @@ -0,0 +1,371 @@
> > > +From 576db9a3262931fcda4dbf1b78b56d4565a5ad3f Mon Sep 17 00:00:00 20=
01
> > > +From: Roland Shoemaker <bracewell@google.com>
> > > +Date: Mon, 20 Mar 2023 11:01:13 -0700
> > > +Subject: [PATCH 2/2] html/template: disallow actions in JS template
> literals
> > > +
> > > +ECMAScript 6 introduced template literals[0][1] which are delimited
> with
> > > +backticks. These need to be escaped in a similar fashion to the
> > > +delimiters for other string literals. Additionally template literals
> can
> > > +contain special syntax for string interpolation.
> > > +
> > > +There is no clear way to allow safe insertion of actions within JS
> > > +template literals, as handling (JS) string interpolation inside of
> these
> > > +literals is rather complex. As such we've chosen to simply disallow
> > > +template actions within these template literals.
> > > +
> > > +A new error code is added for this parsing failure case, errJsTmplLi=
t,
> > > +but it is unexported as it is not backwards compatible with other
> minor
> > > +release versions to introduce an API change in a minor release. We
> will
> > > +export this code in the next major release.
> > > +
> > > +The previous behavior (with the cavet that backticks are now escaped
> > > +properly) can be re-enabled with GODEBUG=3Djstmpllitinterp=3D1.
> > > +
> > > +This change subsumes CL471455.
> > > +
> > > +Thanks to Sohom Datta, Manipal Institute of Technology, for reportin=
g
> > > +this issue.
> > > +
> > > +Fixes CVE-2023-24538
> > > +For #59234
> > > +Fixes #59271
> > > +
> > > +[0]
> https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#se=
c-template-literals
> > > +[1]
> https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Templat=
e_literals
> > > +
> > > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1802457
> > > +Reviewed-by: Damien Neil <dneil@google.com>
> > > +Run-TryBot: Damien Neil <dneil@google.com>
> > > +Reviewed-by: Julie Qiu <julieqiu@google.com>
> > > +Reviewed-by: Roland Shoemaker <bracewell@google.com>
> > > +Reviewed-on:
> https://team-review.git.corp.google.com/c/golang/go-private/+/1802612
> > > +Run-TryBot: Roland Shoemaker <bracewell@google.com>
> > > +Change-Id: Ic7f10595615f2b2740d9c85ad7ef40dc0e78c04c
> > > +Reviewed-on: https://go-review.googlesource.com/c/go/+/481987
> > > +Auto-Submit: Michael Knyszek <mknyszek@google.com>
> > > +TryBot-Result: Gopher Robot <gobot@golang.org>
> > > +Run-TryBot: Michael Knyszek <mknyszek@google.com>
> > > +Reviewed-by: Matthew Dempsky <mdempsky@google.com>
> > > +
> > > +Upstream-Status: Backport from
> https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303a=
d9b
> > > +CVE: CVE-2023-24538
> > > +Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
> > > +---
> > > + src/html/template/context.go      |  2 ++
> > > + src/html/template/error.go        | 13 ++++++++
> > > + src/html/template/escape.go       | 11 +++++++
> > > + src/html/template/escape_test.go  | 66
> ++++++++++++++++++++++-----------------
> > > + src/html/template/js.go           |  2 ++
> > > + src/html/template/js_test.go      |  2 +-
> > > + src/html/template/jsctx_string.go |  9 ++++++
> > > + src/html/template/state_string.go | 37 ++++++++++++++++++++--
> > > + src/html/template/transition.go   |  7 ++++-
> > > + 9 files changed, 116 insertions(+), 33 deletions(-)
> > > +
> > > +diff --git a/src/html/template/context.go
> b/src/html/template/context.go
> > > +index f7d4849..0b65313 100644
> > > +--- a/src/html/template/context.go
> > > ++++ b/src/html/template/context.go
> > > +@@ -116,6 +116,8 @@ const (
> > > +       stateJSDqStr
> > > +       // stateJSSqStr occurs inside a JavaScript single quoted
> string.
> > > +       stateJSSqStr
> > > ++      // stateJSBqStr occurs inside a JavaScript back quoted string=
.
> > > ++      stateJSBqStr
> > > +       // stateJSRegexp occurs inside a JavaScript regexp literal.
> > > +       stateJSRegexp
> > > +       // stateJSBlockCmt occurs inside a JavaScript /* block commen=
t
> */.
> > > +diff --git a/src/html/template/error.go b/src/html/template/error.go
> > > +index 0e52706..fd26b64 100644
> > > +--- a/src/html/template/error.go
> > > ++++ b/src/html/template/error.go
> > > +@@ -211,6 +211,19 @@ const (
> > > +       //   pipeline occurs in an unquoted attribute value context,
> "html" is
> > > +       //   disallowed. Avoid using "html" and "urlquery" entirely i=
n
> new templates.
> > > +       ErrPredefinedEscaper
> > > ++
> > > ++      // errJSTmplLit: "... appears in a JS template literal"
> > > ++      // Example:
> > > ++      //     <script>var tmpl =3D `{{.Interp}`</script>
> > > ++      // Discussion:
> > > ++      //   Package html/template does not support actions inside of
> JS template
> > > ++      //   literals.
> > > ++      //
> > > ++      // TODO(rolandshoemaker): we cannot add this as an exported
> error in a minor
> > > ++      // release, since it is backwards incompatible with the other
> minor
> > > ++      // releases. As such we need to leave it unexported, and then
> we'll add it
> > > ++      // in the next major release.
> > > ++      errJSTmplLit
> > > + )
> > > +
> > > + func (e *Error) Error() string {
> > > +diff --git a/src/html/template/escape.go b/src/html/template/escape.=
go
> > > +index f12dafa..29ca5b3 100644
> > > +--- a/src/html/template/escape.go
> > > ++++ b/src/html/template/escape.go
> > > +@@ -8,6 +8,7 @@ import (
> > > +       "bytes"
> > > +       "fmt"
> > > +       "html"
> > > ++      "internal/godebug"
> > > +       "io"
> > > +       "text/template"
> > > +       "text/template/parse"
> > > +@@ -203,6 +204,16 @@ func (e *escaper) escapeAction(c context, n
> *parse.ActionNode) context {
> > > +               c.jsCtx =3D jsCtxDivOp
> > > +       case stateJSDqStr, stateJSSqStr:
> > > +               s =3D append(s, "_html_template_jsstrescaper")
> > > ++      case stateJSBqStr:
> > > ++              debugAllowActionJSTmpl :=3D
> godebug.Get("jstmpllitinterp")
> > > ++              if debugAllowActionJSTmpl =3D=3D "1" {
> > > ++                      s =3D append(s, "_html_template_jsstrescaper"=
)
> > > ++              } else {
> > > ++                      return context{
> > > ++                              state: stateError,
> > > ++                              err:   errorf(errJSTmplLit, n, n.Line=
,
> "%s appears in a JS template literal", n),
> > > ++                      }
> > > ++              }
> > > +       case stateJSRegexp:
> > > +               s =3D append(s, "_html_template_jsregexpescaper")
> > > +       case stateCSS:
> > > +diff --git a/src/html/template/escape_test.go
> b/src/html/template/escape_test.go
> > > +index c709660..807aabd 100644
> > > +--- a/src/html/template/escape_test.go
> > > ++++ b/src/html/template/escape_test.go
> > > +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
> > > +       }
> > > +
> > > +       for _, test :=3D range tests {
> > > +-              tmpl :=3D New(test.name)
> > > +-              tmpl =3D Must(tmpl.Parse(test.input))
> > > +-              // Check for bug 6459: Tree field was not set in Pars=
e.
> > > +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > > +-                      t.Errorf("%s: tree not set properly",
> test.name)
> > > +-                      continue
> > > +-              }
> > > +-              b :=3D new(bytes.Buffer)
> > > +-              if err :=3D tmpl.Execute(b, data); err !=3D nil {
> > > +-                      t.Errorf("%s: template execution failed: %s",
> test.name, err)
> > > +-                      continue
> > > +-              }
> > > +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > > +-                      t.Errorf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > +-                      continue
> > > +-              }
> > > +-              b.Reset()
> > > +-              if err :=3D tmpl.Execute(b, pdata); err !=3D nil {
> > > +-                      t.Errorf("%s: template execution failed for
> pointer: %s", test.name, err)
> > > +-                      continue
> > > +-              }
> > > +-              if w, g :=3D test.output, b.String(); w !=3D g {
> > > +-                      t.Errorf("%s: escaped output for pointer:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > +-                      continue
> > > +-              }
> > > +-              if tmpl.Tree !=3D tmpl.text.Tree {
> > > +-                      t.Errorf("%s: tree mismatch", test.name)
> > > +-                      continue
> > > +-              }
> > > ++              t.Run(test.name, func(t *testing.T) {
> > > ++                      tmpl :=3D New(test.name)
> > > ++                      tmpl =3D Must(tmpl.Parse(test.input))
> > > ++                      // Check for bug 6459: Tree field was not set
> in Parse.
> > > ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > > ++                              t.Fatalf("%s: tree not set properly",
> test.name)
> > > ++                      }
> > > ++                      b :=3D new(strings.Builder)
> > > ++                      if err :=3D tmpl.Execute(b, data); err !=3D n=
il {
> > > ++                              t.Fatalf("%s: template execution
> failed: %s", test.name, err)
> > > ++                      }
> > > ++                      if w, g :=3D test.output, b.String(); w !=3D =
g {
> > > ++                              t.Fatalf("%s: escaped output:
> want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > ++                      }
> > > ++                      b.Reset()
> > > ++                      if err :=3D tmpl.Execute(b, pdata); err !=3D =
nil {
> > > ++                              t.Fatalf("%s: template execution
> failed for pointer: %s", test.name, err)
> > > ++                      }
> > > ++                      if w, g :=3D test.output, b.String(); w !=3D =
g {
> > > ++                              t.Fatalf("%s: escaped output for
> pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
> > > ++                      }
> > > ++                      if tmpl.Tree !=3D tmpl.text.Tree {
> > > ++                              t.Fatalf("%s: tree mismatch",
> test.name)
> > > ++                      }
> > > ++              })
> > > +       }
> > > + }
> > > +
> > > +@@ -920,6 +916,10 @@ func TestErrors(t *testing.T) {
> > > +                       "<a href=3D'/foo?{{range
> .Items}}&{{.K}}=3D{{.V}}{{end}}'>",
> > > +                       "",
> > > +               },
> > > ++              {
> > > ++                      "<script>var a =3D `${a+b}`</script>`",
> > > ++                      "",
> > > ++              },
> > > +               // Error cases.
> > > +               {
> > > +                       "{{if .Cond}}<a{{end}}",
> > > +@@ -1058,6 +1058,10 @@ func TestErrors(t *testing.T) {
> > > +                       // html is allowed since it is the last
> command in the pipeline, but urlquery is not.
> > > +                       `predefined escaper "urlquery" disallowed in
> template`,
> > > +               },
> > > ++              {
> > > ++                      "<script>var tmpl =3D `asd {{.}}`;</script>",
> > > ++                      `{{.}} appears in a JS template literal`,
> > > ++              },
> > > +       }
> > > +       for _, test :=3D range tests {
> > > +               buf :=3D new(bytes.Buffer)
> > > +@@ -1280,6 +1284,10 @@ func TestEscapeText(t *testing.T) {
> > > +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > +               },
> > > +               {
> > > ++                      "<a onclick=3D\"`foo",
> > > ++                      context{state: stateJSBqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > ++              },
> > > ++              {
> > > +                       `<A ONCLICK=3D"'`,
> > > +                       context{state: stateJSSqStr, delim:
> delimDoubleQuote, attr: attrScript},
> > > +               },
> > > +diff --git a/src/html/template/js.go b/src/html/template/js.go
> > > +index ea9c183..b888eaf 100644
> > > +--- a/src/html/template/js.go
> > > ++++ b/src/html/template/js.go
> > > +@@ -308,6 +308,7 @@ var jsStrReplacementTable =3D []string{
> > > +       // Encode HTML specials as hex so the output can be embedded
> > > +       // in HTML attributes without further encoding.
> > > +       '"':  `\u0022`,
> > > ++      '`':  `\u0060`,
> > > +       '&':  `\u0026`,
> > > +       '\'': `\u0027`,
> > > +       '+':  `\u002b`,
> > > +@@ -331,6 +332,7 @@ var jsStrNormReplacementTable =3D []string{
> > > +       '"':  `\u0022`,
> > > +       '&':  `\u0026`,
> > > +       '\'': `\u0027`,
> > > ++      '`':  `\u0060`,
> > > +       '+':  `\u002b`,
> > > +       '/':  `\/`,
> > > +       '<':  `\u003c`,
> > > +diff --git a/src/html/template/js_test.go
> b/src/html/template/js_test.go
> > > +index d7ee47b..7d963ae 100644
> > > +--- a/src/html/template/js_test.go
> > > ++++ b/src/html/template/js_test.go
> > > +@@ -292,7 +292,7 @@ func
> TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
> > > +                               `0123456789:;\u003c=3D\u003e?` +
> > > +                               `@ABCDEFGHIJKLMNO` +
> > > +                               `PQRSTUVWXYZ[\\]^_` +
> > > +-                              "`abcdefghijklmno" +
> > > ++                              "\\u0060abcdefghijklmno" +
> > > +                               "pqrstuvwxyz{|}~\u007f" +
> > > +
>  "\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
> > > +               },
> > > +diff --git a/src/html/template/jsctx_string.go
> b/src/html/template/jsctx_string.go
> > > +index dd1d87e..2394893 100644
> > > +--- a/src/html/template/jsctx_string.go
> > > ++++ b/src/html/template/jsctx_string.go
> > > +@@ -4,6 +4,15 @@ package template
> > > +
> > > + import "strconv"
> > > +
> > > ++func _() {
> > > ++      // An "invalid array index" compiler error signifies that the
> constant values have changed.
> > > ++      // Re-run the stringer command to generate them again.
> > > ++      var x [1]struct{}
> > > ++      _ =3D x[jsCtxRegexp-0]
> > > ++      _ =3D x[jsCtxDivOp-1]
> > > ++      _ =3D x[jsCtxUnknown-2]
> > > ++}
> > > ++
> > > + const _jsCtx_name =3D "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
> > > +
> > > + var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}
> > > +diff --git a/src/html/template/state_string.go
> b/src/html/template/state_string.go
> > > +index 05104be..6fb1a6e 100644
> > > +--- a/src/html/template/state_string.go
> > > ++++ b/src/html/template/state_string.go
> > > +@@ -4,9 +4,42 @@ package template
> > > +
> > > + import "strconv"
> > > +
> > > +-const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstat=
eCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
> > > ++func _() {
> > > ++      // An "invalid array index" compiler error signifies that the
> constant values have changed.
> > > ++      // Re-run the stringer command to generate them again.
> > > ++      var x [1]struct{}
> > > ++      _ =3D x[stateText-0]
> > > ++      _ =3D x[stateTag-1]
> > > ++      _ =3D x[stateAttrName-2]
> > > ++      _ =3D x[stateAfterName-3]
> > > ++      _ =3D x[stateBeforeValue-4]
> > > ++      _ =3D x[stateHTMLCmt-5]
> > > ++      _ =3D x[stateRCDATA-6]
> > > ++      _ =3D x[stateAttr-7]
> > > ++      _ =3D x[stateURL-8]
> > > ++      _ =3D x[stateSrcset-9]
> > > ++      _ =3D x[stateJS-10]
> > > ++      _ =3D x[stateJSDqStr-11]
> > > ++      _ =3D x[stateJSSqStr-12]
> > > ++      _ =3D x[stateJSBqStr-13]
> > > ++      _ =3D x[stateJSRegexp-14]
> > > ++      _ =3D x[stateJSBlockCmt-15]
> > > ++      _ =3D x[stateJSLineCmt-16]
> > > ++      _ =3D x[stateCSS-17]
> > > ++      _ =3D x[stateCSSDqStr-18]
> > > ++      _ =3D x[stateCSSSqStr-19]
> > > ++      _ =3D x[stateCSSDqURL-20]
> > > ++      _ =3D x[stateCSSSqURL-21]
> > > ++      _ =3D x[stateCSSURL-22]
> > > ++      _ =3D x[stateCSSBlockCmt-23]
> > > ++      _ =3D x[stateCSSLineCmt-24]
> > > ++      _ =3D x[stateError-25]
> > > ++      _ =3D x[stateDead-26]
> > > ++}
> > > ++
> > > ++const _state_name =3D
> "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmt=
stateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstate=
JSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstate=
CSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCm=
tstateErrorstateDead"
> > > +
> > > +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92,
> 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271=
,
> 286, 296}
> > > ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92,
> 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267=
,
> 283, 298, 308, 317}
> > > +
> > > + func (i state) String() string {
> > > +       if i >=3D state(len(_state_index)-1) {
> > > +diff --git a/src/html/template/transition.go
> b/src/html/template/transition.go
> > > +index 06df679..92eb351 100644
> > > +--- a/src/html/template/transition.go
> > > ++++ b/src/html/template/transition.go
> > > +@@ -27,6 +27,7 @@ var transitionFunc =3D [...]func(context, []byte)
> (context, int){
> > > +       stateJS:          tJS,
> > > +       stateJSDqStr:     tJSDelimited,
> > > +       stateJSSqStr:     tJSDelimited,
> > > ++      stateJSBqStr:     tJSDelimited,
> > > +       stateJSRegexp:    tJSDelimited,
> > > +       stateJSBlockCmt:  tBlockCmt,
> > > +       stateJSLineCmt:   tLineCmt,
> > > +@@ -262,7 +263,7 @@ func tURL(c context, s []byte) (context, int) {
> > > +
> > > + // tJS is the context transition function for the JS state.
> > > + func tJS(c context, s []byte) (context, int) {
> > > +-      i :=3D bytes.IndexAny(s, `"'/`)
> > > ++      i :=3D bytes.IndexAny(s, "\"`'/")
> > > +       if i =3D=3D -1 {
> > > +               // Entire input is non string, comment, regexp tokens=
.
> > > +               c.jsCtx =3D nextJSCtx(s, c.jsCtx)
> > > +@@ -274,6 +275,8 @@ func tJS(c context, s []byte) (context, int) {
> > > +               c.state, c.jsCtx =3D stateJSDqStr, jsCtxRegexp
> > > +       case '\'':
> > > +               c.state, c.jsCtx =3D stateJSSqStr, jsCtxRegexp
> > > ++      case '`':
> > > ++              c.state, c.jsCtx =3D stateJSBqStr, jsCtxRegexp
> > > +       case '/':
> > > +               switch {
> > > +               case i+1 < len(s) && s[i+1] =3D=3D '/':
> > > +@@ -303,6 +306,8 @@ func tJSDelimited(c context, s []byte) (context,
> int) {
> > > +       switch c.state {
> > > +       case stateJSSqStr:
> > > +               specials =3D `\'`
> > > ++      case stateJSBqStr:
> > > ++              specials =3D "`\\"
> > > +       case stateJSRegexp:
> > > +               specials =3D `\/[]`
> > > +       }
> > > +--
> > > +2.7.4
> > > --
> > > 2.7.4
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180361):
> https://lists.openembedded.org/g/openembedded-core/message/180361
> > Mute This Topic: https://lists.openembedded.org/mt/98464668/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e917b705fa362e51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Steve,<div><br></div><div>Apologies for the inconvenien=
ce caused. I will look into the issue and will send v2 for both the branche=
s</div><div><br></div><div>Thanks,</div><div>Shubham</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 25, 2=
023 at 8:02=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.co=
m">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, Apr 24, 2023 at 7:45=E2=80=AFAM Steve Sakoman v=
ia<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@li=
sts.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Unfortunately the dunfell version of this patch does not apply<br>
&gt; (kirkstone seems fine):<br>
<br>
Ah, I spoke too soon!<br>
<br>
The kirkstone version of the patch applies just fine but fails to<br>
build both locally and on the autobuilder.<br>
<br>
An example log of the failure from the autobuilder:<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/700566/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/700566/</a><br>
<br>
Steve<br>
<br>
&gt; Applying: go: Security fix for CVE-2023-24538<br>
&gt; error: corrupt patch at line 594<br>
&gt; error: could not build fake ancestor<br>
&gt; Patch failed at 0001 go: Security fix for CVE-2023-24538<br>
&gt; hint: Use &#39;git am --show-current-patch=3Ddiff&#39; to see the fail=
ed patch<br>
&gt; When you have resolved this problem, run &quot;git am --continue&quot;=
.<br>
&gt; If you prefer to skip this patch, run &quot;git am --skip&quot; instea=
d.<br>
&gt; To restore the original branch and stop patching, run &quot;git am --a=
bort&quot;.<br>
&gt;<br>
&gt; Steve<br>
&gt;<br>
&gt; On Sun, Apr 23, 2023 at 7:43=E2=80=AFPM Shubham Kulkarni &lt;<a href=
=3D"mailto:skulkarni@mvista.com" target=3D"_blank">skulkarni@mvista.com</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@mvista.com=
" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; html/template: disallow actions in JS template literals<br>
&gt; &gt;<br>
&gt; &gt; Backport from <a href=3D"https://github.com/golang/go/commit/b1e3=
ecfa06b67014429a197ec5e134ce4303ad9b" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9=
b</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@m=
vista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/go/go-1.14.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt; &gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-1.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 633 +++++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../go/go-1.14/CVE-2023-24538-2.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 371 ++++++++++++<br>
&gt; &gt;=C2=A0 3 files changed, 1006 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-202=
3-24538-1.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-202=
3-24538-2.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-=
devtools/go/go-1.14.inc<br>
&gt; &gt; index 56f4f12..01f9f1e 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.14.inc<br>
&gt; &gt; @@ -57,6 +57,8 @@ SRC_URI +=3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2022-41722-2.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2020-29510.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://CVE-2023-24537.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://CVE-2023-24538-1.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://CVE-2023-24538-2.patch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://0009-ld-replace-=
glibc-dynamic-linker-with-musl.patch&quot;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.pa=
tch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..4b0d200<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch<br>
&gt; &gt; @@ -0,0 +1,633 @@<br>
&gt; &gt; +From 64779a6dfb11631133ff3cfba7ae7e449c191a88 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: empijei &lt;<a href=3D"mailto:robclap8@gmail.com" target=
=3D"_blank">robclap8@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Fri, 27 Mar 2020 19:27:55 +0100<br>
&gt; &gt; +Subject: [PATCH 1/2] html/template,text/template: switch to Unic=
ode escapes<br>
&gt; &gt; + for JSON compatibility<br>
&gt; &gt; +MIME-Version: 1.0<br>
&gt; &gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; &gt; +Content-Transfer-Encoding: 8bit<br>
&gt; &gt; +<br>
&gt; &gt; +The existing implementation is not compatible with JSON<br>
&gt; &gt; +escape as it uses hex escaping.<br>
&gt; &gt; +Unicode escape, instead, is valid for both JSON and JS.<br>
&gt; &gt; +This fix avoids creating a separate escaping context for<br>
&gt; &gt; +scripts of type &quot;application/ld+json&quot; and it is more<b=
r>
&gt; &gt; +future-proof in case more JSON+JS contexts get added<br>
&gt; &gt; +to the platform (e.g. import maps).<br>
&gt; &gt; +<br>
&gt; &gt; +Fixes #33671<br>
&gt; &gt; +Fixes #37634<br>
&gt; &gt; +<br>
&gt; &gt; +Change-Id: Id6f6524b4abc52e81d9d744d46bbe5bf2e081543<br>
&gt; &gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/=
+/226097" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesour=
ce.com/c/go/+/226097</a><br>
&gt; &gt; +Reviewed-by: Carl Johnson &lt;<a href=3D"mailto:me@carlmjohnson.=
net" target=3D"_blank">me@carlmjohnson.net</a>&gt;<br>
&gt; &gt; +Reviewed-by: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mvdan@mvdan=
.cc" target=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; &gt; +Run-TryBot: Daniel Mart=C3=AD &lt;<a href=3D"mailto:mvdan@mvdan.=
cc" target=3D"_blank">mvdan@mvdan.cc</a>&gt;<br>
&gt; &gt; +TryBot-Result: Gobot Gobot &lt;<a href=3D"mailto:gobot@golang.or=
g" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport from <a href=3D"https://github.com/gol=
ang/go/commit/d4d298040d072ddacea0e0d6b55fb148fff18070" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/golang/go/commit/d4d298040d072ddacea0e=
0d6b55fb148fff18070</a><br>
&gt; &gt; +CVE: CVE-2023-24538<br>
&gt; &gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@=
mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + src/html/template/content_test.go=C2=A0 | 70 ++++++++++++++++++=
+-------------------<br>
&gt; &gt; + src/html/template/escape_test.go=C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt; &gt; + src/html/template/example_test.go=C2=A0 |=C2=A0 6 ++--<br>
&gt; &gt; + src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 70 +++++++++++++++++++++++---------------<br>
&gt; &gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 68 +++=
+++++++++++++++------------------<br>
&gt; &gt; + src/html/template/template_test.go | 39 +++++++++++++++++++++<b=
r>
&gt; &gt; + src/text/template/exec_test.go=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++-=
-<br>
&gt; &gt; + src/text/template/funcs.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 ++---<br>
&gt; &gt; + 8 files changed, 163 insertions(+), 110 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/html/template/content_test.go b/src/html/templa=
te/content_test.go<br>
&gt; &gt; +index 72d56f5..bd86527 100644<br>
&gt; &gt; +--- a/src/html/template/content_test.go<br>
&gt; &gt; ++++ b/src/html/template/content_test.go<br>
&gt; &gt; +@@ -18,7 +18,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTML(`Hel=
lo, &lt;b&gt;World&lt;/b&gt; &amp;amp;tc!`),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HTMLAttr(=
` dir=3D&quot;ltr&quot;`),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JS(`c &am=
p;&amp; alert(&quot;Hello, World!&quot;);`),<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr(`Hello, =
World &amp; O&#39;Reilly\x21`),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 JSStr(`Hello, =
World &amp; O&#39;Reilly\u0021`),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0URL(`gree=
ting=3DH%69,&amp;addressee=3D(World)`),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Srcset(`g=
reeting=3DH%69,&amp;addressee=3D(World) 2x, <a href=3D"https://golang.org/f=
avicon.ico" rel=3D"noreferrer" target=3D"_blank">https://golang.org/favicon=
.ico</a> 500.5w`),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0URL(`,foo=
/,`),<br>
&gt; &gt; +@@ -70,7 +70,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;World&lt;/=
b&gt; &amp;amp;tc!`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#3=
4;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert=
(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\x21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\u0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; +@@ -100,7 +100,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello,&amp;#32;World&amp;#=
32;&amp;amp;tc!`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#32;dir&amp;#61;&amp;=
#34;ltr&amp;#34;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c&amp;#32;&amp;amp;&amp;am=
p;&amp;#32;alert(&amp;#34;Hello,&amp;#32;World!&amp;#34;);`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&amp;#32;&am=
p;amp;&amp;#32;O&amp;#39;Reilly\x21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello,&amp;#32;World&amp;#32;&am=
p;amp;&amp;#32;O&amp;#39;Reilly\u0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H%69,&amp=
;amp;addressee&amp;#61;(World)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting&amp;#61;H%69,&amp=
;amp;addressee&amp;#61;(World)&amp;#32;2x,&amp;#32;<a href=3D"https://golan=
g.org/favicon.ico&amp;#32;500.5w" rel=3D"noreferrer" target=3D"_blank">http=
s://golang.org/favicon.ico&amp;#32;500.5w`</a>,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; +@@ -115,7 +115,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, World &amp;amp;tc!`=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#3=
4;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert=
(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\x21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\u0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; +@@ -130,7 +130,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &amp;lt;b&amp;gt;Wo=
rld&amp;lt;/b&amp;gt; &amp;amp;tc!`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#3=
4;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert=
(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\x21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\u0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; +@@ -146,7 +146,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert(&quot;H=
ello, World!&quot;);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;R=
eilly\x21&quot;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;R=
eilly\u0021&quot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u00=
26addressee=3D(World)&quot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u00=
26addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D=
"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w&qu=
ot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;`,<br>
&gt; &gt; +@@ -162,7 +162,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not JS escaped but HTML =
escaped.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert=
(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World &amp;amp; =
O&amp;#39;Reilly\x21&amp;#34;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&amp;#34;Hello, World &amp;amp; =
O&amp;#39;Reilly\u0021&amp;#34;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=3DH%69,\=
u0026addressee=3D(World)&amp;#34;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;greeting=3DH%69,\=
u0026addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w=
&amp;#34;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&amp;#34;,foo/,&amp;#34;`,=
<br>
&gt; &gt; +@@ -171,30 +171,30 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;script&gt;alert(&quot;{{.}}&quot;)&lt;/script&gt;`=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reil=
ly \x26bar;`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"h=
ttp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22=
]#foo`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e=
 \x26amp;tc!`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, Worl=
d!\x22);`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O=
\u0027Reilly \u0026bar;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D=
"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u=
0022]#foo`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\=
/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello=
, World!\u0022);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x2=
1`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World)`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targ=
et=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reill=
y\u0021`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World)`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" t=
arget=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;script type=3D&quot;text/javascript&quot;&gt;alert=
(&quot;{{.}}&quot;)&lt;/script&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reil=
ly \x26bar;`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"h=
ttp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22=
]#foo`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e=
 \x26amp;tc!`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, Worl=
d!\x22);`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O=
\u0027Reilly \u0026bar;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D=
"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u=
0022]#foo`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\=
/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello=
, World!\u0022);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x2=
1`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World)`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targ=
et=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reill=
y\u0021`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World)`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" t=
arget=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +@@ -208,7 +208,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Not escaped.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;&amp; alert(&quot;H=
ello, World!&quot;);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;R=
eilly\x21&quot;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `&quot;Hello, World &amp; O&#39;R=
eilly\u0021&quot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u00=
26addressee=3D(World)&quot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;greeting=3DH%69,\u00=
26addressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D=
"noreferrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w&qu=
ot;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`&quot;,foo/,&quot;`,<br>
&gt; &gt; +@@ -224,7 +224,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello, &lt;b&gt;World&lt;/=
b&gt; &amp;amp;tc!`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0` dir=3D&amp;#34;ltr&amp;#3=
4;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c &amp;amp;&amp;amp; alert=
(&amp;#34;Hello, World!&amp;#34;);`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\x21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World &amp;amp; O&amp;#39=
;Reilly\u0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D(World) 2x, <a href=3D"https://golang.org/favicon.ico" rel=3D"no=
referrer" target=3D"_blank">https://golang.org/favicon.ico</a> 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo/,`,<br>
&gt; &gt; +@@ -233,15 +233,15 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(&quot;{{.}}&quot;)&#39=
;&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0[]string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\x3cb\x3e \x22foo%\x22 O\x27Reil=
ly \x26bar;`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \x22\/\/<a href=3D"h=
ttp://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\x22=
]#foo`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \x3cb\x3eWorld\x3c\/b\x3e=
 \x26amp;tc!`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\x22ltr\x22`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \x26\x26 alert(\x22Hello, Worl=
d!\x22);`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u003cb\u003e \u0022foo%\u0022 O=
\u0027Reilly \u0026bar;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `a[href =3D~ \u0022\/\/<a href=3D=
"http://example.com" rel=3D"noreferrer" target=3D"_blank">example.com</a>\u=
0022]#foo`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, \u003cb\u003eWorld\u003c\=
/b\u003e \u0026amp;tc!`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` dir=3D\u0022ltr\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `c \u0026\u0026 alert(\u0022Hello=
, World!\u0022);`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escape sequence not over=
-escaped.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \x26 O\x27Reilly\x2=
1`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World)`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\x26addressee=3D=
(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" targ=
et=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello, World \u0026 O\u0027Reill=
y\u0021`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World)`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `greeting=3DH%69,\u0026addressee=
=3D(World) 2x, https:\/\/<a href=3D"http://golang.org" rel=3D"noreferrer" t=
arget=3D"_blank">golang.org</a>\/favicon.ico 500.5w`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`,foo\/,`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +@@ -253,7 +253,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3eWorld%3c=
%2fb%3e%20%26amp%3btc%21`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert%28%22He=
llo%2c%20World%21%22%29%3b`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Rei=
lly%5cx21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Rei=
lly%5cu0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and parens are es=
caped but %69 is not over-escaped. HTML escaping is done.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;amp;a=
ddressee=3D%28World%29`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%2c%26add=
ressee%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgolang.org" =
rel=3D"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico%20500.5=
w`,<br>
&gt; &gt; +@@ -268,7 +268,7 @@ func TestTypedContent(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`Hello%2c%20%3cb%3eWorld%3c=
%2fb%3e%20%26amp%3btc%21`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`%20dir%3d%22ltr%22`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`c%20%26%26%20alert%28%22He=
llo%2c%20World%21%22%29%3b`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Rei=
lly%5cx21`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `Hello%2c%20World%20%26%20O%27Rei=
lly%5cu0021`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Quotes and parens are es=
caped but %69 is not over-escaped. HTML escaping is not done.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting=3DH%69,&amp;addre=
ssee=3D%28World%29`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`greeting%3dH%2569%2c%26add=
ressee%3d%28World%29%202x%2c%20https%3a%2f%<a href=3D"http://2fgolang.org" =
rel=3D"noreferrer" target=3D"_blank">2fgolang.org</a>%2ffavicon.ico%20500.5=
w`,<br>
&gt; &gt; +diff --git a/src/html/template/escape_test.go b/src/html/templat=
e/escape_test.go<br>
&gt; &gt; +index e72a9ba..c709660 100644<br>
&gt; &gt; +--- a/src/html/template/escape_test.go<br>
&gt; &gt; ++++ b/src/html/template/escape_test.go<br>
&gt; &gt; +@@ -238,7 +238,7 @@ func TestEscape(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;jsStr&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;button onclick=3D&#39;alert(&amp;quot;{{.H}}&=
amp;quot;)&#39;&gt;&quot;,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\x3cHello\x3e&amp;=
quot;)&#39;&gt;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(&amp;quot;\u003cHello\u003e&=
amp;quot;)&#39;&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;badMarshaler&quot;,<br>
&gt; &gt; +@@ -259,7 +259,7 @@ func TestEscape(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;jsRe&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;button onclick=3D&#39;alert(/{{&quot;foo+bar&quot;=
}}/.test(&quot;&quot;))&#39;&gt;`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\x2bbar/.test(&quot;&quo=
t;))&#39;&gt;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&#39;alert(/foo\u002bbar/.test(&quot;&q=
uot;))&#39;&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;jsReBlank&quot;,<br>
&gt; &gt; +@@ -825,7 +825,7 @@ func TestEscapeSet(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;main&quot;:=C2=A0 =C2=
=A0`&lt;button onclick=3D&quot;title=3D&#39;{{template &quot;helper&quot;}}=
&#39;; ...&quot;&gt;{{template &quot;helper&quot;}}&lt;/button&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;helper&quot;: `{{11}}=
 of {{&quot;&lt;100&gt;&quot;}}`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \x3c100\x3e&#3=
9;; ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `&lt;button onclick=3D&quot;title=3D&#39;11 of \u003c100\u003=
e&#39;; ...&quot;&gt;11 of &amp;lt;100&amp;gt;&lt;/button&gt;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// A non-=
recursive template that ends in a different context.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// helper=
 starts in jsCtxRegexp and ends in jsCtxDivOp.<br>
&gt; &gt; +diff --git a/src/html/template/example_test.go b/src/html/templa=
te/example_test.go<br>
&gt; &gt; +index 9d965f1..6cf936f 100644<br>
&gt; &gt; +--- a/src/html/template/example_test.go<br>
&gt; &gt; ++++ b/src/html/template/example_test.go<br>
&gt; &gt; +@@ -116,9 +116,9 @@ func Example_escape() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&am=
p;#39;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.com" targe=
t=3D"_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&am=
p;#39;s Diner&amp;#34; &amp;<a href=3D"mailto:lt%3Btasty@example.com" targe=
t=3D"_blank">lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &amp;#34;Fran &amp;amp; Freddie&am=
p;#39;s Diner&amp;#<a href=3D"mailto:34%3B32%26lt%3Btasty@example.com" targ=
et=3D"_blank">34;32&amp;lt;tasty@example.com</a>&amp;gt;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&=
quot; \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@e=
xample.com</a>\x3E<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&=
quot; \<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@e=
xample.com</a>\x3E<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \x26 Freddie\&#39;s Diner\&=
quot;32\<a href=3D"mailto:x3Ctasty@example.com" target=3D"_blank">x3Ctasty@=
example.com</a>\x3E<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner=
\&quot; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003Ct=
asty@example.com</a>\u003E<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner=
\&quot; \<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003Ct=
asty@example.com</a>\u003E<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // \&quot;Fran \u0026 Freddie\&#39;s Diner=
\&quot;32\<a href=3D"mailto:u003Ctasty@example.com" target=3D"_blank">u003C=
tasty@example.com</a>\u003E<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// %22Fran+%26+Freddie%27s+Diner%2232=
%3Ctasty%<a href=3D"http://40example.com" rel=3D"noreferrer" target=3D"_bla=
nk">40example.com</a>%3E<br>
&gt; &gt; +<br>
&gt; &gt; + }<br>
&gt; &gt; +diff --git a/src/html/template/js.go b/src/html/template/js.go<b=
r>
&gt; &gt; +index 0e91458..ea9c183 100644<br>
&gt; &gt; +--- a/src/html/template/js.go<br>
&gt; &gt; ++++ b/src/html/template/js.go<br>
&gt; &gt; +@@ -163,7 +163,6 @@ func jsValEscaper(args ...interface{}) strin=
g {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: detect cycles before calling=
 Marshal which loops infinitely on<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// cyclic data. This may be an unacce=
ptable DoS risk.<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0b, err :=3D json.Marshal(a)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Put a =
space before comment so that if it is flush against<br>
&gt; &gt; +@@ -178,8 +177,8 @@ func jsValEscaper(args ...interface{}) strin=
g {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: maybe post-process output to=
 prevent it from containing<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &quot;&lt;!--&quot;, &quot;--&gt;&=
quot;, &quot;&lt;![CDATA[&quot;, &quot;]]&gt;&quot;, or &quot;&lt;/script&q=
uot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// in case custom marshalers produce =
output containing those.<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 // TODO: Maybe abbreviate \u00ab to \xab t=
o produce more compact output.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // Note: Do not use \x escaping to save by=
tes because it is not JSON compatible and this escaper<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // supports ld+json content-type.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(b) =3D=3D 0 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// In, `x=
=3Dy/{{.}}*z` a json.Marshaler that produces &quot;&quot; should<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// not ca=
use the output `x=3Dy/*z`.<br>
&gt; &gt; +@@ -260,6 +259,8 @@ func replace(s string, replacementTable []st=
ring) string {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r, w =3D =
utf8.DecodeRuneInString(s[i:])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var repl =
string<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch {<=
br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case int(r) &l=
t; len(lowUnicodeReplacementTable):<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 repl =3D lowUnicodeReplacementTable[r]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case int(=
r) &lt; len(replacementTable) &amp;&amp; replacementTable[r] !=3D &quot;&qu=
ot;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0repl =3D replacementTable[r]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case r =
=3D=3D &#39;\u2028&#39;:<br>
&gt; &gt; +@@ -283,67 +284,80 @@ func replace(s string, replacementTable []=
string) string {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.String()<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++var lowUnicodeReplacementTable =3D []string{<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0: `\u0000`, 1: `\u0001`, 2: `\u0002`, 3: =
`\u0003`, 4: `\u0004`, 5: `\u0005`, 6: `\u0006`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\a&#39;: `\u0007`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\b&#39;: `\u0008`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\t&#39;: `\t`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\n&#39;: `\n`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\u000b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\f&#39;: `\f`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\r&#39;: `\r`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0xe:=C2=A0 `\u000e`, 0xf: `\u000f`, 0x10: =
`\u0010`, 0x11: `\u0011`, 0x12: `\u0012`, 0x13: `\u0013`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0x14: `\u0014`, 0x15: `\u0015`, 0x16: `\u0=
016`, 0x17: `\u0017`, 0x18: `\u0018`, 0x19: `\u0019`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0x1a: `\u001a`, 0x1b: `\u001b`, 0x1c: `\u0=
01c`, 0x1d: `\u001d`, 0x1e: `\u001e`, 0x1f: `\u001f`,<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + var jsStrReplacementTable =3D []string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\0`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\u0000`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\t&#39;: `\t`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;: `\n`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\x0b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\u000b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\f&#39;: `\f`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\r&#39;: `\r`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Encode HTML specials as hex so the=
 output can be embedded<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// in HTML attributes without further=
 encoding.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\x22`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\x26`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\x27`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\x2b`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\u0026`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\u0027`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\x3c`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\x3e`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\u003c`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\u003e`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\\&#39;: `\\`,<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + // jsStrNormReplacementTable is like jsStrReplacementTable but =
does not<br>
&gt; &gt; + // overencode existing escapes since this table has no entry fo=
r `\`.<br>
&gt; &gt; + var jsStrNormReplacementTable =3D []string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\0`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\u0000`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\t&#39;: `\t`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;: `\n`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\x0b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\u000b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\f&#39;: `\f`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\r&#39;: `\r`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Encode HTML specials as hex so the=
 output can be embedded<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// in HTML attributes without further=
 encoding.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\x22`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\x26`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\x27`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\x2b`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\u0026`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\u0027`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\x3c`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\x3e`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\u003c`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\u003e`,<br>
&gt; &gt; + }<br>
&gt; &gt; +-<br>
&gt; &gt; + var jsRegexpReplacementTable =3D []string{<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\0`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 0:=C2=A0 =C2=A0 `\u0000`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\t&#39;: `\t`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\n&#39;: `\n`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\x0b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\v&#39;: `\u000b`, // &quot;\v&quot; =
=3D=3D &quot;v&quot; on IE 6.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\f&#39;: `\f`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\r&#39;: `\r`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Encode HTML specials as hex so the=
 output can be embedded<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// in HTML attributes without further=
 encoding.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\x22`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39;:=C2=A0 `\u0022`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;$&#39;:=C2=A0 `\$`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\x26`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\x27`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&amp;&#39;:=C2=A0 `\u0026`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;\&#39;&#39;: `\u0027`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(&#39;:=C2=A0 `\(`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;)&#39;:=C2=A0 `\)`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*&#39;:=C2=A0 `\*`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\x2b`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-&#39;:=C2=A0 `\-`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.&#39;:=C2=A0 `\.`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\x3c`,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\x3e`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&lt;&#39;:=C2=A0 `\u003c`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;&gt;&#39;:=C2=A0 `\u003e`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;?&#39;:=C2=A0 `\?`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;[&#39;:=C2=A0 `\[`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\\&#39;: `\\`,<br>
&gt; &gt; +diff --git a/src/html/template/js_test.go b/src/html/template/js=
_test.go<br>
&gt; &gt; +index 075adaa..d7ee47b 100644<br>
&gt; &gt; +--- a/src/html/template/js_test.go<br>
&gt; &gt; ++++ b/src/html/template/js_test.go<br>
&gt; &gt; +@@ -137,7 +137,7 @@ func TestJSValEscaper(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o&quot;, `&quot;foo&quot;`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Newlin=
es.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r=
\n\u2028\u2029&quot;, `&quot;\r\n\u2028\u2029&quot;`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;\v&qu=
ot; =3D=3D &quot;v&quot; on IE 6 so use &quot;\x0b&quot; instead.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;\v&qu=
ot; =3D=3D &quot;v&quot; on IE 6 so use &quot;\u000b&quot; instead.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t=
\x0b&quot;, `&quot;\t\u000b&quot;`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{struct{ =
X, Y int }{1, 2}, `{&quot;X&quot;:1,&quot;Y&quot;:2}`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{[]interf=
ace{}{}, &quot;[]&quot;},<br>
&gt; &gt; +@@ -173,7 +173,7 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;&q=
uot;, ``},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o&quot;, `foo`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&=
quot;, `\0`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&=
quot;, `\u0000`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t=
&quot;, `\t`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\n=
&quot;, `\n`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r=
&quot;, `\r`},<br>
&gt; &gt; +@@ -183,14 +183,14 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\\=
n&quot;, `\\n`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o\r\nbar&quot;, `foo\r\nbar`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preser=
ve attribute boundaries.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\x=
22`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\x2=
7`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\u=
0022`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\u0=
027`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Allow =
embedding in HTML without further escaping.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, =
`\x26amp;`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, =
`\u0026amp;`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preven=
t breaking out of text node and element boundaries.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/sc=
ript&gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![C=
DATA[&quot;, `\x3c![CDATA[`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&=
quot;, `]]\x3e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/sc=
ript&gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![C=
DATA[&quot;, `\u003c![CDATA[`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&=
quot;, `]]\u003e`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// <a hre=
f=3D"https://dev.w3.org/html5/markup/aria/syntax.html#escaping-text-span" r=
el=3D"noreferrer" target=3D"_blank">https://dev.w3.org/html5/markup/aria/sy=
ntax.html#escaping-text-span</a><br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =
=C2=A0&quot;The text in style, script, title, and textarea elements<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =
=C2=A0must not have an escaping text span start that is not<br>
&gt; &gt; +@@ -201,11 +201,11 @@ func TestJSStrEscaper(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// allow =
regular text content to be interpreted as script<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// allowi=
ng script execution via a combination of a JS string<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// inject=
ion followed by an HTML text injection.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--=
&quot;, `\x3c!--`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&=
quot;, `--\x3e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--=
&quot;, `\u003c!--`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&=
quot;, `--\u003e`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// From <=
a href=3D"https://code.google.com/p/doctype/wiki/ArticleUtf7" rel=3D"norefe=
rrer" target=3D"_blank">https://code.google.com/p/doctype/wiki/ArticleUtf7<=
/a><br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;+A=
Dw-script+AD4-alert(1)+ADw-/script+AD4-&quot;,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `\x2bADw-script\x2bAD4-alert(1)\x2bADw-\/script\x2bAD4-`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `\u002bADw-script\u002bAD4-alert(1)\u002bADw-\/script\u002bAD=
4-`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Invali=
d UTF-8 sequence<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o\xA0bar&quot;, &quot;foo\xA0bar&quot;},<br>
&gt; &gt; +@@ -228,7 +228,7 @@ func TestJSRegexpEscaper(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;&q=
uot;, `(?:)`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o&quot;, `foo`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&=
quot;, `\0`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;\u0000&=
quot;, `\u0000`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\t=
&quot;, `\t`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\n=
&quot;, `\n`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\r=
&quot;, `\r`},<br>
&gt; &gt; +@@ -238,19 +238,19 @@ func TestJSRegexpEscaper(t *testing.T) {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;\\=
n&quot;, `\\n`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;fo=
o\r\nbar&quot;, `foo\r\nbar`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preser=
ve attribute boundaries.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\x=
22`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\x2=
7`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&quot;`, `\u=
0022`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&#39;`, `\u0=
027`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Allow =
embedding in HTML without further escaping.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, =
`\x26amp;`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;amp;`, =
`\u0026amp;`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Preven=
t breaking out of text node and element boundaries.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/sc=
ript&gt;&quot;, `\x3c\/script\x3e`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![C=
DATA[&quot;, `\x3c!\[CDATA\[`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&=
quot;, `\]\]\x3e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;/sc=
ript&gt;&quot;, `\u003c\/script\u003e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;![C=
DATA[&quot;, `\u003c!\[CDATA\[`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;]]&gt;&=
quot;, `\]\]\u003e`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Escapi=
ng text spans.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--=
&quot;, `\x3c!\-\-`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&=
quot;, `\-\-\x3e`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;&lt;!--=
&quot;, `\u003c!\-\-`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;--&gt;&=
quot;, `\-\-\u003e`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;*&=
quot;, `\*`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;+&quot;=
, `\x2b`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;+&quot;=
, `\u002b`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;?&=
quot;, `\?`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;[]=
(){}&quot;, `\[\]\(\)\{\}`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;$f=
oo|x.y&quot;, `\$foo\|x\.y`},<br>
&gt; &gt; +@@ -284,27 +284,27 @@ func TestEscapersOnLower7AndSelectHighCode=
points(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;jsStrEscaper&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0jsStrEscaper,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\\f\\r\x0E\x=
0F&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13\x14\x15\x1=
6\x17&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b\x1c\x1d\x1=
e\x1f&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#$%\x26\x27()*\x2b,-.\/` +=
<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x3e?` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\u000e\u000f=
` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0013\u0014\u=
0015\u0016\u0017` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u001b\u001c\u=
001d\u001e\u001f` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#$%\u0026\u0027()*\u002b=
,-.\/` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D\u003e?` +<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_` +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijklmno&quot=
; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\x7f&quot; +=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pqrstuvwxyz{|}~\u007f&quot;=
 +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\\u2028\\=
u2029\ufeff\U0001D11E&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;jsRegexpEscaper&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0jsRegexpEscaper,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;\\0\x01\x02\x03\x04\x05\x06\x07&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x08\\t\\n\\x0b\\f\\r\x0E\x=
0F&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x10\x11\x12\x13\x14\x15\x1=
6\x17&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\x18\x19\x1a\x1b\x1c\x1d\x1=
e\x1f&quot; +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\x22#\$%\x26\x27\(\)\*\x2b,\-\=
.\/` +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\x3c=3D\x3e\?` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0008\t\n\u000b\f\r\u000e\u000f=
` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0010\u0011\u0012\u0013\u0014\u=
0015\u0016\u0017` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `\u0018\u0019\u001a\u001b\u001c\u=
001d\u001e\u001f` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ` !\u0022#\$%\u0026\u0027\(\)\*\u=
002b,\-\.\/` +<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 `0123456789:;\u003c=3D\u003e\?` +=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ\[\\\]\^_` +<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;`abcdefghijklmno&quot=
; +<br>
&gt; &gt; +diff --git a/src/html/template/template_test.go b/src/html/templ=
ate/template_test.go<br>
&gt; &gt; +index 13e6ba4..86bd4db 100644<br>
&gt; &gt; +--- a/src/html/template/template_test.go<br>
&gt; &gt; ++++ b/src/html/template/template_test.go<br>
&gt; &gt; +@@ -6,6 +6,7 @@ package template_test<br>
&gt; &gt; +<br>
&gt; &gt; + import (<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;encoding/json&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. &quot;html/template&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;strings&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;testing&quot;<br>
&gt; &gt; +@@ -121,6 +122,44 @@ func TestNumbers(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0c.mustExecute(c.root, nil, &quot;12.3=
4 7.5&quot;)<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped=
(t *testing.T) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // See #33671 and #37634 for more context =
on this.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 tests :=3D []struct{ name, in string }{<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;empty&q=
uot;, &quot;&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;invalid=
&quot;, string(rune(-1))},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;null&qu=
ot;, &quot;\u0000&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;unit se=
parator&quot;, &quot;\u001F&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;tab&quo=
t;, &quot;\t&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;gt and =
lt&quot;, &quot;&lt;&gt;&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;quotes&=
quot;, `&#39;&quot;`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;ASCII l=
etters&quot;, &quot;ASCII letters&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Unicode=
&quot;, &quot;=CA=95=E2=8A=99=CF=96=E2=8A=99=CA=94&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;Pizza&q=
uot;, &quot;=F0=9F=8D=95&quot;},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 const (<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D `&l=
t;script type=3D&quot;application/ld+json&quot;&gt;`<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D `&l=
t;/script&gt;`<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 templ=C2=A0 =
=3D prefix + `&quot;{{.}}&quot;` + suffix<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 tpl :=3D Must(New(&quot;JS string is JSON =
string&quot;).Parse(templ))<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 for _, tt :=3D range tests {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(<a href=
=3D"http://tt.name" rel=3D"noreferrer" target=3D"_blank">tt.name</a>, func(=
t *testing.T) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 var buf bytes.Buffer<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if err :=3D tpl.Execute(&amp;buf, <a href=3D"http://tt.in" re=
l=3D"noreferrer" target=3D"_blank">tt.in</a>); err !=3D nil {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot render temp=
late: %v&quot;, err)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 trimmed :=3D bytes.TrimSuffix(bytes.TrimPrefix(buf.Bytes(), [=
]byte(prefix)), []byte(suffix))<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 var got string<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if err :=3D json.Unmarshal(trimmed, &amp;got); err !=3D nil {=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;Cannot parse JS st=
ring %q as JSON: %v&quot;, trimmed[1:len(trimmed)-1], err)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if got !=3D <a href=3D"http://tt.in" rel=3D"noreferrer" targe=
t=3D"_blank">tt.in</a> {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Errorf(&quot;Serialization chan=
ged the string value: got %q want %q&quot;, got, <a href=3D"http://tt.in" r=
el=3D"noreferrer" target=3D"_blank">tt.in</a>)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + type testCase struct {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0t=C2=A0 =C2=A0 *testing.T<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0root *Template<br>
&gt; &gt; +diff --git a/src/text/template/exec_test.go b/src/text/template/=
exec_test.go<br>
&gt; &gt; +index 77294ed..b8a809e 100644<br>
&gt; &gt; +--- a/src/text/template/exec_test.go<br>
&gt; &gt; ++++ b/src/text/template/exec_test.go<br>
&gt; &gt; +@@ -911,9 +911,9 @@ func TestJSEscaping(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{`Go &quo=
t;jump&quot; \`, `Go \&quot;jump\&quot; \\`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{`Yukihir=
o says &quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C&quot;`, `Yukihir=
o says \&quot;=E4=BB=8A=E6=97=A5=E3=81=AF=E4=B8=96=E7=95=8C\&quot;`},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;un=
printable \uFDFF&quot;, `unprintable \uFDFF`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt;html&gt;=
`, `\x3Chtml\x3E`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =3D in at=
tributes`, `no \x3D in attributes`},<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;#x27; d=
oes not become HTML entity`, `\x26#x27; does not become HTML entity`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&lt;html&gt;=
`, `\u003Chtml\u003E`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`no =3D in at=
tributes`, `no \u003D in attributes`},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {`&amp;#x27; d=
oes not become HTML entity`, `\u0026#x27; does not become HTML entity`},<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, tc :=3D range testCases {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s :=3D JS=
EscapeString(<a href=3D"http://tc.in" rel=3D"noreferrer" target=3D"_blank">=
tc.in</a>)<br>
&gt; &gt; +diff --git a/src/text/template/funcs.go b/src/text/template/func=
s.go<br>
&gt; &gt; +index 46125bc..f3de9fb 100644<br>
&gt; &gt; +--- a/src/text/template/funcs.go<br>
&gt; &gt; ++++ b/src/text/template/funcs.go<br>
&gt; &gt; +@@ -640,10 +640,10 @@ var (<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0jsBackslash =3D []byte(`\\`)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0jsApos=C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\&#39;`)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0jsQuot=C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\&quot;`)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 jsLt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\x3C`)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 jsGt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\x3E`)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 jsAmp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D []byte=
(`\x26`)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 jsEq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\x3D`)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 jsLt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\u003C`)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 jsGt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\u003E`)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 jsAmp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D []byte=
(`\u0026`)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 jsEq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D []byte=
(`\u003D`)<br>
&gt; &gt; + )<br>
&gt; &gt; +<br>
&gt; &gt; + // JSEscape writes to w the escaped JavaScript equivalent of th=
e plain text data b.<br>
&gt; &gt; +--<br>
&gt; &gt; +2.7.4<br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.pa=
tch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..5f5a2d9<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch<br>
&gt; &gt; @@ -0,0 +1,371 @@<br>
&gt; &gt; +From 576db9a3262931fcda4dbf1b78b56d4565a5ad3f Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@google.co=
m" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 20 Mar 2023 11:01:13 -0700<br>
&gt; &gt; +Subject: [PATCH 2/2] html/template: disallow actions in JS templ=
ate literals<br>
&gt; &gt; +<br>
&gt; &gt; +ECMAScript 6 introduced template literals[0][1] which are delimi=
ted with<br>
&gt; &gt; +backticks. These need to be escaped in a similar fashion to the<=
br>
&gt; &gt; +delimiters for other string literals. Additionally template lite=
rals can<br>
&gt; &gt; +contain special syntax for string interpolation.<br>
&gt; &gt; +<br>
&gt; &gt; +There is no clear way to allow safe insertion of actions within =
JS<br>
&gt; &gt; +template literals, as handling (JS) string interpolation inside =
of these<br>
&gt; &gt; +literals is rather complex. As such we&#39;ve chosen to simply d=
isallow<br>
&gt; &gt; +template actions within these template literals.<br>
&gt; &gt; +<br>
&gt; &gt; +A new error code is added for this parsing failure case, errJsTm=
plLit,<br>
&gt; &gt; +but it is unexported as it is not backwards compatible with othe=
r minor<br>
&gt; &gt; +release versions to introduce an API change in a minor release. =
We will<br>
&gt; &gt; +export this code in the next major release.<br>
&gt; &gt; +<br>
&gt; &gt; +The previous behavior (with the cavet that backticks are now esc=
aped<br>
&gt; &gt; +properly) can be re-enabled with GODEBUG=3Djstmpllitinterp=3D1.<=
br>
&gt; &gt; +<br>
&gt; &gt; +This change subsumes CL471455.<br>
&gt; &gt; +<br>
&gt; &gt; +Thanks to Sohom Datta, Manipal Institute of Technology, for repo=
rting<br>
&gt; &gt; +this issue.<br>
&gt; &gt; +<br>
&gt; &gt; +Fixes CVE-2023-24538<br>
&gt; &gt; +For #59234<br>
&gt; &gt; +Fixes #59271<br>
&gt; &gt; +<br>
&gt; &gt; +[0] <a href=3D"https://tc39.es/ecma262/multipage/ecmascript-lang=
uage-expressions.html#sec-template-literals" rel=3D"noreferrer" target=3D"_=
blank">https://tc39.es/ecma262/multipage/ecmascript-language-expressions.ht=
ml#sec-template-literals</a><br>
&gt; &gt; +[1] <a href=3D"https://developer.mozilla.org/en-US/docs/Web/Java=
Script/Reference/Template_literals" rel=3D"noreferrer" target=3D"_blank">ht=
tps://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_li=
terals</a><br>
&gt; &gt; +<br>
&gt; &gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/=
c/golang/go-private/+/1802457" rel=3D"noreferrer" target=3D"_blank">https:/=
/team-review.git.corp.google.com/c/golang/go-private/+/1802457</a><br>
&gt; &gt; +Reviewed-by: Damien Neil &lt;<a href=3D"mailto:dneil@google.com"=
 target=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; &gt; +Run-TryBot: Damien Neil &lt;<a href=3D"mailto:dneil@google.com" =
target=3D"_blank">dneil@google.com</a>&gt;<br>
&gt; &gt; +Reviewed-by: Julie Qiu &lt;<a href=3D"mailto:julieqiu@google.com=
" target=3D"_blank">julieqiu@google.com</a>&gt;<br>
&gt; &gt; +Reviewed-by: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@go=
ogle.com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; &gt; +Reviewed-on: <a href=3D"https://team-review.git.corp.google.com/=
c/golang/go-private/+/1802612" rel=3D"noreferrer" target=3D"_blank">https:/=
/team-review.git.corp.google.com/c/golang/go-private/+/1802612</a><br>
&gt; &gt; +Run-TryBot: Roland Shoemaker &lt;<a href=3D"mailto:bracewell@goo=
gle.com" target=3D"_blank">bracewell@google.com</a>&gt;<br>
&gt; &gt; +Change-Id: Ic7f10595615f2b2740d9c85ad7ef40dc0e78c04c<br>
&gt; &gt; +Reviewed-on: <a href=3D"https://go-review.googlesource.com/c/go/=
+/481987" rel=3D"noreferrer" target=3D"_blank">https://go-review.googlesour=
ce.com/c/go/+/481987</a><br>
&gt; &gt; +Auto-Submit: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@goog=
le.com" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
&gt; &gt; +TryBot-Result: Gopher Robot &lt;<a href=3D"mailto:gobot@golang.o=
rg" target=3D"_blank">gobot@golang.org</a>&gt;<br>
&gt; &gt; +Run-TryBot: Michael Knyszek &lt;<a href=3D"mailto:mknyszek@googl=
e.com" target=3D"_blank">mknyszek@google.com</a>&gt;<br>
&gt; &gt; +Reviewed-by: Matthew Dempsky &lt;<a href=3D"mailto:mdempsky@goog=
le.com" target=3D"_blank">mdempsky@google.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport from <a href=3D"https://github.com/gol=
ang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/golang/go/commit/b1e3ecfa06b67014429a1=
97ec5e134ce4303ad9b</a><br>
&gt; &gt; +CVE: CVE-2023-24538<br>
&gt; &gt; +Signed-off-by: Shubham Kulkarni &lt;<a href=3D"mailto:skulkarni@=
mvista.com" target=3D"_blank">skulkarni@mvista.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + src/html/template/context.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<b=
r>
&gt; &gt; + src/html/template/error.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 ++++=
++++<br>
&gt; &gt; + src/html/template/escape.go=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++=
+++<br>
&gt; &gt; + src/html/template/escape_test.go=C2=A0 | 66 +++++++++++++++++++=
+++-----------------<br>
&gt; &gt; + src/html/template/js.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
&gt; &gt; + src/html/template/js_test.go=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
&gt; &gt; + src/html/template/jsctx_string.go |=C2=A0 9 ++++++<br>
&gt; &gt; + src/html/template/state_string.go | 37 ++++++++++++++++++++--<b=
r>
&gt; &gt; + src/html/template/transition.go=C2=A0 =C2=A0|=C2=A0 7 ++++-<br>
&gt; &gt; + 9 files changed, 116 insertions(+), 33 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/html/template/context.go b/src/html/template/co=
ntext.go<br>
&gt; &gt; +index f7d4849..0b65313 100644<br>
&gt; &gt; +--- a/src/html/template/context.go<br>
&gt; &gt; ++++ b/src/html/template/context.go<br>
&gt; &gt; +@@ -116,6 +116,8 @@ const (<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSDqStr<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateJSSqStr occurs inside a JavaS=
cript single quoted string.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSSqStr<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // stateJSBqStr occurs inside a JavaScript=
 back quoted string.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSBqStr<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateJSRegexp occurs inside a Java=
Script regexp literal.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSRegexp<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// stateJSBlockCmt occurs inside a Ja=
vaScript /* block comment */.<br>
&gt; &gt; +diff --git a/src/html/template/error.go b/src/html/template/erro=
r.go<br>
&gt; &gt; +index 0e52706..fd26b64 100644<br>
&gt; &gt; +--- a/src/html/template/error.go<br>
&gt; &gt; ++++ b/src/html/template/error.go<br>
&gt; &gt; +@@ -211,6 +211,19 @@ const (<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0pipeline occurs in an =
unquoted attribute value context, &quot;html&quot; is<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0disallowed. Avoid usin=
g &quot;html&quot; and &quot;urlquery&quot; entirely in new templates.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ErrPredefinedEscaper<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // errJSTmplLit: &quot;... appears in a JS=
 template literal&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // Example:<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0&lt;script&gt;var tm=
pl =3D `{{.Interp}`&lt;/script&gt;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // Discussion:<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0Package html/template does =
not support actions inside of JS template<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0literals.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 //<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // TODO(rolandshoemaker): we cannot add th=
is as an exported error in a minor<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // release, since it is backwards incompat=
ible with the other minor<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // releases. As such we need to leave it u=
nexported, and then we&#39;ll add it<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // in the next major release.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 errJSTmplLit<br>
&gt; &gt; + )<br>
&gt; &gt; +<br>
&gt; &gt; + func (e *Error) Error() string {<br>
&gt; &gt; +diff --git a/src/html/template/escape.go b/src/html/template/esc=
ape.go<br>
&gt; &gt; +index f12dafa..29ca5b3 100644<br>
&gt; &gt; +--- a/src/html/template/escape.go<br>
&gt; &gt; ++++ b/src/html/template/escape.go<br>
&gt; &gt; +@@ -8,6 +8,7 @@ import (<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bytes&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fmt&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;html&quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;internal/godebug&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;io&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;text/template/parse&quot;<br>
&gt; &gt; +@@ -203,6 +204,16 @@ func (e *escaper) escapeAction(c context, n=
 *parse.ActionNode) context {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.jsCtx =
=3D jsCtxDivOp<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSDqStr, stateJSSqStr:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D app=
end(s, &quot;_html_template_jsstrescaper&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 case stateJSBqStr:<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debugAllowActi=
onJSTmpl :=3D godebug.Get(&quot;jstmpllitinterp&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debugAllowA=
ctionJSTmpl =3D=3D &quot;1&quot; {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 s =3D append(s, &quot;_html_template_jsstrescaper&quot;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return context{<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state: stateError,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err:=C2=A0 =C2=A0errorf(errJSTmpl=
Lit, n, n.Line, &quot;%s appears in a JS template literal&quot;, n),<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSRegexp:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D app=
end(s, &quot;_html_template_jsregexpescaper&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateCSS:<br>
&gt; &gt; +diff --git a/src/html/template/escape_test.go b/src/html/templat=
e/escape_test.go<br>
&gt; &gt; +index c709660..807aabd 100644<br>
&gt; &gt; +--- a/src/html/template/escape_test.go<br>
&gt; &gt; ++++ b/src/html/template/escape_test.go<br>
&gt; &gt; +@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl :=3D New(=
<a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name=
</a>)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpl =3D Must(=
tmpl.Parse(test.input))<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Check for b=
ug 6459: Tree field was not set in Parse.<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=
=3D tmpl.text.Tree {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: tree not set properly&quot;, <a href=3D"ht=
tp://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b :=3D new(byt=
es.Buffer)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tm=
pl.Execute(b, data); err !=3D nil {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed: %s&quot;, <a hr=
ef=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>,=
 err)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D t=
est.output, b.String(); w !=3D g {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: escaped output: want\n\t%q\ngot\n\t%q&quot=
;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.n=
ame</a>, w, g)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b.Reset()<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D tm=
pl.Execute(b, pdata); err !=3D nil {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: template execution failed for pointer: %s&=
quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">te=
st.name</a>, err)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if w, g :=3D t=
est.output, b.String(); w !=3D g {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: escaped output for pointer: want\n\t%q\ngo=
t\n\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_b=
lank">test.name</a>, w, g)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tmpl.Tree !=
=3D tmpl.text.Tree {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 t.Errorf(&quot;%s: tree mismatch&quot;, <a href=3D"http://tes=
t.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>)<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 continue<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Run(<a href=
=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">test.name</a>, f=
unc(t *testing.T) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tmpl :=3D New(<a href=3D"http://test.name" rel=3D"noreferrer"=
 target=3D"_blank">test.name</a>)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tmpl =3D Must(tmpl.Parse(test.input))<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 // Check for bug 6459: Tree field was not set in Parse.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tree not set p=
roperly&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_b=
lank">test.name</a>)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 b :=3D new(strings.Builder)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if err :=3D tmpl.Execute(b, data); err !=3D nil {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: template execu=
tion failed: %s&quot;, <a href=3D"http://test.name" rel=3D"noreferrer" targ=
et=3D"_blank">test.name</a>, err)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: escaped output=
: want\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=3D"noreferr=
er" target=3D"_blank">test.name</a>, w, g)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 b.Reset()<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if err :=3D tmpl.Execute(b, pdata); err !=3D nil {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: template execu=
tion failed for pointer: %s&quot;, <a href=3D"http://test.name" rel=3D"nore=
ferrer" target=3D"_blank">test.name</a>, err)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if w, g :=3D test.output, b.String(); w !=3D g {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: escaped output=
 for pointer: want\n\t%q\ngot\n\t%q&quot;, <a href=3D"http://test.name" rel=
=3D"noreferrer" target=3D"_blank">test.name</a>, w, g)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if tmpl.Tree !=3D tmpl.text.Tree {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.Fatalf(&quot;%s: tree mismatch&=
quot;, <a href=3D"http://test.name" rel=3D"noreferrer" target=3D"_blank">te=
st.name</a>)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -920,6 +916,10 @@ func TestErrors(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&lt;a href=3D&#39;/foo?{{range .Items}}&amp;{{.K}=
}=3D{{.V}}{{end}}&#39;&gt;&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;var a =3D `${a+b}`&lt;/script&gt;`&quot;,=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Error =
cases.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;{{if .Cond}}&lt;a{{end}}&quot;,<br>
&gt; &gt; +@@ -1058,6 +1058,10 @@ func TestErrors(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0// html is allowed since it is the last command in the =
pipeline, but urlquery is not.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`predefined escaper &quot;urlquery&quot; disallowed in =
template`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;script&gt;var tmpl =3D `asd {{.}}`;&lt;/script&gt;&=
quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `{{.}} appears in a JS template literal`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, test :=3D range tests {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf :=3D =
new(bytes.Buffer)<br>
&gt; &gt; +@@ -1280,6 +1284,10 @@ func TestEscapeText(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDoubleQuote, a=
ttr: attrScript},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;&lt;a onclick=3D\&quot;`foo&quot;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 context{state: stateJSBqStr, delim: delimDoubleQuote, attr: a=
ttrScript},<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0`&lt;A ONCLICK=3D&quot;&#39;`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0context{state: stateJSSqStr, delim: delimDoubleQuote, a=
ttr: attrScript},<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +diff --git a/src/html/template/js.go b/src/html/template/js.go<b=
r>
&gt; &gt; +index ea9c183..b888eaf 100644<br>
&gt; &gt; +--- a/src/html/template/js.go<br>
&gt; &gt; ++++ b/src/html/template/js.go<br>
&gt; &gt; +@@ -308,6 +308,7 @@ var jsStrReplacementTable =3D []string{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// Encode HTML specials as hex so the=
 output can be embedded<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// in HTML attributes without further=
 encoding.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&quot;&#39;:=C2=A0 `\u0022`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;`&#39;:=C2=A0 `\u0060`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&amp;&#39;:=C2=A0 `\u0026`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\&#39;&#39;: `\u0027`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt; &gt; +@@ -331,6 +332,7 @@ var jsStrNormReplacementTable =3D []string{<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&quot;&#39;:=C2=A0 `\u0022`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&amp;&#39;:=C2=A0 `\u0026`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;\&#39;&#39;: `\u0027`,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;`&#39;:=C2=A0 `\u0060`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;+&#39;:=C2=A0 `\u002b`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;/&#39;:=C2=A0 `\/`,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&lt;&#39;:=C2=A0 `\u003c`,<br>
&gt; &gt; +diff --git a/src/html/template/js_test.go b/src/html/template/js=
_test.go<br>
&gt; &gt; +index d7ee47b..7d963ae 100644<br>
&gt; &gt; +--- a/src/html/template/js_test.go<br>
&gt; &gt; ++++ b/src/html/template/js_test.go<br>
&gt; &gt; +@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepo=
ints(t *testing.T) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`0123456789:;\u003c=3D\u003=
e?` +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`@ABCDEFGHIJKLMNO` +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`PQRSTUVWXYZ[\\]^_` +<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`abcdefghijklmno&quot; +<br=
>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\u0060abcdefghijklmno&quot=
; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pqrstuvwxyz{|}~\u007f=
&quot; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\u00A0\u0100\\u2028\\=
u2029\ufeff\U0001D11E&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt; +diff --git a/src/html/template/jsctx_string.go b/src/html/templa=
te/jsctx_string.go<br>
&gt; &gt; +index dd1d87e..2394893 100644<br>
&gt; &gt; +--- a/src/html/template/jsctx_string.go<br>
&gt; &gt; ++++ b/src/html/template/jsctx_string.go<br>
&gt; &gt; +@@ -4,6 +4,15 @@ package template<br>
&gt; &gt; +<br>
&gt; &gt; + import &quot;strconv&quot;<br>
&gt; &gt; +<br>
&gt; &gt; ++func _() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // An &quot;invalid array index&quot; comp=
iler error signifies that the constant values have changed.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // Re-run the stringer command to generate=
 them again.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 var x [1]struct{}<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[jsCtxRegexp-0]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[jsCtxDivOp-1]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[jsCtxUnknown-2]<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + const _jsCtx_name =3D &quot;jsCtxRegexpjsCtxDivOpjsCtxUnknown&q=
uot;<br>
&gt; &gt; +<br>
&gt; &gt; + var _jsCtx_index =3D [...]uint8{0, 11, 21, 33}<br>
&gt; &gt; +diff --git a/src/html/template/state_string.go b/src/html/templa=
te/state_string.go<br>
&gt; &gt; +index 05104be..6fb1a6e 100644<br>
&gt; &gt; +--- a/src/html/template/state_string.go<br>
&gt; &gt; ++++ b/src/html/template/state_string.go<br>
&gt; &gt; +@@ -4,9 +4,42 @@ package template<br>
&gt; &gt; +<br>
&gt; &gt; + import &quot;strconv&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +-const _state_name =3D &quot;stateTextstateTagstateAttrNamestate=
AfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcse=
tstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmts=
tateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstate=
CSSBlockCmtstateCSSLineCmtstateError&quot;<br>
&gt; &gt; ++func _() {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // An &quot;invalid array index&quot; comp=
iler error signifies that the constant values have changed.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 // Re-run the stringer command to generate=
 them again.<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 var x [1]struct{}<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateText-0]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateTag-1]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttrName-2]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAfterName-3]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateBeforeValue-4]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateHTMLCmt-5]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateRCDATA-6]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateAttr-7]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateURL-8]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateSrcset-9]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJS-10]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSDqStr-11]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSSqStr-12]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBqStr-13]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSRegexp-14]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSBlockCmt-15]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateJSLineCmt-16]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSS-17]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqStr-18]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqStr-19]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSDqURL-20]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSSqURL-21]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSURL-22]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSBlockCmt-23]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateCSSLineCmt-24]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateError-25]<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 _ =3D x[stateDead-26]<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++const _state_name =3D &quot;stateTextstateTagstateAttrNamestate=
AfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcse=
tstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtsta=
teJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstat=
eCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +-var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, =
92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 2=
71, 286, 296}<br>
&gt; &gt; ++var _state_index =3D [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, =
92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 2=
67, 283, 298, 308, 317}<br>
&gt; &gt; +<br>
&gt; &gt; + func (i state) String() string {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i &gt;=3D state(len(_state_index)-=
1) {<br>
&gt; &gt; +diff --git a/src/html/template/transition.go b/src/html/template=
/transition.go<br>
&gt; &gt; +index 06df679..92eb351 100644<br>
&gt; &gt; +--- a/src/html/template/transition.go<br>
&gt; &gt; ++++ b/src/html/template/transition.go<br>
&gt; &gt; +@@ -27,6 +27,7 @@ var transitionFunc =3D [...]func(context, []by=
te) (context, int){<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tJS,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSDqStr:=C2=A0 =C2=A0 =C2=A0tJSD=
elimited,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSSqStr:=C2=A0 =C2=A0 =C2=A0tJSD=
elimited,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 stateJSBqStr:=C2=A0 =C2=A0 =C2=A0tJSDelimi=
ted,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSRegexp:=C2=A0 =C2=A0 tJSDelimi=
ted,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSBlockCmt:=C2=A0 tBlockCmt,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stateJSLineCmt:=C2=A0 =C2=A0tLineCmt,=
<br>
&gt; &gt; +@@ -262,7 +263,7 @@ func tURL(c context, s []byte) (context, int=
) {<br>
&gt; &gt; +<br>
&gt; &gt; + // tJS is the context transition function for the JS state.<br>
&gt; &gt; + func tJS(c context, s []byte) (context, int) {<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, `&quot;&#39;/`)<b=
r>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 i :=3D bytes.IndexAny(s, &quot;\&quot;`&#3=
9;/&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if i =3D=3D -1 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Entire=
 input is non string, comment, regexp tokens.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.jsCtx =
=3D nextJSCtx(s, c.jsCtx)<br>
&gt; &gt; +@@ -274,6 +275,8 @@ func tJS(c context, s []byte) (context, int)=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.state, =
c.jsCtx =3D stateJSDqStr, jsCtxRegexp<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;\&#39;&#39;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.state, =
c.jsCtx =3D stateJSSqStr, jsCtxRegexp<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 case &#39;`&#39;:<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.state, c.jsC=
tx =3D stateJSBqStr, jsCtxRegexp<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;/&#39;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch {<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case i+1 =
&lt; len(s) &amp;&amp; s[i+1] =3D=3D &#39;/&#39;:<br>
&gt; &gt; +@@ -303,6 +306,8 @@ func tJSDelimited(c context, s []byte) (cont=
ext, int) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch c.state {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSSqStr:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specials =
=3D `\&#39;`<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 case stateJSBqStr:<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specials =3D &=
quot;`\\&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case stateJSRegexp:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specials =
=3D `\/[]`<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +--<br>
&gt; &gt; +2.7.4<br>
&gt; &gt; --<br>
&gt; &gt; 2.7.4<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180361): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180361" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180361</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98464668=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98464668/3620601</a><br>
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

--000000000000e917b705fa362e51--

