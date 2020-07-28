Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.14320.1595948544004626615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 08:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TGMLlOcs;
 spf=pass (domain: linaro.org, ip: 209.85.219.66, mailfrom: ryan.harkin@linaro.org)
Received: by mail-qv1-f66.google.com with SMTP id dm12so9230410qvb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+Wj7bxHF4z8Uu9lyGk6JOkEa81quklX9cRpoZoCISg=;
        b=TGMLlOcsegmVs6qIRal3GYkd5KMa64ipRKlAseXLAlKfOlR3AtVplybP7JIb9glmnG
         ALp59x8yxsbCVw+YGS0wzPMiXYzFqwrwWfc+wIbmuxRkp86z0d12teyQk0Er1M3fmm1u
         J1F6ZwWvp+OsnLGapYv7kjdzhCHNrSQobAiQVsGpY6BBSOJTEXy/ZVjAwyMy53ZqZMmi
         AlHksLBgcCFx3jPDezaSm/oaplA0ycVVG4X7BNQTiv/40xmVbUIYfASqfvMaZ97+ZHNk
         xr5P6m63Ng6UzOzegGXodDfVa53jfprw9UtI63pCfz47ZODXUs1ErlEa7Rfk9DHUvhB1
         lLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+Wj7bxHF4z8Uu9lyGk6JOkEa81quklX9cRpoZoCISg=;
        b=AZkmw6h+LEHxWrtlMak1y3oX4k/LH7Rb2vXyu8rkegyYrUlsRBmlVR7JGpnyjdaDrE
         a2ZNFEJ0Vs660YzZIl7I/7KlFuYCbihwSFhNZ+pyQReFszUsdS+X/K0UygXB0GO3hh8C
         nzt4PRExYyLfZJOUznYnFFXC7z8hEUq6zKJNO5SkxWKbqf+hdMnpNMUW7biCOImqwLww
         oEbM0wMQi30Hj9/lR/mqWWrWoWS1tjN6z6/dAe1ckMbM5dwz0m4c2YqxbQt5YAbGWx1I
         7paj+rMynK5jBiU9eMNB4vZqPUJBEU7RAuCKZp6J11ACr5A1+Z/nIV+XSvxRRnef/EAE
         aD2g==
X-Gm-Message-State: AOAM533KrVao12hocBaQ58J6pRHzI6PACWR8vyl2rI2xiVw1UVrba6rL
	nncDtY2Okyi7a98YWqkI2ORolPpxyVpsW/JcAnbYMw==
X-Google-Smtp-Source: ABdhPJwiH1nwaaxG5RoA/XfgOfGHIAiRLzrvyoFQRVO3jAEHGWzN2+eHjQcZJC121X5Hfk6N0+P1Ras9hgu9bqAIOLQ=
X-Received: by 2002:a0c:b45b:: with SMTP id e27mr16560104qvf.208.1595948543070;
 Tue, 28 Jul 2020 08:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <162552C22941F232.11956@lists.openembedded.org> <AM7PR05MB68819E7C05243F00A918121DA8720@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68819E7C05243F00A918121DA8720@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Tue, 28 Jul 2020 16:02:11 +0100
Message-ID: <CAD0U-hJ00kreMdgpj0s_geoFkWZcnukdCxHCTxpVpXp_a5G7+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-update: handle baseMetricV2 as optional
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, akuster808@gmail.com, 
	Steve Sakoman <steve@sakoman.com>, anuj.mittal@intel.com
Content-Type: multipart/alternative; boundary="000000000000fd705805ab81b905"

--000000000000fd705805ab81b905
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jul 2020 at 19:26, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Hi all,
>
> please consider this patch to be backported to dunfell/zeus and warrior.
>

I'll second that request. My Warrior and Dunfell builds broke last week
because of this.


> Master-rev: bbefe04a622e166d95093d5127c316de91b27d20
>

Thanks for the fix, Konrad.


>
> Thanks
> Konrad
>
> On 26.07.20 16:10, Konrad Weihmann wrote:
> > Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
> > Let the parser handle it as an optional item.
> > In case use baseMetricV2 before baseMetricV3
> >
> > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > ---
> >   meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-core/meta/cve-update-db-native.bb
> > index f27ade40db..32d6dbdffc 100644
> > --- a/meta/recipes-core/meta/cve-update-db-native.bb
> > +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> > @@ -176,15 +176,20 @@ def update_db(c, jsondata):
> >           if not elt['impact']:
> >               continue
> >
> > +        accessVector = None
> >           cveId = elt['cve']['CVE_data_meta']['ID']
> >           cveDesc =
> elt['cve']['description']['description_data'][0]['value']
> >           date = elt['lastModifiedDate']
> > -        accessVector =
> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> > -        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> > -
> >           try:
> > +            accessVector =
> elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> > +            cvssv2 =
> elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> > +        except KeyError:
> > +            cvssv2 = 0.0
> > +        try:
> > +            accessVector = accessVector or
> elt['impact']['baseMetricV3']['cvssV3']['attackVector']
> >               cvssv3 =
> elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> > -        except:
> > +        except KeyError:
> > +            accessVector = accessVector or "UNKNOWN"
> >               cvssv3 = 0.0
> >
> >           c.execute("insert or replace into NVD values (?, ?, ?, ?, ?,
> ?)",
> >
> >
> >
> >
> 
>

--000000000000fd705805ab81b905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Jul 2020 at 19:26, Konrad =
Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi all,<br>
<br>
please consider this patch to be backported to dunfell/zeus and warrior.<b=
r></blockquote><div><br></div><div>I&#39;ll second that request. My Warrior=
 and Dunfell builds broke last week because of this.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Master-rev: bbefe04a622e166d95093d5127c316de91b27d20<br></blockquote><div>=
<br></div><div>Thanks for the fix, Konrad.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Thanks<br>
Konrad<br>
<br>
On 26.07.20 16:10, Konrad Weihmann wrote:<br>
&gt; Currently in NVD DB an item popped up, which hasn&#39;t set baseMetri=
cV2.<br>
&gt; Let the parser handle it as an optional item.<br>
&gt; In case use baseMetricV2 before baseMetricV3<br>
&gt; <br>
&gt; Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outloo=
k.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-db-na=
tive.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> |=
 13 +++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-n=
ative.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> =
b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt; index f27ade40db..32d6dbdffc 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.b=
b" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.b=
b" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
&gt; @@ -176,15 +176,20 @@ def update_db(c, jsondata):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not elt[&#39;impact&#39;]:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveId =3D elt[&#39;cve&#39;][=
&#39;CVE_data_meta&#39;][&#39;ID&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveDesc =3D elt[&#39;cve&#39;=
][&#39;description&#39;][&#39;description_data&#39;][0][&#39;value&#39;]<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0date =3D elt[&#39;lastModifie=
dDate&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;impact&#39;][&=
#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;accessVector&#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D elt[&#39;impact&#39;][&#39;ba=
seMetricV2&#39;][&#39;cvssV2&#39;][&#39;baseScore&#39;]<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;=
impact&#39;][&#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;accessVector&#3=
9;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D elt[&#39;impact=
&#39;][&#39;baseMetricV2&#39;][&#39;cvssV2&#39;][&#39;baseScore&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D 0.0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVec=
tor or elt[&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#39=
;attackVector&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D elt[=
&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39;cvssV3&#39;][&#39;baseScore&=
#39;]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVec=
tor or &quot;UNKNOWN&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D 0.0<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.execute(&quot;insert or rep=
lace into NVD values (?, ?, ?, ?, ?, ?)&quot;,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000fd705805ab81b905--
