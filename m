Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.40041.1629212456970983452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sx+1fqyV;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v2so21580750edq.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jayVxWlQ0qMyKMkpwy1hTNK/7Nkn2yDdwZdrpJbHwWY=;
        b=Sx+1fqyVmadhRgk9B/ZGjim0yMNJMjStf/pWxhd3jLljTuFMO7y1Q/KkdJsL7aOoXx
         GuCSm3dWQoF63l61H21/8QSZx2M9fQqyFUr7dzhYAdtkBwdFASi0eCe4I76227YKqbhW
         y11wsz144/t+is8OA5yB6my3E/DEUgXL61CxaM1Dp9DyIne8KFptBRn1LLNkfQeYG5PQ
         NT3kxw/hdFpXzvXHRkWADvTZFv9Pi3OrWRqXveqtJIwTzo2vStiFr3jUlOoiwC3XPAS6
         KuIXo9S2hNQOs0eBK57hCMdWPHkZQbdoX4yOY4S7ZnGukDcVp4nBVynaDGA1LY98Zrb6
         mPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jayVxWlQ0qMyKMkpwy1hTNK/7Nkn2yDdwZdrpJbHwWY=;
        b=O8izeckYda6dfKR2aOamrJxbOyUQKQxrHbioiq/a1aewmVq3PrZAUI38WlK1uidmG5
         hOBGI4DhDMZ0aP84z3CorM9eJ44kZrs7ewJXfItYLmL2XitBbxcBEJZv8n/B4FKLlPoN
         4LFXaScUoRLpM3lBnyDMPPH7p0qPn9Z95Vuwb8RppKci0MRWdrgdWgTZWVR+3nbili/x
         hdRR0Cye9ujcfXymgxO2mZZBIFSdVBZC9xflPEheQB4WPVghRJGniqkFXXxnGtqjgHMY
         ymvlOrhskhKa3fGjSgTRk85iR8D5vuuRwnWrSQgc4wVmJ+3S20QcBpIO6qXZaiuShVsw
         t9+Q==
X-Gm-Message-State: AOAM532ddtMkCRNZFvBUHwxC7J9pqUcUaRtRCGc/yh9wl7fciPHg1Qvq
	CmcBIGw0CWdSwIh6GyBdw2dKrp/5WgKYGsLKNGo=
X-Google-Smtp-Source: ABdhPJzBIxtozfxppavFHRB2fx7RSqRwxPhp1ec6oS3T9fIGxKHqXkddrMa6t5Y5xyqGC3ujeg2sXIgsVpxeyjTxlyY=
X-Received: by 2002:a05:6402:19a:: with SMTP id r26mr4547251edv.230.1629212455139;
 Tue, 17 Aug 2021 08:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <1628579261-7380-1-git-send-email-purushottam.choudhary@kpit.com> <CAOSpxdbihGhrEUqEd8+vgj5hvv-5wexzr2fN0zwpTMBuyp-5pg@mail.gmail.com>
In-Reply-To: <CAOSpxdbihGhrEUqEd8+vgj5hvv-5wexzr2fN0zwpTMBuyp-5pg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Aug 2021 17:00:44 +0200
Message-ID: <CA+chaQdf7Yp77OWxYDcFSCfQ_Y=8xnjv3KVCgvNUfqeZ8sRaYw@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] python3: Remove unused python3 recipe
To: Steve Sakoman <steve@sakoman.com>
Cc: Purushottam choudhary <purushottam.choudhary@kpit.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="000000000000a6fded05c9c295cb"

--000000000000a6fded05c9c295cb
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 4:52 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Mon, Aug 9, 2021 at 9:08 PM Purushottam choudhary
> <purushottam.choudhary@kpit.com> wrote:
> >
> > Currently in dunfell branch python3 version is 3.8.11.
> > so, python3_3.8.10.bb is not needed.
> > Hence, removed.
>
> I don't feel good about removing a recipe from a stable release.
> There may be people who are using 3.8.10 for whatever reason and
> removing the recipe would break their builds.
>

IMHO removing 3.8.10 is correct in this case, normally the upgrade to
3.8.11 from:
https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=1ba51ee2d52ee92bbdede9f2cd2f9ed9ff04ddb6
would remove the older version like the upgrade to 3.8.10 did couple days
before:
https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=471d19fa70c4c2b43a039909c9538e2223996335

3.8.10 recipe existed in dunfell only for about 2,5 weeks (and probably
only by accident it wasn't removed with 3.8.11 upgrade), if someone started
to depend on this exact version for whatever reason, then something is
wrong with him or her :).

Regards,

--000000000000a6fded05c9c295cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Aug 17, 2021 at 4:52 PM Steve Sak=
oman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wro=
te:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Mon, Aug 9, 2021 at 9:08 PM Purushottam choudhary<br>
&lt;<a href=3D"mailto:purushottam.choudhary@kpit.com" target=3D"_blank">pur=
ushottam.choudhary@kpit.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently in dunfell branch python3 version is 3.8.11.<br>
&gt; so, <a href=3D"http://python3_3.8.10.bb" rel=3D"noreferrer" target=3D"=
_blank">python3_3.8.10.bb</a> is not needed.<br>
&gt; Hence, removed.<br>
<br>
I don&#39;t feel good about removing a recipe from a stable release.<br>
There may be people who are using 3.8.10 for whatever reason and<br>
removing the recipe would break their builds.<br></blockquote><div><br></di=
v><div>IMHO removing 3.8.10 is correct in this case, normally the upgrade t=
o 3.8.11 from:</div><div><a href=3D"https://git.openembedded.org/openembedd=
ed-core/commit/?h=3Ddunfell&amp;id=3D1ba51ee2d52ee92bbdede9f2cd2f9ed9ff04dd=
b6">https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&amp;=
id=3D1ba51ee2d52ee92bbdede9f2cd2f9ed9ff04ddb6</a></div><div>would remove th=
e older version like the upgrade to 3.8.10 did couple days before:<br></div=
><div><a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=
=3Ddunfell&amp;id=3D471d19fa70c4c2b43a039909c9538e2223996335">https://git.o=
penembedded.org/openembedded-core/commit/?h=3Ddunfell&amp;id=3D471d19fa70c4=
c2b43a039909c9538e2223996335</a><br></div><div><br></div><div>3.8.10 recipe=
 existed in dunfell only for about 2,5 weeks (and probably only by accident=
 it wasn&#39;t removed with 3.8.11 upgrade), if someone started to depend o=
n this exact version for whatever reason, then something is wrong with him =
or her :).</div><div><br></div><div>Regards,</div><div><br></div><div><br><=
/div></div></div>

--000000000000a6fded05c9c295cb--
