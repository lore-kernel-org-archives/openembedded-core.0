Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA7660167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:14:48 +0000 (UTC)
Received: by lblf12 with SMTP id f12so32417794lbl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qTwKwY220jJ2VJPu9yVnynrQLcgvzQVQlFTghQPBoWc=;
	b=d3LWnMWBraINPT3pl3OAwhL7i6QbmaAo8S0S7HKfs0ouUYO6qmh6wdtMODyiZUNzGV
	9hWZ+jgsZjyUqkrin7IKOPMfldFK+OAbdta+jAJnsJ0qYpMaE3ihWL5GNWscJyCACDa2
	TA5JgpGAvP6NGo/yUVmleUyt4HFBvjfZxYlO/Bh/uNG4SRbeBCK5aDSDk9DuIZBYkCmp
	GqLX7Tki/hkfyc4bJSTL44WF3OapUaPPFPjzS1lfjRQL0xru9UXFafZhZLP1p9vos+ea
	NSUQRyOBuaXxljllQWF7DSGJlmFG8wqoKSdFCQXxlGHHBdRkWIoMrkvDcFTSVns5T9mi
	fjFg==
X-Gm-Message-State: ALoCoQmN1DFnFRC7sYrqL4hQgqZvIGsf6mOo6n0qTrGPdbbUuaei+j8H02dCFe0YWHw45YcS91lz
X-Received: by 10.112.91.196 with SMTP id cg4mr45888149lbb.10.1438280087514;
	Thu, 30 Jul 2015 11:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.167.198 with HTTP; Thu, 30 Jul 2015 11:14:27 -0700 (PDT)
In-Reply-To: <1438272923.3455.23.camel@collabora.co.uk>
References: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
	<20150727152544.GA307@jama>
	<CAMg8ce8qNmsMEz4dhVNCJMYJ0R-Eb6cnsNgSWAHnDWzZRJ6SdA@mail.gmail.com>
	<1438272923.3455.23.camel@collabora.co.uk>
From: Tobias Olausson <tobias.olausson@pelagicore.com>
Date: Thu, 30 Jul 2015 11:14:27 -0700
Message-ID: <CAMg8ce-_hCr=x8RW2Q-ze7uvvVdQTEUTFShEHk92=zPP2BLgGw@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
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
X-List-Received-Date: Thu, 30 Jul 2015 18:14:49 -0000
Content-Type: multipart/alternative; boundary=001a113494dab4435a051c1bad57

--001a113494dab4435a051c1bad57
Content-Type: text/plain; charset=UTF-8

Sure, I'll submit two new patches in a minute.

//Tobias

On 30 July 2015 at 09:15, Joshua Lock <joshua.lock@collabora.co.uk> wrote:

> On Mon, 2015-07-27 at 11:00 -0700, Tobias Olausson wrote:
> > On 27 July 2015 at 08:25, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > > On Tue, Jul 21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:
> > > > In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS
> > > uses an #ifdef,
> > > > not an #if define().
> > >
> > > So this commit which was recently backported to fido branch should
> > > be
> > > reverted:
> > Well, reverting the already backported patch would break my patch. I
> > don't mind resubmitting a new patch, but the one I originally
> > submitted builds on top of the backported one, so the backported one
> > would be neutralized.
>
> Ideally you'd submit a series of patches with 1) a patch to revert the
> already backported patch below and 2) a patch to backport the change
> from 9c746017af381884cc20c7cd563fc429c2c66112.
>
> That would give us nice clean git history (making future patch
> backporting easier) and mean next to no work for me.
>
> Does that seem reasonable?
>
> Regards,
>
> Joshua
>
> > >
> > > commit 12e467f436fbc22f274558c753f0ac9756ce1071
> > > Author:     Robert Yang <liezhi.yang@windriver.com>
> > > AuthorDate: Wed May 6 00:08:35 2015 -0700
> > > Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
> > > CommitDate: Sun Jun 28 09:41:54 2015 +0100
> > >
> > >     mesa: fix do_install_append
> > >
> > >     "ifdef MESA_EGL_NO_X11_HEADERS" -> "if
> > > defined(MESA_EGL_NO_X11_HEADERS)"
> > >
> > >     (From OE-Core master rev:
> > > 3a464d67b60f70b865f7db768e7edc53e40ff450)
> > >
> > >     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > >     Signed-off-by: Richard Purdie <
> > > richard.purdie@linuxfoundation.org>
> > >     Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> > >
> > > with proper commit message (preferably separately from
> > > 9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I
> > > like
> > > what this patch is doing.
> > >
> > > Thanks
> > >
> > > >
> > > > Also, this backports commit
> > > 9c746017af381884cc20c7cd563fc429c2c66112
> > > > to fido from master.
> > > >
> > > > Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
> > > > ---
> > > >  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
> > > >  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > > index 90cccbe..a5f510d 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > > +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > > @@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
> > > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > > >  do_install_append() {
> > > >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true',
> > > 'false', d)}; then
> > > > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> > > ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> > > ${D}${includedir}/EGL/eglplatform.h
> > > > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> > > defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECO
> > > NFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > > >      fi
> > > >  }
> > > > diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
> > > b/meta/recipes-graphics/mesa/mesa_git.bb
> > > > index 1598019..269ae1e 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa_git.bb
> > > > +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> > > > @@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
> > > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > > >  do_install_append() {
> > > >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true',
> > > 'false', d)}; then
> > > > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> > > ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> > > ${D}${includedir}/EGL/eglplatform.h
> > > > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> > > defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECO
> > > NFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > > >      fi
> > > >  }
> > > > --
> > > > 2.1.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> >
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



-- 
Tobias Olausson
M.Sc
Software Engineer

PELAGICORE | Experience Change
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46(0)735-873444
E-Mail: tobias.olausson@pelagicore.com
IRC: wto @ FreeNode

--001a113494dab4435a051c1bad57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, I&#39;ll submit two new patches in a minute.<br=
><br></div>//Tobias<br></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 30 July 2015 at 09:15, Joshua Lock <span dir=3D"ltr">&lt;<a =
href=3D"mailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@c=
ollabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On Mon, 2015-07-27 at 11:00 -0700, Tobias Olausson wrote:<br>
&gt; On 27 July 2015 at 08:25, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; On Tue, Jul 21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:<=
br>
&gt; &gt; &gt; In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEAD=
ERS<br>
&gt; &gt; uses an #ifdef,<br>
&gt; &gt; &gt; not an #if define().<br>
&gt; &gt;<br>
&gt; &gt; So this commit which was recently backported to fido branch shoul=
d<br>
&gt; &gt; be<br>
&gt; &gt; reverted:<br>
&gt; Well, reverting the already backported patch would break my patch. I<b=
r>
&gt; don&#39;t mind resubmitting a new patch, but the one I originally<br>
&gt; submitted builds on top of the backported one, so the backported one<b=
r>
&gt; would be neutralized.<br>
<br>
</span>Ideally you&#39;d submit a series of patches with 1) a patch to reve=
rt the<br>
already backported patch below and 2) a patch to backport the change<br>
from 9c746017af381884cc20c7cd563fc429c2c66112.<br>
<br>
That would give us nice clean git history (making future patch<br>
backporting easier) and mean next to no work for me.<br>
<br>
Does that seem reasonable?<br>
<br>
Regards,<br>
<br>
Joshua<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt;<br>
&gt; &gt; commit 12e467f436fbc22f274558c753f0ac9756ce1071<br>
&gt; &gt; Author:=C2=A0 =C2=A0 =C2=A0Robert Yang &lt;<a href=3D"mailto:liez=
hi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt; AuthorDate: Wed May 6 00:08:35 2015 -0700<br>
&gt; &gt; Commit:=C2=A0 =C2=A0 =C2=A0Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t;<br>
&gt; &gt; CommitDate: Sun Jun 28 09:41:54 2015 +0100<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mesa: fix do_install_append<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;ifdef MESA_EGL_NO_X11_HEADERS&quot; -&gt=
; &quot;if<br>
&gt; &gt; defined(MESA_EGL_NO_X11_HEADERS)&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(From OE-Core master rev:<br>
&gt; &gt; 3a464d67b60f70b865f7db768e7edc53e40ff450)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mail=
to:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Richard Purdie &lt;<br>
&gt; &gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Joshua Lock &lt;<a href=3D"mail=
to:joshua.lock@collabora.co.uk">joshua.lock@collabora.co.uk</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; with proper commit message (preferably separately from<br>
&gt; &gt; 9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I<b=
r>
&gt; &gt; like<br>
&gt; &gt; what this patch is doing.<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also, this backports commit<br>
&gt; &gt; 9c746017af381884cc20c7cd563fc429c2c66112<br>
&gt; &gt; &gt; to fido from master.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tobias Olausson &lt;<a href=3D"mailto:tobias.=
olausson@pelagicore.com">tobias.olausson@pelagicore.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a> | 2 +-<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_git.bb</a>=C2=A0 =C2=A0 | 2 +=
-<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://me=
sa_10.4.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; &gt; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; &gt; &gt; index 90cccbe..a5f510d 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
&gt; &gt; &gt; @@ -11,6 +11,6 @@ S =3D &quot;${WORKDIR}/Mesa-${PV}&quot;<br=
>
&gt; &gt; &gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEA=
DER<br>
&gt; &gt; &gt;=C2=A0 do_install_append() {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;egl&#39;, &#39;true&#39;,<br>
&gt; &gt; &#39;false&#39;, d)}; then<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(M=
ESA_EGL_NO_X11_HEADERS)/#if<br>
&gt; &gt; ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &#39=
;0&#39;, &#39;1&#39;, d)}/&#39;<br>
&gt; &gt; ${D}${includedir}/EGL/eglplatform.h<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_E=
GL_NO_X11_HEADERS/#if<br>
&gt; &gt; defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39;PAC=
KAGECO<br>
&gt; &gt; NFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D=
}${includedir}/EGL/eglplatform.h<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://me=
sa_git.bb" rel=3D"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; &gt; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; &gt; &gt; index 1598019..269ae1e 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_git.bb</a><br>
&gt; &gt; &gt; @@ -13,6 +13,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEA=
DER<br>
&gt; &gt; &gt;=C2=A0 do_install_append() {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;egl&#39;, &#39;true&#39;,<br>
&gt; &gt; &#39;false&#39;, d)}; then<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(M=
ESA_EGL_NO_X11_HEADERS)/#if<br>
&gt; &gt; ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &#39=
;0&#39;, &#39;1&#39;, d)}/&#39;<br>
&gt; &gt; ${D}${includedir}/EGL/eglplatform.h<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_E=
GL_NO_X11_HEADERS/#if<br>
&gt; &gt; defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39;PAC=
KAGECO<br>
&gt; &gt; NFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D=
}${includedir}/EGL/eglplatform.h<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.1.4<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">=
Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/op=
enembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Tobias Olausson<br></div><div>M.Sc</div><div>Software Engineer</div>=
<div><div><br></div><div>PELAGICORE | Experience Change</div><div>Ekelundsg=
atan 4, 6tr, SE-411 18 Gothenburg, Sweden<br></div><div>Mobile: +46(0)735-8=
73444<br>E-Mail: <a href=3D"mailto:tobias.olausson@pelagicore.com" target=
=3D"_blank">tobias.olausson@pelagicore.com</a> <br></div></div><div>IRC: wt=
o @ FreeNode</div></div></div></div></div></div>
</div>

--001a113494dab4435a051c1bad57--
