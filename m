Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.2550.1587855842079282141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 16:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ftml.net header.s=fm3 header.b=nb6l4d/q;
 spf=pass (domain: ftml.net, ip: 64.147.123.20, mailfrom: fdk17@ftml.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5C18CA33
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 19:04:00 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
  by compute3.internal (MEProxy); Sat, 25 Apr 2020 19:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=jJ+CIi5rcNUoRhBF7cMbGSUVZJziHmC
	JFssKpUyiN3A=; b=nb6l4d/qHImjx5FgS0ArsActLYqF5LHeYA74Q0aPxv6Y263
	aI/qKshFHGN8vFar6j9RhYzXxmTkopSb173wvPz78QiMd+lG5nqcUDQe26WGOuV0
	FlaFU5CMMgFjmolJ7LDkNp5FP3i1um+JBT8BzOwlqS7JK98edu353ONt01RYN9ca
	bGXOo7MctTBBjhdK1ohiJu7Ji/TzZLDK5vTpXssFsXKYvF5l3obOgN9uT5TCcDy5
	e1vmSj9eAveg90q6hLJTCC5CShkFqwC0w//2rVsQVmWsNMKO5cCvAvu7Bm1AVUh/
	8ZXjWoyWst5vcGP90KVA7LDrF78Ch3m7bcCjlGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jJ+CIi
	5rcNUoRhBF7cMbGSUVZJziHmCJFssKpUyiN3A=; b=Xy3P2YuMlvdXtKAPXysNwh
	8AE/5YSxuNN4H78XIqg10Duv+xHSnc4q0BBgv+R+Yn18DlHqUIa/o4hwLUlIC2iJ
	n3Z8Mi5qQKJDo8sN+lQhe5d5lFClMCTRKB+CahYICLgnNX0DyNNETrl3Et6+3EjX
	XWS0uczzNI31JfB/hepGmBDBds54TfALuipi+f4QqZA/e0Lg1RgVb5iuG7/wigFX
	0Kat3+yuZ8Bx/hkvCPaEoBdyQf6pvZDfsJMecIpP8EOGslVBIUYNlafUQhcB6phD
	62vpgGXD4NQavOeBtfuRP73iCDySU5P4zW8CS0O3U7rMBp7C17IojF7OwK+rdtug
	==
X-ME-Sender: <xms:38GkXgufgr8_JSleS4z4zeBa1JsUV-i7tDR0MnsRCXMjZsZdncK06w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheehgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrgdtre
    erreerjeenucfhrhhomhepfdfhrhgvugcuuegrkhhsihhkfdcuoehfughkudejsehfthhm
    lhdrnhgvtheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfihikhhiphgvughirg
    drohhrghdpiihughgrihhnrgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehfughkudejsehfthhmlhdrnhgvth
X-ME-Proxy: <xmx:38GkXod_vGaQF_wXmBO88D8-AHyws_MkZUeuupeBthbSyJbc1YJrEg>
    <xmx:38GkXqxK-s1yxgJ0bzoPWgDRqbpebTixrYZvkH8fEE5vb_NAdsSQnQ>
    <xmx:38GkXk5mSvwQDEll28j3iLbQVlkubGkbtQnANroIq4sGRg3P929VQQ>
    <xmx:4MGkXjSQkrITeO9warvpRDM_pnQEjP56Kl9ciIw78xhG4xpzuSahAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB2A1180091; Sat, 25 Apr 2020 19:03:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <7b0b659b-6e42-41f7-bd9d-447d37de850c@www.fastmail.com>
In-Reply-To: <28192.1587843536617759309@lists.openembedded.org>
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
 <28192.1587843536617759309@lists.openembedded.org>
Date: Sat, 25 Apr 2020 19:03:38 -0400
From: "Fred Baksik" <fdk17@ftml.net>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Content-Type: multipart/alternative;
 boundary=14660d40c4f24916ac18242bccc8c851

--14660d40c4f24916ac18242bccc8c851
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Sat, Apr 25, 2020, at 3:38 PM, Bart=C5=82omiej Burdukiewicz wrote:
> On Sat, Apr 25, 2020 at 06:46 AM, Khem Raj wrote:

>> On 4/24/20 8:01 AM, Bart=C5=82omiej Burdukiewicz wrote: > Mesa can be=
 compiled with libva support, in order to avoid recursive > dependency b=
etween mesa and libva, virtual/mesa must be removed > from libva recipe.=
 > > Signed-off-by: Bart=C5=82omiej Burdukiewicz bartlomiej.burdukiewicz=
@gmail.com > --- > meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +- > 1=
 file changed, 1 insertion(+), 1 deletion(-) > > diff --git a/meta/recip=
es-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6=
.1.bb > index 92cea83bc1..c1a441a18b 100644 > --- a/meta/recipes-graphic=
s/libva/libva_2.6.1.bb > +++ b/meta/recipes-graphics/libva/libva_2.6.1.b=
b > @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55=
dc10111e8c98976dbab8fd62e4862940 > > UPSTREAM_CHECK_URI =3D "https://git=
hub.com/intel/libva/releases" <https://github.com/intel/libva/releases%2=
2> > > -DEPENDS =3D "libdrm virtual/mesa" > +DEPENDS =3D "libdrm"

>> I am not sure how it will work with non-mesa graphics stacks. Or is i=
t non-issue ?

> It looks like libva is designed to work without mesa (or other graphic=
al stacks), since it's using libdrm to dispatch kernel calls. https://en=
.wikipedia.org/wiki/Direct_Rendering_Manager#/media/File:DRM_architectur=
e.svg

> There is also ebuild in Gentoo for libva do not depend on mesa (https:=
//data.gpo.zugaina.org/gentoo/x11-libs/libva/libva-2.6.1.ebuild) or othe=
r graphical stacks (like nvidia-drivers or etc.).

> I'll provide more information about actual problem that is happening i=
n meta-kodi and it's related to this patch.

> There is append that I created for meta-kodi, that is extending mesa w=
ith libva and libvdpau capabilities: https://github.com/dev-0x7C6/meta-k=
odi/blob/zeus/recipes-graphics/mesa/mesa_%25.bbappend

> And this is current workaround for libva to avoid recursive dependency=
: https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphics/libv=
a/libva_%25.bbappend

>>> inherit meson pkgconfig features_check

>=20

FYI, meta-amd also had to have appends to properly support va with AMD h=
ardware via the mesa library. I think only Intel supplies accelerated vi=
deo through DRM (without requiring mesa).

Requiring virtual/mesa always seems to be redundant because libva recipe=
 already required the OpenGL distro feature.=20

I wanted to point out that libva can be built without enabling GLX suppo=
rt. But with_glx is set to auto and will use OpenGL if meson detects Ope=
nGL being available and X11 is enabled. GLX support seems to enable some=
 additional code for integration with the OpenGL stack.=20

--14660d40c4f24916ac18242bccc8c851
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div><br></div><div>=
On Sat, Apr 25, 2020, at 3:38 PM, Bart=C5=82omiej Burdukiewicz wrote:<br=
></div><blockquote type=3D"cite" id=3D"qt"><p>On Sat, Apr 25, 2020 at 06=
:46 AM, Khem Raj wrote:<br></p><blockquote><p>On 4/24/20 8:01 AM, Bart=C5=
=82omiej Burdukiewicz wrote:
&gt; Mesa can be compiled with libva support, in order to avoid recursiv=
e
&gt; dependency between mesa and libva, virtual/mesa must be removed
&gt; from libva recipe.
&gt;
&gt; Signed-off-by: Bart=C5=82omiej Burdukiewicz <a href=3D"mailto:bartl=
omiej.burdukiewicz@gmail.com" target=3D"_blank">bartlomiej.burdukiewicz@=
gmail.com</a> &gt; ---
&gt;  meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
&gt;  1 file changed, 1 insertion(+), 1 deletion(-)
&gt;
&gt; diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb
b/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; index 92cea83bc1..c1a441a18b 100644
&gt; --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
&gt; @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D
"6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940
&gt;
&gt;  UPSTREAM_CHECK_URI =3D "<a href=3D"https://github.com/intel/libva/=
releases&quot;" target=3D"_blank">https://github.com/intel/libva/release=
s"</a> &gt;
&gt; -DEPENDS =3D "libdrm virtual/mesa"
&gt; +DEPENDS =3D "libdrm"<br></p><p>I am not sure how it will work with=
 non-mesa graphics stacks. Or is it
non-issue ?<br></p></blockquote><p>It looks like libva is designed to wo=
rk without mesa (or other graphical stacks), since it's using libdrm to =
dispatch kernel calls. <a href=3D"https://en.wikipedia.org/wiki/Direct_R=
endering_Manager#/media/File:DRM_architecture.svg" target=3D"_blank">htt=
ps://en.wikipedia.org/wiki/Direct_Rendering_Manager#/media/File:DRM_arch=
itecture.svg</a><br></p><p>There is also ebuild in Gentoo for libva do n=
ot depend on mesa (<a href=3D"https://data.gpo.zugaina.org/gentoo/x11-li=
bs/libva/libva-2.6.1.ebuild" target=3D"_blank">https://data.gpo.zugaina.=
org/gentoo/x11-libs/libva/libva-2.6.1.ebuild</a>) or other graphical sta=
cks (like nvidia-drivers or etc.).<br></p><p>I'll provide more informati=
on about actual problem that is happening in meta-kodi and it's related =
to this patch.<br></p><p>There is append that I created for meta-kodi, t=
hat is extending mesa with libva and libvdpau capabilities: <a href=3D"h=
ttps://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphics/mesa/me=
sa_%25.bbappend" target=3D"_blank">https://github.com/dev-0x7C6/meta-kod=
i/blob/zeus/recipes-graphics/mesa/mesa_%25.bbappend</a><br></p><p>And th=
is is current workaround for libva to avoid recursive dependency: <a hre=
f=3D"https://github.com/dev-0x7C6/meta-kodi/blob/zeus/recipes-graphics/l=
ibva/libva_%25.bbappend" target=3D"_blank">https://github.com/dev-0x7C6/=
meta-kodi/blob/zeus/recipes-graphics/libva/libva_%25.bbappend</a><br></p=
><blockquote><blockquote><p>inherit meson pkgconfig features_check<br></=
p></blockquote></blockquote><div><br></div></blockquote><div><br></div><=
div>FYI, meta-amd also had to have appends to properly support va with A=
MD hardware via the mesa library. I think only Intel supplies accelerate=
d video through DRM (without requiring mesa).<br></div><div><br></div><d=
iv>Requiring virtual/mesa always seems to be redundant because libva rec=
ipe already required the OpenGL distro feature. <br></div><div><br></div=
><div>I wanted to point out that libva can be built without enabling GLX=
 support.&nbsp; But with_glx is set to auto and will use OpenGL if meson=
 detects OpenGL being available and X11 is enabled.&nbsp; GLX support se=
ems to enable some additional code for integration with the OpenGL stack=
.&nbsp;<br></div></body></html>

--14660d40c4f24916ac18242bccc8c851--
