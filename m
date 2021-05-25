Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web08.10706.1621952974624358322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 07:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TzQs2+P6;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id h26so3481968uab.13
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLlX6t2bK8BSmMiqgCWgRtAIL6lefpuPs3OaWY8DX+Q=;
        b=TzQs2+P6UiqsP5/pp70OdTQ0Cs6U7OmxfSHVIMTr0D9pmqKzuHD2uFFfDy3IPUjEcO
         ingtN+/fsgRLz+XkaDyGExxxV/vg6wHtAYwvL8pPAOEhBgWZesl2Ro5bOjGmdZO3p1Bs
         OzDDJ7wK3dN3vaDr/Ks1XG3nVIbiAxFqqeCwFk+2/pYxT1RDdYHCIVnMBFVx+g85L5Pb
         rtIQ/ZO+Td/U20nQE/K/NmRlxjA5tZDGJPDfh+3/DB88r4nfZ9xGapkCycY9adLVqr3Z
         vSMF8owCwbxF1jELHav48VEbbAxXhhX504m9Gf9kTgmD0MuwSHg2H7YsLx8jTJ7NNi9g
         7urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLlX6t2bK8BSmMiqgCWgRtAIL6lefpuPs3OaWY8DX+Q=;
        b=A0w72Lk7C7saRhYQTQmdaqKtHQ23/OI3vYNFDZoV5l1aUmckhR74jM0SP1xPGkKvl1
         8YKwjwkUrn5NAx0fjTijWppC/ugBW579el4fQkzR4AR0UxuuQbJhbWqGpibqTzy08d71
         cor9xCvJiNUZD0hjqnrNxyIv2VC1yIffM+7A8o1RqoMcPp3xQLamDexk9q6V8G4YxXPE
         UwTvq99Snf3SYGxqW4NPbpKaarJWB6UTzYgD1AxhLqXO3Rw354FO/5csO2EVkGDbBS4e
         lFX0ZMmteW/DXmzaZxe9RbfXJzSX1GMCTkA6/b+4XHOilou3+hje2OV/GfjPNEaVNomi
         Hbew==
X-Gm-Message-State: AOAM530zPeFBN3oiRYs8MpXT8ndxRwvzFQbeuD3u5WwYM0RaxzI0bOU/
	me3dU2ce7hUofyKODLHZFJKqUBU88YM5LFMeZpc=
X-Google-Smtp-Source: ABdhPJxyIP7a8KNgDLz9QMgkCNo5aP4fYhq+wEePhRIYnIRrD0qe/EztUxATGK+TP/A+MrRvxEJxcXJZUxH+2Vq5aDw=
X-Received: by 2002:ab0:6708:: with SMTP id q8mr26423702uam.71.1621952973837;
 Tue, 25 May 2021 07:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
 <20210524091347.419253-2-alex.kanavin@gmail.com> <CAMKF1sq9mwdOOPFebQ1xXHXEJOLrx_-3jgHCb_6VhBd5yoZh8A@mail.gmail.com>
 <CAMKF1sp3yeZV3VW7i0MHhaj0e8LvMpXd4yb5SUKXRf-WArDkPA@mail.gmail.com>
 <CANNYZj9V6e9+uqA=PPF06SKop4mp-UGfsoZ21mZF7spVsm21Aw@mail.gmail.com>
 <CAMKF1srLE4eN4JoQfXyt4ma6_uVxZwpxB8AqmyWN8xZx=dWKpQ@mail.gmail.com>
 <CANNYZj-ZH+ew+8KShNcZAvQiqZEDu5mVBHF=rQk1Q0eKmkVzPQ@mail.gmail.com> <2e6c986f556ca09bce5789200a2f64dcc550cb5e.camel@linuxfoundation.org>
In-Reply-To: <2e6c986f556ca09bce5789200a2f64dcc550cb5e.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 16:29:22 +0200
Message-ID: <CANNYZj_KuThnr+YVhOBHK5uY47B8Evjh17qLy69wjM7x+hvE1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/21] systemd: update 247.6 -> 248.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d917b205c3285a48"

--000000000000d917b205c3285a48
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 May 2021 at 16:16, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-05-25 at 16:02 +0200, Alexander Kanavin wrote:
> > Sorry, but that is not a good answer. If the next version upgrade
> > is a pain because of those patches, I will actually make a patch
> > that drops them.
>
> I'm going to wade in on this at this point.
>
> systemd is a tricky one. Khem has been doing a good job keeping it
> working on musl and that is important to some set of our users so
> I'm going to continue to enable him and others to do that.
>
> I'm not sure the current patch approach cases a huge issue, worst
> case it gets broken and then fixed as just happened.
>

That's ok, but then I would suggest that systemd version updates do not
rebase the musl patches, and that is dealt with after the fact by those who
need the feature.

Alex

--000000000000d917b205c3285a48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 25 May 2021 at 16:16, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, 2021-05-25 at 16:02 +0200, Alexander Kanavin wrote:<br>
&gt; Sorry, but that is not a good answer. If the next version upgrade=C2=
=A0<br>
&gt; is a pain because of those patches, I will actually make a patch<br>
&gt; that drops them.<br>
<br>
I&#39;m going to wade in on this at this point.<br>
<br>
systemd is a tricky one. Khem has been doing a good job keeping it=C2=A0<br=
>
working on musl and that is important to some set of our users so=C2=A0<br>
I&#39;m going to continue to enable him and others to do that.<br>
<br>
I&#39;m not sure the current patch approach cases a huge issue, worst<br>
case it gets broken and then fixed as just happened.<br></blockquote><div><=
br></div><div>That&#39;s ok, but then I would suggest that systemd version =
updates do not rebase the musl patches, and that is dealt with after the fa=
ct by those who need the feature.</div><div><br></div><div>Alex<br></div></=
div></div>

--000000000000d917b205c3285a48--
