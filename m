Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web08.3987.1611615229190594500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O3epfNCF;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id h11so29903911ioh.11
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hbo46V0TEKzoiUjKB9u0hLWigcNcZKZWwoYQqv6oW58=;
        b=O3epfNCFo8GD6F8iQftAOLXenHNd5jQNNg7+yFFJ/NVZBU3ArA7BXZZn7URR1rFBHA
         sfYxiKunshduFsagfd7kne+wL5NVgV6+zmyq9myC5++/NxWVtg2ftcOmJ7jAaz6r+rC0
         edfTTXYyB/Fe7UkF/j+OtcWiDLvB+lj18QamNZJBJnsQzFhY4K9tEUbQJYXhGzftSk+4
         YZdULZASiXCdyuXZiqEEbBilrkbfR+WfpvknqbvS8rSDV1HAxLkeAjKHjO6WdmCTxbtZ
         EP7mOC3I1Ym0/l35nyvnNkIMgZKNaMdhv1wyj/QSsdrT/fd9MiD5lCGv/4xHxwML8sCG
         M4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hbo46V0TEKzoiUjKB9u0hLWigcNcZKZWwoYQqv6oW58=;
        b=VuZLOupIhoP+5TwsprAh/nIVeaJKjcyGkGArG4AhTmxhSNa7VUzN0eXNZ5uzLIypho
         juZt8gRakzrFtQ7PNJkhWfOVO2IHLCez+UrXMcGvyVNleY/joldkH4adYr62+2D3LGnA
         dj/ASs47gZ722zT2mVztSQ2n3SlRRdYd8jR0akyJIUEBFXg6MfJIkubBWyplDNdMieFk
         uzOe1hL7/9zbXmQEuDNoFJ4gyk2wTEZEHklOZnDWlDA3MLZn4cwOlUj1PsIkALlHtiGa
         liy27lmkheMMQ86RqxO/OASMsrZduJ4KG9MDKnN0Ao7Id0BnDAikHZWYzKTFZqhCioX+
         Ynvw==
X-Gm-Message-State: AOAM531cbYvKOezbE5mHv0teQONDi6tqu46uz2crRu+vU3l4dUVl68hV
	QeiJWERYRzedfwYQG6hKtSVPhrydSk/bKtTOlHc=
X-Google-Smtp-Source: ABdhPJxofCJsqXdskdlIAJxXc4XJx5aYLMEVny5jfA/6kIm3RMWEMLhVezJ6vAYJIWBDicqmeQur9O7beQKCnRuSX8o=
X-Received: by 2002:a6b:b356:: with SMTP id c83mr2135672iof.208.1611615228667;
 Mon, 25 Jan 2021 14:53:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Mon, 25 Jan 2021 14:53:47
 -0800 (PST)
Received: by 2002:a92:ce09:0:0:0:0:0 with HTTP; Mon, 25 Jan 2021 14:53:47
 -0800 (PST)
In-Reply-To: <763a6b20912146228385c2125395bc68@XBOX03.axis.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
 <20210124135559.21894-5-dorindabassey@gmail.com> <20210125092140.qzuwucbfplk6mzma@qschulz>
 <763a6b20912146228385c2125395bc68@XBOX03.axis.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Mon, 25 Jan 2021 23:53:47 +0100
Message-ID: <CAJSnhzvbFKLepN-nnOz30e_mih4-GokFtxHzdRAQca6U21cCrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: quentin.schulz@streamunlimited.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000382aee05b9c169e4"

--000000000000382aee05b9c169e4
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedbacks, will update the patch.

Dorinda

On Jan 25, 2021 3:58 PM, "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Quentin Schulz
> > Sent: den 25 januari 2021 10:22
> > To: Dorinda <dorindabassey@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user isn't
> > building in PSEUDO_IGNORE_PATHS
> >
> > Hi Dorinda,
> >
> > On Sun, Jan 24, 2021 at 02:55:59PM +0100, Dorinda wrote:
> > > added a check to ensure that a user isn't building in
> > PSEUDO_IGNORE_PATHS
> > >
> >
> > Missing [YOCTO #14179] tag I think :)
> >
> > > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > > ---
> > >  meta/classes/sanity.bbclass | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > index 2040b48595..78c0343f0d 100644
> > > --- a/meta/classes/sanity.bbclass
> > > +++ b/meta/classes/sanity.bbclass
> > > @@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
> > >      if (tmpdirmode & stat.S_ISUID):
> > >          status.addresult("TMPDIR is setuid, please don't build in a
> setuid directory")
> > >
> > > +    # Check that user isn't building in PSEUDO_IGNORE_PATHS
> > > +    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
> expand=True).split(",")
> > > +    workdir = d.getVar('WORKDIR', expand=True)
> > > +    for i in pseudoignorepaths:
> > > +        if workdir.startswith(i):
>
> PSEUDO_IGNORE_PATHS may contain empty paths (i.e., from multiple
> consecutive commas, or a trailing commas). Pseudo will ignore these
> paths, so this code should ignore them too:
>
>         if i and workdir.startswith(i):
>
> > > +            status.addresult("you are building in a path under
> PSEUDO_IGNORE_PATHS, please remove this" + str(i) + "directory in \nParsed
> WORKDIR: " + str(workdir) + "\n")
> >
> > Capital Y for the beginning of the sentence?
> >
> > Missing space before and after str(i).
> >
> > I'm not familiar with this part of the code, so forgive me if this is
> > wrong but... is your sentence finished?
> >
> > You are building in a path under PSEUDO_IGNORE_PATHS, please remove this
> <dir> directory in
> > Parsed WORKDIR: <workdir>
> >
> > That is to me not very telling about what I should do to fix this issue.
> >
> > I honestly might be missing a lot of context on the issue so wouldn't be
> > surprised if the issue is with me not understanding the sentence more
> > than the sentence being "unfinished".
>
> No, I don't think you are wrong. I do not understand it either.
>
> > Thanks,
> > Quentin
>
> //Peter
>
>

--000000000000382aee05b9c169e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the feedbacks, will update the patch.<div dir=
=3D"auto"><br></div><div dir=3D"auto">Dorinda</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Jan 25, 2021 3:58 PM, &quot;Pete=
r Kjellerstedt&quot; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">pet=
er.kjellerstedt@axis.com</a>&gt; wrote:<br type=3D"attribution"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.<wbr>openembedded.org</a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org">core@lists.openembedded=
.org</a>&gt; On Behalf Of Quentin Schulz<br>
&gt; Sent: den 25 januari 2021 10:22<br>
&gt; To: Dorinda &lt;<a href=3D"mailto:dorindabassey@gmail.com">dorindabass=
ey@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH 5/5] sanity.bbclass: verify that user is=
n&#39;t<br>
&gt; building in PSEUDO_IGNORE_PATHS<br>
&gt; <br>
&gt; Hi Dorinda,<br>
&gt; <br>
&gt; On Sun, Jan 24, 2021 at 02:55:59PM +0100, Dorinda wrote:<br>
&gt; &gt; added a check to ensure that a user isn&#39;t building in<br>
&gt; PSEUDO_IGNORE_PATHS<br>
&gt; &gt;<br>
&gt; <br>
&gt; Missing [YOCTO #14179] tag I think :)<br>
&gt; <br>
&gt; &gt; Signed-off-by: Dorinda Bassey &lt;<a href=3D"mailto:dorindabassey=
@gmail.com">dorindabassey@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/sanity.bbclass | 7 +++++++<br>
&gt; &gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bb=
class<br>
&gt; &gt; index 2040b48595..78c0343f0d 100644<br>
&gt; &gt; --- a/meta/classes/sanity.bbclass<br>
&gt; &gt; +++ b/meta/classes/sanity.bbclass<br>
&gt; &gt; @@ -703,6 +703,13 @@ def check_sanity_version_change(<wbr>status,=
 d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (tmpdirmode &amp; stat.S_ISUID):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot;TMPDIR i=
s setuid, please don&#39;t build in a setuid directory&quot;)<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 # Check that user isn&#39;t building in PSEUDO_IGN=
ORE_PATHS<br>
&gt; &gt; +=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_=
PATHS&#39;<wbr>, expand=3DTrue).split(&quot;,&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 workdir =3D d.getVar(&#39;WORKDIR&#39;, expand=3DT=
rue)<br>
&gt; &gt; +=C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir.startswith(i):<br>
<br>
PSEUDO_IGNORE_PATHS may contain empty paths (i.e., from multiple <br>
consecutive commas, or a trailing commas). Pseudo will ignore these <br>
paths, so this code should ignore them too:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and workdir.startswith(i):<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresult(&quot=
;you are building in a path under PSEUDO_IGNORE_PATHS, please remove this&q=
uot; + str(i) + &quot;directory in \nParsed WORKDIR: &quot; + str(workdir) =
+ &quot;\n&quot;)<br>
&gt; <br>
&gt; Capital Y for the beginning of the sentence?<br>
&gt; <br>
&gt; Missing space before and after str(i).<br>
&gt; <br>
&gt; I&#39;m not familiar with this part of the code, so forgive me if this=
 is<br>
&gt; wrong but... is your sentence finished?<br>
&gt; <br>
&gt; You are building in a path under PSEUDO_IGNORE_PATHS, please remove th=
is &lt;dir&gt; directory in<br>
&gt; Parsed WORKDIR: &lt;workdir&gt;<br>
&gt; <br>
&gt; That is to me not very telling about what I should do to fix this issu=
e.<br>
&gt; <br>
&gt; I honestly might be missing a lot of context on the issue so wouldn&#3=
9;t be<br>
&gt; surprised if the issue is with me not understanding the sentence more<=
br>
&gt; than the sentence being &quot;unfinished&quot;.<br>
<br>
No, I don&#39;t think you are wrong. I do not understand it either.<br>
<br>
&gt; Thanks,<br>
&gt; Quentin<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--000000000000382aee05b9c169e4--
