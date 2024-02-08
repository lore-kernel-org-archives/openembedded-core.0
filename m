Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC548C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 17:06:30 +0000 (UTC)
Received: from 14.mo584.mail-out.ovh.net (14.mo584.mail-out.ovh.net [46.105.40.29])
 by mx.groups.io with SMTP id smtpd.web11.113.1707411989463542717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 09:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.40.29, mailfrom: jonathan@joggee.fr)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.139.212])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TW3Kv0NgXz1G1w
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Feb 2024 17:06:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-b45nn (unknown [10.110.113.233])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 60BE71FEA6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Feb 2024 17:06:26 +0000 (UTC)
Received: from joggee.fr ([37.59.142.103])
	by ghost-submission-6684bf9d7b-b45nn with ESMTPSA
	id 8fJtCBIKxWXuIwEAPALM2A
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 17:06:26 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-103G005b71511f7-71ae-4957-bb5c-f757c4767f9b,
                    EE0538694EAB3E5EC1512EDE8FC760BCBA2B9C5C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.161.45
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-59a1a03d067so13525eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 09:06:26 -0800 (PST)
X-Gm-Message-State: AOJu0YzzHtnqBt/tE3sOIYzpKaXOcUqQyaX5fKzj7meHLUHB7Mpi+O1T
	dcml8IhRnY3gZtrJZoaSgY/u7qYSYbjVkeUr4EILloPaZZoxTkw84koUfF2E2UH3BTjAsUlw+RX
	O0W6sT5KG5wANioRXwMs2BkGfVM0=
X-Google-Smtp-Source: AGHT+IHqfkhxnrgD9jhLQsa47wXYqiXx0gpAU8NCgj9By2/fy0xQdvoRrsPAJW5REJ4P2Qwh+EMtXE9w5l15lnaWiic=
X-Received: by 2002:a4a:351e:0:b0:599:f42b:9f5d with SMTP id
 l30-20020a4a351e000000b00599f42b9f5dmr202727ooa.2.1707411984731; Thu, 08 Feb
 2024 09:06:24 -0800 (PST)
MIME-Version: 1.0
References: <CY5ZELISRCAC.YYJ5RA7Q61I0@joggee.fr> <C0719697-FF31-4FE8-A5A6-7F9BD56A96A3@arm.com>
In-Reply-To: <C0719697-FF31-4FE8-A5A6-7F9BD56A96A3@arm.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Thu, 8 Feb 2024 18:06:05 +0100
X-Gmail-Original-Message-ID: <CAA_hxbTeFg6rCW-q_PDaeiHt+QgCGexhEXG1D4oKzK9G-H1PrQ@mail.gmail.com>
Message-ID: <CAA_hxbTeFg6rCW-q_PDaeiHt+QgCGexhEXG1D4oKzK9G-H1PrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/3] lib/oe/package: add LOCALE_EXTRA_PATHS
 to add extra locations for locales
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5d4e80610e1d4c4"
X-Ovh-Tracer-Id: 725642491420150907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrtdeggdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfevtgesrgdtreertddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeetfeejvddvtdetudejhefftdelgeejgfffueeuheeijeeuheffudduieehfeehtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvtdelrdekhedrudeiuddrgeehpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 17:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195162

--000000000000d5d4e80610e1d4c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Thanks for your suggestions. I gave it a try and the code is indeed
cleaner. I will send new patches soon.

Regards,
Jonathan GUILLOT

Le ven. 26 janv. 2024 =C3=A0 18:13, Ross Burton <Ross.Burton@arm.com> a =C3=
=A9crit :

> I like the idea of this patch (hardcoding behaviour is bad), but I think
> it could be generalised some more.
>
> > On 6 Dec 2023, at 16:03, Jonathan GUILLOT via lists.openembedded.org
> <jonathan=3Djoggee.fr@lists.openembedded.org> wrote:
> > -    localedir =3D os.path.join(dvar + datadir, 'locale')
> > +    localedirs =3D [os.path.join(dvar + datadir, 'locale')]
> >
> > -    if not cpath.isdir(localedir):
> > +    for localedir in (d.getVar('LOCALE_EXTRA_PATHS') or "").split():
> > +        localedirs.append(dvar + localedir)
>
> Instead of hardcoding ${datadir}/locale and then working on
> LOCALE_EXTRA_PATHS, how about adding a new variable (LOCALE_PATHS?) which
> is set to ${datadir}/locale by default, and the population code just work=
s
> on that.  The cups recipe can then LOCALE_PATHS +=3D
> "${datadir}/cups/templates/=E2=80=9C to add in its own files.
>
> Cheers
> Ross
>
>

--000000000000d5d4e80610e1d4c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross,</div><div><br></div><div>Thanks for your sug=
gestions. I gave it a try and the code is indeed cleaner. I will send new p=
atches soon.</div><div><br></div><div>Regards,</div><div>Jonathan GUILLOT<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Le=C2=A0ven. 26 janv. 2024 =C3=A0=C2=A018:13, Ross Burton &lt;<a hr=
ef=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I like t=
he idea of this patch (hardcoding behaviour is bad), but I think it could b=
e generalised some more.<br>
<br>
&gt; On 6 Dec 2023, at 16:03, Jonathan GUILLOT via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;jonathan=3D<a href=3D"mailto:joggee.fr@lists.openembedded.org" t=
arget=3D"_blank">joggee.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; -=C2=A0 =C2=A0 localedir =3D os.path.join(dvar + datadir, &#39;locale&=
#39;)<br>
&gt; +=C2=A0 =C2=A0 localedirs =3D [os.path.join(dvar + datadir, &#39;local=
e&#39;)]<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 if not cpath.isdir(localedir):<br>
&gt; +=C2=A0 =C2=A0 for localedir in (d.getVar(&#39;LOCALE_EXTRA_PATHS&#39;=
) or &quot;&quot;).split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 localedirs.append(dvar + localedir)<br>
<br>
Instead of hardcoding ${datadir}/locale and then working on LOCALE_EXTRA_PA=
THS, how about adding a new variable (LOCALE_PATHS?) which is set to ${data=
dir}/locale by default, and the population code just works on that.=C2=A0 T=
he cups recipe can then LOCALE_PATHS +=3D &quot;${datadir}/cups/templates/=
=E2=80=9C to add in its own files.<br>
<br>
Cheers<br>
Ross<br>
<br>
</blockquote></div>

--000000000000d5d4e80610e1d4c4--

