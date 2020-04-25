Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.7938.1587827556089902896
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CJRn38ph;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id o135so983222qke.6
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4qfGclV0agH9/YJMpgP5lyeoDwvMpG+I8pvjK2bAv0=;
        b=CJRn38phU7N4Fp6cuNej3h6qPkW1BkdNFEsrmvUm3vf5QcnciYPEGYTk37MSlej9kM
         L6VoEE/DJGnjxp/xFNw6I51FReJNtEaB6U/EvQ0h/6PvEEcDoctNzj/f3wSgX6OnANRF
         0REOjPKCzOivZgKaU6Ajt9VWpyJ+dUcPrU3gdhvedcsSZdXi2901RriDg6lMYIlTrk+9
         LiGmHKMGvF6xOQ+ZEb8wlAUFYWedfqUEvNW0esFG8XiQ0l6g0/fS+pqN6Hh0ETZoKe4r
         C92MHoB5ZWUc4jWlo4w31ESN1SYUzJZ2/RPEO13LKNY2aYTMnV9ptXlA2k7a3DkSTQRo
         etjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4qfGclV0agH9/YJMpgP5lyeoDwvMpG+I8pvjK2bAv0=;
        b=KEziP9+hQA/ZN5UdrC+HXv6MFmzh+I2FGERf8yApB7j/Nxj0kW8vaA8JTHK0RhhPzF
         1wfBXZas90kehWxR4v0FqDujmA2WmBmbiilpAMz6WxkkZVgXggNaUDgzTqXNTJHSlwLU
         zk79Er1UlUW6tZ3hrKehy4J+oeOByL0z+XdnyE7Ievirt7OBYQ5+Z+gV+DeRx5G8yTHl
         P5PPVDKaSSYea9a29jrOjW8/tk+rYzQs/bwwZfTOS8UYXyZeEpOsiTwt35XDhenPnuJB
         8tX16/qsTq+WeRamjrZUyr52TaGeT6qZHZAwZ0zG9Hbw11mtbOlgyi9Ovb1BbfijaZUk
         7gIg==
X-Gm-Message-State: AGi0PuYuQjLMv8XEx7WFtKN038g0TifMpWckgq5Kdn1CDtVMi+vMEhZS
	CEhkQB8GL7MIvUAH1VKV0nEcdv5Bw4IfsIaqF5g=
X-Google-Smtp-Source: APiQypIyTWmpa+kUjJNvVMkae1E7vN6uTFyJaRYxpci/OtDrVSMBrijCilIT9RaU7vozMLx2W4ER4e5D40DNSF5GOOU=
X-Received: by 2002:a05:620a:4f0:: with SMTP id b16mr2794118qkh.165.1587827555111;
 Sat, 25 Apr 2020 08:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com>
 <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
 <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
 <CAJ86T=W1jP=eMiJmcQLYfKamsD3v2+ycbS8Q3V-iEc+HVDT=Gw@mail.gmail.com>
 <e2745c5f-8856-56f5-3fa0-84a89fd26216@gmail.com> <CAO5Uq5S8cxQJJGetX=2ndAi_XWoi81DZ3hy_A9JL-mYQpgFuqw@mail.gmail.com>
In-Reply-To: <CAO5Uq5S8cxQJJGetX=2ndAi_XWoi81DZ3hy_A9JL-mYQpgFuqw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Apr 2020 08:12:20 -0700
Message-ID: <CAMKF1sq8pmyc6VmM=iV1vzMvcHjQo8b4DWP97z6QVX8dKaC81Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000063216105a41ee968"

--00000000000063216105a41ee968
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 25, 2020 at 3:45 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Sat, Apr 25, 2020 at 2:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 4/23/20 10:14 AM, Andre McCurdy wrote:
> > > On Thu, Apr 23, 2020 at 1:30 AM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> > >> On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > >>> On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> > >>>>
> > >>>> sshd.socket launches the templated sshd@.service, so by moving the
> > >>>> sshdgenkeys.service to sshd.socket, key generation can start in
> advance
> > >>>> of a connection.
> > >>>
> > >>> Is deferring key generation until the first connection a bug or by
> design?
> > >>
> > >> If you've installed it, presumably you're expecting connections. But I
> > >> agree you could argue it either way.
> > >
> > > The trade off is between slower first boot (or every boot for
> > > read-only rootfs if host keys are not persistent) -vs- slower first
> > > incoming ssh connection.
> > >
> > > Since the first incoming ssh connection may never happen (especially
> > > if ssh is only used for debugging or development), optimising it at
> > > the expense of boot time doesn't seem to be an obvious improvement.
> > >
> >
> > I tend to agree. Perhaps it could be covered under read-only-rootfs
> > DISTRO_FEATURE
> >
>
> I just ran both through systemd-analyze. For qemuarm, this adds 5s to
> the total boot time, but graphical.target is reached in the same time.
>

Thanks for data. A lot of systems are very sensitive to boot time and this
sadly is not helping them


> Clearly you can cut this one both ways - I don't have a specific
> problem this fixes, it was more an annoyance (for me).
>
> > >
> > > 
> > >
> >
>
>
> --
> Alex Kiernan
>

--00000000000063216105a41ee968
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Apr 25, 2020 at 3:45 AM Alex Kiernan &lt;<a href=
=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Sat, Apr 25, 2020 at 2:43 AM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 4/23/20 10:14 AM, Andre McCurdy wrote:<br>
&gt; &gt; On Thu, Apr 23, 2020 at 1:30 AM Alex Kiernan &lt;<a href=3D"mail=
to:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt; On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy &lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;&gt;&gt; On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan &lt;<a href=
=
=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.co=
m</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; sshd.socket launches the templated sshd@.service, so=
 by moving the<br>
&gt; &gt;&gt;&gt;&gt; sshdgenkeys.service to sshd.socket, key generation c=
an start in advance<br>
&gt; &gt;&gt;&gt;&gt; of a connection.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Is deferring key generation until the first connection a=
 bug or by design?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If you&#39;ve installed it, presumably you&#39;re expecting =
connections. But I<br>
&gt; &gt;&gt; agree you could argue it either way.<br>
&gt; &gt;<br>
&gt; &gt; The trade off is between slower first boot (or every boot for<br=
>
&gt; &gt; read-only rootfs if host keys are not persistent) -vs- slower fi=
rst<br>
&gt; &gt; incoming ssh connection.<br>
&gt; &gt;<br>
&gt; &gt; Since the first incoming ssh connection may never happen (especi=
ally<br>
&gt; &gt; if ssh is only used for debugging or development), optimising it=
 at<br>
&gt; &gt; the expense of boot time doesn&#39;t seem to be an obvious impro=
vement.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I tend to agree. Perhaps it could be covered under read-only-rootfs<b=
r>
&gt; DISTRO_FEATURE<br>
&gt;<br>
<br>
I just ran both through systemd-analyze. For qemuarm, this adds 5s to<br>
the total boot time, but graphical.target is reached in the same time.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for data=
. A lot of systems are very sensitive to boot time and this sadly is not he=
lping them=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><br>
Clearly you can cut this one both ways - I don&#39;t have a specific<br>
problem this fixes, it was more an annoyance (for me).<br>
<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div></div>

--00000000000063216105a41ee968--
