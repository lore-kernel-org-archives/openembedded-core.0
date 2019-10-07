Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 136907E457
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 22:35:54 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u186so14377222qkc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DjuYtnBwJgl7aeAGfJoVqh6mT0gl2igGSX8VJ3gE5BQ=;
	b=eQ3vNkitI6PmuMUr49XSh5DgPxJe0xdTzz9s678xKhYCg6dXtU00O7cJOX906uQxwr
	ZCSK+DIZLCfwkh/T124vqTgniVy2khu+MsU3ZZKjB5euWnlytWzm/UP37lPkGlEEKE5E
	7+MsBQCvT9Zd6+6RNTmK7KyFITUXRpUkixHdcGkrtNv5dgFMxgJaf8P/oNdQOEs9e56V
	oUGqwgCkKVns9g5yDh0FyJ1n1VmahrJDxPcHSyNT59NbjTrMqMWe2n4YEIZDjjHRs6ll
	e+Ug4+6Uhh0Bh6ejfL4AHIFza0v/sLTs74s/4WB3K9FNaYUiN+oIdVzRffXjmaWbGThS
	MLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DjuYtnBwJgl7aeAGfJoVqh6mT0gl2igGSX8VJ3gE5BQ=;
	b=C9KVjSHUm5pPpE7Ys3jAvq03PXifmpDpTuRuwsfBw9RyRQtKtig8Q85ISdkNg8QK3C
	SQtVGfmc+YsSvWfb7BiEJC3h35H+7ef8yoaKKqLHzqHQznt02PFcbO0ld8ZmWZtYTDmf
	ExIM6dZ6kVRvCCX0j6nBGDo2raBGV9RLld71Ev9peRpcBKyxB8k+XsTD1O6Jqj052CIs
	0BpswJrFLA+gaPPlHEMahJZAmXFICAuNyPBatNrRL19Mzr0NmjunhWzVq7ikK6QH743k
	w79WzQ5kY5fRgVeMenevn+RoG3LW4WYQPj04mqG0qzGBWiLNPx8isskCkTzLxHrHfjDT
	IebQ==
X-Gm-Message-State: APjAAAVQmD0GBRYEgai6IxDPpq0A8JZPDlpAmYU/P8Oks5AvcEPm4V/Z
	GOedkfGYhMDD/iHyxQdluwT9OYVP/UQvZrb1DKY=
X-Google-Smtp-Source: APXvYqzRVyQKGnJKOj+JEwV2nYqo/Quj+zavdQaTtbQBOi0h8gzyqMRS+nPzqa48hNA8kFMn8wFQXEXmC1AX/umVi9s=
X-Received: by 2002:a37:6651:: with SMTP id a78mr26488448qkc.474.1570487755581;
	Mon, 07 Oct 2019 15:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191006154747.7699-1-raj.khem@gmail.com>
	<72f935872cf5be891f607ba461716e4126f3d2c0.camel@linuxfoundation.org>
In-Reply-To: <72f935872cf5be891f607ba461716e4126f3d2c0.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2019 15:35:44 -0700
Message-ID: <CAMKF1soi4YPbx1-QGFJ5UJecjcStASUB=r-S2751F9O6HGYGFQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: Handle PACKAGES_DYNAMIC for perl-native
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
X-List-Received-Date: Mon, 07 Oct 2019 22:35:55 -0000
Content-Type: multipart/alternative; boundary="000000000000cbaf70059459ac10"

--000000000000cbaf70059459ac10
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 7, 2019 at 3:15 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-10-06 at 08:47 -0700, Khem Raj wrote:
> > A perl module recipe extending to provide native version causes target
> > perl dependencies to be pulled into native build if the module recipe
> > has RDEPENDS_${PN} = "perl-module-XXXX" e.g. libxml-sax-base-perl
> > recipe.
> >
> > The reason is that native bbclass empties out PACKAGES_DYNAMIC and
> > perl's PACKAGES_DYNAMIC_class-target is greedy enough to usurp native
> > modules as well.
> >
> > Eventually we end up with errors like when sstate is used across
> > machines
> >
> > * ERROR: libxml-sax-base-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemuarm
> >
> > Therefore, to fix this native case needs to handled specially when
> > re-assigning module dependencies in split_perl_packages(), where the
> > modules are named correctly for native case and have a single dependency
> > on perl-native, secondly, PACKAGES_DYNAMIC for target case needs to be
> > reined in to spare, -native modules, thirdly, let perl-native take over
> > the case for providing native modules
> >
> > This will fix several sstate signature errors like above with external
> > perl modules providing native variants and having runtime dependencies on
> > modules which are provided by perl proper
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/perl/perl_5.30.0.bb | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb
> b/meta/recipes-devtools/perl/perl_5.30.0.bb
> > index a221bce52b..9614477982 100644
> > --- a/meta/recipes-devtools/perl/perl_5.30.0.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.30.0.bb
> > @@ -265,13 +265,18 @@ python split_perl_packages () {
> >      # Read the pre-generated dependency file, and use it to set module
> dependecies
> >      for line in open(d.expand("${WORKDIR}") +
> '/perl-rdepends.txt').readlines():
> >          splitline = line.split()
> > -        module = splitline[0].replace("RDEPENDS_perl", "RDEPENDS_${PN}")
> > -        depends = splitline[2].strip('"').replace("perl-module",
> "${PN}-module")
> > +        if bb.data.inherits_class('native', d):
> > +            module = splitline[0] + '-native'
> > +            depends = "perl-native"
> > +        else:
> > +            module = splitline[0].replace("RDEPENDS_perl",
> "RDEPENDS_${PN}")
> > +            depends = splitline[2].strip('"').replace("perl-module",
> "${PN}-module")
> >          d.appendVar(d.expand(module), " " + depends)
> >  }
> >
> > -PACKAGES_DYNAMIC_class-target += "^perl-module-.*"
> > -PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
> > +PACKAGES_DYNAMIC_class-native_forcevariable = "^perl-module-.*-native$"
> > +PACKAGES_DYNAMIC_class-target = "^perl-module-.*(?<!native)$"
> > +PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-perl-module-.*"
> >
> >  RDEPENDS_${PN}-misc += "perl perl-modules"
> >  RDEPENDS_${PN}-pod += "perl"
>
> We should never be using _forcevariable in public repos, let alone OE-
> Core. Its a tool of last resort. I guess this is because native.bbclass
> is clearing it but we need to find a better way.


Ok and any suggestions that would be better here ?


>
> Cheers,
>
> Richard
>
>

--000000000000cbaf70059459ac10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 7, 2019 at 3:15 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2019-=
10-06 at 08:47 -0700, Khem Raj wrote:<br>
&gt; A perl module recipe extending to provide native version causes target=
<br>
&gt; perl dependencies to be pulled into native build if the module recipe<=
br>
&gt; has RDEPENDS_${PN} =3D &quot;perl-module-XXXX&quot; e.g. libxml-sax-ba=
se-perl<br>
&gt; recipe.<br>
&gt; <br>
&gt; The reason is that native bbclass empties out PACKAGES_DYNAMIC and<br>
&gt; perl&#39;s PACKAGES_DYNAMIC_class-target is greedy enough to usurp nat=
ive<br>
&gt; modules as well.<br>
&gt; <br>
&gt; Eventually we end up with errors like when sstate is used across<br>
&gt; machines<br>
&gt; <br>
&gt; * ERROR: libxml-sax-base-perl-native different signature for task do_p=
opulate_sysroot.sigdata between qemux86copy and qemuarm<br>
&gt; <br>
&gt; Therefore, to fix this native case needs to handled specially when<br>
&gt; re-assigning module dependencies in split_perl_packages(), where the<b=
r>
&gt; modules are named correctly for native case and have a single dependen=
cy<br>
&gt; on perl-native, secondly, PACKAGES_DYNAMIC for target case needs to be=
<br>
&gt; reined in to spare, -native modules, thirdly, let perl-native take ove=
r<br>
&gt; the case for providing native modules<br>
&gt; <br>
&gt; This will fix several sstate signature errors like above with external=
<br>
&gt; perl modules providing native variants and having runtime dependencies=
 on<br>
&gt; modules which are provided by perl proper<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.0.bb" rel=
=3D"noreferrer" target=3D"_blank">perl_5.30.0.bb</a> | 13 +++++++++----<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.0.=
bb" rel=3D"noreferrer" target=3D"_blank">perl_5.30.0.bb</a> b/meta/recipes-=
devtools/perl/<a href=3D"http://perl_5.30.0.bb" rel=3D"noreferrer" target=
=3D"_blank">perl_5.30.0.bb</a><br>
&gt; index a221bce52b..9614477982 100644<br>
&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.0.bb" rel=
=3D"noreferrer" target=3D"_blank">perl_5.30.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.0.bb" rel=
=3D"noreferrer" target=3D"_blank">perl_5.30.0.bb</a><br>
&gt; @@ -265,13 +265,18 @@ python split_perl_packages () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Read the pre-generated dependency file, and use =
it to set module dependecies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for line in open(d.expand(&quot;${WORKDIR}&quot;) =
+ &#39;/perl-rdepends.txt&#39;).readlines():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 splitline =3D line.split()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D splitline[0].replace(&quot;RDE=
PENDS_perl&quot;, &quot;RDEPENDS_${PN}&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D splitline[2].strip(&#39;&quot=
;&#39;).replace(&quot;perl-module&quot;, &quot;${PN}-module&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&#39;native&#39=
;, d):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D splitline[0] + &=
#39;-native&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;perl-nati=
ve&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D splitline[0].rep=
lace(&quot;RDEPENDS_perl&quot;, &quot;RDEPENDS_${PN}&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D splitline[2].st=
rip(&#39;&quot;&#39;).replace(&quot;perl-module&quot;, &quot;${PN}-module&q=
uot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(d.expand(module), &quot;=
 &quot; + depends)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -PACKAGES_DYNAMIC_class-target +=3D &quot;^perl-module-.*&quot;<br>
&gt; -PACKAGES_DYNAMIC_class-nativesdk +=3D &quot;^nativesdk-perl-module-.*=
&quot;<br>
&gt; +PACKAGES_DYNAMIC_class-native_forcevariable =3D &quot;^perl-module-.*=
-native$&quot;<br>
&gt; +PACKAGES_DYNAMIC_class-target =3D &quot;^perl-module-.*(?&lt;!native)=
$&quot;<br>
&gt; +PACKAGES_DYNAMIC_class-nativesdk =3D &quot;^nativesdk-perl-module-.*&=
quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN}-misc +=3D &quot;perl perl-modules&quot;<br>
&gt;=C2=A0 RDEPENDS_${PN}-pod +=3D &quot;perl&quot;<br>
<br>
We should never be using _forcevariable in public repos, let alone OE-<br>
Core. Its a tool of last resort. I guess this is because native.bbclass<br>
is clearing it but we need to find a better way.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">Ok and any suggestions that would be better=
 here ?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000cbaf70059459ac10--
