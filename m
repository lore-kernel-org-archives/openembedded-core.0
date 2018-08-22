Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8A40E65C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 21:56:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v9-v6so2579413ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZinbvtPVUQOCXiaXbxubwoEOr0ijdYabuawIo8TmHrw=;
	b=NVoPJN4N2azPNe8AoYcHcoAxUmHG/53mN8cObDy+79c/SNFJKUq+0H8S3DQy2TV5t7
	XAi1lTZVsVy9ePap0p8pflWqUeCfXmSeEHp7QDp50aAekeWN1i2cOWYo2BaPYFG+zCXo
	+39ICTwYvYCQBffFXyTnPqVLBO4LlGnrZMlsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZinbvtPVUQOCXiaXbxubwoEOr0ijdYabuawIo8TmHrw=;
	b=aU7A9z/HXd8m1UcdTXoJouatkn82e6CgiZYaqfwXfIeqovQs0lHI89KL7gs0kfeEjb
	OSSqUTge+ifa7r8A0Npq7oozcbFUB5ZnINVTOtiROTXd+d0HNcDaYSw54vzkY9Afe92M
	vruDVaLSdcMcR8cqo7I5ID8nOaHqQGVh3SlJXS6LELiME68XXNDMbw2BCK9SEcemBbfS
	EehuB6DA+rH+ustrxWQ1UfMH8IAgNLSneBPuFxH0P3ZIqwWNn2cPVg3OzjxXcrB2qyzW
	IPtNacYr8z5SK4SKaXigsmVy/iE6oYU0DCWZ5M3k68zWnNLlYTULCS+zFHjHdho0l7gg
	Vtjg==
X-Gm-Message-State: AOUpUlGzhA1a6PiMdo8Gm6sPIZYOKApfpFhXph9DsJw5sseyEtE/avgj
	VhlGfFN6XzRwIAO8XZ8OEz85Dr802Q22yu6XfN7lvQ==
X-Google-Smtp-Source: AA+uWPyYgAjLftn9YQivLaLiMdjlSzVmysfxdoHJZOl7xYYjHk/s6B/evHL6exJVcc1A3h2iD0MFj3e1Km1btao2Wcc=
X-Received: by 2002:a2e:9f4d:: with SMTP id
	v13-v6mr37193455ljk.42.1534974972188; 
	Wed, 22 Aug 2018 14:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
In-Reply-To: <CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 22 Aug 2018 22:56:00 +0100
Message-ID: <CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Wed, 22 Aug 2018 21:56:11 -0000
Content-Type: multipart/alternative; boundary="000000000000f4e5a705740d3527"

--000000000000f4e5a705740d3527
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com> wrote:

> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> > On Wed, 22 Aug 2018, 20:02 Martin Jansa, <martin.jansa@gmail.com> wrote:
> >>
> >> Your 1st parameter is wrong, compare again with the example I gave you
> >> (don't include "brcm/" path in 1st param, because you want the symlink
> to
> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in the version
> >> after cd).
> >
> > That doesn't work either. I tried it with the same result, but didn't
> send a
> > log of it. That works for you?
>
> Martin's example is correct so maybe check your tests again for typos.
> It it still doesn't work then please do send a log.
>
> The link will point to whatever you define via the first parameter, so
> if you changed the first parameter it shouldn't be possible to get
> "the same result".
>
>   $ mkdir foo
>   $ ln -sf test_target foo/test1
>   $ ln -sf brcm/test_target foo/test2
>   $ ls -l foo
>
>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -> brcm/test_target
>

Yes, that's essentially the same as what I'm getting.

Now try "cat foo/test1" and what happens?

There is no file called test_target in the foo directory. And neither is
there a file called brcm/test_target in the foo directory.

>

--000000000000f4e5a705740d3527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Wed, 22 Aug 2018, 21:42 Andre McCurdy, &lt;<a href=3D"mailto:armccurdy@g=
mail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin &lt;<a href=3D"mailt=
o:ryan.harkin@linaro.org" target=3D"_blank" rel=3D"noreferrer">ryan.harkin@=
linaro.org</a>&gt; wrote:<br>
&gt; On Wed, 22 Aug 2018, 20:02 Martin Jansa, &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Your 1st parameter is wrong, compare again with the example I gave=
 you<br>
&gt;&gt; (don&#39;t include &quot;brcm/&quot; path in 1st param, because yo=
u want the symlink to<br>
&gt;&gt; point to just brcmfmac43430-sdio.AP6212.txt like you did in the ve=
rsion<br>
&gt;&gt; after cd).<br>
&gt;<br>
&gt; That doesn&#39;t work either. I tried it with the same result, but did=
n&#39;t send a<br>
&gt; log of it. That works for you?<br>
<br>
Martin&#39;s example is correct so maybe check your tests again for typos.<=
br>
It it still doesn&#39;t work then please do send a log.<br>
<br>
The link will point to whatever you define via the first parameter, so<br>
if you changed the first parameter it shouldn&#39;t be possible to get<br>
&quot;the same result&quot;.<br>
<br>
=C2=A0 $ mkdir foo<br>
=C2=A0 $ ln -sf test_target foo/test1<br>
=C2=A0 $ ln -sf brcm/test_target foo/test2<br>
=C2=A0 $ ls -l foo<br>
<br>
=C2=A0 lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -&gt; test_target<br>
=C2=A0 lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 -&gt; brcm/test_targe=
t<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Yes, that&#39;s essentially the same as what I&#39;m getting.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Now try &quot;cat foo/test1&quot; an=
d what happens?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
ere is no file called test_target in the foo directory. And neither is ther=
e a file called brcm/test_target in the foo directory.</div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000f4e5a705740d3527--
