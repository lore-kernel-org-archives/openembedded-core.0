Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.10164.1629548260168113479
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 05:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDB+d7pv;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id f13so7897671vsl.13
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EJvdBob/UmQnOOpcXAlXambx0Rpa2gAnLQvMtFLEWDc=;
        b=VDB+d7pvxGvVThMggxmitfyr99YvnavDgZ5bxi34GsuAtygWI78cwTg9eOsoCfbKpL
         tCme0pvMoFC/36kkFk99WIyuHtK3YBCExD8j2rLxiMUgBPrvKc2g/em4jMNa0vloVIE9
         KLHW86Vyo1zFE/MBnd7xImQy7j/295dE21Q34Oyf6uIti/AQ2mWbySB6PRhwKjsheqOJ
         /Al1gxUaSdTyaAbZR5P3wm8H5eTxqaLE+KbIHXx4nddGPEq79LUnSMo3uOO9oD/wenOG
         COawqKc1zUfhshcPWH6uG2RFU6dQMbBho5wgZZIjz2bTo3+q16QNypb1HYJ4S/NmAtnU
         ak0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJvdBob/UmQnOOpcXAlXambx0Rpa2gAnLQvMtFLEWDc=;
        b=fnMKqRW68BGV3T4p6tp/Ofm9tINqAk7DgrdvM+k0txhnhF9fW0YCs8SXO4gtX5/Wbq
         8Eabest6U+TRvYUy+wBuE1jBVzPq2ny54Sy8AK+SPsZ63D6Gk3yFj4STxxyE4LdmHoER
         H3Du18Sw1MnMXh3mJqfRcDWHu6Zyuacy9vcqku5ipQp5SmKOCfXkKv2POJKKT/OyZE7B
         tLHaMd2pR0Zmlz2VGV2WRxzLhyfLHslmE54jxBJpFQn2kh4DtxdsXlhZyVPCMJC1ku6p
         AJNvxnqTMLXifaK4TA+y8nBIgTMSrwIT35bNouHXvMRwWc2Jcod8xmEYJKMO3OZ6IbVE
         TWXw==
X-Gm-Message-State: AOAM533EE67D3rtCD4hFVjDfVJK3don838jtNXGamYQq83KMYeVQkcbx
	hHFlVvR3rkUhFoRUgLZ4+mwzgWWHHWwzi78elyA=
X-Google-Smtp-Source: ABdhPJzZUVSd2v1ReIQ/hM5RbV9bzFRqLL1wS2JeU8MRILR7SpGCO7ws+2JicnyHqpJ4BbQdfoB2qgqRW1bA1o0Ihrg=
X-Received: by 2002:a67:844:: with SMTP id 65mr19532560vsi.20.1629548259273;
 Sat, 21 Aug 2021 05:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
 <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
 <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com> <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
In-Reply-To: <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 21 Aug 2021 14:17:28 +0200
Message-ID: <CANNYZj8R=FhyEZ9kqnDPb9x-NYYOJOiaFimR2EJN1uoP2wbFsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000023707905ca10c588"

--00000000000023707905ca10c588
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Then let=E2=80=99s just go for it. I think there are enough examples on how=
 to make
gpl3 free images without it, and mbition has a full infotainment build
based on recent master with no gpl3 and no meta-gpl2. It=E2=80=99s doable a=
nd
highly overdue.

Ale

On Sat 21. Aug 2021 at 13.13, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-08-20 at 15:48 +0200, Alexander Kanavin wrote:
> > I think this is breaking meta-gpl2 somehow?
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3855
>
> Yes, there are also fixes pending for it which have now merged.
>
> I'm getting more than a little jaded fixing that layer as I really dislik=
e
> what
> it is doing and believe it does need to be dropped. The biggest problem i=
s
> the
> bash shell, if we had a solution for that I think the rest can be managed=
.
>
> Cheers,
>
> Richard
>
>

--00000000000023707905ca10c588
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Then let=E2=80=99s just go for it. I think there are enou=
gh examples on how to make gpl3 free images without it, and mbition has a f=
ull infotainment build based on recent master with no gpl3 and no meta-gpl2=
. It=E2=80=99s doable and highly overdue.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Ale=C2=A0</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat 21. Aug 2021 at 13.13, Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fri, 2021-0=
8-20 at 15:48 +0200, Alexander Kanavin wrote:<br>
&gt; I think this is breaking meta-gpl2 somehow?<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/=
builds/3855" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/75/builds/3855</a><br>
<br>
Yes, there are also fixes pending for it which have now merged.<br>
<br>
I&#39;m getting more than a little jaded fixing that layer as I really disl=
ike what<br>
it is doing and believe it does need to be dropped. The biggest problem is =
the<br>
bash shell, if we had a solution for that I think the rest can be managed.<=
br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000023707905ca10c588--
