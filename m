Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFCDC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 10:00:40 +0000 (UTC)
Received: from 3.mo581.mail-out.ovh.net (3.mo581.mail-out.ovh.net [46.105.34.113])
 by mx.groups.io with SMTP id smtpd.web11.38412.1708336829738059995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 46.105.34.113, mailfrom: jonathan@joggee.fr)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.2.160])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TddMH4jHSz14t3
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 10:00:27 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zcjpp (unknown [10.110.113.175])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DDBE01FEB3
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 10:00:26 +0000 (UTC)
Received: from joggee.fr ([37.59.142.107])
	by ghost-submission-6684bf9d7b-zcjpp with ESMTPSA
	id cU+kILom02WcQAAA/UWf/Q
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 10:00:26 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-107S0019775761b-f7d1-4d7e-8547-55b7ef898f32,
                    FBBA307669F78C5F9D8AF8442BE79D01AA2F721C) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.161.44
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-59927972125so2746276eaf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:00:26 -0800 (PST)
X-Gm-Message-State: AOJu0YyD9ziyZVFn8yXXbjI4pksVeMk/7MW8BMoQDC2nyksewzH7sbha
	8C+jTJ9m8oZv4XtFIekcgQExEtpacZUKQOLazoX+0L+IJFq8BR7B0d4C2rnYUdjT00GwRLJ82YC
	bvLrzU+N4b+EstiuSjZJ9qyazAOM=
X-Google-Smtp-Source: AGHT+IHz36M5MYoeB3ANrAE+FOOvD5XN7YMtXD2LmYXYo5DB3hlafJYdV0EPDuKcJ3IOyaKKzRuTVYQdD6Jj1cV8r04=
X-Received: by 2002:a4a:920e:0:b0:59d:8486:3a7e with SMTP id
 f14-20020a4a920e000000b0059d84863a7emr11831810ooh.1.1708336825150; Mon, 19
 Feb 2024 02:00:25 -0800 (PST)
MIME-Version: 1.0
References: <CZ36N8IH1TRF.3LXKZ2C2DTGIN@joggee.fr> <29D5757B-A2B2-4131-B0F7-84210DA0452A@arm.com>
In-Reply-To: <29D5757B-A2B2-4131-B0F7-84210DA0452A@arm.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Mon, 19 Feb 2024 11:00:02 +0100
X-Gmail-Original-Message-ID: <CAA_hxbS6hEY-QtBc7-2JOndevZfiLp3Ww4EoGFxUQDhsDfjBOg@mail.gmail.com>
Message-ID: <CAA_hxbS6hEY-QtBc7-2JOndevZfiLp3Ww4EoGFxUQDhsDfjBOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/3] cups: use LOCALE_PATHS to split
 localized HTML templates
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009eb22d0611b92999"
X-Ovh-Tracer-Id: 2790824398095387771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfevtgesrgdtreertddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeetfeejvddvtdetudejhefftdelgeejgfffueeuheeijeeuheffudduieehfeehtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvtdelrdekhedrudeiuddrgeegpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhesjhhoghhgvggvrdhfrhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 10:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195868

--0000000000009eb22d0611b92999
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ross,

I was too focus on English and French packages and missed this point.
Listing all items in CUPS added locale path is not OK. I should at least
only get directories (not files) in this path to create the locale list.
However, it remains an issue if some directories in the path would not be
dedicated to locales. This is not the point in CUPS but could be in an
other recipe. Do you think it is possible to determine if the directory
name is a valid language code? Is it reliable to consider locale
directories will always be : 2-letter ISO 639 code followed by optional
hyphen and ISO 3166 country code?

Regards,
Jonathan GUILLOT

Le jeu. 15 f=C3=A9vr. 2024 =C3=A0 17:27, Ross Burton <Ross.Burton@arm.com> =
a =C3=A9crit :

> On 6 Dec 2023, at 16:06, Jonathan GUILLOT via lists.openembedded.org
> <jonathan=3Djoggee.fr@lists.openembedded.org> wrote:
> > +LOCALE_PATHS +=3D "${datadir}/cups/templates=E2=80=9D
>
> This doesn=E2=80=99t quite do what you expect. Listing the packages gener=
ated by
> cups I see:
>
> cups-locale-da:
>         /usr/share/cups/templates/da/add-class.tmpl
>         /usr/share/cups/templates/da/add-printer.tmpl
>         /usr/share/cups/templates/da/admin.tmpl
>
> Which is good.   But I also see:
>
> cups-locale-add-class.tmpl:
>         /usr/share/cups/templates/add-class.tmpl
> cups-locale-add-printer.tmpl:
>         /usr/share/cups/templates/add-printer.tmpl
> cups-locale-admin.tmpl:
>         /usr/share/cups/templates/admin.tmpl
>
> That doesn=E2=80=99t look right!
>
> Ross

--0000000000009eb22d0611b92999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Ross,</div><div><br></div><div>I was too focus=
 on English and French packages and missed this point. Listing all items in=
 CUPS added locale path is not OK. I should at least only
get

 directories (not files) in this path to create the locale list. However, i=
t remains an issue if some directories in the path would not be dedicated t=
o locales. This is not the point in CUPS but could be in an other recipe. D=
o you think it is possible to determine if the directory name is a valid la=
nguage code? Is it reliable to consider locale directories will always be :=
 2-letter ISO 639 code followed by optional hyphen and ISO 3166 country cod=
e?</div><div><br></div><div>Regards,</div><div>Jonathan GUILLOT<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0jeu. 15 f=C3=A9vr. 2024 =C3=A0=C2=A017:27, Ross Burton &lt;<a href=3D=
"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6 Dec 2023,=
 at 16:06, Jonathan GUILLOT via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;jonathan=
=3D<a href=3D"mailto:joggee.fr@lists.openembedded.org" target=3D"_blank">jo=
ggee.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt; +LOCALE_PATHS +=3D &quot;${datadir}/cups/templates=E2=80=9D<br>
<br>
This doesn=E2=80=99t quite do what you expect. Listing the packages generat=
ed by cups I see:<br>
<br>
cups-locale-da:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/da/add-class.tmpl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/da/add-printer.tmpl<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/da/admin.tmpl<br>
<br>
Which is good.=C2=A0 =C2=A0But I also see:<br>
<br>
cups-locale-add-class.tmpl:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/add-class.tmpl<br>
cups-locale-add-printer.tmpl:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/add-printer.tmpl<br>
cups-locale-admin.tmpl:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/share/cups/templates/admin.tmpl<br>
<br>
That doesn=E2=80=99t look right!<br>
<br>
Ross</blockquote></div>

--0000000000009eb22d0611b92999--

