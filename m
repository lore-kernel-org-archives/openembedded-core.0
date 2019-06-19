Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 89E6E6C4DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:43:31 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id a15so462442qtn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=szQ0wvjiNdzfMJwgRdpW1G5W3t+0qXZSR7bmBEW/D5Y=;
	b=Ggd1Grb0ZlEgLrB9+RNw0O1S4gHV8KASf/rj3gtbnUbBipMb6Lq4Gt/hQJ4lC1l9qo
	IWuw4QWPf956+cD40GqGjzAy6tGRguAs1Y2pZxJ0XuKvp4wTN1yfY5iNbNPhc6FukE+X
	feG7hB2p/xpYJ8kDmpnLQdmmJsiuyE2Vm9nPA56WOVgw3EatGN+Lfmd9tKWdekKIr+1s
	C7In5WhmiwBUELQe6vqZj4vTofNpzDFtALlhG2j0wXyyeOeqb/yuRIvF2rhi8qftmoHU
	nJiQO7mqdYBsAlobKz3SL821Y0a3Jcu5L22P9n32hbwBfZEcmsqSYcJGCWWSaO+JmnXy
	wdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=szQ0wvjiNdzfMJwgRdpW1G5W3t+0qXZSR7bmBEW/D5Y=;
	b=HmQkcafa2m7ObJXG6V9/yEXBgxkybTJs1OP7fUXxxk4wRHPABWwP618LhtLS2DSb60
	toG/ZPT778YCDnDc9tYHIsEawNB9+45DKtWMQX5qp9DvPMHpp74MdQfG0x4j7o12YUau
	v88/AX3E6dJ5XLC1wwAQugCsYTalzzuA5Nj5F7HnzKft85cHa0W2Yl3vl9BoTfYb1+8M
	Y+hfPtELmMd3OX6bnDbQvgEd8Ef8TNh/wJxh+McGL94c4UCT2oy1y+ll9tMyBCfCWjly
	EP+DiSdmMMtvmaM+VLRAipADQQf4Di788xWDACaOwMq3pddd677WJNLDJfbUiO0RNQgO
	N4lQ==
X-Gm-Message-State: APjAAAVfq6922uuYmTBsQeAT7YUVfAp6oMh0j3MzHAjPdY8maFFoIZC4
	OfEyQmxbJZiXQ2CZd3sgSZFNjSx3QFzkaiIdzpE=
X-Google-Smtp-Source: APXvYqxjSfX9C+NLcbM6jZQ2MZD2N7zmpny6JmEUmGtgrZoAH7qIK0cfsy3DS5RaZ4T16s2BWmPa6FbUyb9zr39zqdI=
X-Received: by 2002:ac8:e05:: with SMTP id a5mr73254842qti.53.1560973412070;
	Wed, 19 Jun 2019 12:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190619094436.2024-1-ricardo@ribalda.com>
	<CAJTo0LafiOR5uE8cD3wv79TeVsY0OSsoMsUG1OcgMwCXgBwYHA@mail.gmail.com>
In-Reply-To: <CAJTo0LafiOR5uE8cD3wv79TeVsY0OSsoMsUG1OcgMwCXgBwYHA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jun 2019 12:43:21 -0700
Message-ID: <CAMKF1spRCEthHdZwL-G5nWh4BJzUZMaTs8MWDQOQUQS66-cwCw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] less: Create symlink for pager
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
X-List-Received-Date: Wed, 19 Jun 2019 19:43:31 -0000
Content-Type: multipart/alternative; boundary="000000000000bafa55058bb2717e"

--000000000000bafa55058bb2717e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 2:55 AM Burton, Ross <ross.burton@intel.com> wrote:

> dpkg may, but that's because dpkg is the Debian package manager and it
> follows Debian traditions.  /usr/bin/pager is a Debianism: I suggest
> we just patch it to use 'less'.


Moreover I don=E2=80=99t see pager binary on my system here

>
>
> Ross
>
> On Wed, 19 Jun 2019 at 10:47, Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > Some system tools (like dpkg) expects a binary called pager when they
> > run on a interactive console.
> >
> > This patch addes this symlink via alternative, so other packages can
> > also provide this symlink.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  meta/recipes-extended/less/less_550.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/less/less_550.bb
> b/meta/recipes-extended/less/less_550.bb
> > index bb1618f1eb..8f59bd6087 100644
> > --- a/meta/recipes-extended/less/less_550.bb
> > +++ b/meta/recipes-extended/less/less_550.bb
> > @@ -24,6 +24,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >                      file://LICENSE;md5=3Dba01d0cab7f62f7f2204c7780ff6a=
87d
> \
> >                      "
> >  DEPENDS =3D "ncurses"
> > +RPROVIDES_${PN} =3D "pager"
> >
> >  SRC_URI =3D "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.=
gz
> \
> >           "
> > @@ -39,5 +40,6 @@ do_install () {
> >          oe_runmake 'bindir=3D${D}${bindir}' 'mandir=3D${D}${mandir}' i=
nstall
> >  }
> >
> > -ALTERNATIVE_${PN} =3D "less"
> > +ALTERNATIVE_${PN} =3D "less pager"
> >  ALTERNATIVE_PRIORITY =3D "100"
> > +ALTERNATIVE_TARGET[pager] =3D "/usr/bin/less.less"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000bafa55058bb2717e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 19, 2019 at 2:55 AM Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">dpkg may, but that&#39;s because dpkg is t=
he Debian package manager and it<br>
follows Debian traditions.=C2=A0 /usr/bin/pager is a Debianism: I suggest<b=
r>
we just patch it to use &#39;less&#39;.</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Moreover I don=E2=80=99t see pager binary on my syst=
em here=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Ross<br>
<br>
On Wed, 19 Jun 2019 at 10:47, Ricardo Ribalda Delgado<br>
&lt;<a href=3D"mailto:ricardo@ribalda.com" target=3D"_blank">ricardo@ribald=
a.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Some system tools (like dpkg) expects a binary called pager when they<=
br>
&gt; run on a interactive console.<br>
&gt;<br>
&gt; This patch addes this symlink via alternative, so other packages can<b=
r>
&gt; also provide this symlink.<br>
&gt;<br>
&gt; Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo@r=
ibalda.com" target=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/less/<a href=3D"http://less_550.bb" rel=3D=
"noreferrer" target=3D"_blank">less_550.bb</a> | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/less/<a href=3D"http://less_550.bb"=
 rel=3D"noreferrer" target=3D"_blank">less_550.bb</a> b/meta/recipes-extend=
ed/less/<a href=3D"http://less_550.bb" rel=3D"noreferrer" target=3D"_blank"=
>less_550.bb</a><br>
&gt; index bb1618f1eb..8f59bd6087 100644<br>
&gt; --- a/meta/recipes-extended/less/<a href=3D"http://less_550.bb" rel=3D=
"noreferrer" target=3D"_blank">less_550.bb</a><br>
&gt; +++ b/meta/recipes-extended/less/<a href=3D"http://less_550.bb" rel=3D=
"noreferrer" target=3D"_blank">less_550.bb</a><br>
&gt; @@ -24,6 +24,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd322=
39bcb673463ab874e80d47fae504 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENSE;md5=3Dba01d0cab7f62f7f2204c7780ff6a87d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot;ncurses&quot;<br>
&gt; +RPROVIDES_${PN} =3D &quot;pager&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.greenwoodsoftware.com/$%=
7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; @@ -39,5 +40,6 @@ do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake &#39;bindir=3D${D}${bindi=
r}&#39; &#39;mandir=3D${D}${mandir}&#39; install<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -ALTERNATIVE_${PN} =3D &quot;less&quot;<br>
&gt; +ALTERNATIVE_${PN} =3D &quot;less pager&quot;<br>
&gt;=C2=A0 ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
&gt; +ALTERNATIVE_TARGET[pager] =3D &quot;/usr/bin/less.less&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000bafa55058bb2717e--
