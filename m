Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.9643.1598954733980394940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 03:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=E7zvFNfW;
 spf=pass (domain: linaro.org, ip: 209.85.166.68, mailfrom: ryan.harkin@linaro.org)
Received: by mail-io1-f68.google.com with SMTP id z25so575546iol.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xm9Masm0YeMTVwQl9bkV5b/40AXypQ/oWq61nRA9RwE=;
        b=E7zvFNfWftu6AV+PMysyObLGWYL/2589RTESRKYIPWstivD66ar7RyA01cH8GCmb4j
         c4JUP7k5lasH5giCl7M1nwEq/SWbDOl52k/7Ch+ZLn7M7N16T5GNDqHVO38ukYgx2ucX
         8Ajk+vKW/qrF/xAnwKfRW8zo+juL+ZtISktKVlvROz/rReXRNwxSgHi2SGXefNyMceRl
         a+qqeCuaa8c8Rk7uyhf0YqMKpf10I57EdmXDFYw4KP01gOgQzb7nuz7/pv09ZjBcXekr
         1SflNTCYrDyBeXbSLMV1FPsGtYvF+Y/DAOATbOUYnsZCb/fq4u8x3ba4lU8HK6F1vPfF
         4Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xm9Masm0YeMTVwQl9bkV5b/40AXypQ/oWq61nRA9RwE=;
        b=Lz9AjbTU+eXIIBKBWQbP7Pxd0hjfB2QtFABdP0DQSWif7opNc3I/bq4REhb4RaRbvw
         5ipqNeDDzpQOE5XOD3u2OBkcnvop4yhzftWz0+2yLpgCpWq7WNCwArqEs/kA6ynmB2gw
         Pl0ifVKhr75wxjVY7KAq5nV2S0o9vEX/uTB/5WPWBDpe5B2cAgsHPAmbPnJTZIHyf82k
         QXwLhMIwtIKih8qEP1anVwzFb2Yu+5iLwEiXg3htkIU80wm5r+EoD2n/uMCGpUC3YoQo
         ofJhlH3LRpRrmN/3x7pTdYzwwAFvkvPteCzqUKLPFHA+hK6w+KuvcH6kwFeICCRApjRR
         ESCA==
X-Gm-Message-State: AOAM532SQAoV55kGfrRwCQUkp2A7UOQM70WcnMlZExa7Urof7kQBn5rA
	QON8cs+LY1TrawCnYsDLagOKRqAjGpG2w25ICWi9Kw==
X-Google-Smtp-Source: ABdhPJww706Gy1IO8gDEIGKVyfimCgbYMR9H1lP3nc1E/0I68iN6RHO6J1PeT229ZdbNsM91qV2gIgALu9hoDZiOQqI=
X-Received: by 2002:a6b:8dcc:: with SMTP id p195mr796017iod.39.1598954733194;
 Tue, 01 Sep 2020 03:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <162552C22941F232.11956@lists.openembedded.org>
 <AM7PR05MB68819E7C05243F00A918121DA8720@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CAD0U-hJ00kreMdgpj0s_geoFkWZcnukdCxHCTxpVpXp_a5G7+w@mail.gmail.com> <AM7PR05MB688103857C9DE2DA59A0B38BA8500@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB688103857C9DE2DA59A0B38BA8500@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Tue, 1 Sep 2020 11:05:22 +0100
Message-ID: <CAD0U-hJ9DQsdNJ0Q_9m64BcsesM=jA-W46MxquHwM8=x6UABbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-update: handle baseMetricV2 as optional
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, akuster808@gmail.com
Content-Type: multipart/alternative; boundary="000000000000e2697f05ae3da82d"

--000000000000e2697f05ae3da82d
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Aug 2020 at 17:27, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Again this breaks builds for me - please backport the patch to warrior -
>

Pretty please? ;-)
My Warrior builds are broken again. They only started working again because
someone fixed the database, rather than the patch being backported.


> or ping me, then I do the backporting
>
> Cheers
> Konrad
>
> On 28.07.20 17:02, Ryan Harkin wrote:
> >
> >
> > On Mon, 27 Jul 2020 at 19:26, Konrad Weihmann <kweihmann@outlook.com
> > <mailto:kweihmann@outlook.com>> wrote:
> >
> >     Hi all,
> >
> >     please consider this patch to be backported to dunfell/zeus and
> warrior.
> >
> >
> > I'll second that request. My Warrior and Dunfell builds broke last week
> > because of this.
> >
> >     Master-rev: bbefe04a622e166d95093d5127c316de91b27d20
> >
> >
> > Thanks for the fix, Konrad.
> >
> >
> >     Thanks
> >     Konrad
> >
> >     On 26.07.20 16:10, Konrad Weihmann wrote:
> >      > Currently in NVD DB an item popped up, which hasn't set
> baseMetricV2.
> >      > Let the parser handle it as an optional item.
> >      > In case use baseMetricV2 before baseMetricV3
> >      >
> >      > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
> >     <mailto:kweihmann@outlook.com>>
> >      > ---
> >      >   meta/recipes-core/meta/cve-update-db-native.bb
> >     <http://cve-update-db-native.bb> | 13 +++++++++----
> >      >   1 file changed, 9 insertions(+), 4 deletions(-)
> >      >
> >      > diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> >     <http://cve-update-db-native.bb>
> >     b/meta/recipes-core/meta/cve-update-db-native.bb
> >     <http://cve-update-db-native.bb>
> >      > index f27ade40db..32d6dbdffc 100644
> >      > --- a/meta/recipes-core/meta/cve-update-db-native.bb
> >     <http://cve-update-db-native.bb>
> >      > +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> >     <http://cve-update-db-native.bb>
> >      > @@ -176,15 +176,20 @@ def update_db(c, jsondata):
> >      >           if not elt['impact']:
> >      >               continue
> >      >
> >      > +        accessVector = None
> >      >           cveId = elt['cve']['CVE_data_meta']['ID']
> >      >           cveDesc =
> >     elt['cve']['description']['description_data'][0]['value']
> >      >           date = elt['lastModifiedDate']
> >      > -        accessVector =
> >     elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> >      > -        cvssv2 =
> >     elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> >      > -
> >      >           try:
> >      > +            accessVector =
> >     elt['impact']['baseMetricV2']['cvssV2']['accessVector']
> >      > +            cvssv2 =
> >     elt['impact']['baseMetricV2']['cvssV2']['baseScore']
> >      > +        except KeyError:
> >      > +            cvssv2 = 0.0
> >      > +        try:
> >      > +            accessVector = accessVector or
> >     elt['impact']['baseMetricV3']['cvssV3']['attackVector']
> >      >               cvssv3 =
> >     elt['impact']['baseMetricV3']['cvssV3']['baseScore']
> >      > -        except:
> >      > +        except KeyError:
> >      > +            accessVector = accessVector or "UNKNOWN"
> >      >               cvssv3 = 0.0
> >      >
> >      >           c.execute("insert or replace into NVD values (?, ?, ?,
> >     ?, ?, ?)",
> >      >
> >      >
> >      >
> >      >
> >     
> >
>

--000000000000e2697f05ae3da82d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 30 Aug 2020 at 17:27, Konrad =
Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Again this breaks builds for me - please backport the patch to warrior - <b=
r></blockquote><div><br></div><div>Pretty please? ;-)</div><div>My Warrior =
builds are broken again. They only started working again because someone fi=
xed the database, rather than the patch being backported.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
or ping me, then I do the backporting<br>
<br>
Cheers<br>
Konrad<br>
<br>
On 28.07.20 17:02, Ryan Harkin wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, 27 Jul 2020 at 19:26, Konrad Weihmann &lt;<a href=3D"mailto:k=
weihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank"=
>kweihmann@outlook.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi all,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0please consider this patch to be backported to dun=
fell/zeus and warrior.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;ll second that request. My Warrior and Dunfell builds broke las=
t week <br>
&gt; because of this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Master-rev: bbefe04a622e166d95093d5127c316de91b27d=
20<br>
&gt; <br>
&gt; <br>
&gt; Thanks for the fix, Konrad.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0Konrad<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 26.07.20 16:10, Konrad Weihmann wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Currently in NVD DB an item popped up, which=
 hasn&#39;t set baseMetricV2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Let the parser handle it as an optional item=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; In case use baseMetricV2 before baseMetricV3=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Konrad Weihmann &lt;<a href=
=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/recipes-core/meta/<a href=
=3D"http://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">c=
ve-update-db-native.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">http://cve-update-db-native.bb</a>&gt; |=
 13 +++++++++----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 9 insertions(+),=
 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/meta/recipes-core/meta/<a href=
=3D"http://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">c=
ve-update-db-native.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">http://cve-update-db-native.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-core/meta/<a href=3D"http://cve-upd=
ate-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">http://cve-update-db-native.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index f27ade40db..32d6dbdffc 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-core/meta/<a href=3D"http=
://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update=
-db-native.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">http://cve-update-db-native.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-core/meta/<a href=3D"http=
://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update=
-db-native.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cve-update-db-native.bb" rel=
=
=3D"noreferrer" target=3D"_blank">http://cve-update-db-native.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -176,15 +176,20 @@ def update_db(c, jsond=
ata):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if n=
ot elt[&#39;impact&#39;]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =
=3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveI=
d =3D elt[&#39;cve&#39;][&#39;CVE_data_meta&#39;][&#39;ID&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveD=
esc =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;cve&#39;][&#39;description&#39;][&#39;des=
cription_data&#39;][0][&#39;value&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0date=
 =3D elt[&#39;lastModifiedDate&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV2&#39;][&#39=
;cvssV2&#39;][&#39;accessVector&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV2&#39;][&#39=
;cvssV2&#39;][&#39;baseScore&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
ccessVector =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV2&#39;][&#39=
;cvssV2&#39;][&#39;accessVector&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
vssv2 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV2&#39;][&#39=
;cvssV2&#39;][&#39;baseScore&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
vssv2 =3D 0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
ccessVector =3D accessVector or<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39=
;cvssV3&#39;][&#39;attackVector&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0cvssv3 =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0elt[&#39;impact&#39;][&#39;baseMetricV3&#39;][&#39=
;cvssV3&#39;][&#39;baseScore&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
ccessVector =3D accessVector or &quot;UNKNOWN&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0cvssv3 =3D 0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.ex=
ecute(&quot;insert or replace into NVD values (?, ?, ?,<br>
&gt;=C2=A0 =C2=A0 =C2=A0?, ?, ?)&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div></div>

--000000000000e2697f05ae3da82d--
