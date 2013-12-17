Return-Path: <andrei@gherzan.ro>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 64AB560CFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:51:28 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hi5so4008358wib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YFPvGn29cWqoEJrBYHsjSj6CO5T/S5NHax8/EjL9QMI=;
	b=XANLVn0LuV5Z6pEbfZ/xqzqP5jm/+GvXYe0Sr4Fo9gvK84LltLv+XmP21ybRkh/JrR
	TfLhcTlQcUfdw0Ep1bX74TNViALCpn0xutvFN6mtzxkKQpPjMnjBTqKCV8+NcKktyIiP
	xWB0/CMRh4JVjK19x3bkyxYzaiPh008ost1EQT/KbamcT9uBEIem44N8bbD5rpPZ0+hh
	KPYlUdGMksYSBfSSctivnxsy29MmImcEi4ZnUoBTG9aS+dXL197Xh1yi2MxqLrjUhFeB
	db5LLtezRB/e6GuZJz1KOwlVrK2Vhw72UT6aXi0n4iYfNYQ+oD3tkX7kxXRR9C8ddTu3
	aydA==
X-Gm-Message-State: ALoCoQlVSyfe0/PqIROIW8cu9Z0gNEJmJ7q0nGaM81DLLbNV/9DHKyt0tuPCmutkmp/IX4NWJWgE
X-Received: by 10.194.95.198 with SMTP id dm6mr13379738wjb.57.1387299088282;
	Tue, 17 Dec 2013 08:51:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Tue, 17 Dec 2013 08:51:08 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <6803371.I0exNcVham@helios>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<6803371.I0exNcVham@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 17 Dec 2013 18:51:08 +0200
Message-ID: <CAK18fxH7hi15JcvrG0rQ9ZET0B4erxFec4FNZYf29p7QVH2jfA@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Dec 2013 16:51:29 -0000
Content-Type: multipart/alternative; boundary=047d7bb03a505ace4c04edbdbd13

--047d7bb03a505ace4c04edbdbd13
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:
> > From: Alexandru Niculita <alexnick87@gmail.com>
> >
> > Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
> > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> > ---
> >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb index 4b4ff63..84d3ad6
> > 100644
> > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > @@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES',
> 'directfb',
> > 'directfb', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'x11',
> > 'virtual/libx11 libxext libxrandr libxrender', '', d)} \ tslib"
> >  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11',
> > 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender
> > nativesdk-libxext', '', d)}" +DEPENDS_class-native =
> > "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native
> libxrandr-native
> > libxrender-native libxext-native', '', d)}"
> >
> >  PR = "r2"
> >
> > @@ -63,4 +64,4 @@ do_configure_prepend() {
> >          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> >  }
> >
> > -BBCLASSEXTEND = "nativesdk"
> > +BBCLASSEXTEND = "nativesdk native"
>
> Why do you want to do this? Usually, it's better to rely on the host distro
> providing SDL for native because building libsdl-native can lead to
> problems
> linking against a specific host OpenGL implementation.
>

xbmc needs sdl-native - this is why I made this change. I didn't encounter
any issues with the native libsdl so i thought this would be a better /
cleaner way to do it. If you guys don't agree, we can drop.

-- 
*ag*

--047d7bb03a505ace4c04edbdbd13
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.e=
ggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
uesday 17 December 2013 18:33:51 Andrei Gherzan wrote:<br>
&gt; From: Alexandru Niculita &lt;<a href=3D"mailto:alexnick87@gmail.com">a=
lexnick87@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65<br>
&gt; Signed-off-by: Alexandru Niculita &lt;<a href=3D"mailto:alexnick87@gma=
il.com">alexnick87@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb" ta=
rget=3D"_blank">libsdl_1.2.15.bb</a> | 3 ++-<br>
&gt; =A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2=
.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; b/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb" tar=
get=3D"_blank">libsdl_1.2.15.bb</a> index 4b4ff63..84d3ad6<br>
&gt; 100644<br>
&gt; --- a/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb"=
 target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb"=
 target=3D"_blank">libsdl_1.2.15.bb</a><br>
&gt; @@ -17,6 +17,7 @@ DEPENDS =3D &quot;${@base_contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;directfb&#39;,<br>
&gt; &#39;directfb&#39;, &#39;&#39;, d)} \ ${@base_contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;,<br>
&gt; &#39;virtual/libx11 libxext libxrandr libxrender&#39;, &#39;&#39;, d)}=
 \ tslib&quot;<br>
&gt; =A0DEPENDS_class-nativesdk =3D &quot;${@base_contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;x11&#39;,<br>
&gt; &#39;virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender=
<br>
&gt; nativesdk-libxext&#39;, &#39;&#39;, d)}&quot; +DEPENDS_class-native =
=3D<br>
&gt; &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;=
libx11-native libxrandr-native<br>
&gt; libxrender-native libxext-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;<br>
&gt; =A0PR =3D &quot;r2&quot;<br>
&gt;<br>
&gt; @@ -63,4 +64,4 @@ do_configure_prepend() {<br>
&gt; =A0 =A0 =A0 =A0 =A0export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR<br>
&gt; =A0}<br>
&gt;<br>
&gt; -BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;nativesdk native&quot;<br>
<br>
</div></div>Why do you want to do this? Usually, it&#39;s better to rely on=
 the host distro<br>
providing SDL for native because building libsdl-native can lead to problem=
s<br>
linking against a specific host OpenGL implementation.<br></blockquote><div=
><br></div><div>xbmc needs sdl-native - this is why I made this change. I d=
idn&#39;t encounter any issues with the native libsdl so i thought this wou=
ld be a better / cleaner way to do it. If you guys don&#39;t agree, we can =
drop.</div>

<div>=A0</div></div>--=A0</div><div class=3D"gmail_extra"><b style=3D"color=
:rgb(51,51,51);font-family:Arial;text-align:center">ag</b>
</div></div>

--047d7bb03a505ace4c04edbdbd13--
