Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCAB7F7CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 11:30:51 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a143so13916519vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 03:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RH596zDZV9XyUNaFITFFn3XUHBbiF1RpmIWCgcwv22Q=;
	b=GFbwKxMD7BshdlYJ6gHdlqgfGk3+vjj4Yn9ucJSoNUrDmjvfwKm6hSUJCQwNnZj5FB
	3sAmBRGqmoGmWcRF7k2SqTIIKi3+E8VGUdJv5tbNAscHF4V9ZNF/blFA0N4kc4RjwJWA
	3s7/jI9CPQXOfSSE070vF9ZBHKahKAl+RE53iM7J9RbNmiV/0XathPknyc/0LWQ+nTOE
	8ljCS07ifZjVJAHKMG4qTVvXieOcZGHM6ta7luJw1NZernEmPeVreQEoeSGV8rbuu0Fq
	0tT+aACCRWM7jax+PU/kOtI1ZwHf1HKVgrefluqr2+g7MBsL6A7ydWToj4T3GAdJCBTM
	q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RH596zDZV9XyUNaFITFFn3XUHBbiF1RpmIWCgcwv22Q=;
	b=ryL6+JdnVtg6Qc7dCr9DmYCDXgQzC/YFutFc3EnK3qV0orWqb/nFxdgX4wnHJqJdkk
	LJ+0OEgXLgpEY11G19BJykLbTLoa35upq8TUPDbC0wIE1/BRcudO5TtyfkwABzT/s1jJ
	OGZZG3oKwTI21NsaiV7oqpPYPBnJ9Y9VmXIk2Hd+0RDt9qHIcTJdS5V9K0faCZbAkYeK
	zhDFKkRNGLDXO3CcfjhrbjMpd37F5aKFh+Idtx92R8rpsOt61tJzn6WXc6ELdntAmXaB
	/3OCRmk8dHYCh+AFDIlEoXxTI7LF6hKN8hDlnU0uTq05vRCnLwqhgoNSEksz510FtWCY
	7xRg==
X-Gm-Message-State: APjAAAUHfodOoSehH+mjcjF9dBkG9HsFz7mSunCYU2mHKeLMU5LDhA/0
	5I6Od1ZMORpyj1AtC2+f/4jlT8vJKAot9HLZlMw=
X-Google-Smtp-Source: APXvYqwIFQf4nBHHrOoBi4uHHXQFaRscv4EkfS7D7W0LUptFt7SKbRFRJvpha3nDK43Irk1JhWRriwwXwm85+Eg5EpI=
X-Received: by 2002:a67:fc04:: with SMTP id o4mr20791217vsq.35.1574163052601; 
	Tue, 19 Nov 2019 03:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
	<CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
In-Reply-To: <CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 12:30:41 +0100
Message-ID: <CANNYZj_2+0+6Suq0Gu74t+QDhx3mdb6FZsr2mwy8WhtNk493ug@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Tue, 19 Nov 2019 11:30:52 -0000
Content-Type: multipart/alternative; boundary="00000000000091a4e20597b16572"

--00000000000091a4e20597b16572
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Nov 2019 at 08:58, Tim Orling <ticotimo@gmail.com> wrote:

>
> I have the beginnings of scripts to generate a meta-python2 layer. Someone
> with a vested interest in keeping python2 supported will need to step up to
> maintain it. After bitbake and Oe-core moved to python3, my use of python2
> has gone to near zero.
>
> I intend to move all python2 recipes from meta-python to the new layer.
> meta-python will become python3 only in 3.1 release timeframe. The bb files
> and inc files will also be merged, simplifying AUH and devtool usage.
>
> Attempts to send python2 patches to meta-python after that shift will be
> nacked.
>

Thanks! There is however a missing part: how close is meta-oe to being
py2-free? Oe-core is very close (u-boot is the last holdout as noted), but
I am not sure that we can simply take out py2, and not have half of meta-oe
fail. For instance (random example) mozjs, a fairly important component,
still pulls it in, together with a few 3rd party libraries:
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb

It's tempting to force the transition by breaking things, but it also
antagonizes users.

Alex

--00000000000091a4e20597b16572
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 19 Nov 2019 at 08:58, Tim Orling =
&lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div><div class=3D"gmail_quote"><br><div dir=3D"auto">I have th=
e beginnings of scripts to generate a meta-python2 layer. Someone with a ve=
sted interest in keeping python2 supported will need to step up to maintain=
 it. After bitbake and Oe-core moved to python3, my use of python2 has gone=
 to near zero.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I intend =
to move all python2 recipes from meta-python to the new layer. meta-python =
will become python3 only in 3.1 release timeframe. The bb files and inc fil=
es will also be merged, simplifying AUH and devtool usage.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Attempts to send python2 patches to meta=
-python after that shift will be nacked.</div></div></div></blockquote><div=
><br></div><div>Thanks! There is however a missing part: how close is meta-=
oe to being py2-free? Oe-core is very close (u-boot is the last holdout as =
noted), but I am not sure that we can simply take out py2, and not have hal=
f of meta-oe fail. For instance (random example) mozjs, a fairly important =
component, still pulls it in, together with a few 3rd party libraries: <a h=
ref=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-=
extended/mozjs/mozjs_60.5.2.bb">https://git.openembedded.org/meta-openembed=
ded/tree/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb</a></div><div><br><=
/div><div>It&#39;s tempting to force the transition by breaking things, but=
 it also antagonizes users.<br></div><div><br></div><div>Alex<br></div><div=
><br></div></div></div>

--00000000000091a4e20597b16572--
