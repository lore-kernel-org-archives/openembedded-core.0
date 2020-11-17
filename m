Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.14215.1605644652659555591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 12:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XBBbHpnv;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id v22so23851804edt.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cSxF8VSIF3TdlsUGkEZczapxybPd2mEOQ0GTVjjJ3qE=;
        b=XBBbHpnvJ5NFqvRGhTZOgJ47KGaNx4+Nv6BrLgH2LwLXvc8b6DGaXbIOs11Iv3ar6C
         z2KszAsyA98i4z+iY4duOSzh5WHnhDdZciv7FGASxq2WeAs3Ys9Lxmx3QNby9xDGSbvQ
         Dp3MM4YZ+9cHjr7seZ1F8bLcv3HJWBk3ri4JSeyiU1yt20SJZUvsmWsOCboCY+btWmUf
         xfU0ULPB9EEpgLsMDSD4PtoMF6cCl7FTCEgnoPHK6R8819mj9IPqroi2Sotr0BrSrgFo
         v9L56HqOCQT264sU9upgn9AFELmOwLm1ACDHbxDTiwnEOG6hI+OrYST8D8DarOqCcRue
         dXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cSxF8VSIF3TdlsUGkEZczapxybPd2mEOQ0GTVjjJ3qE=;
        b=f8wIioAiqMNlUCHxc9w4zMN51GCsH8YH4gWkozswqN8f9BWyGfAmzMlgI4lY2Yha9R
         TW+6ngn0azv3cdjPOa8j1OKdw9f2j+DSVk8/9GTNCB8TTI8kjAaulsXjjcA8NNNWyZnG
         RY0NuFESYvhdPfK7CFyMI/8DZZU4w1kaDfwx5Y11qDX70Q2AWhSpgahDR67A62gRLUbm
         h7QQM45JnQJAPMzqF0inzYvHQj4MnY2c4t6hQucrulZwtSARIOZ4Cc4v3mA6rW0nJu0F
         LAgmIf2aP0wRd5IhY12zU4Ue8IkdFXhdOtPSzmqTGpM/D05LUwR12iDK0vOXj7GkWXQY
         YiLQ==
X-Gm-Message-State: AOAM530r0TSSVN+Te3tRA20qyorYZTj+tBkzyFCIOyHRrjiV8p+K6BR0
	P0M1plaOrALQn7gU/IHMJ+PjfISQVyGWhe0dwhI=
X-Google-Smtp-Source: ABdhPJzVPceo28mzrRVW+xSXYVJ6Lhfi1QX73P3V2HQkVgmMz7TWb279dqIvJRTNzwp/SIg0mD0WPrZ7ifPM01ebXVY=
X-Received: by 2002:aa7:d356:: with SMTP id m22mr22540224edr.270.1605644651097;
 Tue, 17 Nov 2020 12:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com> <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
 <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com> <CANPvuRnK2v4SwZ722=Phhp_C6PGphB7ygMYOzMaCDbbXcSzUsw@mail.gmail.com>
In-Reply-To: <CANPvuRnK2v4SwZ722=Phhp_C6PGphB7ygMYOzMaCDbbXcSzUsw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 21:23:59 +0100
Message-ID: <CA+chaQdJ79DA8zB9DFkqbVWzumABb+aF5jXgPu0s4pdqXQ7UTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000010760505b45347f6"

--00000000000010760505b45347f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Then you will need space in:
EXTRA_PYTHON_DEPENDS_append_class-target =3D " python3"
as well.

I don't expect EXTRA_PYTHON_DEPENDS to be often (if at all) outside the
bbclass, but IMHO it's good convention to just use leading space
wherever you append to space separated list (less surprises for people who
might eventually set something like EXTRA_PYTHON_DEPENDS in their recipes =
-
even from wrong reasons).

On Tue, Nov 17, 2020 at 9:18 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Martin,
>
> you're right. if EXTRA_PYTHON_DEPENDS is set outside of the bbclass it
> break the DEPENDS.
>
> Sorry Khem for my suggestion, your initial was right.
>
> +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>
> But in this case (when EXTRA_PYTHON_DEPENDS is set outside of the bbclas=
s)
> it will don't have any effect for the overwrite class-target because
> EXTRA_PYTHON_DEPENDS_class-target=3D"python3" always will set
> EXTRA_PYTHON_DEPENDS=3D"python3"
>
> I think I have see another problem now and something like this is better=
:
>
> +EXTRA_PYTHON_DEPENDS_append_class-target =3D "python3"
> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>
> Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
> 17/11/2020 =C3=A0(s) 19:56:
> >
> > I don't mind this change, but why do you think space in the variable i=
s
> better in this case (where we don't mind extra space being added for
> native/nativesdk case?)
> >
> > If someone sets EXTRA_PYTHON_DEPENDS =3D "foo" for whatever reason in =
some
> recipe, then the space will be missing.
> >
> > On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma <quaresma.jose@gmail.com=
>
> wrote:
> >>
> >> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/2020 =
=
=C3=A0(s)
> 18:04:
> >> >
> >> > python3targetconfig append target python3 to dependencies
> >> > unconditionally, and here its inherited unconditionally too but
> >> > distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
> not-target
> >> > recipes as well. Hence the change added via
> 9c8f666097802cb594a759989edcf01603a22df3
> >> > is now bridging the native dependencies with target python3 and tha=
ts
> >> > resulting all sorts of rebuilds for multimachine builds e.g.
> >> >
> >> > MACHINE=3Dqemuarm bitbake python3-scons-native
> >> > MACHINE=3Dqemumips bitbake python3-scons-native
> >> >
> >> > results in rebuilds for python3-scons-native
> >> >
> >> > bitbake-diffsigs shows
> >> >
> >> > Hash for dependent task python/python3-scons-native_3.1.2.bb:do_pop=
ulate_sysroot
> changed from
> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
> >> > 0e3b97bd058d162065
> >> >     Hash for dependent task python/python3-scons-native_3.1.2.bb:do=
_install
> changed from
> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
> >> > 229cb0f5ebb11
> >> >         Hash for dependent task python/python3-scons-native_3.1.2.b=
b:do_compile
> changed from
> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
> >> > 7cc9769194c43eae1
> >> >             Hash for dependent task
> python/python3-scons-native_3.1.2.bb:do_configure changed from
> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
> a366982778b03eee5165c3117ee778f848acdfaa2
> >> > b346650fbdf114ac70ab57b
> >> >                 Hash for dependent task
> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed
> from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
> 474333fb565f908992fd3716
> >> > 4935aaecf31a79e867826fe634cde4f44171d8e7
> >> >                     Hash for dependent task python/python3_3.9.0.bb=
:do_populate_sysroot
> changed from
> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
> >> > 08777e46a6fa6e417c0445018
> >> >
> >> > ...
> >> >
> >> > Therefore limit effects of this class only for target recipes.
> >> >
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> >> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> >> > ---
> >> > v2: Mark depends conditional instead
> >> > v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
> >> >     and mark tasks with target override
> >> >
> >> >  meta/classes/python3targetconfig.bbclass | 10 ++++++----
> >> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/meta/classes/python3targetconfig.bbclass
> b/meta/classes/python3targetconfig.bbclass
> >> > index 640d0c97b6..fc1025c207 100644
> >> > --- a/meta/classes/python3targetconfig.bbclass
> >> > +++ b/meta/classes/python3targetconfig.bbclass
> >> > @@ -1,15 +1,17 @@
> >> >  inherit python3native
> >> >
> >> > -DEPENDS_append =3D " python3"
> >> > +EXTRA_PYTHON_DEPENDS ?=3D ""
> >> > +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> >> > +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >>
> >> -EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> >> -DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> >> +EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
> >> +DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"
> >>
> >> add a space before python3 is better than always add it to DEPENDS
> >>
> >> >
> >> > -do_configure_prepend() {
> >> > +do_configure_prepend_class-target() {
> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >  }
> >> >
> >> > -do_compile_prepend() {
> >> > +do_compile_prepend_class-target() {
> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >  }
> >> >
> >> > -do_install_prepend() {
> >> > +do_install_prepend_class-target() {
> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >> >  }
> >> > --
> >> > 2.29.2
> >> >
> >> >=20
> >> >
> >>
> >>
> >> --
> >> best regards,
> >> Jos=C3=A9 Quaresma
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>

--00000000000010760505b45347f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Then you will need space in:<div>EXTRA_PYTHON_DEPENDS_appe=
nd_class-target =3D &quot; python3&quot;<br></div><div>as well.</div><div><=
br></div><div>I don&#39;t expect=C2=A0EXTRA_PYTHON_DEPENDS to be often (if =
at all) outside the bbclass, but IMHO it&#39;s good convention to just use =
leading space wherever=C2=A0you append to space separated list (less surpri=
ses for people who might eventually set something like=C2=A0EXTRA_PYTHON_DE=
PENDS in their recipes - even from wrong reasons).</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 202=
0 at 9:18 PM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">q=
uaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Martin,<br>
<br>
you&#39;re right. if EXTRA_PYTHON_DEPENDS is set outside of the bbclass it=
<br>
break the DEPENDS.<br>
<br>
Sorry Khem for my suggestion, your initial was right.<br>
<br>
+EXTRA_PYTHON_DEPENDS_class-target =3D &quot;python3&quot;<br>
+DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
<br>
But in this case (when EXTRA_PYTHON_DEPENDS is set outside of the bbclass)=
<br>
it will don&#39;t have any effect for the overwrite class-target because<b=
r>
EXTRA_PYTHON_DEPENDS_class-target=3D&quot;python3&quot; always will set<br=
>
EXTRA_PYTHON_DEPENDS=3D&quot;python3&quot;<br>
<br>
I think I have see another problem now and something like this is better:<=
br>
<br>
+EXTRA_PYTHON_DEPENDS_append_class-target =3D &quot;python3&quot;<br>
+DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blan=
k">martin.jansa@gmail.com</a>&gt; escreveu no dia ter=C3=A7a,<br>
17/11/2020 =C3=A0(s) 19:56:<br>
&gt;<br>
&gt; I don&#39;t mind this change, but why do you think space in the varia=
ble is better in this case (where we don&#39;t mind extra space being added=
 for native/nativesdk case?)<br>
&gt;<br>
&gt; If someone sets EXTRA_PYTHON_DEPENDS =3D &quot;foo&quot; for whatever=
 reason in some recipe, then the space will be missing.<br>
&gt;<br>
&gt; On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma &lt;<a href=3D"mailto:q=
uaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 17/11/2020 =C3=
=A0(s) 18:04:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; python3targetconfig append target python3 to dependencies<br=
>
&gt;&gt; &gt; unconditionally, and here its inherited unconditionally too =
but<br>
&gt;&gt; &gt; distutils3-base is inherited in BBCLASSEXTEND&#39;ed recipes=
 and other not-target<br>
&gt;&gt; &gt; recipes as well. Hence the change added via 9c8f666097802cb5=
94a759989edcf01603a22df3<br>
&gt;&gt; &gt; is now bridging the native dependencies with target python3 =
and thats<br>
&gt;&gt; &gt; resulting all sorts of rebuilds for multimachine builds e.g.=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; MACHINE=3Dqemuarm bitbake python3-scons-native<br>
&gt;&gt; &gt; MACHINE=3Dqemumips bitbake python3-scons-native<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; results in rebuilds for python3-scons-native<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; bitbake-diffsigs shows<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hash for dependent task python/python3-scons-native_3.1.2.bb=
:do_populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa2=
9033146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897<b=
r>
&gt;&gt; &gt; 0e3b97bd058d162065<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hash for dependent task python/python3-sc=
ons-native_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7=
ccca1be026a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd010=
2be4d62bd3156<br>
&gt;&gt; &gt; 229cb0f5ebb11<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hash for dependent task pyt=
hon/python3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6a=
e7853ec19a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f=
363ce6afb37652abe837dac<br>
&gt;&gt; &gt; 7cc9769194c43eae1<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hash for depe=
ndent task python/python3-scons-native_3.1.2.bb:do_configure changed from 7=
70a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a3669827=
78b03eee5165c3117ee778f848acdfaa2<br>
&gt;&gt; &gt; b346650fbdf114ac70ab57b<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Hash for dependent task python/python3-scons-native_3.1.2.bb:do_prepare=
_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b93=
3cfeba771ee095cb72 to 474333fb565f908992fd3716<br>
&gt;&gt; &gt; 4935aaecf31a79e867826fe634cde4f44171d8e7<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Hash for dependent task python/python3_3.9.0.bb:do_popula=
te_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e48=
5e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad<br>
&gt;&gt; &gt; 08777e46a6fa6e417c0445018<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Therefore limit effects of this class only for target recipe=
s.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.co=
m" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; v2: Mark depends conditional instead<br>
&gt;&gt; &gt; v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0and mark tasks with target override<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 meta/classes/python3targetconfig.bbclass | 10 ++++++--=
--<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/python3targetconfig.bbclass b/meta=
/classes/python3targetconfig.bbclass<br>
&gt;&gt; &gt; index 640d0c97b6..fc1025c207 100644<br>
&gt;&gt; &gt; --- a/meta/classes/python3targetconfig.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/python3targetconfig.bbclass<br>
&gt;&gt; &gt; @@ -1,15 +1,17 @@<br>
&gt;&gt; &gt;=C2=A0 inherit python3native<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -DEPENDS_append =3D &quot; python3&quot;<br>
&gt;&gt; &gt; +EXTRA_PYTHON_DEPENDS ?=3D &quot;&quot;<br>
&gt;&gt; &gt; +EXTRA_PYTHON_DEPENDS_class-target =3D &quot;python3&quot;<b=
r>
&gt;&gt; &gt; +DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -EXTRA_PYTHON_DEPENDS_class-target =3D &quot;python3&quot;<br>
&gt;&gt; -DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
&gt;&gt; +EXTRA_PYTHON_DEPENDS_class-target =3D &quot; python3&quot;<br>
&gt;&gt; +DEPENDS_append =3D &quot;${EXTRA_PYTHON_DEPENDS}&quot;<br>
&gt;&gt;<br>
&gt;&gt; add a space before python3 is better than always add it to DEPEND=
S<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -do_configure_prepend() {<br>
&gt;&gt; &gt; +do_configure_prepend_class-target() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDA=
TA_NAME=3D&quot;_sysconfigdata&quot;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -do_compile_prepend() {<br>
&gt;&gt; &gt; +do_compile_prepend_class-target() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDA=
TA_NAME=3D&quot;_sysconfigdata&quot;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -do_install_prepend() {<br>
&gt;&gt; &gt; +do_install_prepend_class-target() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDA=
TA_NAME=3D&quot;_sysconfigdata&quot;<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.29.2<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; best regards,<br>
&gt;&gt; Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
</blockquote></div>

--00000000000010760505b45347f6--
