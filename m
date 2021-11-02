Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C42C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 21:05:39 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.1480.1635887138843032468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 14:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHTpOK4T;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id y73so319233iof.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeSLJWuhLMvfcaoaglTVZj0bPtFenPRaHe94UtHUTvI=;
        b=mHTpOK4TOt1fquZWtRb25WKgihjKg3g8aflAtUp9wFLnkgevAkge1liOMe3n1SpZj2
         OO5D68Khn0gd4/ChZUa3HtHBde+olMiZL6QdtDYwxja0dwPPedeMu/ojXIk+7gRaj4oa
         IxUCzHMI50V4bKFU8YMct+IV0MzqOq+20xSZzC7Y2lGZQjBmQCUYOW8bdgKVgb/RU62W
         RMLT9vwjkh0KiiidteNMjtrRqo5EeKt3dYhYs/velvDm8SKQB0Ts/d4WAWlp3RCXjiqU
         dQFgexHVmdOnpcJZBb6+jyHift0fqsbdNwZlNixRye4fHzVKvHLkge2OM/DMt/oibXs0
         M5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeSLJWuhLMvfcaoaglTVZj0bPtFenPRaHe94UtHUTvI=;
        b=LOVMAJ1Oq39DH3zcJkXCiLmTN0IzsrIW5FKuOroJK8DOdB+vRUGHgRRwvzdSCev03J
         zLSh18loCVJwp69wVSs7j2izPTcJbwcQHVYBUnGEgDiJzs23RVyWiIRu3hFbYTCwu576
         aIdvKxs0A5w0by2xro0sovA/69VeMJt0lF4dcG3VfNh0yFgoeGQKeMqhUli32TX4kzef
         FxhQlkNibFetumvz7lWKGx8tmSJLg9QbnQR7Cfc9Cmv648iNJQa0ZDvvlgWdKkD3a7qx
         63ERbdRyLO/FYzWly7PxndY8/HjT5DoOSv0dbtKZNZCisSZLDOhgy4i94mfyl7MtzcMO
         HOYA==
X-Gm-Message-State: AOAM530bdl8QGlttwCMqoQaMd7DG3yN1H9CvJ+UTeag+rtyXM9ZT62lQ
	3HV3YbJsG7dwM830kZNT35sm1kiPyEZL+CCeipM=
X-Google-Smtp-Source: 
 ABdhPJyq3B6VAi1Y8xYvxQfpWbnx3ULO7CyR2RNq0FZ5Ulp1UYak/P/gkpsY2YA59lBGDE6ZBJA5AeWy2rPo/TS4AtU=
X-Received: by 2002:a05:6602:18e:: with SMTP id
 m14mr305659ioo.126.1635887138142;
 Tue, 02 Nov 2021 14:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211102180233.4104293-1-ross.burton@arm.com>
 <CAMKF1spVJSF9tpjK5nz7WYVB_XXEjXvuXARvXnpTKjOa4S-Brg@mail.gmail.com>
 <CAAnfSTs3mb+KxE+LbMR3Jj-HdKPXQFro0YCx=15vXzPAiVG6XQ@mail.gmail.com>
 <CAMKF1soAqszOxP5q_FsjTWpcgr1G-8gYCUWC1cAdHx_++3m3pw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soAqszOxP5q_FsjTWpcgr1G-8gYCUWC1cAdHx_++3m3pw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 2 Nov 2021 14:05:27 -0700
Message-ID: 
 <CANx9H-B9G851bi-XVM1NouK-UawPPDDNu31NFZcNP3BfOetWGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: silence DeprecationWarnings in
 python3-config
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000c2fcfa05cfd4a7d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 21:05:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157816

--000000000000c2fcfa05cfd4a7d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2021 at 1:12 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Nov 2, 2021 at 1:06 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > On Tue, 2 Nov 2021 at 18:06, Khem Raj <raj.khem@gmail.com> wrote:
> > > So shouldn=E2=80=99t we fix python3-config to not use distutils and s=
witch to
> setup tools instead ?
> > >
> > > I am afraid that masking the warning will come biting soon when this
> is turned into a hard error
> >
> > That is a much bigger question that needs to be done, but most likely
> > involves rewriting large chunks of the cross integration as from what
> > I can tell, setuptools doesn't expose sysconfig (and we patch
> > distutils.sysconfig).
> >
> > We can continue hacking the hack, until we solve this properly.  This
> > may happen as part of the pyo3 rust/python problem.
>
> I guess, this patch is fine for what it is solving for now, I was
> hopeful that converting to not use
> distutils would be easy :)
>

The distutils.sysconfig.get_python_inc(plat_specific=3DTrue) call has no
replacement. It will have to be rewritten.


> >
> > Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157815):
> https://lists.openembedded.org/g/openembedded-core/message/157815
> Mute This Topic: https://lists.openembedded.org/mt/86772899/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c2fcfa05cfd4a7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 2, 2021 at 1:12 PM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">On Tue, Nov 2, 2021 at 1:06 PM Ross Burton &lt;<a href=3D"mailto:ro=
ss@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2 Nov 2021 at 18:06, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; So shouldn=E2=80=99t we fix python3-config to not use distutils a=
nd switch to setup tools instead ?<br>
&gt; &gt;<br>
&gt; &gt; I am afraid that masking the warning will come biting soon when t=
his is turned into a hard error<br>
&gt;<br>
&gt; That is a much bigger question that needs to be done, but most likely<=
br>
&gt; involves rewriting large chunks of the cross integration as from what<=
br>
&gt; I can tell, setuptools doesn&#39;t expose sysconfig (and we patch<br>
&gt; distutils.sysconfig).<br>
&gt;<br>
&gt; We can continue hacking the hack, until we solve this properly.=C2=A0 =
This<br>
&gt; may happen as part of the pyo3 rust/python problem.<br>
<br>
I guess, this patch is fine for what it is solving for now, I was<br>
hopeful that converting to not use<br>
distutils would be easy :)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">The distutils.sy=
sconfig.get_python_inc(plat_specific=3DTrue) call has no replacement. It wi=
ll have to be rewritten.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<br>
&gt;<br>
&gt; Ross<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157815): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157815" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157815</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86772899/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
86772899/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c2fcfa05cfd4a7d8--

