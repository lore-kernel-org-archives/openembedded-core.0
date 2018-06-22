Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95B1474E53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 15:07:28 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id l15-v6so7825929oth.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yQM/Jo1Gx1mpJ+8nZlGtD/srWu5phlSK6bAoB0gIlUQ=;
	b=GGm3ivRtXC1qPAweQpyiEYR42/T3/b4rPsuLNyN4yyeUYiA8XCmrBlmP2I2CRK9QhR
	9yXVqjUEsQk5UQssIooObre2iXDsc96gvuzELoMtv7V3AMy5R23t20dZTBBpwoLPLH/N
	whc4mZ0NAGP6OE0FgUweqpw8JJnIcXdGZ0Fa0rMFZMNhRoeU1FkVI3lI6V2aOO9uxYya
	PF8cDhye8cgzZd9O/GI2T/m/XSo65yzqc+npGem7BFPM85WNzQZy0LhEvi/lOJMICj3d
	idIEd5+hiCcSVaMEGrbF2cR7OHF1iLWHUqdmz0p1v/Nx8NepL2e0zV7AHduY9O+rA3hZ
	j47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yQM/Jo1Gx1mpJ+8nZlGtD/srWu5phlSK6bAoB0gIlUQ=;
	b=YiXohXhqTaPQDeI3rEO5/urXjIbzmbITlBHZ8JlIlUTvGtR8wJjxaCN8BiOQXCqI1l
	Jc1CwJt/BM+PHmSoeCJQH3/Av6i+s5Rcb8iN68wjIkMI0y0G3xX+Y/Eo6TGcb3ILFydl
	rMRlK05GgcdguZPwSwXjiDv1RVi7S+X1uLmsFrrZG1pjV/ZLjqcxNm+Sc4eHHA1QQnLw
	6HiXSR6tHVpi2o9zIpf1uJUWPjUZ7HPXyjKK3r1XOjVS2jlKIQ25+MUpQTQHzvmY63+E
	9DyQIATQJlwPOuJYhLWMPG0zQjqKtbYtN0a91k94/lNLCIf9M9wBvpvPus9Dc9EfGUKv
	OHnw==
X-Gm-Message-State: APt69E1K9+Ph8TpBWBtI1KuhkUqEik95TNCPmCTzdama19ooXpGEoStH
	Wg+C7pZaxq26KjKfh5lr1bbBaBcrOqVW2WxWW8I=
X-Google-Smtp-Source: ADUXVKK1GilmK7JBjYJWWmxn7MKphaLcjm/pT4h5+AHXyUJkPpoxz9AyeUmzqx0HhS2krArG1bUgoitzmJ0BAWwRfEE=
X-Received: by 2002:a9d:2104:: with SMTP id i4-v6mr109347otb.275.1529680049535;
	Fri, 22 Jun 2018 08:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1529604086.git.chris_larson@mentor.com>
	<5ce7b09e00b4967d2c0efaad58049cf871fab57a.1529604086.git.chris_larson@mentor.com>
	<74728be5ad84d7fcc78d591b3eb85b5780ea7075.camel@linuxfoundation.org>
In-Reply-To: <74728be5ad84d7fcc78d591b3eb85b5780ea7075.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 22 Jun 2018 08:07:16 -0700
Message-ID: <CABcZANnH+5fUx_8K3X0wNZjX9FUHa6+wYrQhtxwmYNwgKHg_xg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] perf: drop the rdep on man
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
X-List-Received-Date: Fri, 22 Jun 2018 15:07:28 -0000
Content-Type: multipart/alternative; boundary="000000000000f8fe23056f3c6305"

--000000000000f8fe23056f3c6305
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 22, 2018 at 12:36 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-06-22 at 02:07 +0500, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > It's not common practice to make -doc rdep on man when man pages are
> > included, and doing so prevents the recipe from building for non-
> > gplv3
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > kernel/perf/perf.bb
> > index 51f5597eb92..5e710f61834 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -239,7 +239,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >  PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
> >
> >  RDEPENDS_${PN} += "elfutils bash"
> > -RDEPENDS_${PN}-doc += "man"
> >  RDEPENDS_${PN}-archive =+ "bash"
> >  RDEPENDS_${PN}-python =+ "bash python python-modules ${@bb.utils.con
> > tains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
> >  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
>
> We're certainly not consistent but:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/manpages.bbclass#n13
>
> RDEPENDS_${MAN_PKG} += "${@bb.utils.contains('PACKAGECONFIG', 'manpages',
> 'man-db', '', d)}"
>
> man-db is gplv2 too...
>

Ah, well spotted, I didn't know about that one. If that's the case, I'll
drop this patch and rework both it and manpages.bbclass to make the rdep
conditional on license compatibility. Thanks!
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000f8fe23056f3c6305
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 22, 2018 at 12:36 AM Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Fri, 2018-06-22 at 02:07 +0500, =
Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; <br>
&gt; It&#39;s not common practice to make -doc rdep on man when man pages a=
re<br>
&gt; included, and doing so prevents the recipe from building for non-<br>
&gt; gplv3<br>
&gt; <br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a> | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-<br>
&gt; kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_b=
lank">perf.bb</a><br>
&gt; index 51f5597eb92..5e710f61834 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; @@ -239,7 +239,6 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-archive ${PN}-tests ${PN}-perl ${PN}-p=
ython&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;elfutils bash&quot;<br>
&gt; -RDEPENDS_${PN}-doc +=3D &quot;man&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-archive =3D+ &quot;bash&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-python =3D+ &quot;bash python python-modules ${@b=
b.utils.con<br>
&gt; tains(&#39;PACKAGECONFIG&#39;, &#39;audit&#39;, &#39;audit-python&#39;=
, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-perl =3D+ &quot;bash perl perl-modules&quot;<br>
<br>
We&#39;re certainly not consistent but:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/manp=
ages.bbclass#n13" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproj=
ect.org/cgit.cgi/poky/tree/meta/classes/manpages.bbclass#n13</a><br>
<br>
RDEPENDS_${MAN_PKG} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;manpages&#39;, &#39;man-db&#39;, &#39;&#39;, d)}&quot;<br>
<br>
man-db is gplv2 too...<br></blockquote><div><br></div><div>Ah, well spotted=
, I didn&#39;t know about that one. If that&#39;s the case, I&#39;ll drop t=
his patch and rework both it and manpages.bbclass to make the rdep conditio=
nal on license compatibility. Thanks!<br></div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<b=
r>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, =
Mentor Graphics</div></div></div></div></div>

--000000000000f8fe23056f3c6305--
