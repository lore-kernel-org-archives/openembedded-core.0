Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.4427.1587990305852546534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 05:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZT6uzZXo;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a10so17046350uad.7
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zID06Elhv7W75A8SwKyRpn1xCvH/xcegP6dot7BQFnw=;
        b=ZT6uzZXo6WCJqnIpNDShXM2te/Ji7u1A2rGP6BPX9UjemCnsHW/EZWJCfNCf0mPZ5H
         Jk3y7Ojmz5RlgjQ6kXa417BoAF46mAOqou7DUbAsTkY7bF9Zwho+D1XCi3zo9isHSaNY
         wJrVjs4VS9n/8nlRpJZdAF4mnsyaDKIqE0hJXD43PoAnb0mjFXcbECpqTPFU2yKetCv7
         WsLHcFVyr+TUnYhyZs7AtYEHa9h2cc+VpMZad5lT5clEe25RpywM1tFzzfBq+4E/xtU2
         jL+zFiJ4N4NenjvAmxOX2HRIzkYvkjAFuFN/LXkF5HRSc9MUCE9wcySRCgyzdNtzk9wT
         hYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zID06Elhv7W75A8SwKyRpn1xCvH/xcegP6dot7BQFnw=;
        b=dP8OD+Ot7gZBDfBs9x7uIp8tr8SrC6Sk+dRSN2ZwnEIq42KahbbL7h7P+cG4STDQ6A
         sDEZ8SPSafHBMA2wx8TvJPQJy5e4uH6gGWeKxknvQH8cMPAV2PMqyoRpw0cElmdqDpp5
         YuO+3WvGpPkoNfk5PMfLJ3UgKoXUl35lnMc72+kqIfWLhNTxMmAbdtKZuF268wGWqD9z
         ld062NDa7F/jDhXdxFbJiVuhyoNqRT1nXy9Aj3j1bnUvR/aKX34hhMNlvUv6SW39W7OU
         xQWFQcdxc2IDMNtFe9B+0RYKRRFUFXJixilIRZCoxvXgGabF66clD5IcghUn94wGVWet
         F/+A==
X-Gm-Message-State: AGi0PuZagSGASxst6Dii+eH2zCcHP4Xfs3SrXGqMIWEZDr8Du7Fn/pXe
	gn2JOhcdOTCOf55ltVYBvrSyY8ZBJZZhWnfkiTc=
X-Google-Smtp-Source: APiQypK23CMLfa7t3tlRCLQ0EZa0lc7/RY/Ch+xNwbfVIYXysR8YQyI1XTMqSjtZ+Z1DxZMnR9XzQjJ9fHOd6Goe3rE=
X-Received: by 2002:a67:b64c:: with SMTP id e12mr15488901vsm.94.1587990304867;
 Mon, 27 Apr 2020 05:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
 <160972188EAFC253.2907@lists.openembedded.org> <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
 <20200427090911.GA19242@localhost> <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
 <20200427100816.GA27417@localhost>
In-Reply-To: <20200427100816.GA27417@localhost>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 14:24:53 +0200
Message-ID: <CANNYZj-_Z_Kd5=6UbvMg5c-2T1QCrCuvexy+7RqzhWOZfRtArA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
To: Adrian Bunk <bunk@stusta.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000007479d05a444ce4a"

--00000000000007479d05a444ce4a
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2020 at 12:08, Adrian Bunk <bunk@stusta.de> wrote:

> > Yes, I thought of sending a patch that adds libgomp-dev to the extended
> > tarball, but... the mysterious problem is, in some cases, rpm-native will
> > compile on the same worker machines without any failure (and maybe it
> then
> > gets linked against 'wrong' gomp, hence failures)  - see links above. I'd
> > like to try to ssh in and see how this could happen.
>
> Richard had a possible explanation for that:
>
> On Sun, Apr 26, 2020 at 10:07:30PM +0100, Richard Purdie wrote:
> > I think what may happen is that sstate may become populated and then
> > builds proceed further than they did previously.
>

I still don't understand this. In both cases, rpm-native is compiled (not
taken from sstate). In one case, it fails due to missing omp.h, but in
another, do_compile completes without error. How does sstate influence this?

I think the build should be run again, then particularly the build
directory of debian/centos where rpm-native was able to complete should be
preserved. I suspect it succeeds because,
somehow, the old gcc from the host is used, which might be a serious issue
:(

After that we can look into the (most likely different) issue of providing
the header via buildtools-tarball.

Alex

--00000000000007479d05a444ce4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 27 Apr 2020 at 12:08, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&gt; Yes, I thought of sending a patch that adds libgomp-dev to the ex=
tended<br>
&gt; tarball, but... the mysterious problem is, in some cases, rpm-native w=
ill<br>
&gt; compile on the same worker machines without any failure (and maybe it =
then<br>
&gt; gets linked against &#39;wrong&#39; gomp, hence failures)=C2=A0 - see =
links above. I&#39;d<br>
&gt; like to try to ssh in and see how this could happen.<br>
<br>
Richard had a possible explanation for that:<br>
<br>
On Sun, Apr 26, 2020 at 10:07:30PM +0100, Richard Purdie wrote:<br>
&gt; I think what may happen is that sstate may become populated and then<b=
r>
&gt; builds proceed further than they did previously.<br></blockquote><div>=
<br></div><div>I still don&#39;t understand this. In both cases, rpm-native=
 is compiled (not taken from sstate). In one case, it fails due to missing =
omp.h, but in another, do_compile completes without error. How does sstate =
influence this?<br></div><div><br></div><div>I think the build should be ru=
n again, then particularly the build directory of debian/centos where rpm-n=
ative was able to complete should be preserved. I suspect it succeeds becau=
se,</div><div>somehow, the old gcc from the host is used, which might be a =
serious issue :(</div><div><br></div><div>After that we can look into the (=
most likely different) issue of providing the header via buildtools-tarball=
.<br></div><div><br></div><div>Alex<br></div></div></div>

--00000000000007479d05a444ce4a--
