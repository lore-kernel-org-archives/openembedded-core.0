Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web09.14806.1615319448565270944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGBeMfUF;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id q17so3273661vkd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JxZFfTtNzu2F1ytEFvjoqFwy9GCAPywvB4VVXMmwgf0=;
        b=pGBeMfUFx9tPQNC0H5+D5f3VLpxexjWhnfBk2YyPYlgUrd30e0b/0ZBzT47yoYYsZC
         ukQcwjyBnJXBGKQRT8zcgSvGVMFtIxzy9+8OgRvN9YjwEDL2bPRRDVLDtOJExdS+StiI
         4fV0uZpImdlZg4U0oaFfx5WTROOSHHtOZ0/5lIoH/wJMcw/NFC8+DP5jQ00GiRW3aOVO
         q4BR6mKJeNpajboy50xlEZnT8MClR/o1SZUeAqUOIBmA2/XgqvWQrh5EV4BGp/f2HkDd
         0x8akbZfvNqqiM87xnHEZUdjuyUWN2sO57p3UsvPyDq+WLrh1qlOGHeM0cJ3q6xIN413
         +uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JxZFfTtNzu2F1ytEFvjoqFwy9GCAPywvB4VVXMmwgf0=;
        b=T0jfDqC8dO9EigDaV/PvXVKJg/QGF5b/0ueTlhWzlDF0SxMw8tEau85gS9zmhfVTv3
         1CLVwPfujpVLB7rpIukG6V9qf37j1jpuAnNpeN+aiXU6A0GZgwcHVA0M2JC4ZNR6clLl
         KRHDOKOMxHcnsqwFccV9nPXn1J8VjXRfJxd7G+mVtYWc5RigBHISt5HAIkVh1kvO6LLN
         Jhkyjc+3UfaSVgl5OKoGefVtK3lNYOUJVwRDVAvwuIlV9lw84Uf5+tlcGPZmzT0FRLu/
         HSSlkXhJ1XFEvZVH45xxCPU21wzvr4tplqT6Aq84Y6P8zrfvtGke5fwtPkqwc2FId/zD
         EkcA==
X-Gm-Message-State: AOAM530KmgN/cFBmgvfdFZXWp/foMNwPsae7XqhGTkPB2x3NWfOPr+5a
	KaJ1TS4+jmxEJ1nkA0DD17WFvvr43eG0YHNMccc=
X-Google-Smtp-Source: ABdhPJxFagxam5H2TBq84lSYZQyRfr/tCG+9ohbixVXjqZ+Wf6PNjkfEqz2hcNSaJ4DjFHRJaN39yxBDw0HBZqHlcfI=
X-Received: by 2002:ac5:c0cd:: with SMTP id b13mr3654688vkk.16.1615319447716;
 Tue, 09 Mar 2021 11:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-8-alex.kanavin@gmail.com> <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
 <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com>
 <82beb9df-56ea-3081-b502-4fce8a65f4d4@gmail.com> <CANNYZj_88i2diRoHSTFpiEVswR-diK3Cuu6c2Nx9SJkovn=MdA@mail.gmail.com>
 <0db2c5cd53d62ba364d69958e76f377428f7b0b1.camel@linuxfoundation.org>
In-Reply-To: <0db2c5cd53d62ba364d69958e76f377428f7b0b1.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 20:50:36 +0100
Message-ID: <CANNYZj8E9nEUZKtXX8zawuiwj520wHfs5kq9_ajN6VZU056sgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e1487c05bd1fddfc"

--000000000000e1487c05bd1fddfc
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Mar 2021 at 23:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-03-01 at 12:53 +0100, Alexander Kanavin wrote:
> > On Sun, 28 Feb 2021 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Can you send a patch upstream for this please? I have filed a ticket
> > > > which you can reference:
> > > > https://github.com/rpm-software-management/libdnf/issues/1146
> > > > <https://github.com/rpm-software-management/libdnf/issues/1146>
> > >
> > > This is a review so please fix it as suggested in OE atleast since you
> > > will have test setups I do not have rpm/dnf setups
> > >
> >
> > Any fix we do needs to be upstreamable, so can you please write a
> comment to the upstream ticket?
> > They're too telling me I need to send them a patch, and I don't want to
> send something I don't really
> > understand.
> > https://github.com/rpm-software-management/libdnf/issues/1146
> >
> > Testing is easy: build libdnf with TCLIBC=musl.
>
> I've been holding this in -next since I'd really like to try and match what
> happens upstream if we can. Since upstream seem receptive, could we get
> them a pull request open for the replacement for __WORDSIZE and update
> the OE patch too to track things?
>

Done both.

Alex

--000000000000e1487c05bd1fddfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 8 Mar 2021 at 23:29, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 2021-03-01 at 12:53 +0100, Alexander Kanavin wrote:<br>
&gt; On Sun, 28 Feb 2021 at 20:30, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Can you send a patch upstream for this please? I have filed =
a ticket <br>
&gt; &gt; &gt; which you can reference:<br>
&gt; &gt; &gt; <a href=3D"https://github.com/rpm-software-management/libdnf=
/issues/1146" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-s=
oftware-management/libdnf/issues/1146</a> <br>
&gt; &gt; &gt; &lt;<a href=3D"https://github.com/rpm-software-management/li=
bdnf/issues/1146" rel=3D"noreferrer" target=3D"_blank">https://github.com/r=
pm-software-management/libdnf/issues/1146</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; This is a review so please fix it as suggested in OE atleast sinc=
e you <br>
&gt; &gt; will have test setups I do not have rpm/dnf setups<br>
&gt; &gt; <br>
&gt; <br>
&gt; Any fix we do needs to be upstreamable, so can you please write a comm=
ent to the upstream ticket?<br>
&gt; They&#39;re too telling me I need to send them a patch, and I don&#39;=
t want to send something I don&#39;t really<br>
&gt; understand.<br>
&gt; <a href=3D"https://github.com/rpm-software-management/libdnf/issues/11=
46" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-ma=
nagement/libdnf/issues/1146</a><br>
&gt; <br>
&gt; Testing is easy: build libdnf with TCLIBC=3Dmusl.<br>
<br>
I&#39;ve been holding this in -next since I&#39;d really like to try and ma=
tch what<br>
happens upstream if we can. Since upstream seem receptive, could we get=C2=
=A0<br>
them a pull request open for the replacement for __WORDSIZE and update=C2=
=A0<br>
the OE patch too to track things?<br></blockquote><div><br></div><div>Done =
both.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000e1487c05bd1fddfc--
