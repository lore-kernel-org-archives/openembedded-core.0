Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.5527.1591082296649395679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azOqT8sT;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id a68so1447174vsd.8
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwVfbd+DGdGE6l3m9QOmk3pjt+KDrKvYKsS1dkhrgV0=;
        b=azOqT8sTwl9oSkocy2dcjX3hKxIGkLt7orM0bQlPa6i4uRZjHkeOXv+jkinYM1hoRL
         +i4Ll2sDawi/oGE1n7M+vGBzqm0Rt5Vt1wDucdo0hqYgIqi2AIpQdPEPFGk9BYHUWbKa
         qoMGewWIrtYxaSdK1EmQS1IjUrD/iO84jK2zYwP6EreVrpyr7fr0Yt88RcrkXk5x7UC5
         K75vewxPlbQWVVA7X2+ip4oRph/x5uenawKZWqNsN0Jpm13us+UlBaITlsEDXnTQa2bv
         zTvJVYRCzVBlpgZqKspT6AQeVz1H876SkJcf9lGl2wOC4rWcTgK7g+71I4hjcjfl+M65
         9tQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwVfbd+DGdGE6l3m9QOmk3pjt+KDrKvYKsS1dkhrgV0=;
        b=dw7xskBp0wVWmKR7vJLXrHT1IvU5D/XUrLo1CWysssP6JdyYFGf64THiPqnJDlEIhO
         2BlyU+x1iZnHvmCAcbqPO8K6RrLDUVJiuV3+Pl7ggtmlCrzdBMIWXxh9gzowiVLGxcue
         kf9HHCMOkJCKthThxu95J/z0Fzf49WC90cQfUmzLfpQFaPK8N44/AkFbTUivYaQK9bGr
         lH/M6BG/LrfLm1djeEtVISMaEzAeWF4cm3nGqKgKvGWqxGMU75d5ekHoHG0Y/t7UhB2k
         EgVzqfChQLuIdRSHZ/VDZYn0y0HXIZDr04eTlz2NmFNaWP6DkfPbWhPyztRceBIAl3kG
         uGCQ==
X-Gm-Message-State: AOAM532IZ2XYpJ9yzFXw2Ex3v7mCCLEflWhXw3j/iYF94ypDjn6uUZgu
	rB2cc5vJw+kh23ofaynErMZXALuGBe0yEKyc/5Tn4KR5
X-Google-Smtp-Source: ABdhPJzzZ12di+DHRPEcDdPGoCE3GQmi5rgGnAcW6Ri66iIZFKCFq/d42xb6BQgxGy8watrvUr1NpDLi5rFybyV9ud8=
X-Received: by 2002:a67:c806:: with SMTP id u6mr11013197vsk.94.1591082295797;
 Tue, 02 Jun 2020 00:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-41-alex.kanavin@gmail.com> <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
 <CANNYZj-rXODGtejn13KtYtUyHy083SeVtM7Gd6S3hmAsLuqPew@mail.gmail.com> <CAMKF1spKJZyjoE_qJWXhg+Jrqt2ZotJNRaUEkNZ69zhjxPHnkg@mail.gmail.com>
In-Reply-To: <CAMKF1spKJZyjoE_qJWXhg+Jrqt2ZotJNRaUEkNZ69zhjxPHnkg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 09:18:04 +0200
Message-ID: <CANNYZj8zjOFUyYkgbK69hCphVNBUc-6EDyeiMasY9=hHtXTf2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
To: Khem Raj <raj.khem@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000caa0d05a714b7ae"

--0000000000000caa0d05a714b7ae
Content-Type: text/plain; charset="UTF-8"

I was thinking of simply dropping the revision from PV, and setting PE to 1
or so.

Alex

On Tue, 2 Jun 2020 at 05:51, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Mon, Jun 1, 2020 at 3:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Mon, 1 Jun 2020 at 03:37, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>>
>>> >  UPSTREAM_CHECK_COMMITS = "1"
>>> >
>>> > -SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
>>> > +SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
>>> >
>>> >  PV = "r2991+git${SRCPV}"
>>>
>>> PV will also need to be changed in this case to r2999+git${SRCPV}.
>>>
>>
>> I wonder if basing PV on svn revisions is still beneficial - we pull
>> directly from github, rather than svn, and I don't think anyone is
>> interested in what the svn revision is. Upstream does not tag releases.
>>
>
> Since it is set to denote svn rev not updating will add to confusion so
> please update it
>
>>
>> Alex
>> 
>>
>

--0000000000000caa0d05a714b7ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was thinking of simply dropping the revision from P=
V, and setting PE to 1 or so.</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 2 Jun 2020 at 05:51, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1, 2020 at 3:53 AM Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, 1 Jun 2020 at 03:=
37, Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_bl=
ank">anuj.mittal@intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 UPSTREAM_CH=
ECK_COMMITS =3D &quot;1&quot;<br>
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
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><di=
v><br></div><div>Alex<br></div></div></div>
<br>
</blockquote></div></div>
</blockquote></div>

--0000000000000caa0d05a714b7ae--
