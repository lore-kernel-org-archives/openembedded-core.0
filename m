Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.4649.1592390132000780217
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fnJjuzTZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id k13so1055049vsm.13
        for <Openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 03:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhKCcfMvoHtt6/RIepuOgBb0kRjsWYku++F8Ok/gdDE=;
        b=fnJjuzTZ8QGTBTHj/4bNfsyOx2+5MGNSXMgJTbFXwwj/qZgCe6OJcaKV+T1jqvOgqp
         lCEfhbasZUOwBE7YgE9JpeFmBVBIc0F5LFX42+mqOT2WGkUg1fNddyvpIGMNe3vA/uE/
         hHdRorBVChTKcHuIsSdg011McHtCvY7uJCxws9MQD3yT801yCz0u5zRA/cKvsGS7U0fh
         sCy6QYmRVq7Ixl4dtaGKUv8/hOBxG7J3AhlSh49k/VzVWkAem2KZbxXBmAv9kvgN4g48
         yirxrlMPdlsvy53cvCyisU/PcXFIe2+c04DGFj9Hq0M60qhyrBVxins3Wak9DBEcOzp2
         2h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhKCcfMvoHtt6/RIepuOgBb0kRjsWYku++F8Ok/gdDE=;
        b=L7+oKWIOcEZbNvEwUZRY80W/iE68AGlFDZjvCxocDelMet7NdGanUMyb/J7GqCMhg2
         oHjylYIKO3OZxUcJ2OKiX2dQ9YxF4J82izCe+3rhDL/SAgPPXPBX016ELDW9f1mopP0t
         Ztpx8KSI57JQdpppXWUuUUWVEoIFhjqftf6UcbDKAZdN3SqlpDhd4DxHupqE1oKwArmo
         BvR6hnphmPsQAxQ7zszgkiG0B0b8BkgjJxpufMRKMWNj7gAYeqSalUNyUyzczMbvFLNF
         5KCgOi/aMLu5Wce3TNm1MxUCDO+/7Se5Vi2gu1IivHv4ZAGg9O8yxZeOXSBxFt2ChPBu
         M1wA==
X-Gm-Message-State: AOAM530uKPwCbrpseh8eS++tq0MOfLrcRruCwRUH8wJ/fUcICKoVcCN3
	le4h1BqZWw37bA684o4Ru10MPmMRgOn26DxnPfY=
X-Google-Smtp-Source: ABdhPJyD0nALmCuwGAxUCJGjeNVt25r452poJ+6U7QJhE/Vk0ss1Lf0llEypU62wwGS0wJAOn8FRYkXDxJiFVZz3ih8=
X-Received: by 2002:a67:8c09:: with SMTP id o9mr5447476vsd.23.1592390131213;
 Wed, 17 Jun 2020 03:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200610143520.2727827-1-uvv.mail@gmail.com> <6dd0de0be72028b355cd759e40fee22c9d24ca7b.camel@linuxfoundation.org>
 <b10c95a7-5d8b-d922-ad40-6d97cceb9c85@gmail.com> <14618585.ZI4Hmrvx6b@tyche> <af72cd9c-2ce8-a2d8-e6d2-89028f576294@gmail.com>
In-Reply-To: <af72cd9c-2ce8-a2d8-e6d2-89028f576294@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 17 Jun 2020 12:35:19 +0200
Message-ID: <CANNYZj_i8WN1hto1ncZVPu0Ef1Gy7O+=TmzCU3BcFdOeRn4wMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dhcp: use included bind version
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <Openembedded-core@lists.openembedded.org>, tmark@isc.org, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: multipart/alternative; boundary="0000000000001d692005a84538a7"

--0000000000001d692005a84538a7
Content-Type: text/plain; charset="UTF-8"

This brings me to a question. Should we replace dhcp with kea?

https://www.isc.org/kea/

Alex

On Sat, 13 Jun 2020 at 10:31, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> On 13.06.2020 02:41, Khem Raj wrote:
> > I think it would be good to share if we can. Shipping two versions of
> bind
> > libraries is less than ideal, have you explored disabling threading in
> the
> > bind recipe and see if named is happy with that ?
> >
> Yes, I have. It partially solves the issue. At least DHCP doesn't
> crash/fail anymore, but warnings from epoll enabled are still seen in
> the logs. The other question is do we have to strip down BIND
> functionality in order to make DHCP work?
>
> I understand that maintenance effort is at stake and we are looking for
> the best possible solution here, but IMHO having one set of bind
> libraries for both BIND and DHCP servers is not one of them.
>
> We could also go Ubuntu way here, by having two bind-9.11.x for DHCP and
> upgrading BIND server to the latest stable (9.16.x if I'm not mistaken).
> Then security support could be only done for 9.11.x version, the latest
> stable should have most of security patches included already.
>
> Vyacheslav
> 
>

--0000000000001d692005a84538a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This brings me to a question. Should we replace dhcp =
with kea?</div><div><br></div><div><a href=3D"https://www.isc.org/kea/">htt=
ps://www.isc.org/kea/</a></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 13=
 Jun 2020 at 10:31, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.=
com">uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 13.06.2020 02:41, Khem Raj wrote:<br>
&gt; I think it would be good to share if we can. Shipping two versions of=
 bind<br>
&gt; libraries is less than ideal, have you explored disabling threading i=
n the<br>
&gt; bind recipe and see if named is happy with that ?<br>
&gt;<br>
Yes, I have. It partially solves the issue. At least DHCP doesn&#39;t <br>
crash/fail anymore, but warnings from epoll enabled are still seen in <br>
the logs. The other question is do we have to strip down BIND <br>
functionality in order to make DHCP work?<br>
<br>
I understand that maintenance effort is at stake and we are looking for <b=
r>
the best possible solution here, but IMHO having one set of bind <br>
libraries for both BIND and DHCP servers is not one of them.<br>
<br>
We could also go Ubuntu way here, by having two bind-9.11.x for DHCP and <=
br>
upgrading BIND server to the latest stable (9.16.x if I&#39;m not mistaken=
). <br>
Then security support could be only done for 9.11.x version, the latest <b=
r>
stable should have most of security patches included already.<br>
<br>
Vyacheslav<br>
<br>
</blockquote></div>

--0000000000001d692005a84538a7--
