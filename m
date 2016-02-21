Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3485F772CD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 15:12:57 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id x4so70529227lbm.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/8QUlFVTPf/FHIvrnHRf4oj49tukcpNYQG5qLsShDIU=;
	b=lXCHLz/RmepUq5SyNOlmhjUzoACwameQCGWbo3ECac/0PTN5tnLpd3hhJZqYhQFLjD
	1cFryyAzLgj3BSDgn1nTf+WREAV9cOY9lNBt1FS3yAdt5c/QUuySIA0VlSgPxhmoORyn
	iuuUkD+pryVye2zfTs5G1V2rRpTrs7AfJCVY3Agiu7pFPvdarOaF8hq0sjuT8RtWZSAs
	P5dVUo0Gh1EpqlH6NvpF4jYIms9olx7+U2/brpYwVb1JIlX+GhXv6a3IRUAMEyPppdAl
	nyA7wd4zDPOnlbM/gTuC6jhhWf1IAjspVUPAB7BNB6nD2UPyPLMNoIYTURjZvwFHwWYL
	W+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/8QUlFVTPf/FHIvrnHRf4oj49tukcpNYQG5qLsShDIU=;
	b=JJ8GWlYUjcQ7bE5/Un25KVLBce6lHs/JRUF1rtCldNhYlg3XUMAe59EcZJl5CgwL29
	TuDIUBu/6DRg6t4W2c0fOUN8AKhZVRtTXy5ol+h2VMFfhyJkTjnWuFLeqsxMoeDaHzjQ
	JX92LNbC6yM36FnYhrMpAsYTFKumWZM2Yo/lEkZkv6nHBhMxbB5FV/hsmvzPNG91nDsX
	xxDiTkQz1OzbMRt0IX32C8Z5nmeyeI6bTOym9HVWQ4eomfAtMIocpPjTr0/p1uaoy1sk
	xv/Jmb2tz4pv3XJjvdBoPZkJ31vZKuyfHT9pTz2BhTvUpJwu7kun/MQ81wV1ag/kNuGS
	mYfw==
X-Gm-Message-State: AG10YOQcU65caZ64phl3V6R/Fea1V4Z4zdPOZuEsrT0YQEA/em4ESNmhi9hYnSZsMsjLj7k11otjsHDxxffDdGDi
MIME-Version: 1.0
X-Received: by 10.112.235.71 with SMTP id uk7mr8451852lbc.39.1456067577803;
	Sun, 21 Feb 2016 07:12:57 -0800 (PST)
Received: by 10.114.29.74 with HTTP; Sun, 21 Feb 2016 07:12:57 -0800 (PST)
In-Reply-To: <CAHiDW_GqS-S1OK2FQ6v4vf=iDQiXdKyJQewz7a5iZ2wYajfmAw@mail.gmail.com>
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAHiDW_GqS-S1OK2FQ6v4vf=iDQiXdKyJQewz7a5iZ2wYajfmAw@mail.gmail.com>
Date: Sun, 21 Feb 2016 20:42:57 +0530
Message-ID: <CAD3vsf4=9HvXsQPmRKdrAqG3m4nyLRmfoN2Aq19D1A2=jp+X1g@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Sun, 21 Feb 2016 15:13:00 -0000
Content-Type: multipart/alternative; boundary=001a11c3c5c2be8c5c052c4926c8

--001a11c3c5c2be8c5c052c4926c8
Content-Type: text/plain; charset=UTF-8

Hi Jussi,

Thank you for considering the addition of cantarell fonts to OE-core. I
will submit an updated cantarell fonts recipe with v0.0.21 and PR ="r0"
removed.

Regards,
Jagadeesh

On Tue, Feb 9, 2016 at 8:07 PM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Hi again,
>
> Maybe this does make sense even with the downsides I mentioned earlier:
> testing the layout is a good idea (even if just using font metrics), and
> the build/install time/size of cantarell are reasonable. The test in
> question seems good to me and these patches produce correct results.
>
> A recipe review comment below.
>
> Jussi
>
>
> On 9 January 2016 at 16:32, Jagadeesh Krishnanjanappa <
> jkrishnanjanappa@mvista.com> wrote:
> >
> > 1. The Cantarell font typeface is designed as a
> >    contemporary Humanist sans serif, and was developed for
> >    on-screen reading; in particular, reading web pages on an
> >    HTC Dream mobile phone.
> >
> > 2. Pango test case (test-layout.test) requires cantarell-font
> >    typeface. This test case uses 'Cantarell 11' font type
> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  .../cantarell-fonts/cantarell-fonts_git.bb         | 25
> ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 meta/recipes-graphics/cantarell-fonts/
> cantarell-fonts_git.bb
> >
> > diff --git a/meta/recipes-graphics/cantarell-fonts/
> cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/
> cantarell-fonts_git.bb
> > new file mode 100644
> > index 0000000..f55fef1
> > --- /dev/null
> > +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY = "Cantarell, a Humanist sans-serif font family"
> > +
> > +DESCRIPTION = "The Cantarell font typeface is designed as a \
> > +               contemporary Humanist sans serif, and was developed for \
> > +               on-screen reading; in particular, reading web pages on
> an \
> > +               HTC Dream mobile phone."
> > +
> > +HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
> > +SECTION = "fonts"
> > +LICENSE = "OFL-1.1"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
> > +
> > +PV = "0.0.18.1+git${SRCPV}"
>
> We could go with 0.0.21 since that's now out (I realize you picked the
> newest release at the time -- sorry for extra work).
>
> > +PR = "r0"
>
> PR is not needed.
>
> > +
> > +SRCREV = "3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4"
> > +SRC_URI = "git://
> git.gnome.org/cantarell-fonts;protocol=git;branch=master"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit autotools allarch fontcache
> > +
> > +PACKAGECONFIG ??= ""
> > +PACKAGECONFIG[fontforge] =
> "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
> > +FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3c5c2be8c5c052c4926c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jussi,<div><br></div><div>Thank you for considering the=
 addition of cantarell fonts to OE-core. I will submit an updated cantarell=
 fonts recipe with v0.0.21 and PR =3D&quot;r0&quot; removed.</div><div><br>=
</div><div>Regards,</div><div>Jagadeesh<br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Tue, Feb 9, 2016 at 8:07 PM, Jussi Kukkonen <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_=
blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Hi again,<div><br>Maybe this does make sense=
 even with the downsides I mentioned earlier: testing the layout is a good =
idea (even if just using font metrics), and the build/install time/size of =
cantarell are reasonable. The test in question seems good to me and these p=
atches produce correct results.<br><br>A recipe review comment below.<br><b=
r>Jussi<div><div class=3D"h5"><br><br>On 9 January 2016 at 16:32, Jagadeesh=
 Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=
=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt; wrote:<br>&gt;<br>&gt; 1. T=
he Cantarell font typeface is designed as a<br>&gt; =C2=A0 =C2=A0contempora=
ry Humanist sans serif, and was developed for<br>&gt; =C2=A0 =C2=A0on-scree=
n reading; in particular, reading web pages on an<br>&gt; =C2=A0 =C2=A0HTC =
Dream mobile phone.<br>&gt;<br>&gt; 2. Pango test case (test-layout.test) r=
equires cantarell-font<br>&gt; =C2=A0 =C2=A0typeface. This test case uses &=
#39;Cantarell 11&#39; font type <br>&gt;<br>&gt; Signed-off-by: Jagadeesh K=
rishnanjanappa &lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D=
"_blank">jkrishnanjanappa@mvista.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.../=
cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb" target=3D"_blank"=
>cantarell-fonts_git.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 ++++++++++++++=
++++++++<br>&gt; =C2=A01 file changed, 25 insertions(+)<br>&gt; =C2=A0creat=
e mode 100644 meta/recipes-graphics/cantarell-fonts/<a href=3D"http://canta=
rell-fonts_git.bb" target=3D"_blank">cantarell-fonts_git.bb</a><br>&gt;<br>=
&gt; diff --git a/meta/recipes-graphics/cantarell-fonts/<a href=3D"http://c=
antarell-fonts_git.bb" target=3D"_blank">cantarell-fonts_git.bb</a> b/meta/=
recipes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb" =
target=3D"_blank">cantarell-fonts_git.bb</a><br>&gt; new file mode 100644<b=
r>&gt; index 0000000..f55fef1<br>&gt; --- /dev/null<br>&gt; +++ b/meta/reci=
pes-graphics/cantarell-fonts/<a href=3D"http://cantarell-fonts_git.bb" targ=
et=3D"_blank">cantarell-fonts_git.bb</a><br>&gt; @@ -0,0 +1,25 @@<br>&gt; +=
SUMMARY =3D &quot;Cantarell, a Humanist sans-serif font family&quot;<br>&gt=
; +<br>&gt; +DESCRIPTION =3D &quot;The Cantarell font typeface is designed =
as a \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 contempor=
ary Humanist sans serif, and was developed for \<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on-screen reading; in particular, readin=
g web pages on an \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 HTC Dream mobile phone.&quot;<br>&gt; +<br>&gt; +HOMEPAGE =3D &quot;<a =
href=3D"https://git.gnome.org/browse/cantarell-fonts/" target=3D"_blank">ht=
tps://git.gnome.org/browse/cantarell-fonts/</a>&quot;<br>&gt; +SECTION =3D =
&quot;fonts&quot;<br>&gt; +LICENSE =3D &quot;OFL-1.1&quot;<br>&gt; +LIC_FIL=
ES_CHKSUM =3D &quot;file://COPYING;md5=3Ddf91e3ffcab8cfb972a66bf11255188d&q=
uot;<br>&gt; +<br>&gt; +PV =3D &quot;0.0.18.1+git${SRCPV}&quot;<br><br></di=
v></div><div>We could go with 0.0.21 since that&#39;s now out (I realize yo=
u picked the newest release at the time -- sorry for extra work).</div><div=
><br></div><div>&gt; +PR =3D &quot;r0&quot;<br><br><div>PR is not needed.</=
div><div><br></div><div><span class=3D"">&gt; +<br>&gt; +SRCREV =3D &quot;3=
e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4&quot;<br>&gt; +SRC_URI =3D &quot;gi=
t://<a href=3D"http://git.gnome.org/cantarell-fonts;protocol=3Dgit;branch=
=3Dmaster" target=3D"_blank">git.gnome.org/cantarell-fonts;protocol=3Dgit;b=
ranch=3Dmaster</a>&quot;<br>&gt; +<br>&gt; +S =3D &quot;${WORKDIR}/git&quot=
;<br>&gt; +<br>&gt; +inherit autotools allarch fontcache<br>&gt; +<br>&gt; =
+PACKAGECONFIG ??=3D &quot;&quot;<br>&gt; +PACKAGECONFIG[fontforge] =3D &qu=
ot;--enable-source-rebuild=3Dyes,--enable-source-rebuild=3Dno,fontforge-nat=
ive&quot;<br>&gt; +FILES_${PN} =3D &quot;${datadir}/fonts ${datadir}/fontco=
nfig&quot;<br>&gt; --<br>&gt; 1.9.1<br>&gt;<br></span><span class=3D"">&gt;=
 --<br>&gt; _______________________________________________<br>&gt; Openemb=
edded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.o=
penembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org=
</a><br>&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" target=3D"_blank">http://lists.openembedded.org/mailman/list=
info/openembedded-core</a></span></div></div></div></div>
</blockquote></div><br></div></div></div>

--001a11c3c5c2be8c5c052c4926c8--
