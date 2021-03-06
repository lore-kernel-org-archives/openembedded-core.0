Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.13444.1615066406213796406
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 13:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IOqxL8tB;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: dorindabassey@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id c10so5368595ilo.8
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 13:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=diL1SmrawjDfLKiiOFzwhGAgHTD59mcs1erYGQWYWG8=;
        b=IOqxL8tBw5/m1YY35OKvqyHTd7gUrLsZVMbemL54Cg8foPGElf0sx7khsG69pDncYW
         69YLo97/tifSNmP8AtHkpIaE3Eqm6mrnhGzfMCKaO5nnW7/Oge22Gj+mr//G2jKtMRHa
         e6gcwJ6FrZ7rCjJ9g+XkPNDUk9B6apGAcU6+sazLGCiBW/MH2ZzZLkzZJktJREyTj+M1
         AanD3lwbI3C210MY67WuTfPVVC+jJlp/MCyhO5vlR4ZcscWBkhrk7dod8dHNz6XBh0GH
         StFR5whj//cF0p+P1Lsx3jllClsTwjrJkH8gYqbZkQ60rEC+5sFfSIxfE+fedZcEg90o
         qATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=diL1SmrawjDfLKiiOFzwhGAgHTD59mcs1erYGQWYWG8=;
        b=GA1Q5S5yHN2I912rqU19hPQQOrbW245XiqqG7FM1jvLfWMSrfUgHAS2rPDG7KmwY78
         jrCF9k4xfrJWM9x1DwMEi5uUfyhiVWEuCZlToQ2Wc+gM52RDbH6cJvWjWqvk7FeTQ2Hb
         lKKax1ZUbxi2sZeXVrXrwd5NEFO6t1f4hBS4Wa5VBrIDs4lRe29GidOYUvNq4b7quYPB
         LdJgRZhw8g2JLozcrw1/kMe3LNWGHoNdyTaWwgBN5440h/JYYm57uzxcMZbptZjGGRPL
         AZrpiqjLJWrxZaaftUjUOcwbsvS51H2JR1Xreflu5jkO2ZoZIcIgUfmj06uqSBV+yuKS
         8G4A==
X-Gm-Message-State: AOAM530SGf0S9Znfg9xcoj94IT2WPa1k7a0u7ez0EH68SAYpCuBnbULo
	ObAOgIF23kKhF/0PTkrelu1pTccXkOAktbMZ0Z4=
X-Google-Smtp-Source: ABdhPJzXEXzzU36NcXv9QkyVzOUw5QK4ps4ggtRYzfM87cyYbkBFOXRmlzrbnjO5P3cd8msSmzDB9alWcaQTynG1mQo=
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id u13mr14284733ilv.176.1615066405610;
 Sat, 06 Mar 2021 13:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20210306205320.28581-1-dorindabassey@gmail.com> <AM9PR09MB464269F1F1334AFA87C645B6A8959@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB464269F1F1334AFA87C645B6A8959@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Sat, 6 Mar 2021 22:33:13 +0100
Message-ID: <CAJSnhzvqhm6ZerWiC67mwNtqcF1=4W3W9ty2JR9iy2jw5yDiDQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006528ae05bce4f3a7"

--0000000000006528ae05bce4f3a7
Content-Type: text/plain; charset="UTF-8"

Alright, Thank you for the feedback.

the currently valid edition
(https://www.openembedded.org/wiki/Styleguide) of the the style guide
claims that DESCRIPTION defaults to SUMMARY. So I personally would
rather check that SUMMARY != DESCRIPTION in case DESCRIPTION is set - by
default DESCRIPTION isn't mandatory IMO (or the styleguide needs to be
updated)
I now see why I didn't get reports on recipes without DESCRIPTION.

Thanks,
Dorinda.


On Sat, Mar 6, 2021, 22:10 Konrad Weihmann <kweihmann@outlook.com> wrote:

> some nitpick below
>
> On 06.03.21 21:53, Dorinda wrote:
> > [YOCTO #13471]
> >
> > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > ---
> >   meta/lib/oeqa/selftest/cases/distrodata.py | 34 ++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
> b/meta/lib/oeqa/selftest/cases/distrodata.py
> > index e1cfc3b621..d8df0b530c 100644
> > --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> > +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> > @@ -40,6 +40,40 @@ but their recipes claim otherwise by setting
> UPSTREAM_VERSION_UNKNOWN. Please re
> >   """ + "\n".join(regressed_successes)
> >           self.assertTrue(len(regressed_failures) == 0 and
> len(regressed_successes) == 0, msg)
> >
> > +    def test_missing_homepg(self):
> > +        """
> > +        Summary:     Test for oe-core recipes that don't have a
> HOMEPAGE or DESCRIPTION
> > +        Expected:    All oe-core recipes should have a DESCRIPTION entry
> > +        Expected:    All oe-core recipes should have a HOMEPAGE entry
> except for recipes that are not fetched from external sources.
> > +        Product:     oe-core
> > +        """
> > +        with bb.tinfoil.Tinfoil() as tinfoil:
> > +            tinfoil.prepare(config_only=False)
> > +            no_description = []
> > +            no_homepage = []
> > +            for fn in tinfoil.all_recipe_files(variants=False):
> > +                if not '/meta/recipes-' in fn:
> > +                    # We are only interested in OE-Core
> > +                    continue
> > +                rd = tinfoil.parse_recipe_file(fn, appends=False)
> > +                pn = rd.getVar('PN')
>
> shouldn't it be BPN, otherwise we would get the same warning for
> native/cross/nativesdk and target configuration.
> Also I would advise to used set() instead of lists for `no_description`
> and `no_homepage`, just to rule out any double postings
>
> > +                srcfile = rd.getVar('SRC_URI').split()
> > +                if not rd.getVar('DESCRIPTION'):
> > +                    no_description.append((pn, fn))
> > +                if not rd.getVar('HOMEPAGE'):
> > +                    if len(srcfile) > 0 and
> srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
>
> `if len(x) > 0` is a bad pattern - a pythonic way would be `if x:`
>
> > +                        # We are only interested in recipes SRC_URI
> fetched from external sources
> > +                        continue
> > +                    no_homepage.append((pn, fn))
> > +        if no_homepage:
> > +            self.fail("""
> > +The following recipes do not have a HOMEPAGE. Please add an entry for
> HOMEPAGE in the recipe.
> > +""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
> > +        if no_description:
> > +            self.fail("""
> > +The following recipes do not have a DESCRIPTION. Please add an entry
> for DESCRIPTION in the recipe.
> > +""" + "\n".join(['%s (%s)' % i for i in no_description]))
>
> the currently valid edition
> (https://www.openembedded.org/wiki/Styleguide) of the the style guide
> claims that DESCRIPTION defaults to SUMMARY. So I personally would
> rather check that SUMMARY != DESCRIPTION in case DESCRIPTION is set - by
> default DESCRIPTION isn't mandatory IMO (or the styleguide needs to be
> updated)
>
> > +
> >       def test_maintainers(self):
> >           """
> >           Summary:     Test that oe-core recipes have a maintainer and
> entries in maintainers list have a recipe
> >
> >
> >
> > 
> >
>

--0000000000006528ae05bce4f3a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div dir=3D"auto">Alright, Thank you for the feedbac=
k.</div><div dir=3D"auto"><br><span style=3D"font-family:sans-serif;font-si=
ze:13.696px">the currently valid edition=C2=A0</span><br style=3D"font-fami=
ly:sans-serif;font-size:13.696px"><span style=3D"font-family:sans-serif;fon=
t-size:13.696px">(</span><a href=3D"https://www.openembedded.org/wiki/Style=
guide" style=3D"text-decoration:none;color:rgb(66,133,244);font-family:sans=
-serif;font-size:13.696px">https://www.openembedded.org/wiki/Styleguide</a>=
<span style=3D"font-family:sans-serif;font-size:13.696px">) of the the styl=
e guide=C2=A0</span><br style=3D"font-family:sans-serif;font-size:13.696px"=
><span style=3D"font-family:sans-serif;font-size:13.696px">claims that DESC=
RIPTION defaults to SUMMARY. So I personally would=C2=A0</span><br style=3D=
"font-family:sans-serif;font-size:13.696px"><span style=3D"font-family:sans=
-serif;font-size:13.696px">rather check that SUMMARY !=3D DESCRIPTION in ca=
se DESCRIPTION is set - by=C2=A0</span><br style=3D"font-family:sans-serif;=
font-size:13.696px"><span style=3D"font-family:sans-serif;font-size:13.696p=
x">default DESCRIPTION isn&#39;t mandatory IMO (or the styleguide needs to =
be=C2=A0</span><br style=3D"font-family:sans-serif;font-size:13.696px"><spa=
n style=3D"font-family:sans-serif;font-size:13.696px">updated)</span><br></=
div><div dir=3D"auto">I now see why I didn&#39;t get reports on recipes wit=
hout DESCRIPTION.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
,</div><div dir=3D"auto">Dorinda.</div><br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 6, 2021, 22:10 Konrad Weih=
mann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">some nitpick below<br>
<br>
On 06.03.21 21:53, Dorinda wrote:<br>
&gt; [YOCTO #13471]<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">dorindabassey@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/lib/oeqa/selftest/cases/distrodata.py | 34 +++++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 34 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oe=
qa/selftest/cases/distrodata.py<br>
&gt; index e1cfc3b621..d8df0b530c 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; @@ -40,6 +40,40 @@ but their recipes claim otherwise by setting UPSTR=
EAM_VERSION_UNKNOWN. Please re<br>
&gt;=C2=A0 =C2=A0&quot;&quot;&quot; + &quot;\n&quot;.join(regressed_succes=
ses)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(regressed=
_failures) =3D=3D 0 and len(regressed_successes) =3D=3D 0, msg)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 def test_missing_homepg(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0 =C2=A0Test for oe-=
core recipes that don&#39;t have a HOMEPAGE or DESCRIPTION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 All oe-core recip=
es should have a DESCRIPTION entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 =C2=A0 All oe-core recip=
es should have a HOMEPAGE entry except for recipes that are not fetched fro=
m external sources.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Product:=C2=A0 =C2=A0 =C2=A0oe-core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with bb.tinfoil.Tinfoil() as tinfoil:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfoil.prepare(config_onl=
y=3DFalse)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_description =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_homepage =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for fn in tinfoil.all_reci=
pe_files(variants=3DFalse):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not &#39;=
/meta/recipes-&#39; in fn:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # We are only interested in OE-Core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rd =3D tinfo=
il.parse_recipe_file(fn, appends=3DFalse)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D rd.ge=
tVar(&#39;PN&#39;)<br>
<br>
shouldn&#39;t it be BPN, otherwise we would get the same warning for <br>
native/cross/nativesdk and target configuration.<br>
Also I would advise to used set() instead of lists for `no_description` <b=
r>
and `no_homepage`, just to rule out any double postings<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcfile =3D =
rd.getVar(&#39;SRC_URI&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rd.ge=
tVar(&#39;DESCRIPTION&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 no_description.append((pn, fn))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rd.ge=
tVar(&#39;HOMEPAGE&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if len(srcfile) &gt; 0 and srcfile[0].startswith(&#39;file&#39;) or no=
t rd.getVar(&#39;SRC_URI&#39;):<br>
<br>
`if len(x) &gt; 0` is a bad pattern - a pythonic way would be `if x:`<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # We are only interested in recipes SRC_URI fetched from=
 external sources<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 no_homepage.append((pn, fn))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_homepage:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&quot;&quot;&quo=
t;<br>
&gt; +The following recipes do not have a HOMEPAGE. Please add an entry fo=
r HOMEPAGE in the recipe.<br>
&gt; +&quot;&quot;&quot; + &quot;\n&quot;.join([&#39;%s (%s)&#39; % i for =
i in no_homepage]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&quot;&quot;&quo=
t;<br>
&gt; +The following recipes do not have a DESCRIPTION. Please add an entry=
 for DESCRIPTION in the recipe.<br>
&gt; +&quot;&quot;&quot; + &quot;\n&quot;.join([&#39;%s (%s)&#39; % i for =
i in no_description]))<br>
<br>
the currently valid edition <br>
(<a href=3D"https://www.openembedded.org/wiki/Styleguide" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://www.openembedded.org/wiki/Styleguid=
e</a>) of the the style guide <br>
claims that DESCRIPTION defaults to SUMMARY. So I personally would <br>
rather check that SUMMARY !=3D DESCRIPTION in case DESCRIPTION is set - by=
 <br>
default DESCRIPTION isn&#39;t mandatory IMO (or the styleguide needs to be=
 <br>
updated)<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def test_maintainers(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Summary:=C2=A0 =C2=A0 =C2=A0T=
est that oe-core recipes have a maintainer and entries in maintainers list =
have a recipe<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div></div>

--0000000000006528ae05bce4f3a7--
