Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id BEA2B77DB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 12:27:47 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id p189so94182623lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mzk3ekjrZZFvpovrAx3CvC4v94MttHzNFdOdli83u90=;
	b=Y4ZUOC21U50yB7alm2xnRN1owRYWb1OsrziEYmud7jbfYrKTrA2grigO9wIzwXojQO
	VC3YzgnS31+m+XmPQSzrhrCxzs59o0G+TQ59Q4lGQzh8HgGqPdPjtHLxNb+ciT/WW86G
	jDS7yg5ySnhCOB0YRjPt99WXOvZJs4S4HAQdo8WhHZo7tt9fgsKr9LKhXPoe5Wj+APMu
	Ip9ykXqqNhSqrdV9+WQswa0ainn9qgjK9AbZBRK19hchjfnrb2kySBDBXggoBpu5HSaX
	DQGpEroG7mkrsYeTYqOI5DQ0lvoy/kkEMnMCceKojgV1AUxp6ko3I6BxqnQ4tknWgjfc
	Nzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mzk3ekjrZZFvpovrAx3CvC4v94MttHzNFdOdli83u90=;
	b=bwlgxkDGuSy2MSI39bt2RLrZa34WgCQzfMuNP3wO6cluLKadVzUtDKBwAsF7xoitX/
	L1LMNkyYBbufvOLxb+dzoH3TeJtvy5NnZLLquhNhwYEHx4BYupsaHuBAjalpsAGSJOI8
	QUP/FB7+XqM4xMAq8hsbR7WLr5rQxQ4dbneZRP0CvtZTmHP0XodJ00UKYFepmR5QjM5m
	zJCjVFLdWjY1cisEdxoQ2BirYRKQELFXGploDhpL/Ic88cBN6YOHcpdBY4YYQZIUW50O
	BGm+1qZulMyJGEevEaUja3KZfCpOb/kttXFsIJ207v7lI71DERNKHQ2nCwVmqpTcmD7g
	fNbw==
X-Gm-Message-State: AKS2vOwb3NhLgLIcgxPRDh7/aMgr4otuty4XA80uoLiZsrp4CEbpReZF
	YeKcPAsiBJrQBDRdpHlMCHnWb2PRQw==
X-Received: by 10.80.131.6 with SMTP id 6mr24906284edh.178.1498048067877; Wed,
	21 Jun 2017 05:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20170619101917.31865-1-git@andred.net>
	<CAHiDW_FCUwov8fBMZMSs+yaDms6oNWMgSfua4LEW8JezntGrqA@mail.gmail.com>
In-Reply-To: <CAHiDW_FCUwov8fBMZMSs+yaDms6oNWMgSfua4LEW8JezntGrqA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Jun 2017 12:27:36 +0000
Message-ID: <CAMKF1srvQxvQasFKo_Gc9eYO5KmCbnsEnTw34UhkvjnGK+fxqA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>, 
	Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] tclibc-musl: use musl's virtual/gettext implementation
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
X-List-Received-Date: Wed, 21 Jun 2017 12:27:50 -0000
Content-Type: multipart/alternative; boundary="94eb2c0da3a2f1433e0552777e97"

--94eb2c0da3a2f1433e0552777e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 6:27 AM Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> $ bitbake -k core-image-minimal core-image-full-cmdline core-image-sato
> world
> That seems to fail with musl on the autobuilder with "Nothing RPROVIDES
> 'gettext-runtime' "
>
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/313/steps/Build=
Images/logs/stdio
>

Andre can you take care of adding it

>
> Cheers,
> Jussi
>
>
> On 19 June 2017 at 13:19, Andr=C3=A9 Draszik <git@andred.net> wrote:
> >
> > From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> >
> > musl implements the GNU gettext API version 1 and 2
> >   http://www.openwall.com/lists/musl/2015/04/16/3
> >
> > Generally, there should be no need need for the
> > actual GNU/gettext in systems using musl, so with
> > this change systems using musl can avoid a needless
> > dependency on a GPLv3+ tool.
> >
> > If an application ever appears that needs
> > GNU/gettext API version 3, we can think about a way
> > to support it at that time.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> > Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
> > ---
> >  meta/conf/distro/include/tclibc-musl.inc | 1 +
> >  meta/recipes-core/musl/musl_git.bb       | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/tclibc-musl.inc
> b/meta/conf/distro/include/tclibc-musl.inc
> > index 3d3f6ac4f4..172b09ab20 100644
> > --- a/meta/conf/distro/include/tclibc-musl.inc
> > +++ b/meta/conf/distro/include/tclibc-musl.inc
> > @@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libiconv ?=3D "musl"
> >  PREFERRED_PROVIDER_virtual/libintl ?=3D "musl"
> >  PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
> >  PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> > +PREFERRED_PROVIDER_virtual/gettext ?=3D "musl"
> >
> >  #USE_NLS ?=3D "no"
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> > index fba47096f5..9cf097d067 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.musl-libc.org/musl \
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/libiconv virtual/libintl"
> > +PROVIDES +=3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> virtual/gettext virtual/libiconv virtual/libintl"
> >
> >  DEPENDS =3D "virtual/${TARGET_PREFIX}binutils \
> >             virtual/${TARGET_PREFIX}gcc-initial \
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0da3a2f1433e0552777e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Jun 21, 2017 =
at 6:27 AM Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">j=
ussi.kukkonen@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div>$ bitbake -k core-image-minimal core-image-full-cmdline core-image=
-sato world<br><div>That seems to fail with musl on the autobuilder with &q=
uot;Nothing RPROVIDES &#39;gettext-runtime&#39; &quot;<br><br><a href=3D"ht=
tps://autobuilder.yocto.io/builders/nightly-musl/builds/313/steps/BuildImag=
es/logs/stdio" target=3D"_blank">https://autobuilder.yocto.io/builders/nigh=
tly-musl/builds/313/steps/BuildImages/logs/stdio</a><br></div></div></block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">Andre can you take care=
 of adding it=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div><br>Cheer=
s,<br>Jussi</div></div><div><div><br><br>On 19 June 2017 at 13:19, Andr=C3=
=A9 Draszik &lt;<a href=3D"mailto:git@andred.net" target=3D"_blank">git@and=
red.net</a>&gt; wrote:<br>&gt;<br>&gt; From: Andr=C3=A9 Draszik &lt;<a href=
=3D"mailto:adraszik@tycoint.com" target=3D"_blank">adraszik@tycoint.com</a>=
&gt;<br>&gt;<br>&gt; musl implements the GNU gettext API version 1 and 2<br=
>&gt; =C2=A0 <a href=3D"http://www.openwall.com/lists/musl/2015/04/16/3" ta=
rget=3D"_blank">http://www.openwall.com/lists/musl/2015/04/16/3</a><br>&gt;=
<br>&gt; Generally, there should be no need need for the<br>&gt; actual GNU=
/gettext in systems using musl, so with<br>&gt; this change systems using m=
usl can avoid a needless<br>&gt; dependency on a GPLv3+ tool.<br>&gt;<br>&g=
t; If an application ever appears that needs<br>&gt; GNU/gettext API versio=
n 3, we can think about a way<br>&gt; to support it at that time.<br>&gt;<b=
r>&gt; Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:adraszik@tyc=
oint.com" target=3D"_blank">adraszik@tycoint.com</a>&gt;<br>&gt; Acked-by: =
Sylvain Lemieux &lt;<a href=3D"mailto:slemieux@tycoint.com" target=3D"_blan=
k">slemieux@tycoint.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/conf/distro/=
include/tclibc-musl.inc | 1 +<br>&gt; =C2=A0meta/recipes-core/musl/<a href=
=3D"http://musl_git.bb" target=3D"_blank">musl_git.bb</a> =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>&gt; =C2=A02 files changed, 2 insertions(+), 1 deletion(-)<br=
>&gt;<br>&gt; diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/=
conf/distro/include/tclibc-musl.inc<br>&gt; index 3d3f6ac4f4..172b09ab20 10=
0644<br>&gt; --- a/meta/conf/distro/include/tclibc-musl.inc<br>&gt; +++ b/m=
eta/conf/distro/include/tclibc-musl.inc<br>&gt; @@ -13,6 +13,7 @@ PREFERRED=
_PROVIDER_virtual/libiconv ?=3D &quot;musl&quot;<br>&gt; =C2=A0PREFERRED_PR=
OVIDER_virtual/libintl ?=3D &quot;musl&quot;<br>&gt; =C2=A0PREFERRED_PROVID=
ER_virtual/nativesdk-libintl ?=3D &quot;nativesdk-glibc&quot;<br>&gt; =C2=
=A0PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D &quot;nativesdk-glibc=
&quot;<br>&gt; +PREFERRED_PROVIDER_virtual/gettext ?=3D &quot;musl&quot;<br=
>&gt;<br>&gt; =C2=A0#USE_NLS ?=3D &quot;no&quot;<br>&gt;<br>&gt; diff --git=
 a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=3D"_blank">=
musl_git.bb</a> b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" tar=
get=3D"_blank">musl_git.bb</a><br>&gt; index fba47096f5..9cf097d067 100644<=
br>&gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" target=
=3D"_blank">musl_git.bb</a><br>&gt; +++ b/meta/recipes-core/musl/<a href=3D=
"http://musl_git.bb" target=3D"_blank">musl_git.bb</a><br>&gt; @@ -15,7 +15=
,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.musl-libc.org/musl" tar=
get=3D"_blank">git.musl-libc.org/musl</a> \<br>&gt;<br>&gt; =C2=A0S =3D &qu=
ot;${WORKDIR}/git&quot;<br>&gt;<br>&gt; -PROVIDES +=3D &quot;virtual/libc v=
irtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl&quot;<=
br>&gt; +PROVIDES +=3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-for-=
gcc virtual/gettext virtual/libiconv virtual/libintl&quot;<br>&gt;<br>&gt; =
=C2=A0DEPENDS =3D &quot;virtual/${TARGET_PREFIX}binutils \<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtual/${TARGET_PREFIX}gcc-initial \<br=
>&gt; --<br>&gt; 2.11.0<br>&gt;<br></div></div><div><div>&gt; --<br>&gt; __=
_____________________________________________<br>&gt; Openembedded-core mai=
ling list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>&gt; <=
a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core"=
 target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembed=
ded-core</a><div><pre style=3D"font-family:&quot;Courier New&quot;,courier,=
monotype,monospace;color:rgb(0,0,0);font-size:medium"></pre></div><div><pre=
 style=3D"font-family:&quot;Courier New&quot;,courier,monotype,monospace;co=
lor:rgb(0,0,0);font-size:medium"></pre></div></div></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0da3a2f1433e0552777e97--
