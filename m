Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29C8671B27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 07:22:14 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id e9-v6so1276460ybq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hdZzlMj/UaOiYBwfzogkv3quiExgaLQk/B78gEi1cvE=;
	b=TNHsD2L+bOkixtx4gYhPGPkRQhhhq6SeksdM6KNdwXiWEZOJ1jvz/faQACQrWENEPX
	hUzAbLIvLJyQDJ+jpfRt6eDeLy9rI2smGruGmdSBYaHP8gAlI5FHFE2+RGDINfoQmMTx
	zI5XFXnVt05YqwVBCUSI7Z8jnxEkPqzsiscccVHwS0uKiym9yrsn7YcyFeFiY8vHnpIA
	rqJHaGQFv+pZr/uZ8R7lDB14at5CmVbFs0z+z+CJV8dd6iZUygSCp55Sztg8l2UCyM+y
	pjzPT3cDyOuX/xRf/ifUpTNlfETWCC8U1InnJF6Wju2gj6fOoSHVbv0UlAzWUsV/b3cC
	8vAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hdZzlMj/UaOiYBwfzogkv3quiExgaLQk/B78gEi1cvE=;
	b=NDndgplkXc5htuTQZ4NTv27FONBCM0d6VbJwBTYEg3/9cES9CD+536giJrttMTy6L1
	3tLz+0ajVvz3rkdDjUhQ2niEL0LgJ1WxVNb35iDaqw7bzO/khSjXuwKaRC3VK21q+Wo9
	fNlJVegXTwGCjIv71R1oUGDKwdMv6KoUHhAJuEGR9Lc07+O5LoQJWcPDqstLCcbFz244
	8B0oM6z7k3AtNaXSDpL6t65ufrxNsx9+JrUCU1FSq1p1MD8XMaBpRR+nBYaHMsrbvCUl
	OmkXIDCc/eGUQE0sn21dZ8Y07N1AmbmXAkRSatx/liLdVHPI3ywN8yiXjeTANo5/VmSU
	7gGg==
X-Gm-Message-State: AOUpUlH383cUXLCGQUjb8Oq8Kua+DeGrNmCBjjDhldpyoyYhMnbnLHYj
	MTtPUFkmPaZ0DprLe3KRMR7Ftj8DAdRtcWkGM3o=
X-Google-Smtp-Source: AAOMgpcdZ5dcG11KD7V4YAgs62dhKNSLTjSTkdfcPizk3YH1enP8XtQGml7QEPhos7BhENuCE/de05Unr5w2NmXekhU=
X-Received: by 2002:a25:67d6:: with SMTP id
	b205-v6mr8953762ybc.243.1532416935013; 
	Tue, 24 Jul 2018 00:22:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5b:2cf:0:0:0:0:0 with HTTP;
	Tue, 24 Jul 2018 00:22:14 -0700 (PDT)
In-Reply-To: <CAJ86T=VBxXPmDwg6S7q9vLjubLwDoSHtZiQ6k-Q475BV-az=Ow@mail.gmail.com>
References: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
	<5af302bc.1c69fb81.44885.4061@mx.google.com>
	<CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
	<CAFmD+WEeyHwEQs825up0Q=yF4n3gvQU-eav3RZdJ9nt5NLECwQ@mail.gmail.com>
	<CAJ86T=VBxXPmDwg6S7q9vLjubLwDoSHtZiQ6k-Q475BV-az=Ow@mail.gmail.com>
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Date: Tue, 24 Jul 2018 09:22:14 +0200
Message-ID: <CAFmD+WEhmrCpo-xhaBWanXPPBLxBS+y6YaECxO68SRsy30LnAg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Tue, 24 Jul 2018 07:22:14 -0000
Content-Type: multipart/alternative; boundary="0000000000000f358b0571b99f74"

--0000000000000f358b0571b99f74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Example recipe (recipe.bb for example):
"""
LICENSE=3D"CLOSED"

RDEPENDS_${PN} =3D "perl-module-file-glob"

BBCLASSEXTEND =3D "native nativesdk"
do_install() {
    install -d ${D}/${bindir}
    echo "my perl script" > ${D}/${bindir}/recipe.pl
}
inherit perlnative
""

When my patch is removed and I will call: "'bitbake recipe-native".
Then I have dependency:
recipe-native -> perl (target version)
This is not correct, that native recipe has dependency to target recipe.

When I called (bitbake recipe-native -g) I can find:
"recipe-native" -> "perl"
in recipe-depends.dot

This was my original problem. Please correct me, if missed something.

usage of +=3D with an over-ride - I've just copied it from nativesdk
over-ride, which was already in perl recipe.


Best regards,
Krzysztof Taborski

2018-07-23 19:23 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Mon, Jul 23, 2018 at 5:57 AM, Krzysztof Taborski
> <taborskikrzysztof@gmail.com> wrote:
> > Change was already merged:
> > http://cgit.openembedded.org/openembedded-core/commit/meta/
> recipes-devtools?id=3D7dd9772eca6df52db09b65537fdf689f1aa3fd8f
> >
> > Is your request still valid?
>
> Yes, although the change was merged, it's not clear that it was correct.
>
> Native recipes aren't split into packages, so there are no -native
> versions of the perl modules. If you have a recipe which depends on
> "perl-module-XXX-native" it's likely a bug in that recipe - not in
> perl-native.
>
> What recipe did you find which depends on a -native version of a perl
> module?
>
> > 2018-07-09 21:40 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> >>
> >> On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof
> >> <taborskikrzysztof@gmail.com> wrote:
> >> > Can I request review?
> >> > -------- Oryginalna wiadomo=C5=9B=C4=87 --------
> >> > Od: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> >> > Data: 08.05.2018 18:46 (GMT+01:00)
> >> > Do: openembedded-core@lists.openembedded.org
> >> > DW: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> >> > Temat: [meta-oe][PATCH] perl: native modules will not trigger build
> perl
> >> > for
> >> > target.
> >> >
> >> > Currently building perl-native modules triggers
> >> > build perl for target due to PACKAGES_DYNAMIC regex.
> >> >
> >> > This commit will cause, that perl native modules will
> >> > trigger perl-native build.
> >>
> >> Can you give an example of how to reproduce the problem?
> >>
> >> > Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> >> > ---
> >> > meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
> >> > meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
> >> > 2 files changed, 3 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> >> > b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> >> > index a9ab17d16c..71f45890b0 100644
> >> > --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> >> > +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> >> > @@ -135,3 +135,5 @@ EOF
> >> >
> >> > # Fix the path in sstate
> >> > SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> >> > +PACKAGES_DYNAMIC_class-native +=3D "^perl-module-.*native$"
> >>
> >> This usage of +=3D with an over-ride is not correct.
> >>
> >> However, regardless of that, was this change actually needed?
> >>
> >> If you know of a -native recipe which depends on a
> >> perl-module-XXX-native package then it's probably a bug in the -native
> >> recipe. Having perl-native pretend to provide perl-module packages
> >> probably isn't the right solution.
> >>
> >> > diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> >> > b/meta/recipes-devtools/perl/perl_5.24.1.bb
> >> > index 53a426289a..4c6a71082f 100644
> >> > --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> >> > +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> >> > @@ -339,7 +339,7 @@ python split_perl_packages () {
> >> >      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), '
> '.join(packages))
> >> > }
> >> >
> >> > -PACKAGES_DYNAMIC +=3D "^perl-module-.*"
> >> > +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
> >> > PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-module-.*"
> >>
> >> This usage of +=3D with an over-ride is not correct.
> >>
> >> > RPROVIDES_perl-lib =3D "perl-lib"
> >> > --
> >> > 2.13.6
> >> >
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
> >
> >
> >
> >
> > --
> > Pozdrawiam,
> > Krzysiek Taborski
>



--=20
Pozdrawiam,
Krzysiek Taborski

--0000000000000f358b0571b99f74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello,<br>Example recipe (<a href=3D"http:/=
/recipe.bb">recipe.bb</a> for example):<br>&quot;&quot;&quot;<br>LICENSE=3D=
&quot;CLOSED&quot;<br><br>RDEPENDS_${PN} =3D &quot;perl-module-file-glob&qu=
ot;<br><br>BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>do_install() {=
<br></div><div>=C2=A0=C2=A0=C2=A0 install -d ${D}/${bindir}<br></div><div>=
=C2=A0=C2=A0=C2=A0 echo &quot;my perl script&quot; &gt; ${D}/${bindir}/<a h=
ref=3D"http://recipe.pl">recipe.pl</a><br>}<br>inherit perlnative<br>&quot;=
&quot;<br><br></div>When my patch is removed and I will call: &quot;&#39;bi=
tbake recipe-native&quot;. <br></div>Then I have dependency:<br></div>recip=
e-native -&gt; perl (target version)<br><div><div><div><div>This is not cor=
rect, that native recipe has dependency to target recipe.<br><br></div><div=
>When I called (bitbake recipe-native -g) I can find:<br>&quot;recipe-nativ=
e&quot; -&gt; &quot;perl&quot; <br>in recipe-depends.dot<br><br></div><div>=
This was my original problem. Please correct me, if missed something.<br><b=
r>usage of +=3D with an over-ride - I&#39;ve just copied it from nativesdk =
over-ride, which was already in perl recipe.<br><br></div></div></div></div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Best regar=
ds,<br></div><div class=3D"gmail_extra">Krzysztof Taborski<br></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-23 19:23 GMT+02:=
00 Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.co=
m" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><span class=3D"">On Mon, Jul 23, 2018 at 5:57 AM, Krzysztof=
 Taborski<br>
&lt;<a href=3D"mailto:taborskikrzysztof@gmail.com">taborskikrzysztof@gmail.=
com</a>&gt; wrote:<br>
&gt; Change was already merged:<br>
&gt; <a href=3D"http://cgit.openembedded.org/openembedded-core/commit/meta/=
recipes-devtools?id=3D7dd9772eca6df52db09b65537fdf689f1aa3fd8f" rel=3D"nore=
ferrer" target=3D"_blank">http://cgit.openembedded.org/<wbr>openembedded-co=
re/commit/meta/<wbr>recipes-devtools?id=3D<wbr>7dd9772eca6df52db09b65537fdf=
68<wbr>9f1aa3fd8f</a><br>
&gt;<br>
&gt; Is your request still valid?<br>
<br>
</span>Yes, although the change was merged, it&#39;s not clear that it was =
correct.<br>
<br>
Native recipes aren&#39;t split into packages, so there are no -native<br>
versions of the perl modules. If you have a recipe which depends on<br>
&quot;perl-module-XXX-native&quot; it&#39;s likely a bug in that recipe - n=
ot in<br>
perl-native.<br>
<br>
What recipe did you find which depends on a -native version of a perl modul=
e?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; 2018-07-09 21:40 GMT+02:00 Andre McCurdy &lt;<a href=3D"mailto:armccur=
dy@gmail.com">armccurdy@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof<br>
&gt;&gt; &lt;<a href=3D"mailto:taborskikrzysztof@gmail.com">taborskikrzyszt=
of@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; Can I request review?<br>
&gt;&gt; &gt; -------- Oryginalna wiadomo=C5=9B=C4=87 --------<br>
&gt;&gt; &gt; Od: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzyszto=
f@gmail.com">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Data: 08.05.2018 18:46 (GMT+01:00)<br>
&gt;&gt; &gt; Do: <a href=3D"mailto:openembedded-core@lists.openembedded.or=
g">openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; DW: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzyszto=
f@gmail.com">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Temat: [meta-oe][PATCH] perl: native modules will not trigger=
 build perl<br>
&gt;&gt; &gt; for<br>
&gt;&gt; &gt; target.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Currently building perl-native modules triggers<br>
&gt;&gt; &gt; build perl for target due to PACKAGES_DYNAMIC regex.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This commit will cause, that perl native modules will<br>
&gt;&gt; &gt; trigger perl-native build.<br>
&gt;&gt;<br>
&gt;&gt; Can you give an example of how to reproduce the problem?<br>
&gt;&gt;<br>
&gt;&gt; &gt; Signed-off-by: Krzysztof Taborski &lt;<a href=3D"mailto:tabor=
skikrzysztof@gmail.com">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24=
.1.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>l-native_5.24.1.bb</a> =
| 2 ++<br>
&gt;&gt; &gt; meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" =
rel=3D"noreferrer" target=3D"_blank">per<wbr>l_5.24.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt; &gt; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://per=
l-native_5.24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5=
.24.1.bb</a><br>
&gt;&gt; &gt; b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.=
24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a=
><br>
&gt;&gt; &gt; index a9ab17d16c..71f45890b0 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl-nativ=
e_5.24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.b=
b</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl-nativ=
e_5.24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.b=
b</a><br>
&gt;&gt; &gt; @@ -135,3 +135,5 @@ EOF<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Fix the path in sstate<br>
&gt;&gt; &gt; SSTATE_SCAN_FILES +=3D &quot;*.pm *.pod *.h *.pl *.sh&quot;<b=
r>
&gt;&gt; &gt; +PACKAGES_DYNAMIC_class-native +=3D &quot;^perl-module-.*nati=
ve$&quot;<br>
&gt;&gt;<br>
&gt;&gt; This usage of +=3D with an over-ride is not correct.<br>
&gt;&gt;<br>
&gt;&gt; However, regardless of that, was this change actually needed?<br>
&gt;&gt;<br>
&gt;&gt; If you know of a -native recipe which depends on a<br>
&gt;&gt; perl-module-XXX-native package then it&#39;s probably a bug in the=
 -native<br>
&gt;&gt; recipe. Having perl-native pretend to provide perl-module packages=
<br>
&gt;&gt; probably isn&#39;t the right solution.<br>
&gt;&gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://per=
l_5.24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><b=
r>
&gt;&gt; &gt; b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb=
" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt;&gt; &gt; index 53a426289a..4c6a71082f 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.=
1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.=
1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt;&gt; &gt; @@ -339,7 +339,7 @@ python split_perl_packages () {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 d.setVar(d.expand(&quot;<wbr>RRECOMMENDS_=
${PN}-modules&quot;), &#39; &#39;.join(packages))<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*&quot;<br>
&gt;&gt; &gt; +PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*(?&lt;!\-native)$=
<wbr>&quot;<br>
&gt;&gt; &gt; PACKAGES_DYNAMIC_class-<wbr>nativesdk +=3D &quot;^nativesdk-p=
erl-module-.*&quot;<br>
&gt;&gt;<br>
&gt;&gt; This usage of +=3D with an over-ride is not correct.<br>
&gt;&gt;<br>
&gt;&gt; &gt; RPROVIDES_perl-lib =3D &quot;perl-lib&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.13.6<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Pozdrawiam,<br>
&gt; Krzysiek Taborski<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Po=
zdrawiam,<div>Krzysiek Taborski</div></div></div>
</div></div>

--0000000000000f358b0571b99f74--
