Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.10938.1593562623635886126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AujtPnPf;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w6so22576697ejq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 17:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bZtf3Q73ACkSC6kJbGQekoudkSmw7Hy+AcPlxVFu0rY=;
        b=AujtPnPfaYxGEEKwkT38ocn8+hqkGSyQecWUSjaLkK4XBjz+XPisXI0N3eXqYIx1SO
         xUJpsCK974wqh1ePPruVVw42nNUNvawbvTJZ0ObncHkoZdmJmex9sfbH7P6D9QWi4byF
         TK9IBDDCIu7Z2pUhwEAEGbju/bFLsl+QTef1V3poWLHXTTnUs+lA9WJT8THqQLJ0xRQ5
         U6EHInNh0aGH8RLas0rAphJzkJTuwwC6AbAx7mHqhRhgXAJ9x5CL4QszFC1vBDOw3Bwo
         Xscrft+kt2CwIhFAXcUl2n0+ywOe1XKfX9xQCOrNeS0EEmR8iaPvJTEkIU6DMTL8Taex
         gBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bZtf3Q73ACkSC6kJbGQekoudkSmw7Hy+AcPlxVFu0rY=;
        b=JrB9bvURTK6jB/u479+fUF1zhR7kXx7wPdqdAHZRwq5fRZ1J/LTcZlBVhKSVA4YuqV
         S0Lb+qnyb6w+gDMFT7Bnv0fwD7w3p3d5gW93OqICWvVy332c+bXW6lDiHPhXEZGCV9Uz
         XGMvN8ADrHMUpNNBDn9i/+adqWMUqIPPQSTDOIx5YQdSAtQfXvdHdiIgVpbJ8QaFPCgJ
         lYgnJg67DitxH3CLPlNznRsV67rdZEj5c8rlExUFgeUa8Bv/U+k9qyOeURJ7qNHaqWyP
         +vuJ86Xmafx+7EEiHCw3hocfL7FgZTXZMLThhcVPlxxJdUzRPoNEH+vYXZMSe4xws1Co
         IuHg==
X-Gm-Message-State: AOAM532HVsb1bNH1ZicbEzCRfC6DdGVFF6z0s0vL+m8rsZ/nq452ReCQ
	vzzATD4xCg/bvMXTWJp25XF40KoZdJBmw8zHzcQ=
X-Google-Smtp-Source: ABdhPJxyzGg9RmvY0XS8qlXYGIIaj7ejcpAHQYm5/aM4O17aiBzuUoeyVF762jovEUtRnObWu6Z1NVcwvjEoz5cZkec=
X-Received: by 2002:a17:906:940f:: with SMTP id q15mr21130780ejx.470.1593562622152;
 Tue, 30 Jun 2020 17:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com> <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
 <1593543683295.70380@axis.com> <20200630215424.u77jq5frrnpwztfc@jama> <CAJ86T=VTNDHK0OCdWiSTwyv97rvkGTa9euc+OhtMd07dxwbaSw@mail.gmail.com>
In-Reply-To: <CAJ86T=VTNDHK0OCdWiSTwyv97rvkGTa9euc+OhtMd07dxwbaSw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2020 02:16:50 +0200
Message-ID: <CA+chaQdND07kh8mooQD7E9_+CaeWoePSRWVjpTw7mweCOJu=rg@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, Ross Burton <ross@burtonini.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Content-Type: multipart/alternative; boundary="00000000000005529205a95636ac"

--00000000000005529205a95636ac
Content-Type: text/plain; charset="UTF-8"

Yes, I thought we at @lge do a lot of builds, but after checking our
statistics we average "only" around 30,000 builds per week in last 5 years.

But on the other hand, our typical image is quite big (between 300MB and
1GB for enduser image and between 700MG and 1.5GB for developer images
depending on the target MACHINE for tar.bz2 IMAGE_FSTYPE), but each build
is producing at least 2 images (enduser and devel), but e.g. TVs are
building 15 different rootfs for each MACHINE, so the number of do_rootfs
tasks is easily over 100,000 per week and I'm seeing average do_rootfs
times around 10-14 minutes for bigger images and 4 minutes for "small"
images.

I should definitely try apk to prevent global warming :).

On Wed, Jul 1, 2020 at 1:15 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Jun 30, 2020 at 2:54 PM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> > On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:
> > > Hi Ross,
> > > those 5 seconds will increase to minutes for my use case and we build
> a lot
> > > hence I hope this will save us a lot of computer power and engineering
> time.
> > > For example I've sent numbers on building a bigger image
> (core-image-sato-sdk-ptest)
> > > to Alex and Alex:
> > > out.apk.1: 1:13.35
> > > out.apk.2: 1:13.51
> > > out.apk.3: 1:13.23
> > > out.apk.4: 1:14.07
> > > out.apk.5: 1:13.00
> > > out.deb.1: 3:49.37
> > > out.deb.2: 3:50.77
> > > out.deb.3: 3:51.39
> > > out.deb.4: 3:53.40
> > > out.deb.5: 3:53.99
> > > out.ipk.1: 2:38.99
> > > out.ipk.2: 2:39.07
> > > out.ipk.3: 2:35.34
> > > out.ipk.4: 2:36.15
> > > out.ipk.5: 2:34.55
> > > out.rpm.1: 1:58.61
> > > out.rpm.2: 1:59.42
> > > out.rpm.3: 1:59.70
> > > out.rpm.4: 1:58.96
> > > out.rpm.5: 1:58.11
> > >
> > > Also consider that if we've a target without python with limited
> space, rpm is out
> > > of the question. So the real comparison would be between ipk and apk.
> Let's
> > > say we can save 80 seconds in each build. Now multiply that with the
> number of
> > > builds, and we do a lot (I guess we might approach 100 000 builds/week
> in the
> > > next year). Then this will save 92.5 days build time each week.
> >
> > This is impressive.
>
> Indeed. 10 builds per minute, 24hrs a day. But not as impressive as
> the scale of the development team able to create enough changes to
> trigger so many builds and the scale of the test infrastructure able
> to consume them!
>
> Assume one developer makes 10 changes a day and each change gets built
> for 10 different targets... 100,000 builds per week implies a team of
> over 140 developers.
>

--00000000000005529205a95636ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I thought we at=C2=A0@lge do a lot of builds, but aft=
er checking our statistics=C2=A0we average &quot;only&quot; around 30,000 b=
uilds per week in last 5 years.<div><br></div><div>But on the other hand, o=
ur typical image is quite big (between 300MB and 1GB for enduser image and =
between 700MG and 1.5GB for developer images depending on the target MACHIN=
E for tar.bz2 IMAGE_FSTYPE), but each build is producing at least 2 images =
(enduser and devel), but e.g. TVs are building 15 different rootfs for each=
 MACHINE, so the number of do_rootfs tasks is easily over 100,000 per week =
and I&#39;m seeing average do_rootfs times around 10-14 minutes for bigger =
images and 4 minutes for &quot;small&quot; images.<br></div><div><br></div>=
<div>I should definitely try apk to prevent global warming :).</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Jul 1, 2020 at 1:15 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail=
.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Tue, Jun 30, 2020 at 2:54 PM Martin Jansa &lt;<=
a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gma=
il.com</a>&gt; wrote:<br>
&gt; On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:<br=
>
&gt; &gt; Hi Ross,<br>
&gt; &gt; those 5 seconds will increase to minutes for my use case and we b=
uild a lot<br>
&gt; &gt; hence I hope this will save us a lot of computer power and engine=
ering time.<br>
&gt; &gt; For example I&#39;ve sent numbers on building a bigger image (cor=
e-image-sato-sdk-ptest)<br>
&gt; &gt; to Alex and Alex:<br>
&gt; &gt; out.apk.1: 1:13.35<br>
&gt; &gt; out.apk.2: 1:13.51<br>
&gt; &gt; out.apk.3: 1:13.23<br>
&gt; &gt; out.apk.4: 1:14.07<br>
&gt; &gt; out.apk.5: 1:13.00<br>
&gt; &gt; out.deb.1: 3:49.37<br>
&gt; &gt; out.deb.2: 3:50.77<br>
&gt; &gt; out.deb.3: 3:51.39<br>
&gt; &gt; out.deb.4: 3:53.40<br>
&gt; &gt; out.deb.5: 3:53.99<br>
&gt; &gt; out.ipk.1: 2:38.99<br>
&gt; &gt; out.ipk.2: 2:39.07<br>
&gt; &gt; out.ipk.3: 2:35.34<br>
&gt; &gt; out.ipk.4: 2:36.15<br>
&gt; &gt; out.ipk.5: 2:34.55<br>
&gt; &gt; out.rpm.1: 1:58.61<br>
&gt; &gt; out.rpm.2: 1:59.42<br>
&gt; &gt; out.rpm.3: 1:59.70<br>
&gt; &gt; out.rpm.4: 1:58.96<br>
&gt; &gt; out.rpm.5: 1:58.11<br>
&gt; &gt;<br>
&gt; &gt; Also consider that if we&#39;ve a target without python with limi=
ted space, rpm is out<br>
&gt; &gt; of the question. So the real comparison would be between ipk and =
apk. Let&#39;s<br>
&gt; &gt; say we can save 80 seconds in each build. Now multiply that with =
the number of<br>
&gt; &gt; builds, and we do a lot (I guess we might approach 100 000 builds=
/week in the<br>
&gt; &gt; next year). Then this will save 92.5 days build time each week.<b=
r>
&gt;<br>
&gt; This is impressive.<br>
<br>
Indeed. 10 builds per minute, 24hrs a day. But not as impressive as<br>
the scale of the development team able to create enough changes to<br>
trigger so many builds and the scale of the test infrastructure able<br>
to consume them!<br>
<br>
Assume one developer makes 10 changes a day and each change gets built<br>
for 10 different targets... 100,000 builds per week implies a team of<br>
over 140 developers.<br>
</blockquote></div>

--00000000000005529205a95636ac--
