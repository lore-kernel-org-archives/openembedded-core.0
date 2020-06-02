Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.3216.1591069888983484561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 20:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DyrBEdEe;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id w90so9583746qtd.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 20:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/znpxLiqXN454SUlErtyyhWWQeRWgzWsqthrFRi/WE=;
        b=DyrBEdEeDJEmWG9jH1qZZ6u9WVFKSLezjG1NourUoi4SMRANLKh76Wusd1rnub7Qzz
         iqw13ybv2QbNIb1tJoM0mjVxcOVhzrGkxxaWY5+VZ9HEx8eMS+scULxuDZkgeahuXyE/
         AARTwoFuCP+ESrRvRIuPiSd7F0BIjYMZ5b5JbNPdY59932eZ+KP/kn6jbEcCbRR8zqu1
         P46Tbpt2NvQbBzq26+mDvZN2GgZ8jSAPeXyW0Y+55BxxgotL7lFoU9ORfrMTpArBs+2d
         zaNYzqBSjYC+Z6FG5RHBPh3F4eFsUz5gc6lOEkC13W3aAGUTgHdMeqXiQmDWje+iHE6g
         S6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/znpxLiqXN454SUlErtyyhWWQeRWgzWsqthrFRi/WE=;
        b=YBycAsTIyINJEfHrniwyb7Pg1oBEDajyhQSjkNhf4TD6Z9Q6ZQTtm7FM+/Wzl/RRqo
         ptnDRDqULhUT+JXbk0XIecs9ApUBGzzZwpn35aqa0SsKCq6t4wo3QCplSWXxUH/3f4Ko
         OK78gglfWkA2xsO4d9jgGIslJ432budpfgif2FomSIqafZ4IaK965TUvpkPJU2tDtn6y
         F5NGUFA0WZ921IUN9dO1A73WXsWixZVKDQPqgJQTxqHEZxWVWxud+gW1hR6wyAemztL+
         onant9CgJQgce4SrwR5knFHVNSVyLwBI8s39zxfaHxTnkkZU0J9qDsI/44DzV9JdccjO
         KzkA==
X-Gm-Message-State: AOAM5322kKbVuarFs8a1LaVf2pzbTPHP1WaFskZ4JMPMe/N1fiFetlCW
	+/cD/KogdINyKq/XMxhoujlVim0A8d5ZfrmhsKY=
X-Google-Smtp-Source: ABdhPJyYyWDGVdpeH3v9YO6ST3taDj/EFEbF9T+T/ybvQ+dviEMPtZaoW9Cp0Y93XCqChenDrXRr0SEJww+ekSkGrRE=
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr25123438qto.285.1591069888063;
 Mon, 01 Jun 2020 20:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-41-alex.kanavin@gmail.com> <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
 <CANNYZj-rXODGtejn13KtYtUyHy083SeVtM7Gd6S3hmAsLuqPew@mail.gmail.com>
In-Reply-To: <CANNYZj-rXODGtejn13KtYtUyHy083SeVtM7Gd6S3hmAsLuqPew@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 20:51:17 -0700
Message-ID: <CAMKF1spKJZyjoE_qJWXhg+Jrqt2ZotJNRaUEkNZ69zhjxPHnkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007daff805a711d319"

--0000000000007daff805a711d319
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 1, 2020 at 3:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 1 Jun 2020 at 03:37, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
>> >  UPSTREAM_CHECK_COMMITS = "1"
>> >
>> > -SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
>> > +SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
>> >
>> >  PV = "r2991+git${SRCPV}"
>>
>> PV will also need to be changed in this case to r2999+git${SRCPV}.
>>
>
> I wonder if basing PV on svn revisions is still beneficial - we pull
> directly from github, rather than svn, and I don't think anyone is
> interested in what the svn revision is. Upstream does not tag releases.
>

Since it is set to denote svn rev not updating will add to confusion so
please update it

>
> Alex
> 
>

--0000000000007daff805a711d319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 1, 2020 at 3:53 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Mon, 1 Jun 2020 at 03:37, Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@=
intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt; wrote:<br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV =3D &quot;1771b556ee45207f8711744ccbd5d42a3949b14c&quot;<br>
&gt; +SRCREV =3D &quot;296494a4011f58f32adc54304a2654627558c59a&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV =3D &quot;r2991+git${SRCPV}&quot;<br>
<br>
PV will also need to be changed in this case to r2999+git${SRCPV}.<br></bl=
ockquote><div><br></div><div>I wonder if basing PV on svn revisions is stil=
l beneficial - we pull directly from github, rather than svn, and I don&#39=
;t think anyone is interested in what the svn revision is. Upstream does no=
t tag releases.</div><div></div></div></div></blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Since it is set to denote svn rev not updating =
will add to confusion so please update it=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Al=
ex<br></div></div></div>
<br>
</blockquote></div></div>

--0000000000007daff805a711d319--
