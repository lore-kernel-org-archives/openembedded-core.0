Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.4466.1587990836877391714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 05:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mbu5N9G2;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id g129so4740745vkh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F1ssKmGb4GtoitvDM9SgtgpJXq1/pqxC+58kMIxVZrE=;
        b=mbu5N9G2E98MdYSM4RdXBI7Rdc1TYqha7pF/o3W9DrDU1tdNHnSuSTYf/k90d6gGWq
         ghuCzPJxIYUljvrXITRxPk30vsIcbOGsdTK5MOkMB61FW/E/A1b8BA33eflXre4i8GYR
         JegZFXdfUIjSGbn/s10elVT/aUsK84iPmy3osA0EujRWMndTlewK4GIMjt68i0JGQ6wh
         7Ru2urAwtpxjrkPOBB2I8BTdr8wP4VAGOFcEPWteJjNCIPd4EmZl53PvfuF18zV3w7KL
         WREHdQOgKpWFSSnDPjdq+gMGkRTmZ9+/lf2MwWtreapLmY4f3roypTJ8S1Y6yGQXlV/p
         gVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1ssKmGb4GtoitvDM9SgtgpJXq1/pqxC+58kMIxVZrE=;
        b=BL4/G+5rnyMWo3lrLv/fBEvmAs7PCom9XiCEYysFYLOuducQ9Mf59lcTJZxJQZYUTe
         S/RORMpWAnNbbSsZITrv1r8mDdyBYBGHwVMKUoOspzN7VsLgfOS6C2bj5oflIgT7I7CU
         dR4gVKqjHSUKz8oY6VPWNhTTuiNvTdZYVxc5cT/vWhL+AsZdhIKOdNV1iHfewmxU710d
         AgBej9guvg5igRFbR8y/HL6toTTuVsw/B8d1NAGsK/Yqj5ejzF3EBXQ0YE+3WzDyrMht
         yXYPG3CcNrYiDeOFzFG+qnYNE8M4B6h1s+/fg4xeVrYOhVki6cg7/evCQ/1iVLePoChb
         m7HA==
X-Gm-Message-State: AGi0Pub6lVYHo3geqVIHI3kQDQzKVO223cjX4PwuaWr/CZXUkPeXcjZY
	NAja5xlaBKfzsd+fJQRVX445X8PekiFgt2YiBDM=
X-Google-Smtp-Source: APiQypICtJ6cp3alQPdgGrvn578+Jq3rSWtG9KbkORcv4KuIVQ087+O/Srt2jZSzAFf8wL5wUicD3yODCHTOhoXt6h8=
X-Received: by 2002:a1f:2154:: with SMTP id h81mr17119220vkh.9.1587990836051;
 Mon, 27 Apr 2020 05:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
 <160972188EAFC253.2907@lists.openembedded.org> <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
 <20200427090911.GA19242@localhost> <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
 <20200427100816.GA27417@localhost> <CANNYZj-_Z_Kd5=6UbvMg5c-2T1QCrCuvexy+7RqzhWOZfRtArA@mail.gmail.com>
 <39285fa7c28870730f023b1b93399dbb54854a67.camel@linuxfoundation.org>
In-Reply-To: <39285fa7c28870730f023b1b93399dbb54854a67.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 14:33:44 +0200
Message-ID: <CANNYZj-XKoLUSwT0tNKj7i0DMYYHi249SFERFrP-g+Yz74CFHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Adrian Bunk <bunk@stusta.de>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b0845e05a444ed94"

--000000000000b0845e05a444ed94
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2020 at 14:30, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > I still don't understand this. In both cases, rpm-native is compiled
> > (not taken from sstate). In one case, it fails due to missing omp.h,
> > but in another, do_compile completes without error. How does sstate
> > influence this?
>
> Have you a pointer to a build where this succeeds and one where it
> fails?
>

Yes, from a few emails back:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1812
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/2073

I can't ssh into that worker for some reason.

Alex

--000000000000b0845e05a444ed94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 27 Apr 2020 at 14:30, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt; I still don&#39;t unde=
rstand this. In both cases, rpm-native is compiled<br>
&gt; (not taken from sstate). In one case, it fails due to missing omp.h,<b=
r>
&gt; but in another, do_compile completes without error. How does sstate<br=
>
&gt; influence this?<br>
<br>
Have you a pointer to a build where this succeeds and one where it<br>
fails?<br></blockquote><div><br></div><div>Yes, from a few emails back:</di=
v><div><span class=3D"gmail-im"><div><a href=3D"https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/75/builds/1812" target=3D"_blank">https://auto=
builder.yoctoproject.org/typhoon/#/builders/75/builds/1812</a></div><div><a=
 href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/=
2073" target=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/15/builds/2073</a></div><div><br></div><div>I can&#39;t ssh into that =
worker for some reason.</div><div><br></div><div>Alex<br></div></span></div=
><div> <br></div></div></div>

--000000000000b0845e05a444ed94--
