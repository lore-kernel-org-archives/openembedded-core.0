Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id ECF066CA1C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 12:05:00 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id n16so1632894oag.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4Rcokon2mCZjedkXBwmw5JkdvRtlWVAAlBh/2nRj0wY=;
	b=Gw+T1w/rZNS96Nj1VBeTwXnSYx7zVZHb5rgNgxUJbDf3N1QR2nW73/qmlQVCoKkGEz
	3VsUr40iCYDYUFYKJAafHihpdaLTvts5hhru8UY6QqSnniBhidwCHavHHQQxAryhjuJ7
	XFI94nijm3axei/f4B5D0Ud50n+mbeZ2JjBp4k9KSyEcEijaHnrEBChJR742hGqmFg3y
	fY551L/JqrAhI/MROL6mqFthjzOtgN6YThUgy5AYLtlzrrl6586KC6RZM8jDkA2eHWAf
	1ArmwqhACRbO+FOIT2kCj72oHlqvTfdMjSgmPgWYQbZvhKDM+jE6yc0671bQM1s82Kg+
	FtSA==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr79837297obb.17.1389182701671; 
	Wed, 08 Jan 2014 04:05:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 8 Jan 2014 04:05:01 -0800 (PST)
In-Reply-To: <20140107192305.GT3709@jama>
References: <52CC470A.9030302@linaro.org>
	<20140107192305.GT3709@jama>
Date: Wed, 8 Jan 2014 10:05:01 -0200
X-Google-Sender-Auth: SyfbA2LjWAt1FujG9fAB0iHF0as
Message-ID: <CAP9ODKqw3nYeLU99CGJmE+2cp+Xn2kSikFqgfL0bR3wsnUoz6g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 12:05:01 -0000
Content-Type: multipart/alternative; boundary=089e0149c506761a9c04ef744d0e

--089e0149c506761a9c04ef744d0e
Content-Type: text/plain; charset=ISO-8859-1

Hello folks,

On Tue, Jan 7, 2014 at 5:23 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Jan 07, 2014 at 01:27:22PM -0500, Trevor Woerner wrote:
> > Hello everyone,
> >
> > question:
> > Should some version of Qt be included in openembedded-core, or should
> > all recipes to add Qt be part of their own version-specific Qt layer?
> >
> >
> > background:
> > openembedded-core[1] used to include recipes for Qt3, but as Qt3 became
> > old these recipes were replaced with Qt4 and the Qt3 support was broken
> > out into its own layer[2]. We're now at a point where Qt4 is getting old
> > and Qt5 is "current". At some point we'll have to replace the Qt4
> > support in [1] with support for Qt5. But we expect users will still want
> > to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt5,
> > the Qt4 support will need to be broken out into its own layer. Qt5
> > support is currently being developed on it's own layer[3].
> >
> >
> > This email thread is *not* to discuss when we should replace Qt4 with
> > Qt5, then question is: should [1] include *any* Qt support, or should Qt
> > be always in its own layer to be added as required by the distribution?
> >
> >
> > If we decide [1] should provide some Qt support, then we can discuss
> > when we should replace the Qt4 support with Qt5 in [1]. But for now it
> > would be nice to reach a consensus on whether or not [1] should include
> > any Qt support at all or if it wouldn't just be easier to always have Qt
> > support in its own version-specific layers to be added as required (if
> > needed) by the distribution configuration.
>
> I would like to see qt4 moved from oe-core to meta-qt4.
>
> That would remove the feeling that using oe-core defaults to using qt4
> and it would be consistent with other QT layers:
>
> meta-qt3
> meta-qt4
> meta-qt5
>

Agreed.


> oe-core would stay just the "core" and if you need any QT you can select
> which one suits your needs the most (or combination of e.g. qt4+qt5 like
> most people are using now)
>
> With PACKAGECONFIGs which can list optional dependencies which aren't
> included in the the layer itself it's now easier to have recipe with
> optional qt5 support in oe-core, but qt5 itself in separate meta-qt5.
>
> Another interesting aspect is that with qt4 we have only 6 recipes in
> openembedded-core/meta/recipes-qt/qt4
>
> while
> meta-qt5/recipes-qt/qt5 has 25 different recipes (many of them with
> _git.bb variant so 42 in total). And splitting the qt5 recipes (e.g. to
> have only qtbase, qtdeclarative in oe-core and "additional" modules in
> separate meta-qt5) isn't very good, because they are quite tightly
> coupled (so upgrading recipes in meta-qt5 would be in many cases
> incomatible with qtbase version in oe-core and vice-versa).
>
> Another advantage of separate meta-qt5 layer is that in many projects
> people are using older oe-core release (e.g. dylan) with newer meta-qt5
> (e.g. dora or master or even qt5-5.2.0 branch), with separate layer it's
> easier to mix them.
>

Fully agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149c506761a9c04ef744d0e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello folks,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, Jan 7, 2014 at 5:23 PM, Martin Jansa <span dir=3D"ltr">=
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Jan 07, 2014 at 01=
:27:22PM -0500, Trevor Woerner wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; question:<br>
&gt; Should some version of Qt be included in openembedded-core, or should<=
br>
&gt; all recipes to add Qt be part of their own version-specific Qt layer?<=
br>
&gt;<br>
&gt;<br>
&gt; background:<br>
&gt; openembedded-core[1] used to include recipes for Qt3, but as Qt3 becam=
e<br>
&gt; old these recipes were replaced with Qt4 and the Qt3 support was broke=
n<br>
&gt; out into its own layer[2]. We&#39;re now at a point where Qt4 is getti=
ng old<br>
&gt; and Qt5 is &quot;current&quot;. At some point we&#39;ll have to replac=
e the Qt4<br>
&gt; support in [1] with support for Qt5. But we expect users will still wa=
nt<br>
&gt; to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt=
5,<br>
&gt; the Qt4 support will need to be broken out into its own layer. Qt5<br>
&gt; support is currently being developed on it&#39;s own layer[3].<br>
&gt;<br>
&gt;<br>
&gt; This email thread is *not* to discuss when we should replace Qt4 with<=
br>
&gt; Qt5, then question is: should [1] include *any* Qt support, or should =
Qt<br>
&gt; be always in its own layer to be added as required by the distribution=
?<br>
&gt;<br>
&gt;<br>
&gt; If we decide [1] should provide some Qt support, then we can discuss<b=
r>
&gt; when we should replace the Qt4 support with Qt5 in [1]. But for now it=
<br>
&gt; would be nice to reach a consensus on whether or not [1] should includ=
e<br>
&gt; any Qt support at all or if it wouldn&#39;t just be easier to always h=
ave Qt<br>
&gt; support in its own version-specific layers to be added as required (if=
<br>
&gt; needed) by the distribution configuration.<br>
<br>
</div>I would like to see qt4 moved from oe-core to meta-qt4.<br>
<br>
That would remove the feeling that using oe-core defaults to using qt4<br>
and it would be consistent with other QT layers:<br>
<br>
meta-qt3<br>
meta-qt4<br>
meta-qt5<br></blockquote><div><br></div><div>Agreed.</div><div>=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
oe-core would stay just the &quot;core&quot; and if you need any QT you can=
 select<br>
which one suits your needs the most (or combination of e.g. qt4+qt5 like<br=
>
most people are using now)<br>
<br>
With PACKAGECONFIGs which can list optional dependencies which aren&#39;t<b=
r>
included in the the layer itself it&#39;s now easier to have recipe with<br=
>
optional qt5 support in oe-core, but qt5 itself in separate meta-qt5.<br>
<br>
Another interesting aspect is that with qt4 we have only 6 recipes in<br>
openembedded-core/meta/recipes-qt/qt4<br>
<br>
while<br>
meta-qt5/recipes-qt/qt5 has 25 different recipes (many of them with<br>
_<a href=3D"http://git.bb" target=3D"_blank">git.bb</a> variant so 42 in to=
tal). And splitting the qt5 recipes (e.g. to<br>
have only qtbase, qtdeclarative in oe-core and &quot;additional&quot; modul=
es in<br>
separate meta-qt5) isn&#39;t very good, because they are quite tightly<br>
coupled (so upgrading recipes in meta-qt5 would be in many cases<br>
incomatible with qtbase version in oe-core and vice-versa).<br>
<br>
Another advantage of separate meta-qt5 layer is that in many projects<br>
people are using older oe-core release (e.g. dylan) with newer meta-qt5<br>
(e.g. dora or master or even qt5-5.2.0 branch), with separate layer it&#39;=
s<br>
easier to mix them.<br></blockquote><div><br></div><div>Fully agreed.=A0</d=
iv></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<=
a href=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossys=
tems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0149c506761a9c04ef744d0e--
