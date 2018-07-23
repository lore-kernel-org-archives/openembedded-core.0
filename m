Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 801A774FE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 12:57:10 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id v197-v6so170166ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4Oz7TV2fn+rKGbBxE+36xNd+IPJiSf+qgNuDeq9sT4Q=;
	b=BcmbMzwnvfZuNPIuINSvbB+p6NAgUrAIxEL2lWMycPj2JaqyzDRbF46kZU35UxdnK+
	4uJzeV+vKOE2HQzp9kyYyo169wset1Jv9asdWcfi6MAc58UP6iJnygS6ZqtiBMENf9oQ
	FMfOypdrDBS10z+W23H5AUwheGddWQaWeEVVt9aewDbnv/oIuqlsKH5tDSy4zskgEsqv
	1QmlcHmCQZhn0SLyTENxm/CNNFETcxpGrzJxlHP51uwbyrKRRIt0LG0Ml6vxRuGUN/NE
	scFs1NOQfOX/5l2CWCcOQqeb4/seKn7Pm1f8qMCxF9QTQzwfWrl3U0tu1jutxGqmz1G/
	aZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4Oz7TV2fn+rKGbBxE+36xNd+IPJiSf+qgNuDeq9sT4Q=;
	b=Tptdzi75uvFifxpnGw6IyDLOivt1hr/8tGtJN1oRg68HwiTr8hKfTUbFWp9yUAT/Ta
	mb8raPtshM0pwSrLiatSNRmEh1UsHJK01ghAqSQvspcycG1OQeUrVrbNMyQV3BPrZlSO
	AcR7fXYGpIVWTxHfS67JIBjS2HJlifuN6WgSW0GvQNro0L+3UzoyUFTIyvEyWkRfnAHq
	wLBAhDBqLAOZiBMXv2jB9DVOICR8Y0gizL90ZjHrUzThAyhss5knGGeUPv4Sy8q66FE1
	9fALTmHEr2r1UJblUnwfEQxqQEKxvxwwbMlaS70ztGDkoz8vUT6wVcDVka/ffdj+M1Lo
	7NsQ==
X-Gm-Message-State: AOUpUlGkrF+dIUpocWu8pekwxwRc1vVe+Bifsl9/Qg77GyteXZvBamF4
	MthVRIu+LlKUwOd8yI0Miur8QGcHcslA4dnqxPE=
X-Google-Smtp-Source: AAOMgpdgfwb+MUcw2szy1tOIUKJ8I1tPY63mcACEV/DyYXhj/97OytE3MZGaOabimVyNfN1AHlkgyj2775i3aCWi3yc=
X-Received: by 2002:a81:6bc6:: with SMTP id
	g189-v6mr6541390ywc.267.1532350631306; 
	Mon, 23 Jul 2018 05:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5b:2cf:0:0:0:0:0 with HTTP;
	Mon, 23 Jul 2018 05:57:10 -0700 (PDT)
In-Reply-To: <CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
References: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
	<5af302bc.1c69fb81.44885.4061@mx.google.com>
	<CAJ86T=Wxh3SzsATsvtB8+CWadp=hjEBXTt1XnwYMFJ4zmVaQ1Q@mail.gmail.com>
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Date: Mon, 23 Jul 2018 14:57:10 +0200
Message-ID: <CAFmD+WEeyHwEQs825up0Q=yF4n3gvQU-eav3RZdJ9nt5NLECwQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jul 2018 12:57:10 -0000
Content-Type: multipart/alternative; boundary="0000000000000cecc50571aa2fdc"

--0000000000000cecc50571aa2fdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Change was already merged:
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools=
?id=3D7dd9772eca6df52db09b65537fdf689f1aa3fd8f

Is your request still valid?

2018-07-09 21:40 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:

> On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof
> <taborskikrzysztof@gmail.com> wrote:
> > Can I request review?
> > -------- Oryginalna wiadomo=C5=9B=C4=87 --------
> > Od: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> > Data: 08.05.2018 18:46 (GMT+01:00)
> > Do: openembedded-core@lists.openembedded.org
> > DW: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> > Temat: [meta-oe][PATCH] perl: native modules will not trigger build per=
l
> for
> > target.
> >
> > Currently building perl-native modules triggers
> > build perl for target due to PACKAGES_DYNAMIC regex.
> >
> > This commit will cause, that perl native modules will
> > trigger perl-native build.
>
> Can you give an example of how to reproduce the problem?
>
> > Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
> > ---
> > meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
> > meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
> > 2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> > b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> > index a9ab17d16c..71f45890b0 100644
> > --- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> > +++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
> > @@ -135,3 +135,5 @@ EOF
> >
> > # Fix the path in sstate
> > SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> > +PACKAGES_DYNAMIC_class-native +=3D "^perl-module-.*native$"
>
> This usage of +=3D with an over-ride is not correct.
>
> However, regardless of that, was this change actually needed?
>
> If you know of a -native recipe which depends on a
> perl-module-XXX-native package then it's probably a bug in the -native
> recipe. Having perl-native pretend to provide perl-module packages
> probably isn't the right solution.
>
> > diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> > b/meta/recipes-devtools/perl/perl_5.24.1.bb
> > index 53a426289a..4c6a71082f 100644
> > --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> > @@ -339,7 +339,7 @@ python split_perl_packages () {
> >      d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages)=
)
> > }
> >
> > -PACKAGES_DYNAMIC +=3D "^perl-module-.*"
> > +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
> > PACKAGES_DYNAMIC_class-nativesdk +=3D "^nativesdk-perl-module-.*"
>
> This usage of +=3D with an over-ride is not correct.
>
> > RPROVIDES_perl-lib =3D "perl-lib"
> > --
> > 2.13.6
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>



--=20
Pozdrawiam,
Krzysiek Taborski

--0000000000000cecc50571aa2fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Change was already merged:<br><a href=3D"http://cgit.=
openembedded.org/openembedded-core/commit/meta/recipes-devtools?id=3D7dd977=
2eca6df52db09b65537fdf689f1aa3fd8f">http://cgit.openembedded.org/openembedd=
ed-core/commit/meta/recipes-devtools?id=3D7dd9772eca6df52db09b65537fdf689f1=
aa3fd8f</a><br><br></div>Is your request still valid?<br></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-09 21:40 GMT+02:00 =
Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" =
target=3D"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, May 9, 2018 at 7:16 AM, taborskikrzysztof<br>
&lt;<a href=3D"mailto:taborskikrzysztof@gmail.com">taborskikrzysztof@gmail.=
com</a>&gt; wrote:<br>
&gt; Can I request review?<br>
<span class=3D"">&gt; -------- Oryginalna wiadomo=C5=9B=C4=87 --------<br>
&gt; Od: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzysztof@gmail.c=
om">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt; Data: 08.05.2018 18:46 (GMT+01:00)<br>
&gt; Do: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; DW: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzysztof@gmail.c=
om">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt; Temat: [meta-oe][PATCH] perl: native modules will not trigger build pe=
rl for<br>
&gt; target.<br>
&gt;<br>
&gt; Currently building perl-native modules triggers<br>
&gt; build perl for target due to PACKAGES_DYNAMIC regex.<br>
&gt;<br>
&gt; This commit will cause, that perl native modules will<br>
&gt; trigger perl-native build.<br>
<br>
</span>Can you give an example of how to reproduce the problem?<br>
<span class=3D""><br>
&gt; Signed-off-by: Krzysztof Taborski &lt;<a href=3D"mailto:taborskikrzysz=
tof@gmail.com">taborskikrzysztof@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" re=
l=3D"noreferrer" target=3D"_blank">per<wbr>l-native_5.24.1.bb</a> | 2 ++<br=
>
&gt; meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"no=
referrer" target=3D"_blank">per<wbr>l_5.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
&gt; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_=
5.24.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb<=
/a><br>
&gt; b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.bb" =
rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
&gt; index a9ab17d16c..71f45890b0 100644<br>
&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.=
bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.24.1.=
bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl-native_5.24.1.bb</a><br>
&gt; @@ -135,3 +135,5 @@ EOF<br>
&gt;<br>
&gt; # Fix the path in sstate<br>
&gt; SSTATE_SCAN_FILES +=3D &quot;*.pm *.pod *.h *.pl *.sh&quot;<br>
&gt; +PACKAGES_DYNAMIC_class-native +=3D &quot;^perl-module-.*native$&quot;=
<br>
<br>
</span>This usage of +=3D with an over-ride is not correct.<br>
<br>
However, regardless of that, was this change actually needed?<br>
<br>
If you know of a -native recipe which depends on a<br>
perl-module-XXX-native package then it&#39;s probably a bug in the -native<=
br>
recipe. Having perl-native pretend to provide perl-module packages<br>
probably isn&#39;t the right solution.<br>
<span class=3D""><br>
&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.=
bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt; b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"=
noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt; index 53a426289a..4c6a71082f 100644<br>
&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>erl_5.24.1.bb</a><br>
&gt; @@ -339,7 +339,7 @@ python split_perl_packages () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d.setVar(d.expand(&quot;<wbr>RRECOMMENDS_${PN}-mod=
ules&quot;), &#39; &#39;.join(packages))<br>
&gt; }<br>
&gt;<br>
&gt; -PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*&quot;<br>
&gt; +PACKAGES_DYNAMIC +=3D &quot;^perl-module-.*(?&lt;!\-native)$<wbr>&quo=
t;<br>
&gt; PACKAGES_DYNAMIC_class-<wbr>nativesdk +=3D &quot;^nativesdk-perl-modul=
e-.*&quot;<br>
<br>
</span>This usage of +=3D with an over-ride is not correct.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; RPROVIDES_perl-lib =3D &quot;perl-lib&quot;<br>
&gt; --<br>
&gt; 2.13.6<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">P=
ozdrawiam,<div>Krzysiek Taborski</div></div></div>
</div>

--0000000000000cecc50571aa2fdc--
