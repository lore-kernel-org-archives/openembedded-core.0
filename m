Return-Path: <alexandru.damian@intel.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id C56EF6A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:06:34 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id f4so11075850oah.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=elvF0gYHiHbARriJ1ub5MTfWJ6EUnNBiPaXPugqodMQ=;
	b=WGtmVyytUvvOUT+cxvZi497wqHiKNCnjoM3/WpMhguBK/CHcuMeeoeO2VUtui9fVHh
	gCgvSrHGMb+l8teLy7NAUY0dzXkhlW82Jp/AEqXsl9G2ZmwyT45p30d8EGvFTItTI5Ui
	nWamhmWI2TLdWiXbXa5/XzTbL+HDHbl3wIGCvWK35R8YhvNKLI3pgPqNGi7KwPCSzB9n
	qOiSonqH7hVgyg5nZWnhGrntkbnZpVLxrhia7WIeg22bzNfZU5jTMgTYPB3ASafS037F
	x0Z5VvrTDnSnUTH05dRL4e50MGXHm8DVkvpp5tb/YwPOWRL3Gq1N7w6hoAwcslB+aV6b
	8IzA==
X-Received: by 10.182.28.98 with SMTP id a2mr24045039obh.36.1374584794876;
	Tue, 23 Jul 2013 06:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.141.47 with HTTP; Tue, 23 Jul 2013 06:06:14 -0700 (PDT)
In-Reply-To: <20130723124418.GL9527@jama>
References: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
	<20130723124418.GL9527@jama>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Tue, 23 Jul 2013 14:06:14 +0100
Message-ID: <CAJ2CSBtUPvJcHUnd=o2Cq_NrByaDv=0HW=Zbh=MX3W6oXEuTOQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmPTuxpVLW1pVm7zKdeFQtwBwbvh3iUF1MPBnA9pGmVpCnOincPFUyt80Sws+qJP9Knr4CQ
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add harfbuzz dependency
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
X-List-Received-Date: Tue, 23 Jul 2013 13:06:35 -0000
Content-Type: multipart/alternative; boundary=089e0158adfe699d6404e22d7615

--089e0158adfe699d6404e22d7615
Content-Type: text/plain; charset=UTF-8

weston.spec clearly describes the dependency.

And I found it while trying to compile. It's needed.


On Tue, Jul 23, 2013 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Tue, Jul 23, 2013 at 12:01:19PM +0100, Alex DAMIAN wrote:
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > Weston 1.1.0 has a build time dependency on libharfbuzz,
> > so we add it.
>
> I don't see that dependency in weston/master repo, are you sure it isn't
> pulled by cairo/pango?
>
> >
> > Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> > ---
> >  meta/recipes-graphics/wayland/weston_1.1.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bbb/meta/recipes-graphics/wayland/
> weston_1.1.0.bb
> > index 7327b98..e324134 100644
> > --- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
> > +++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
> > @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =
> "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa5
> >  inherit autotools pkgconfig useradd
> >
> >  DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> > -DEPENDS += "wayland mesa virtual/egl"
> > +DEPENDS += "wayland mesa virtual/egl harfbuzz"
> >
> >  EXTRA_OECONF = "--disable-android-compositor \
> >                  --enable-setuid-install \
> > --
> > 1.8.1.2
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
Alex Damian
Yocto Project
SSG / OTC

--089e0158adfe699d6404e22d7615
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>weston.spec clearly describes the dependency.<br><br>=
</div>And I found it while trying to compile. It&#39;s needed.<br></div><di=
v class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Jul 23, =
2013 at 1:44 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:marti=
n.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> =
wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, Jul 23, 2013 at 12=
:01:19PM +0100, Alex DAMIAN wrote:<br>
&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; Weston 1.1.0 has a build time dependency on libharfbuzz,<br>
&gt; so we add it.<br>
<br>
</div>I don&#39;t see that dependency in weston/master repo, are you sure i=
t isn&#39;t<br>
pulled by cairo/pango?<br>
<div class=3D"im"><br>
&gt;<br>
&gt; Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian=
@intel.com">alexandru.damian@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston_1.1.0.bb"=
 target=3D"_blank">weston_1.1.0.bb</a> | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston_1.=
1.0.bb" target=3D"_blank">weston_1.1.0.bb</a> b/meta/recipes-graphics/wayla=
nd/<a href=3D"http://weston_1.1.0.bb" target=3D"_blank">weston_1.1.0.bb</a>=
<br>


&gt; index 7327b98..e324134 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/<a href=3D"http://weston_1.1.0.bb"=
 target=3D"_blank">weston_1.1.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston_1.1.0.bb"=
 target=3D"_blank">weston_1.1.0.bb</a><br>
&gt; @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D &quot;e7715d2c731f77a729c994a=
599ffdaebac1307b2dd9336136706869fa5<br>
&gt; =C2=A0inherit autotools pkgconfig useradd<br>
&gt;<br>
&gt; =C2=A0DEPENDS =3D &quot;libxkbcommon gdk-pixbuf pixman cairo glib-2.0 =
jpeg&quot;<br>
&gt; -DEPENDS +=3D &quot;wayland mesa virtual/egl&quot;<br>
&gt; +DEPENDS +=3D &quot;wayland mesa virtual/egl harfbuzz&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF =3D &quot;--disable-android-compositor \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable=
-setuid-install \<br>
&gt; --<br>
&gt; 1.8.1.2<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div><=
/div>
</div>

--089e0158adfe699d6404e22d7615--
