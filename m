Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F48C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 17:38:49 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.9151.1635010728162969019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=alc6oFBv;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id f4so13803562uad.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uAN91E2Z7LqasypX2na0Kf/ZVDm3nq7UGr6vH99jLg0=;
        b=alc6oFBvZEECq+BJEmDbiQqEGou1iXE+ZejGnHkZGPzJn/EALCnL4KtxpfeL7HKBOj
         h7gApxkEgWkroxtvAe4g1zBGE+PHzj00gac7Mr4wK1zcocvaJUuw/6sohbs2qu6ryPES
         yY5QLiy8eUYMpNWT1mJ5XojeAVoIFcIH7CP+On0IR7oJxpWaP8xQuffeS9zVbS5h2CfI
         GBxhEMgxYxTnVQiQNWiDF96589JIYLBuh1/LqFvVQzsLioHNwkVqzjZWuoZxyCfV4t1+
         GLxYhz6othLQhpdS2Qp01u6ylZJTY8gbLuoU3cQIQqL2p41p3241ufN1Zd+48nD9pKLi
         WJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uAN91E2Z7LqasypX2na0Kf/ZVDm3nq7UGr6vH99jLg0=;
        b=SJA4RPsKhrj7/02TiQkmndKUvsquBaFNu0GaYFWUjxEauDRIhJhtrkfWkoM5NoEXOt
         cIAvjySi29BiYORcsQP0CzhTK1TR6dTSUuGQgwxpXlB9hAqSKQOIRgTCyH4YNunW722r
         +uw+DGGxlTqi55zz7EdIofgTDuyaaggGoyCEttM86jAcg2Q27Hb9D/Hc6veIu+QbDTpo
         4n8uujojkfy3LdVsa8UoXFIViFptbgQtng2jAn8VCiHEMK1K3BTnJehnAJrDsxQGl+Au
         PFsR86UN+D4do/sRQcNDhv3AKh7tFrPyNE6p4Oa4fqfCp7I9M+wGqg4rORcpNa/XNtmU
         KYHg==
X-Gm-Message-State: AOAM531VAs2lK8i00Y++9J1PJBZbA/gEyfntw5bZvm7ZvDOD5uv2jenX
	I/Ef7U1OJUNgUcYXbzRbS6W09kiPd9RFmXNwaXs=
X-Google-Smtp-Source: 
 ABdhPJx67ccdZr98YQKm54Pj7M5OtVulufWvLb6f4x9Os6tL6u6yTEGbXXilgiEupT139iuROZqvMJhpRVFD7O939Xg=
X-Received: by 2002:a05:6102:954:: with SMTP id
 a20mr7100142vsi.40.1635010727371;
 Sat, 23 Oct 2021 10:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-26-alex@linutronix.de>
 <968cbfa1-7d80-11d2-d6ab-e050ea855799@gmail.com>
In-Reply-To: <968cbfa1-7d80-11d2-d6ab-e050ea855799@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 19:38:36 +0200
Message-ID: 
 <CANNYZj8D2kgjU=LzbpY6simn3cRM0-j4UOM68iDB526robueLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/65] psplash: upgrade to latest revision
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009be81905cf089962"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 17:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157304

--0000000000009be81905cf089962
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Oct 2021 at 18:44, Khem Raj <raj.khem@gmail.com> wrote:

> > -SRCREV = "0a902f7cd875ccf018456451be369f05fa55f962"
> > +SRCREV = "f5203fdee61b90ef9552ca49c213fe16776b3e4b"
> >   PV = "0.1+git${SRCPV}"
> > -PR = "r15"
> >
>
> Since PV is not bumped. Resetting PR will break feeds
>

${SRCPV} ensures it won't, I think?

Alex

--0000000000009be81905cf089962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 18:44, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; -SRCREV =3D &quot;0a902f7cd875ccf0184=
56451be369f05fa55f962&quot;<br>
&gt; +SRCREV =3D &quot;f5203fdee61b90ef9552ca49c213fe16776b3e4b&quot;<br>
&gt;=C2=A0 =C2=A0PV =3D &quot;0.1+git${SRCPV}&quot;<br>
&gt; -PR =3D &quot;r15&quot;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Since PV is not bumped. Resetting PR will break feeds<br></blockquote><div>=
<br></div>${SRCPV} ensures it won&#39;t, I think?</div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000009be81905cf089962--

