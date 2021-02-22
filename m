Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.1056.1614019498589266170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 10:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nt4rGfUb;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id 68so7047164vsk.11
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlAcS2NrNlNeS6ZKjtc59yNeMafT+oUBnF7y9ZkQIOY=;
        b=Nt4rGfUbL9tc1PEf8vchOw3Sa/ZfA68t8OM8b4ZxqrpkEt3OhWO4X4asqKi++Ho9Ax
         +OY0K+oO4kH7b8eNP1UsLef4jDRw0hMMtgql05/iBb+YTegFC7fESpjFbJZtO5JBySpa
         gOxrDF8F+0ay7msTg7eGDqvt+wRyKgWCgNaOzz6LMN6f1ChEKQarlLJ2WYQD9jn6zYUL
         GIS1B9WP/t0xOm3l4BxB5QxH37XfXiMVbpY4wlRJkqhAcmqQJrXdnOtti5eUmet3P7oY
         ip2mJVnfa3YK46Q75RrfHSNIKWpdXiWvy80tE/kSXXl1jobIeEpCzFyIN21v27TQgTiZ
         7AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlAcS2NrNlNeS6ZKjtc59yNeMafT+oUBnF7y9ZkQIOY=;
        b=QyInk0liXqiAa/+JT7W1yXhSAeYEe5zxXMVTUcVotc9y4/rfyBNWjiv5T8j9rV2L8Q
         +RR3Et3LEYM76S4HxHQ1CaKSh/gYNWJG60A0SqFYDMwDzMFgY/i6w0FTnAK1ukWqoB1b
         FvGb7ODcBgFLqTfOIFuFRM1mpORn/ht/Gd4eGEKeCq4Ra8fvPHV4uPhqAvBuph0T8lrO
         fYXClhWZR8o/Rt620ky1QJntDnSbboxhHwsBhsfTF1Kkb3LPmDa5yk0iwwdsDaA4eNyV
         VXIcGXj1Vo/VxxvwZIYC010EUoGYvmkW998HMbQML2pjYeJ5xtlGZUVekbe+hzXF+ehj
         4U1w==
X-Gm-Message-State: AOAM53270kE/2nwdQyDPU0dTC/m/qv0c7DQF3goMk7OYtF3wT0+nkl/9
	Wn9RllaGxQc7/2xKEy8IzcWyAQNxC4/8jBsTe+o=
X-Google-Smtp-Source: ABdhPJzOnnRU4Ma/l+IjAE3MmhFbVfHQt94bI8ySeSBLL7JdHjXK3QUpp3FL2V7SYVudf5386m2prYUkryDGlZLU2n8=
X-Received: by 2002:a67:7942:: with SMTP id u63mr5703401vsc.41.1614019497780;
 Mon, 22 Feb 2021 10:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20210222154956.27267-1-andrej.valek@siemens.com>
 <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
 <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com> <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com>
In-Reply-To: <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Feb 2021 19:44:46 +0100
Message-ID: <CANNYZj9xb3q+b4Mqng_RQoR+NvstzwOXeHRfCMrKuyCyxzyNEQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Andrej Valek <andrej.valek@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: multipart/alternative; boundary="000000000000d3692805bbf1320c"

--000000000000d3692805bbf1320c
Content-Type: text/plain; charset="UTF-8"

Right here: https://busybox.net/

Alex


On Mon, 22 Feb 2021 at 18:37, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/22/21 8:39 AM, Alexander Kanavin wrote:
> > On Mon, 22 Feb 2021 at 17:02, Richard Purdie
> > <richard.purdie@linuxfoundation.org
> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >
> >      > +UPSTREAM_CHECK_URI = "https://busybox.net/ <https://busybox.net/
> >"
> >      > +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\
> >     \(stable\)"
> >     I just realised/wondered whether:
> >
> >     inherit upstream-version-is-even
> >
> >     would work here?
> >
> >
> > I don't think so - busybox seems to declare x.y.0 as unstable, and
> > everything else as stable.
> >
>
> is it documented somewhere that x.y.0 is unstable ?
>
> https://git.busybox.net/busybox/commit/?id=a4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c
>
> seems to indicate its a normal release.
>
> > Alex
> >
> >
> > 
> >
>

--000000000000d3692805bbf1320c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right here: <a href=3D"https://busybox.net/">https://=
busybox.net/</a></div><div><br></div><div>Alex<br></div><div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, 22 Feb 2021 at 18:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><br>
<br>
On 2/22/21 8:39 AM, Alexander Kanavin wrote:<br>
&gt; On Mon, 22 Feb 2021 at 17:02, Richard Purdie <br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_=
blank">richard.purdie@linuxfoundation.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"htt=
ps://busybox.net/" rel=3D"noreferrer" target=3D"_blank">https://busybox.net=
/</a> &lt;<a href=3D"https://busybox.net/" rel=3D"noreferrer" target=3D"_bl=
ank">https://busybox.net/</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +UPSTREAM_CHECK_REGEX =3D &quot;BusyBox\ (?P=
&lt;pver&gt;\d+\.\d+\.\d+)\<br>
&gt;=C2=A0 =C2=A0 =C2=A0\(stable\)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I just realised/wondered whether:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0inherit upstream-version-is-even<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0would work here?<br>
&gt; <br>
&gt; <br>
&gt; I don&#39;t think so - busybox seems to declare x.y.0 as unstable, an=
d <br>
&gt; everything else as stable.<br>
&gt; <br>
<br>
is it documented somewhere that x.y.0 is unstable ?<br>
<a href=3D"https://git.busybox.net/busybox/commit/?id=3Da4c3a341394a1fb25b=
e8c15d2ddfe3ec77cbb83c" rel=3D"noreferrer" target=3D"_blank">https://git.bu=
sybox.net/busybox/commit/?id=3Da4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c</a>=
<br>
<br>
seems to indicate its a normal release.<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000d3692805bbf1320c--
