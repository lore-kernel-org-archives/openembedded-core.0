Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE0A6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 17:04:15 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g203so138595515iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=FQXNZQCjsKQ+zJUJoAYwMJifJqgHJkiNEuymj3dF8jY=;
	b=qK3jqi7aG4m/hpckiZhL4PuBKgjv5+HFybu0uZTQWzsiHP5CUgcJ+yGOb3F4MV/NkY
	pG+8zY81gFCcVMJ19tLfGoRZv54QIN1s45A3cXAt+1pH2HNSd2/QvysYmI2rQJLk02JB
	Ieq1P18pSfdbrvJY/C8Nx9fxOD2LpCZFMEHggscjPaWWYiGuTzYKCIg0csEwpqsKifD3
	26aKUUoP3w9XOORNYQpBHbIEccB4qESG/P0Pf4w55n8xtknkVyTZue0k0+Fi33RKxQxG
	lIyRu1IFsjZpvriI3fGrYWCzH6e2V+8tn8kCielQVJc3j4xlSYhyswUbi24F4H8MIbkH
	3oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=FQXNZQCjsKQ+zJUJoAYwMJifJqgHJkiNEuymj3dF8jY=;
	b=LRVtNfREcwnOsegYUrTtmkiYA8gAQqiLjTefoaLMqhG85U5TP87BhH6Zq3AMhUD951
	E+89UcRUxm4g3FMIk1/ehWXKKFU+zehI4Osu/GKXdEFBobTyUSrOAO5i37aN+ixwtudJ
	ajrVBrLteKS1RJ6jwPQnzMDpMffvNJzoEBwMp6ugL+X54HUORKAp/+cOZp6kFXgwtfoA
	i/ZFOm5Z46kJw/jZ5VIJIk42nOeM8MeTTmken9P40sm+qswTnDdojsugvIwWP/UAE61H
	LDBWMtx+4ZkVmwrb/JydADcucVM0PbsxsuRgNfIDUu5I6EevizW9ESkrWWmyzJLimatk
	+deg==
X-Gm-Message-State: AG10YOTSYj5+1ZqDHunpqH4dEXaUYfvD1Rc/kk5yIbLy1QfLrZEKvg2Ludp6kEaZ0XrXAdWLcoI1adLusONCBg==
X-Received: by 10.107.14.66 with SMTP id 63mr3528068ioo.150.1455555855591;
	Mon, 15 Feb 2016 09:04:15 -0800 (PST)
MIME-Version: 1.0
References: <1455551116.16142.420.camel@linuxfoundation.org>
	<CABcZANmkyA_RYbjtHRirU1iByBJ44srcdLR360Neke+vGAjukA@mail.gmail.com>
	<1455555481.16142.424.camel@linuxfoundation.org>
In-Reply-To: <1455555481.16142.424.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 15 Feb 2016 17:04:06 +0000
Message-ID: <CABcZAN=KCAHQG20m6OknPAbdAbByh6SP8wa5N0BAfvn7g37QiA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ed_0.5: Handle --disable-static option
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
X-List-Received-Date: Mon, 15 Feb 2016 17:04:16 -0000
Content-Type: multipart/alternative; boundary=001a113fe1bebadda7052bd2019f

--001a113fe1bebadda7052bd2019f
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 9:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2016-02-15 at 16:47 +0000, Christopher Larson wrote:
> >
> >
> > On Mon, Feb 15, 2016 at 8:45 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > Also clean up use of immediate expansion as there are cleaner
> > > mechanisms now.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > > diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes
> > > -extended/ed/ed_0.5.bb
> > > index 143e636..e2df13f 100644
> > > --- a/meta/recipes-extended/ed/ed_0.5.bb
> > > +++ b/meta/recipes-extended/ed/ed_0.5.bb
> > > @@ -15,7 +15,6 @@ inherit autotools texinfo
> > >
> > >  EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}'
> > > 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
> > >
> > > -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('-
> > > -disable-dependency-tracking', ' ')}"
> > > -CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('-
> > > -disable-silent-rules', ' ')}"
> > > -
> > > -
> > > +CONFIGUREOPTS_remove = "--disable-dependency-tracking"
> > > +CONFIGUREOPTS_remove = "--disable-silent-rules"
> > > +EXTRA_OECONF_remove = "--disable-static"
> > This will be impossible to undo in a bbappend..
>
> I appreciate that and we've talked about ways we likely need to extend
> the API for that.
>
> In this case, I would ask why would anyone want/need to add in a
> configure option which configure doesn't support?
>

Right, fair enough, I didn't read the patch carefully enough. Sorry for the
distraction.

--001a113fe1bebadda7052bd2019f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Feb 15, 2016 at 9:58 AM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Mon, 2016-02-15 at 16:47 +0000, C=
hristopher Larson wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Feb 15, 2016 at 8:45 AM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; Also clean up use of immediate expansion as there are cleaner<br>
&gt; &gt; mechanisms now.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">ed_0.5.bb</a> b/meta/recipes<br>
&gt; &gt; -extended/ed/<a href=3D"http://ed_0.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ed_0.5.bb</a><br>
&gt; &gt; index 143e636..e2df13f 100644<br>
&gt; &gt; --- a/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ed_0.5.bb</a><br>
&gt; &gt; +++ b/meta/recipes-extended/ed/<a href=3D"http://ed_0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ed_0.5.bb</a><br>
&gt; &gt; @@ -15,7 +15,6 @@ inherit autotools texinfo<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 EXTRA_OECONF =3D &quot;&#39;CC=3D${CC}&#39; &#39;CXX=3D${CX=
X}&#39; &#39;CFLAGS=3D${CFLAGS}&#39;<br>
&gt; &gt; &#39;CXXFLAGS=3D${CXXFLAGS}&#39; &#39;CPPFLAGS=3D${CPPFLAGS}&#39;=
 &#39;LDFLAGS=3D${LDFLAGS}&#39;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -CONFIGUREOPTS :=3D &quot;${@d.getVar(&#39;CONFIGUREOPTS&#39;, Tr=
ue).replace(&#39;-<br>
&gt; &gt; -disable-dependency-tracking&#39;, &#39; &#39;)}&quot;<br>
&gt; &gt; -CONFIGUREOPTS :=3D &quot;${@d.getVar(&#39;CONFIGUREOPTS&#39;, Tr=
ue).replace(&#39;-<br>
&gt; &gt; -disable-silent-rules&#39;, &#39; &#39;)}&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; +CONFIGUREOPTS_remove =3D &quot;--disable-dependency-tracking&quo=
t;<br>
&gt; &gt; +CONFIGUREOPTS_remove =3D &quot;--disable-silent-rules&quot;<br>
&gt; &gt; +EXTRA_OECONF_remove =3D &quot;--disable-static&quot;<br>
&gt; This will be impossible to undo in a bbappend..<br>
<br>
I appreciate that and we&#39;ve talked about ways we likely need to extend<=
br>
the API for that.<br>
<br>
In this case, I would ask why would anyone want/need to add in a<br>
configure option which configure doesn&#39;t support?<br></blockquote><div>=
<br></div><div>Right, fair enough, I didn&#39;t read the patch carefully en=
ough. Sorry for the distraction.=C2=A0</div></div></div>

--001a113fe1bebadda7052bd2019f--
