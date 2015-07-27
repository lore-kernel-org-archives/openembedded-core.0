Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id C219673217
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 18:01:08 +0000 (UTC)
Received: by lblf12 with SMTP id f12so58824765lbl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8iLln17hMqoztLW23CRVFfNWMjuVRtwtzpK7QfXS8LA=;
	b=EcCqSOMltVerknnywnuuliZif9ZlTUP6oFtnoZ1muYfmASDYmUHn9mfaETfyLubQzv
	OvenQ+Lea3F1KmV61Q62E17n1d9OxoCAEEgeNbWu/9N2hYcEWbNaocwb2fn7RMz3ZGPi
	yqeJJpg9GEgLxGfEbF19xNVD49hizeRaWdDIy51/ojVfHHrPYvfhlSO/dldBGUlGf1pC
	dHHa+nLawqfnhARTyjGlgqnQons9MsfDZq9tBq6wlkp8B618SPlcXBBbeSRZnm7G6D9E
	/ffmCYrjA+iZRqOQsWaqJgohrch/lyqnMZ8aFtDQRiLH0Q7OwhUK7Rh99fwXIZQ+nxcE
	r1Gw==
X-Gm-Message-State: ALoCoQmkKQwPeBAVOUYc+++KvA0B2gCRDcUCVUUm3ThxBWmQkeYRVe94JCPZ17G4/F/PZU1mhqzy
X-Received: by 10.112.139.131 with SMTP id qy3mr28148351lbb.4.1438020067918;
	Mon, 27 Jul 2015 11:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.167.198 with HTTP; Mon, 27 Jul 2015 11:00:48 -0700 (PDT)
In-Reply-To: <20150727152544.GA307@jama>
References: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
	<20150727152544.GA307@jama>
From: Tobias Olausson <tobias.olausson@pelagicore.com>
Date: Mon, 27 Jul 2015 11:00:48 -0700
Message-ID: <CAMg8ce8qNmsMEz4dhVNCJMYJ0R-Eb6cnsNgSWAHnDWzZRJ6SdA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: fix sed for MESA_EGL_NO_X11_HEADERS in fido
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
X-List-Received-Date: Mon, 27 Jul 2015 18:01:12 -0000
Content-Type: multipart/alternative; boundary=001a11c33ffa541bbf051bdf234d

--001a11c33ffa541bbf051bdf234d
Content-Type: text/plain; charset=UTF-8

On 27 July 2015 at 08:25, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Jul 21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:
> > In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS uses an
> #ifdef,
> > not an #if define().
>
> So this commit which was recently backported to fido branch should be
> reverted:
>

Well, reverting the already backported patch would break my patch. I don't
mind resubmitting a new patch, but the one I originally submitted builds on
top of the backported one, so the backported one would be neutralized.


>
> commit 12e467f436fbc22f274558c753f0ac9756ce1071
> Author:     Robert Yang <liezhi.yang@windriver.com>
> AuthorDate: Wed May 6 00:08:35 2015 -0700
> Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
> CommitDate: Sun Jun 28 09:41:54 2015 +0100
>
>     mesa: fix do_install_append
>
>     "ifdef MESA_EGL_NO_X11_HEADERS" -> "if
> defined(MESA_EGL_NO_X11_HEADERS)"
>
>     (From OE-Core master rev: 3a464d67b60f70b865f7db768e7edc53e40ff450)
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>
> with proper commit message (preferably separately from
> 9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I like
> what this patch is doing.
>
> Thanks
>
> >
> > Also, this backports commit 9c746017af381884cc20c7cd563fc429c2c66112
> > to fido from master.
> >
> > Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
> >  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > index 90cccbe..a5f510d 100644
> > --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > @@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> >  do_install_append() {
> >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false',
> d)}; then
> > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> >      fi
> >  }
> > diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
> b/meta/recipes-graphics/mesa/mesa_git.bb
> > index 1598019..269ae1e 100644
> > --- a/meta/recipes-graphics/mesa/mesa_git.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> > @@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> >  do_install_append() {
> >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false',
> d)}; then
> > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> >      fi
> >  }
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>



-- 
Tobias Olausson
M.Sc
Software Engineer

PELAGICORE | Experience Change
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46(0)735-873444
E-Mail: tobias.olausson@pelagicore.com
IRC: wto @ FreeNode

--001a11c33ffa541bbf051bdf234d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 July 2015 at 08:25, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Jul =
21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:<br>
&gt; In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS uses a=
n #ifdef,<br>
&gt; not an #if define().<br>
<br>
</span>So this commit which was recently backported to fido branch should b=
e<br>
reverted:<br></blockquote><div><br></div><div>Well, reverting the already b=
ackported patch would break my patch. I don&#39;t mind resubmitting a new p=
atch, but the one I originally submitted builds on top of the backported on=
e, so the backported one would be neutralized.<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
commit 12e467f436fbc22f274558c753f0ac9756ce1071<br>
Author:=C2=A0 =C2=A0 =C2=A0Robert Yang &lt;<a href=3D"mailto:liezhi.yang@wi=
ndriver.com">liezhi.yang@windriver.com</a>&gt;<br>
AuthorDate: Wed May 6 00:08:35 2015 -0700<br>
Commit:=C2=A0 =C2=A0 =C2=A0Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
CommitDate: Sun Jun 28 09:41:54 2015 +0100<br>
<br>
=C2=A0 =C2=A0 mesa: fix do_install_append<br>
<br>
=C2=A0 =C2=A0 &quot;ifdef MESA_EGL_NO_X11_HEADERS&quot; -&gt; &quot;if defi=
ned(MESA_EGL_NO_X11_HEADERS)&quot;<br>
<br>
=C2=A0 =C2=A0 (From OE-Core master rev: 3a464d67b60f70b865f7db768e7edc53e40=
ff450)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@=
windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.lock@=
collabora.co.uk">joshua.lock@collabora.co.uk</a>&gt;<br>
<br>
with proper commit message (preferably separately from<br>
9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I like<br>
what this patch is doing.<br>
<br>
Thanks<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Also, this backports commit 9c746017af381884cc20c7cd563fc429c2c66112<b=
r>
&gt; to fido from master.<br>
&gt;<br>
&gt; Signed-off-by: Tobias Olausson &lt;<a href=3D"mailto:tobias.olausson@p=
elagicore.com">tobias.olausson@pelagicore.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a> | 2 +-<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D=
"noreferrer" target=3D"_blank">mesa_git.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; index 90cccbe..a5f510d 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; @@ -11,6 +11,6 @@ S =3D &quot;${WORKDIR}/Mesa-${PV}&quot;<br>
&gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
&gt;=C2=A0 do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;egl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO=
_X11_HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#3=
9;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_EGL_NO_X11_=
HEADERS/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}$=
{includedir}/EGL/eglplatform.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa_git.bb</a> b/meta/recipes-graphi=
cs/mesa/<a href=3D"http://mesa_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>mesa_git.bb</a><br>
&gt; index 1598019..269ae1e 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D=
"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D=
"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; @@ -13,6 +13,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
&gt;=C2=A0 do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;egl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO=
_X11_HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#3=
9;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_EGL_NO_X11_=
HEADERS/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}$=
{includedir}/EGL/eglplatform.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"lt=
r"><div>Tobias Olausson<br></div><div>M.Sc</div><div>Software Engineer</div=
><div><div><br></div><div>PELAGICORE | Experience Change</div><div>Ekelunds=
gatan 4, 6tr, SE-411 18 Gothenburg, Sweden<br></div><div>Mobile: +46(0)735-=
873444<br>E-Mail: <a href=3D"mailto:tobias.olausson@pelagicore.com" target=
=3D"_blank">tobias.olausson@pelagicore.com</a> <br></div></div><div>IRC: wt=
o @ FreeNode</div></div></div></div></div></div>
</div></div>

--001a11c33ffa541bbf051bdf234d--
