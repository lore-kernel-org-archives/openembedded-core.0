Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id D5A7E7F8A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 12:19:42 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id 73so4701803uac.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 04:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NTV6SyluXKEuCqq/GdT3uSLtUXYm3lp4L1Xfev75b34=;
	b=bvSGx5O++3nyAyTVevf2xQU8w9FVK53K/NM+zpPCqc1grZXF6j/tuJ2r/Ml41pCRdj
	alibGhmGvPW8u5hydcKx2sdQzZjggxvzrtPehL2gVc5PWEA20gWysjD4Ej3jIFJwDP9D
	SMT5yJJk7jp/w8//01SJPM07anJSW1C79nbcWM9g6RDmD1xgLSuXgGAviW3bXJCxhQPf
	RxAmk/SY1k5ZST6QSA6+LJq+i3gR+J++b61WIMRCXU5OS80uWYAi73Mb1Zwx4JGMr4Aa
	Zw9jG5+rti28pyh279bP20n2kZe2DJ9+Av+aUovhEc95Cipj7REw3sjxuh+GLTUTxQLk
	oeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NTV6SyluXKEuCqq/GdT3uSLtUXYm3lp4L1Xfev75b34=;
	b=m6JogTvBK+lyVgQ+gGOeXSwxiINS1ZOJNkNsHHqxb+FWTcWvHBpWZ7KCmi8EmXtf3R
	44xS3qw0Eu9DLhDkMtMFUOmGkcEpQPSfZpU9N6ApswRn2flnDhxnYPItsr971DpvHob2
	rDUS56UTFUFrDbjGObqgSintDaao6UE85cHwL5mW0r7Awy/lrdezEuZOmUbZBqdt/EHJ
	FXmFma4brHl92i/AOG1oZFopVsz/zI/hRtIy3cGyeB2SaNsPDziyUP/jx1r6Ci3s4dv0
	PSMdyfw5HLPv3xiYAWdiM+Sw8KjGK+1KNihXoSQjYrtmMCXovWddXOJTGwJhmWsbTI3c
	DwKw==
X-Gm-Message-State: APjAAAXTKQ65mB/IVc128HGwHPtItVw+bvWvVnkvmA7m04mXPS+ahgGY
	88t7+7jHWcdWGuKyilKDAVNFi6pcIQTCjtdSFHA=
X-Google-Smtp-Source: APXvYqwCsPaqDQjWuZE616YeZsVHQgUjyknyBtqpR5S81oSchZ2vTCM6zusd18XEzPP3xhg9kDndKsHUGg0DXT9i2L8=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr9847168uap.93.1579004383813;
	Tue, 14 Jan 2020 04:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
	<bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
	<CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
	<9ebe5e019aa41e1c79cae9f0657b044687701759.camel@linuxfoundation.org>
In-Reply-To: <9ebe5e019aa41e1c79cae9f0657b044687701759.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 13:19:32 +0100
Message-ID: <CANNYZj8JaWrOctDzoG7gXxWUa4TZUBSLo-S-8Xk=xSzin_egMw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Tue, 14 Jan 2020 12:19:43 -0000
Content-Type: multipart/alternative; boundary="0000000000006563a0059c189b40"

--0000000000006563a0059c189b40
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2020 at 11:23, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> For extra data I reran this on a builder where it failed. This time it
> worked out ok. I can think of two different things we could try:
>
> a) Add some debug to the code so that when a unknown user error occurs,
> it triggers a mention of the filename with the issue
>
> b) Potentially try turning off any parallel install code for python.
> I'm starting to wonder if that is racing somehow over file ownership.
> Making it single thread may make the issue appear (or it may
> disappear).
>

I tried setting PARALLEL_MAKEINST to "", and it didn't make any difference
(python is using standard autotools). I guess we'll have to catch the build
directory when it happens again somehow.

Alex

--0000000000006563a0059c189b40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 14 Jan 2020 at 11:23, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">For extra data I reran this=
 on a builder where it failed. This time it<br>
worked out ok. I can think of two different things we could try:<br>
<br>
a) Add some debug to the code so that when a unknown user error occurs,<br>
it triggers a mention of the filename with the issue<br>
<br>
b) Potentially try turning off any parallel install code for python.<br>
I&#39;m starting to wonder if that is racing somehow over file ownership.<b=
r>
Making it single thread may make the issue appear (or it may<br>
disappear).<br></blockquote><div><br></div><div>I tried setting PARALLEL_MA=
KEINST to &quot;&quot;, and it didn&#39;t make any difference (python is us=
ing standard autotools). I guess we&#39;ll have to catch the build director=
y when it happens again somehow.</div><div><br></div><div>Alex<br></div></d=
iv></div>

--0000000000006563a0059c189b40--
