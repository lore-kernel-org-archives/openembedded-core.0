Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web09.537.1615581862340516384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 12:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBE3yaFQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id g27so27172347iox.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 12:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfhcU9z0BSGme/pQLzYUHygOxViqr8ajjD6a6VOfqnI=;
        b=dBE3yaFQSZ6trnsBZMQsZ9uXhbTuXvP7Xw6GxW+i5W7plx0S6aQ9GxReX/WAGVaKtt
         0H6tjsQqybuoYdbYEMnYp6kER5NpWjlLeV+Sdj2sihpQKX5lHiB+VrSwfI7D+yYq6lXd
         Fdu+ytM71QP5QUtzx2xQafPWfS9bxWpvEl4jyLpC2j5l5F+VmBz17oiGvUASXJjxq/0P
         B06gZ0Wu1gX4iTDkSy5uBEqjqxYB7I/fL6DPFQWDt5YVd+41H19OliDnpj2wf1ITOwr9
         iPuUlASAS5ESqTKQ2+fXrotor80nRke/FxyeDPv48xnuM8OGPttX78yQW8NGvMa8T8qb
         26Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfhcU9z0BSGme/pQLzYUHygOxViqr8ajjD6a6VOfqnI=;
        b=oD3zKtzlod6snE5DjTL+GuQbIqUAdSNWciYlWEzHJDZ2YwY8wTZnkofrTtPXM9U7Yq
         3Z0w2oONG0mHEeqYrwQaia79lbmlSP56eo/klY81I06pjoK3EX0J+zRE1u6V5yEy7Boi
         WfEUSd4eiYNRDfiXXQepfpUkMaf7jHBR9BqL6oAQMNMY5GbHQvIG65wFaZOmzfW1eN8i
         0jhpBZgtebTWw+BW2k8aqk9osqAmyn+HhXGTc1wwEJ7sE8SwyjoPkP0KMo8ADq2JylfW
         MKVwgjc34/GMYuieqZu8lYphq0eMCdDT0RGP725/0KcTnTsfjpXkoSaold+oCxtacY8p
         UEWQ==
X-Gm-Message-State: AOAM533f1eVspETUmwbsOAuUe1GSLzY2zFwyg4J8mv49NmH7fw+TPRXA
	tjH/q+zARImtZHF+EZyT8wQ3w27GU8o7uG5egMI=
X-Google-Smtp-Source: ABdhPJwORg75ZZJ4uqIIcxxW/J7lfUjxVpOwCKSPQIjj42F7nZZq6i+Ptk93WTWaZ2Ie0ncyooZij68kF0KnBgGngno=
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr1020489jad.83.1615581861572;
 Fri, 12 Mar 2021 12:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20210308211207.6853-1-dorindabassey@gmail.com> <c9021472-59ad-9511-d9bf-fd9b6d71e109@windriver.com>
In-Reply-To: <c9021472-59ad-9511-d9bf-fd9b6d71e109@windriver.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Fri, 12 Mar 2021 21:44:09 +0100
Message-ID: <CAJSnhztKbi-A+jUALk1vJ6fLWbf5TfV4xiYhA-K8xz7Qmj_Bsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2][RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f6f47505bd5cf603"

--000000000000f6f47505bd5cf603
Content-Type: text/plain; charset="UTF-8"

Alright, I get you.
Will send a v3 RFC.

Thanks,
Dorinda.

On Fri, Mar 12, 2021 at 3:11 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-03-08 4:12 p.m., Dorinda wrote:
> > This test is to keep track of recipes that do not have a HOMEPAGE or
> DESCRIPTION,
> > with exceptions to recipes whose SRC_URI are not linked to external
> sources.
> >
> > [YOCTO #13471]
> >
> > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > ---
> > v2:
> > -Changed PN to BPN
> > -Used set() instead of lists
> > -Changed condition for checking recipes with missing DESCRIPTION
> >
> >   meta/lib/oeqa/selftest/cases/distrodata.py | 36 ++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py
> b/meta/lib/oeqa/selftest/cases/distrodata.py
> > index e1cfc3b621..633bf25dc7 100644
> > --- a/meta/lib/oeqa/selftest/cases/distrodata.py
> > +++ b/meta/lib/oeqa/selftest/cases/distrodata.py
> > @@ -40,6 +40,42 @@ but their recipes claim otherwise by setting
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
> > +            no_description = set()
> > +            no_homepage = set()
>
> Since the other tests in this file such as:
>      def test_maintainers(self):
> uses lists rather than set()s:
>              with_maintainer_list = []
>              no_maintainer_list = []
>
>              missing_recipes = []
>              recipes = []
>
> Maybe pick one data structure to be consistent.
>
> If you decide that set() is better then make a separate commit to
> change that. Apparently sets are faster for some operations:
>     https://stackoverflow.com/questions/2831212/python-sets-vs-lists
> it would be nice if you checked and documented what you find in the
> commit log since these tests do take a few minutes on a lowly laptop.
>
> The rest looks good to me. Drop the RFC if you send a v3.
>
> Thanks!
> ../Randy
>
>
> > +            for fn in tinfoil.all_recipe_files(variants=False):
> > +                if not '/meta/recipes-' in fn:
> > +                    # We are only interested in OE-Core
> > +                    continue
> > +                rd = tinfoil.parse_recipe_file(fn, appends=False)
> > +                pn = rd.getVar('BPN')
> > +                srcfile = rd.getVar('SRC_URI').split()
> > +                #Since DESCRIPTION defaults to SUMMARY if not set, we
> are only interested in recipes without DESCRIPTION or SUMMARY
> > +                if not (rd.getVar('SUMMARY') or
> rd.getVar('DESCRIPTION')):
> > +                    no_description.add((pn, fn))
> > +                if not rd.getVar('HOMEPAGE'):
> > +                    if srcfile and srcfile[0].startswith('file') or not
> rd.getVar('SRC_URI'):
> > +                        # We are only interested in recipes SRC_URI
> fetched from external sources
> > +                        continue
> > +                    no_homepage.add((pn, fn))
> > +        if no_homepage:
> > +            self.fail("""
> > +The following recipes do not have a HOMEPAGE. Please add an entry for
> HOMEPAGE in the recipe.
> > +""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
> > +
> > +        if no_description:
> > +            self.fail("""
> > +The following recipes do not have a DESCRIPTION. Please add an entry
> for DESCRIPTION in the recipe.
> > +""" + "\n".join(['%s (%s)' % i for i in no_description]))
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
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--000000000000f6f47505bd5cf603
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alright, I get you.<div>Will send a v3 RFC.</div><div><br>=
</div><div>Thanks,</div><div>Dorinda.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:11 AM =
Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macl=
eod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2021-03-08 4:12 p.m., Dorinda wrote:<br>
&gt; This test is to keep track of recipes that do not have a HOMEPAGE or =
DESCRIPTION,<br>
&gt; with exceptions to recipes whose SRC_URI are not linked to external s=
ources.<br>
&gt; <br>
&gt; [YOCTO #13471]<br>
&gt; <br>
&gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey@gma=
il.com" target=3D"_blank">dorindabassey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt; -Changed PN to BPN<br>
&gt; -Used set() instead of lists<br>
&gt; -Changed condition for checking recipes with missing DESCRIPTION<br>
&gt; <br>
&gt;=C2=A0 =C2=A0meta/lib/oeqa/selftest/cases/distrodata.py | 36 +++++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 36 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oe=
qa/selftest/cases/distrodata.py<br>
&gt; index e1cfc3b621..633bf25dc7 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/distrodata.py<br>
&gt; @@ -40,6 +40,42 @@ but their recipes claim otherwise by setting UPSTR=
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_description =3D set()<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_homepage =3D set()<br>
<br>
Since the other tests in this file such as:<br>
=C2=A0 =C2=A0 =C2=A0def test_maintainers(self):<br>
uses lists rather than set()s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with_maintainer_list =3D [=
]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_maintainer_list =3D []<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing_recipes =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes =3D []<br>
<br>
Maybe pick one data structure to be consistent.<br>
<br>
If you decide that set() is better then make a separate commit to<br>
change that. Apparently sets are faster for some operations:<br>
=C2=A0 =C2=A0 <a href=3D"https://stackoverflow.com/questions/2831212/pytho=
n-sets-vs-lists" rel=3D"noreferrer" target=3D"_blank">https://stackoverflow=
.com/questions/2831212/python-sets-vs-lists</a><br>
it would be nice if you checked and documented what you find in the<br>
commit log since these tests do take a few minutes on a lowly laptop.<br>
<br>
The rest looks good to me. Drop the RFC if you send a v3.<br>
<br>
Thanks!<br>
../Randy<br>
<br>
<br>
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
tVar(&#39;BPN&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcfile =3D =
rd.getVar(&#39;SRC_URI&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #Since DESCR=
IPTION defaults to SUMMARY if not set, we are only interested in recipes wi=
thout DESCRIPTION or SUMMARY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (rd.g=
etVar(&#39;SUMMARY&#39;) or rd.getVar(&#39;DESCRIPTION&#39;)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 no_description.add((pn, fn))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not rd.ge=
tVar(&#39;HOMEPAGE&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if srcfile and srcfile[0].startswith(&#39;file&#39;) or not rd.getVar(=
&#39;SRC_URI&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # We are only interested in recipes SRC_URI fetched from=
 external sources<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 no_homepage.add((pn, fn))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_homepage:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&quot;&quot;&quo=
t;<br>
&gt; +The following recipes do not have a HOMEPAGE. Please add an entry fo=
r HOMEPAGE in the recipe.<br>
&gt; +&quot;&quot;&quot; + &quot;\n&quot;.join([&#39;%s (%s)&#39; % i for =
i in no_homepage]))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if no_description:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fail(&quot;&quot;&quo=
t;<br>
&gt; +The following recipes do not have a DESCRIPTION. Please add an entry=
 for DESCRIPTION in the recipe.<br>
&gt; +&quot;&quot;&quot; + &quot;\n&quot;.join([&#39;%s (%s)&#39; % i for =
i in no_description]))<br>
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
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--000000000000f6f47505bd5cf603--
