Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id A72C060CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:01:45 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so6416430wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 09:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7Lt2bmSlMhqwTg3NE5/tDdiMIhbOq+FsNbJNUiwfHjM=;
	b=b5hWJ8l21TjrUZ9QFaLjT7x5ZlMzh6w2fxa1sALnCeP1+Bvd/M0TMez43wbmYKAmt1
	lb6bATeQxtFRyTWVRhbGqz1yQKsu31uL0BxGQCT59AIxG/KSSWVFJDjkCYuvp392SAzD
	JCl62C2oaVHumrmYp6m//JHP89VLFL2QAncEVgGScJWlXKj0uV1CGFjqXtrjBcAOfmQH
	m0IvIfU/19JQaS9J6qFd2eqJhL+KsnAJndsnymq8J2qG2L8+PZ1VRU2I4Z2vb9QEOS3k
	P9GpTfMXjse4V7Ovb2ZBYR+8y2PerEadI5k1fFVjtw9NJQnWcuHl7l3C4aQNHj0Cj+4A
	NAvA==
X-Gm-Message-State: ALoCoQn9T/b/29P5L5l7i34DSq4lWt81fPkl20an6gl3mfJA34BMcoeCPdJTOhtcwZwY3eoEUjVN
X-Received: by 10.180.108.83 with SMTP id hi19mr4088091wib.26.1387299705942;
	Tue, 17 Dec 2013 09:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Tue, 17 Dec 2013 09:01:25 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1491405.gfUXU6e2O3@helios>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<6803371.I0exNcVham@helios>
	<CAK18fxH7hi15JcvrG0rQ9ZET0B4erxFec4FNZYf29p7QVH2jfA@mail.gmail.com>
	<1491405.gfUXU6e2O3@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 17 Dec 2013 19:01:25 +0200
Message-ID: <CAK18fxH2YHgqinv=jFqyQ_eZDNAVprv8p+-DAwWm0DNoH1GSgA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Alexandru Niculita <alexnick87@gmail.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Tue, 17 Dec 2013 17:01:46 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bb0252b8f9c04edbde200

--e89a8f3bb0252b8f9c04edbde200
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 17, 2013 at 6:53 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Tuesday 17 December 2013 18:51:08 Andrei Gherzan wrote:
> > On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton <
> >
> > paul.eggleton@linux.intel.com> wrote:
> > > On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:
> > > > From: Alexandru Niculita <alexnick87@gmail.com>
> > > >
> > > > Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
> > > > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> > > > ---
> > > >
> > > >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > > > b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb index
> 4b4ff63..84d3ad6
> > > > 100644
> > > > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > > > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > > > @@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES',
> > >
> > > 'directfb',
> > >
> > > > 'directfb', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'x11',
> > > > 'virtual/libx11 libxext libxrandr libxrender', '', d)} \ tslib"
> > > >
> > > >  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES',
> 'x11',
> > > >
> > > > 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender
> > > > nativesdk-libxext', '', d)}" +DEPENDS_class-native =
> > > > "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native
> > >
> > > libxrandr-native
> > >
> > > > libxrender-native libxext-native', '', d)}"
> > > >
> > > >  PR = "r2"
> > > >
> > > > @@ -63,4 +64,4 @@ do_configure_prepend() {
> > > >
> > > >          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> > > >
> > > >  }
> > > >
> > > > -BBCLASSEXTEND = "nativesdk"
> > > > +BBCLASSEXTEND = "nativesdk native"
> > >
> > > Why do you want to do this? Usually, it's better to rely on the host
> > > distro providing SDL for native because building libsdl-native can
> lead to
> > > problems linking against a specific host OpenGL implementation.
> >
> > xbmc needs sdl-native - this is why I made this change.
>
> Why does it need it though?
>
>
Actually xbmc has a tool called texturepacker which uses libsdl-image -
which needs libsdl. That's the chain.

-- 
ag

--e89a8f3bb0252b8f9c04edbde200
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Dec 17, 2013 at 6:53 PM, Paul Eggleton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.e=
ggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
uesday 17 December 2013 18:51:08 Andrei Gherzan wrote:<br>
&gt; On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton &lt;<br>
&gt;<br>
&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.i=
ntel.com</a>&gt; wrote:<br>
&gt; &gt; On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:<br>
&gt; &gt; &gt; From: Alexandru Niculita &lt;<a href=3D"mailto:alexnick87@gm=
ail.com">alexnick87@gmail.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65<br>
&gt; &gt; &gt; Signed-off-by: Alexandru Niculita &lt;<a href=3D"mailto:alex=
nick87@gmail.com">alexnick87@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2=
.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a> | 3 ++-<br>
&gt; &gt; &gt; =A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/libsdl/<a href=3D"http://=
libsdl_1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; &gt; &gt; b/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.=
15.bb" target=3D"_blank">libsdl_1.2.15.bb</a> index 4b4ff63..84d3ad6<br>
&gt; &gt; &gt; 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_=
1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_=
1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; &gt; &gt; @@ -17,6 +17,7 @@ DEPENDS =3D &quot;${@base_contains(&#39;DI=
STRO_FEATURES&#39;,<br>
&gt; &gt;<br>
&gt; &gt; &#39;directfb&#39;,<br>
&gt; &gt;<br>
&gt; &gt; &gt; &#39;directfb&#39;, &#39;&#39;, d)} \ ${@base_contains(&#39;=
DISTRO_FEATURES&#39;, &#39;x11&#39;,<br>
&gt; &gt; &gt; &#39;virtual/libx11 libxext libxrandr libxrender&#39;, &#39;=
&#39;, d)} \ tslib&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0DEPENDS_class-nativesdk =3D &quot;${@base_contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;x11&#39;,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &#39;virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-=
libxrender<br>
&gt; &gt; &gt; nativesdk-libxext&#39;, &#39;&#39;, d)}&quot; +DEPENDS_class=
-native =3D<br>
&gt; &gt; &gt; &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#=
39;, &#39;libx11-native<br>
&gt; &gt;<br>
&gt; &gt; libxrandr-native<br>
&gt; &gt;<br>
&gt; &gt; &gt; libxrender-native libxext-native&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0PR =3D &quot;r2&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; @@ -63,4 +64,4 @@ do_configure_prepend() {<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; &gt; &gt; +BBCLASSEXTEND =3D &quot;nativesdk native&quot;<br>
&gt; &gt;<br>
&gt; &gt; Why do you want to do this? Usually, it&#39;s better to rely on t=
he host<br>
&gt; &gt; distro providing SDL for native because building libsdl-native ca=
n lead to<br>
&gt; &gt; problems linking against a specific host OpenGL implementation.<b=
r>
&gt;<br>
&gt; xbmc needs sdl-native - this is why I made this change.<br>
<br>
</div></div>Why does it need it though?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>Actually xbmc has a tool called texturepacker which uses libs=
dl-image - which needs libsdl. That&#39;s the chain.</div><div>=A0</div></d=
iv>

--=A0</div><div class=3D"gmail_extra">ag</div></div>

--e89a8f3bb0252b8f9c04edbde200--
