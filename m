Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCC76FF93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:14:55 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d62so6956160iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ojX2TnAYrhxDA9LgVUEbHw3Z9LdT7s2MYSlp94qMoF8=;
	b=FX4wCd14eI4HJzyNRnHkCczN3q13AegfBUMnzVkl6suA1ySFpcMs7qq7wUhcj2bMt8
	ABYDRixjwCUO9fChoLN4ERyDjkEJlzVTOj4EEmOi2TVhNOVNeAAQfHfL3FX3BSwjiBtX
	WBdJ0ZZzEIccskyxd+Sghy5J+uNMV0GijbzlQJsGjIsxcKcOdNLSGW0mvZNwCOhHwiS+
	nP96KtrqhMu5j083toj4k/fpM4pS3BTU4k5ThdBn3UySK+O/xquy2uLw42rPMLOWKT75
	Ujb6tp6Mb1JPadqL69y6h1hh7fXWodLnBs3bfR6juW/4qu8veisdZGtg1vhIX5ge2cPS
	URgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ojX2TnAYrhxDA9LgVUEbHw3Z9LdT7s2MYSlp94qMoF8=;
	b=LJAQsU2SUd6ptW6DfTanxLGKrdz82ecGkgM2sEafY56H01NvBkC3VnBu/Ijf+JCWID
	+IZXIRR3WFeInV8nFrXVf35Y8BS7Qd07wTsKfg0hKuhbehCUoLW+Qfg+vHi65EWna23C
	M1VAgFsjKc87FHHHKSVv97zsSb8zS7qI2nceuGf17wmD+eO27YqgttblZYlf1P0U4Axc
	QrHKWLf5xqHCQGcwDJJ0+2WkpIbtoPL4K/QZuoKgMF4umH2shr73NzlfHNuy/75PYSM4
	swezeqTPKnXBTze9vYVGkxRlIVKLYVYBEI6GjQ6gwgPb9RiNq7vXx7cnWId+4GLoYKnO
	nhbw==
X-Gm-Message-State: AOPr4FX42OKLLc5tgGk/COOsmyBmQdqD703OYuv1JHii5rAJSlBVdfwMF8zD9EJ4vBRt+oBwVHEukmUHQRh/Pw==
X-Received: by 10.107.2.70 with SMTP id 67mr4445823ioc.70.1462986896220; Wed,
	11 May 2016 10:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
	<b5bb8c60-377b-8885-54e8-aecdde4b94db@windriver.com>
In-Reply-To: <b5bb8c60-377b-8885-54e8-aecdde4b94db@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 11 May 2016 17:14:46 +0000
Message-ID: <CABcZANmj9PDNgLamFtJLyJ9CSBPC8u5Onpk_=mqhkwbdGbuxaw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Wed, 11 May 2016 17:14:57 -0000
Content-Type: multipart/alternative; boundary=001a1139681442ad5f0532942e71

--001a1139681442ad5f0532942e71
Content-Type: text/plain; charset=UTF-8

Hmm, interesting. It doesn't actually appear to be using LDFLAGS from the
environment at all just now. I'll take another look. Thanks.
On Wed, May 11, 2016 at 9:33 AM Mark Hatle <mark.hatle@windriver.com> wrote:

> On 5/11/16 11:25 AM, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  .../pseudo/pseudo/obey-ldflags.patch               | 48
> ++++++++++++++++++++++
> >  meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       | 16 ++++----
> >  2 files changed, 56 insertions(+), 8 deletions(-)
> >  create mode 100644
> meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
> >
> > diff --git a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
> b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
> > new file mode 100644
> > index 0000000..7e4c629
> > --- /dev/null
> > +++ b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
> > @@ -0,0 +1,48 @@
> > +From 0ace81a687355a3c55caa161b51972a82f5c413f Mon Sep 17 00:00:00 2001
> > +From: Christopher Larson <chris_larson@mentor.com>
> > +Date: Mon, 9 May 2016 17:00:57 -0700
> > +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +---
> > + Makefile.in | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 6511814..22ef625 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -109,26 +109,26 @@ pseudo: $(PSEUDO)
> > + $(PSEUDO): $(BIN) pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o
> pseudo_server.o pseudo_ipc.o
> > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \
> > +             pseudo.o pseudo_server.o pseudo_client.o pseudo_ipc.o \
> > +-            $(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
> > ++            $(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS)
> $(CLIENT_LDFLAGS)
>
> I may be wrong, but I thought the 'client_ldflags' was supposed to inherit
> the
> LDFLAGS, allowing them to be sanitized.
>
> The issue was that pseudo was in a strange situation where it may have to
> build
> both 32-bit and 64-bit clients in order to function properly.
>
> (Perhaps my memory is out of date and it's no longer a concern?)
>
> --Mark
>
> > +
> > + pseudolog: $(PSEUDOLOG)
> > +
> > + $(PSEUDOLOG): $(BIN) pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o
> pseudo_ipc.o
> > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) pseudolog.o
> pseudo_client.o pseudo_ipc.o \
> > +-            $(DBOBJS) $(SHOBJS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)
> > ++            $(DBOBJS) $(SHOBJS) $(LDFLAGS) $(DB_LDFLAGS)
> $(CLIENT_LDFLAGS)
> > +
> > + pseudodb: $(PSEUDODB)
> > +
> > + $(PSEUDODB): $(BIN) pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o
> > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDODB) pseudodb.o \
> > +-            $(DBOBJS) $(SHOBJS) pseudo_ipc.o $(DB_LDFLAGS)
> $(CLIENT_LDFLAGS)
> > ++            $(DBOBJS) $(SHOBJS) pseudo_ipc.o $(LDFLAGS) $(DB_LDFLAGS)
> $(CLIENT_LDFLAGS)
> > +
> > + libpseudo: $(LIBPSEUDO)
> > +
> > + $(LIBPSEUDO): $(LIB) $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOBJS)
> > +     $(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
> > +             pseudo_client.o pseudo_ipc.o \
> > +-            $(WRAPOBJS) $(SHOBJS) $(CLIENT_LDFLAGS)
> > ++            $(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
> > +
> > + # *everything* now relies on stuff that's generated in the
> > + # wrapper process.
> > +--
> > +2.8.0
> > +
> > diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> > index d90e644..dfb9b39 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> > +++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
> > @@ -1,13 +1,13 @@
> >  require pseudo.inc
> >
> > -SRC_URI = " \
> > -
> http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
> > -    file://0001-configure-Prune-PIE-flags.patch \
> > -    file://fallback-passwd \
> > -    file://fallback-group \
> > -    file://moreretries.patch \
> > -    file://handle-remove-xattr.patch \
> > -"
> > +SRC_URI = "
> http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
> > +           file://0001-configure-Prune-PIE-flags.patch \
> > +           file://fallback-passwd \
> > +           file://fallback-group \
> > +           file://moreretries.patch \
> > +           file://handle-remove-xattr.patch \
> > +           file://obey-ldflags.patch \
> > +           "
> >
> >  SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
> >  SRC_URI[sha256sum] =
> "fd89cadec984d3b8202aca465898b1bb4350e0d63ba9aa9ac899f6f50270e688"
> >
>
>

--001a1139681442ad5f0532942e71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hmm, interesting. It doesn&#39;t actually appear to be using LDFLAGS from t=
he environment at all just now. I&#39;ll take another look. Thanks.<br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Wed, May 11, 2016 at 9:33 AM Mar=
k Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windrive=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 5/11/16 11:=
25 AM, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../pseudo/pseudo/obey-ldflags.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 48 ++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.7.5.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_1.7.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 16 ++++----<br>
&gt;=C2=A0 2 files changed, 56 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/pseudo/pseudo/obey-ldfl=
ags.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch b/=
meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..7e4c629<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +From 0ace81a687355a3c55caa161b51972a82f5c413f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.co=
m" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; +Date: Mon, 9 May 2016 17:00:57 -0700<br>
&gt; +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS<br>
&gt; +<br>
&gt; +Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@=
mentor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile.in | 8 ++++----<br>
&gt; + 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile.in b/Makefile.in<br>
&gt; +index 6511814..22ef625 100644<br>
&gt; +--- a/Makefile.in<br>
&gt; ++++ b/Makefile.in<br>
&gt; +@@ -109,26 +109,26 @@ pseudo: $(PSEUDO)<br>
&gt; + $(PSEUDO): $(BIN) pseudo.o $(SHOBJS) $(DBOBJS) pseudo_client.o pseud=
o_server.o pseudo_ipc.o<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDO) \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo.o pseudo_serve=
r.o pseudo_client.o pseudo_ipc.o \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) $(DB_L=
DFLAGS) $(CLIENT_LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) $(LDFL=
AGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)<br>
<br>
I may be wrong, but I thought the &#39;client_ldflags&#39; was supposed to =
inherit the<br>
LDFLAGS, allowing them to be sanitized.<br>
<br>
The issue was that pseudo was in a strange situation where it may have to b=
uild<br>
both 32-bit and 64-bit clients in order to function properly.<br>
<br>
(Perhaps my memory is out of date and it&#39;s no longer a concern?)<br>
<br>
--Mark<br>
<br>
&gt; +<br>
&gt; + pseudolog: $(PSEUDOLOG)<br>
&gt; +<br>
&gt; + $(PSEUDOLOG): $(BIN) pseudolog.o $(SHOBJS) $(DBOBJS) pseudo_client.o=
 pseudo_ipc.o<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDOLOG) =
pseudolog.o pseudo_client.o pseudo_ipc.o \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) $(DB_L=
DFLAGS) $(CLIENT_LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) $(LDFL=
AGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)<br>
&gt; +<br>
&gt; + pseudodb: $(PSEUDODB)<br>
&gt; +<br>
&gt; + $(PSEUDODB): $(BIN) pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -o $(PSEUDODB) p=
seudodb.o \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) pseudo=
_ipc.o $(DB_LDFLAGS) $(CLIENT_LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DBOBJS) $(SHOBJS) pseudo=
_ipc.o $(LDFLAGS) $(DB_LDFLAGS) $(CLIENT_LDFLAGS)<br>
&gt; +<br>
&gt; + libpseudo: $(LIBPSEUDO)<br>
&gt; +<br>
&gt; + $(LIBPSEUDO): $(LIB) $(WRAPOBJS) pseudo_client.o pseudo_ipc.o $(SHOB=
JS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIB=
PSEUDO) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_client.o pseud=
o_ipc.o \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(WRAPOBJS) $(SHOBJS) $(CL=
IENT_LDFLAGS)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(WRAPOBJS) $(SHOBJS) $(LD=
FLAGS) $(CLIENT_LDFLAGS)<br>
&gt; +<br>
&gt; + # *everything* now relies on stuff that&#39;s generated in the<br>
&gt; + # wrapper process.<br>
&gt; +--<br>
&gt; +2.8.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.7=
.5.bb" rel=3D"noreferrer" target=3D"_blank">pseudo_1.7.5.bb</a> b/meta/reci=
pes-devtools/pseudo/<a href=3D"http://pseudo_1.7.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pseudo_1.7.5.bb</a><br>
&gt; index d90e644..dfb9b39 100644<br>
&gt; --- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.7.5.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_1.7.5.bb</a><br>
&gt; +++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.7.5.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_1.7.5.bb</a><br>
&gt; @@ -1,13 +1,13 @@<br>
&gt;=C2=A0 require pseudo.inc<br>
&gt;<br>
&gt; -SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 <a href=3D"http://downloads.yoctoproject.org/releases/p=
seudo/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ht=
tp://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2</a> \<=
br>
&gt; -=C2=A0 =C2=A0 file://0001-configure-Prune-PIE-flags.patch \<br>
&gt; -=C2=A0 =C2=A0 file://fallback-passwd \<br>
&gt; -=C2=A0 =C2=A0 file://fallback-group \<br>
&gt; -=C2=A0 =C2=A0 file://moreretries.patch \<br>
&gt; -=C2=A0 =C2=A0 file://handle-remove-xattr.patch \<br>
&gt; -&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/releas=
es/pseudo/$%7BBPN%7D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank=
">http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-Prune-=
PIE-flags.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fallback-passwd \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fallback-group \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://moreretries.patch \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://handle-remove-xattr.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://obey-ldflags.patch \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;c10209938f03128d0c193f041ff3596d&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;fd89cadec984d3b8202aca465898b1bb435=
0e0d63ba9aa9ac899f6f50270e688&quot;<br>
&gt;<br>
<br>
</blockquote></div>

--001a1139681442ad5f0532942e71--
