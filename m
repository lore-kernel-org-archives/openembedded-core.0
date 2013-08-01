Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id BB53F6B256
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:52:12 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so2354526pad.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=fK6nLP+brtjlbPm+my733yjA3nTcKdXrelWSvdjomCo=;
	b=pVsqQsSKjh+6PLQ4PKTrflkGzH5CoFAN5TLdSMCemBInlvgPsZSBa6+h1Pd9UcAYjU
	bjqJ7Uo1xbMRtrpw569X3Lw1G9R5nPM5Jk191zxiDiLDfPQlQPhd62mdOjxJaEbRy02F
	Wr0b91dfCF0TR87aazekvEws4GWQWkbgB6X8/74I0SSoDq4BKE/QGKkJGnkqBf0RCL/r
	W4WtW1J4bIZ+GMXYqM91jc30/r70rPsIJusQWFeKOAio254n6eQc1KHcEBzjo6pUnZ8y
	wCVRYKFBnWOl+ZqRx6XI/ndtWaNZLRry/ZTZJPkkvdyNRCV/f3tM7YyQMj2Cml7HfPYq
	Wvzw==
MIME-Version: 1.0
X-Received: by 10.68.224.161 with SMTP id rd1mr3219874pbc.121.1375375933691;
	Thu, 01 Aug 2013 09:52:13 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 09:52:13 -0700 (PDT)
In-Reply-To: <CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
	<CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
	<CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
	<CAJTo0LaYiJsuJG6BNEHiCL8Ga+4EZ9S+vvAKRkiNyXQ16v1fMw@mail.gmail.com>
	<CAOMwXhNXO+ZDSh3Kt41g=K1Jo_EDGSGkX6-DUTHN1hMz3QF2yg@mail.gmail.com>
	<CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
Date: Thu, 1 Aug 2013 17:52:13 +0100
X-Google-Sender-Auth: xBvIDU3PzU-7kl3_vwsS-tjjRMY
Message-ID: <CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQm2bzvCXfHaRHOw/ybfPyv7jdc3NA22sJIXTfsdCvpjjgeNC8osWwVW9QjXDuKsukuL88bb
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Aug 2013 16:52:13 -0000
Content-Type: multipart/alternative; boundary=e89a8ff24ff6f5eb8504e2e5a924

--e89a8ff24ff6f5eb8504e2e5a924
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 5:50 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Thu, Aug 1, 2013 at 1:38 PM, Laszlo Papp <lpapp@kde.org> wrote:
> > On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >> On 1 August 2013 17:33, Laszlo Papp <lpapp@kde.org> wrote:
> >> >> I'm not sure what you meant here.  Do you mean a situation where the
> >> >> local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
> >> >> environment?
> >> >
> >> > Yes.
> >>
> >> But there's nothing wrong with the user doing that at all.
> >
> >
> > Why do you think compilers warn in such use cases? Because they cannot
> know
> > if you are doing something silly, or something unintentional. It might
> just
> > well be that the user wanted to type something else, but got confused in
> > which case he might get a hard to debug issue later, or even if not
> hard, it
> > is additional issue due to his.
>
> Please provide the message you preferred so it can be seen and
> discussed. An example might make it easier to get what you really
> mean.
>

"Warning: "foo", specified manually on the command line, is the same as in
the /path/to/the/relevant/background/file.stuff file"

Please do not hang on the grammar as I am a non-native speakers.

--e89a8ff24ff6f5eb8504e2e5a924
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Aug 1, 2013 at 5:50 PM, Otavio Salvador <span dir=3D"ltr">&=
lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossy=
stems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
hu, Aug 1, 2013 at 1:38 PM, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org=
">lpapp@kde.org</a>&gt; wrote:<br>

&gt; On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross &lt;<a href=3D"mailto:ros=
s.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 1 August 2013 17:33, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kd=
e.org">lpapp@kde.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; I&#39;m not sure what you meant here. =A0Do you mean a si=
tuation where the<br>
&gt;&gt; &gt;&gt; local.conf says MACHINE=3Dfoo and the user also sets MACH=
INE=3Dfoo in the<br>
&gt;&gt; &gt;&gt; environment?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yes.<br>
&gt;&gt;<br>
&gt;&gt; But there&#39;s nothing wrong with the user doing that at all.<br>
&gt;<br>
&gt;<br>
&gt; Why do you think compilers warn in such use cases? Because they cannot=
 know<br>
&gt; if you are doing something silly, or something unintentional. It might=
 just<br>
&gt; well be that the user wanted to type something else, but got confused =
in<br>
&gt; which case he might get a hard to debug issue later, or even if not ha=
rd, it<br>
&gt; is additional issue due to his.<br>
<br>
</div></div>Please provide the message you preferred so it can be seen and<=
br>
discussed. An example might make it easier to get what you really<br>
mean.<br></blockquote><div><br></div><div>&quot;Warning: &quot;foo&quot;, s=
pecified manually on the command line, is the same as in the /path/to/the/r=
elevant/background/file.stuff file&quot;</div><div><br></div><div>Please do=
 not hang on the grammar as I am a non-native speakers.</div>
</div></div></div>

--e89a8ff24ff6f5eb8504e2e5a924--
