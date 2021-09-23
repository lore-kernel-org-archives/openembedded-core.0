Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.3563.1632399396582291065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 05:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYMZYOlS;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id t28so3211214wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoAR7ucjrkiSn5G+zKfr/FGSg5hEkFlqOLWTTQw5lX4=;
        b=gYMZYOlSpsI4Vdsydi5wsvtfnP5i+3RYfNspNIbZW//JBct26wkGNfYhyYZSNM9Xcu
         P2JSVWtD7PkuWGHV9ayNqBFT4R++3Y1QjgF/RScIGdfbODedz1LM235k9HXTSfD08XvX
         jP4gtI9toRBwl7InhXphG/U2GmSenkCEQBv1X46y2qYfeKwjRZB32rKFEQzkg18yC4lg
         RnPf3T7CqXj4AuszJdBlGKfebYJZwen0bKDJ2c+DJwDh6Ltd9hEGftNVFRXQIy2yfHy5
         E7ApfY8ZMYpY0dWx3ETOkqtgr0qf7ghBD7HMTFwHf00zcnEnbyext34CMhuR1v4z9BU8
         CxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoAR7ucjrkiSn5G+zKfr/FGSg5hEkFlqOLWTTQw5lX4=;
        b=O2eeTIo1kdDfOh0oKEOG874WiskbmuEt+jTN5pI5LzAOa6n5+hAsVxwWX54Xb1syBz
         LjqGYzAxDkUFyYh0LhZlDc0csyq4j1JxKKP7A633FxPkdcPMOtpveh7AM/pRmBhnPni5
         s8TH5ClXCOWYCXbkRrVZv8uR4kOteP1E4KIgLGKcYRU3soJQQILx2d+vwlnXkb2Xlci0
         CuDC41244BqREvHOquO9sYzfZPubWPnbs0siZTIOvD/IznFQiZdoGT9+ihQHxt41/HRu
         xjhrziCDd3T1g2jdKreeU5Qx2CX8zAbsN50ZSoT/hEZRK77AMLLBxINqEFa7NhIMNqVX
         gAlQ==
X-Gm-Message-State: AOAM531NV6j+b75p4l8syN/21Z2PWoAaJHdVzV8XzYESkE/s/eqc3Km1
	Z/OQls7pRK6d0vuZTFYbgu4xg4FUA02RDN0bs8Y=
X-Google-Smtp-Source: ABdhPJwJ6U3g4ssMxjClJv7rX+cf02TJ0tbnCGtv9G01qjnrBPEwqAaEd+9eQl2skBQPUa6KoWntCRXpYd9XTm9ItUc=
X-Received: by 2002:a7b:c414:: with SMTP id k20mr4140346wmi.146.1632399394556;
 Thu, 23 Sep 2021 05:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210922221420.4115636-1-saul.wold@windriver.com>
 <AM9PR09MB4642D180F4CE760601B2A4D4A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <1d6ac5dd187543559fc07e12be5f9536@axis.com>
In-Reply-To: <1d6ac5dd187543559fc07e12be5f9536@axis.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 23 Sep 2021 07:16:23 -0500
Message-ID: <CAJdd5GY3MiDVw+u-YgOXGviYSNbf_vnr3KivR8qu6MAygfv6Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect natives sources
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, Saul Wold <Saul.Wold@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000b50e705cca89a2e"

--0000000000000b50e705cca89a2e
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021, 5:27 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> > Sent: den 23 september 2021 10:24
> > To: Saul Wold <Saul.Wold@windriver.com>; openembedded-
> > core@lists.openembedded.org; JPEWhacker@gmail.com
> > Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect natives sources
> >
> >
> >
> > On 23.09.21 00:14, Saul Wold wrote:
> > > When the collect_dep_sources() runs, it collects sources from both
> > native
> > > and non-native recipes. Later when the GENERATED_FROM matching occurs
> it
> > > may find the file (via checksum) from the native recipe since it's the
> > > same checksum as the target file. The that are generated DocumentRefs
> > > point to the native recipe rather than the target recipe DocumentRef.
> > >
> > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > ---
> > >   meta/classes/create-spdx.bbclass | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-
> > spdx.bbclass
> > > index 3c73c21c04..8f7fae43f1 100644
> > > --- a/meta/classes/create-spdx.bbclass
> > > +++ b/meta/classes/create-spdx.bbclass
> > > @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
> > >
> > >       sources = {}
> > >       for dep in dep_recipes:
> > > +        # Don't collect sources from native recipes as they
> > > +        # match non-native sources also.
> > > +        if "-native" in dep.recipe.name:
> >
> > That looks a bit too fuzzy to me - I would have expected
> >
> > if dep.recipe.name.endswith("-native"):
> >
> > here. Otherwise this is very prone to false positives
>
> Absolutely. E.g., we have a recipe called crate-native-tls for
> the native-tls Rust crate.
>
> At the same time I hate all these hardcoded tests for recipe types
> all over OE Core as they assume only the types that are in OE Core
> exist without any (easy) way of extending the tests for non-OE Core
> recipe types.
>
> Would it instead be possible to add the is_native in do_create_spdx()
> to the recipe object so that it is available here?
>

Yes. We should be able to add a custom annotation when we create the recipe
that we can check later


> > > +            continue
> > >           recipe_files = set(dep.recipe.hasFiles)
> > >
> > >           for spdx_file in dep.doc.files:
>
> //Peter
>
>

--0000000000000b50e705cca89a2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Sep 23, 2021, 5:27 AM Peter Kjellerstedt &lt;<=
a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; -----Original Me=
ssage-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</=
a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">core@lists.openembedded.org</a>&gt; On Behalf Of Konrad Wei=
hmann<br>
&gt; Sent: den 23 september 2021 10:24<br>
&gt; To: Saul Wold &lt;<a href=3D"mailto:Saul.Wold@windriver.com" target=3D=
"_blank" rel=3D"noreferrer">Saul.Wold@windriver.com</a>&gt;; openembedded-<=
br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">core@lists.openembedded.org</a>; <a href=3D"mailto:JPEWhack=
er@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>=
<br>
&gt; Subject: Re: [OE-core] [PATCH] create-spdx: Don&#39;t collect natives =
sources<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 23.09.21 00:14, Saul Wold wrote:<br>
&gt; &gt; When the collect_dep_sources() runs, it collects sources from bot=
h<br>
&gt; native<br>
&gt; &gt; and non-native recipes. Later when the GENERATED_FROM matching oc=
curs it<br>
&gt; &gt; may find the file (via checksum) from the native recipe since it&=
#39;s the<br>
&gt; &gt; same checksum as the target file. The that are generated Document=
Refs<br>
&gt; &gt; point to the native recipe rather than the target recipe Document=
Ref.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windrive=
r.com" target=3D"_blank" rel=3D"noreferrer">saul.wold@windriver.com</a>&gt;=
<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/create-spdx.bbclass | 4 ++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/crea=
te-<br>
&gt; spdx.bbclass<br>
&gt; &gt; index 3c73c21c04..8f7fae43f1 100644<br>
&gt; &gt; --- a/meta/classes/create-spdx.bbclass<br>
&gt; &gt; +++ b/meta/classes/create-spdx.bbclass<br>
&gt; &gt; @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sources =3D {}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in dep_recipes:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Don&#39;t collect sources from nat=
ive recipes as they<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # match non-native sources also.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;-native&quot; in <a href=3D=
"http://dep.recipe.name" rel=3D"noreferrer noreferrer" target=3D"_blank">de=
p.recipe.name</a>:<br>
&gt; <br>
&gt; That looks a bit too fuzzy to me - I would have expected<br>
&gt; <br>
&gt; if dep.recipe.name.endswith(&quot;-native&quot;):<br>
&gt; <br>
&gt; here. Otherwise this is very prone to false positives<br>
<br>
Absolutely. E.g., we have a recipe called crate-native-tls for <br>
the native-tls Rust crate.<br>
<br>
At the same time I hate all these hardcoded tests for recipe types <br>
all over OE Core as they assume only the types that are in OE Core <br>
exist without any (easy) way of extending the tests for non-OE Core <br>
recipe types.<br>
<br>
Would it instead be possible to add the is_native in do_create_spdx() <br>
to the recipe object so that it is available here?<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. We should be able to=
 add a custom annotation when we create the recipe that we can check later<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipe_files =3D set(dep.=
recipe.hasFiles)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for spdx_file in dep.doc.=
files:<br>
<br>
//Peter<br>
<br>
</blockquote></div></div></div>

--0000000000000b50e705cca89a2e--
