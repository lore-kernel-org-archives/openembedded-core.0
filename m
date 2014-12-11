Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 376C365D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 13:54:38 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so4334262qcw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DhNciTVTfVS5KueJPzMMr/4IHcxtEvAUjgNXRkcLGP0=;
	b=i1hRy1t3XTj9Ix4azV8U4L3dPHdJARvVOql0XiPx4xiUdRQG7IKraEtAyqr5oNo6ER
	2AZclHCNDubKZ6SZ6W/VqD4tID0OoH0r8AtHwO+yBtX91YzE7Sd55vyakjFKyRtmSQp8
	r6zxItYoJ21fShLNud/o0aUZN798r7v8WofJ2XxCPTb45q/XUvhWInQoWpuuuk6gHPEP
	jScqMIlbgzG1GlmpVEiVnY6oEiDYYI6vqF4JsbIfJgsvW/SswFVft+X6Au9oAH5w5NdH
	bVOPp59xVPzz8b92h8mPrvHazdWOR1a4KkMitT8X9ulQ8kLhBvFQL1wPhRVzpHws8/SP
	YTwg==
X-Gm-Message-State: ALoCoQkLY2FuSuEn9weq75Ux2v8kXKCLUaQHsb9SRaRf4M9rUaJe9yIIDH5zktevP8AebetPtJZE
X-Received: by 10.229.176.198 with SMTP id bf6mr20178279qcb.12.1418306078997; 
	Thu, 11 Dec 2014 05:54:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 05:54:18 -0800 (PST)
In-Reply-To: <20141211124459.GC2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
	<20141211121417.GB2467@jama>
	<CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
	<20141211124459.GC2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 13:54:18 +0000
Message-ID: <CAJTo0LZEOOKCP3wV9V8bnNLDs8dhi+rfO+7Lphwak74RpqiXMQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 13:54:48 -0000
Content-Type: multipart/alternative; boundary=001a11c3057e0592e40509f11eb6

--001a11c3057e0592e40509f11eb6
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 12:44, Martin Jansa <martin.jansa@gmail.com> wrote:

> gst-plugins-bad-meta depends on gst-plugins-bad-rtmp when built after
> world (rtmp is detected) and doesn't depend on gst-plugins-bad-rtmp when
> built in minimal TMPDIR.
>
> test-dependencies.sh is showing this warning when the dependencies
> between "maximal" and "minimal" builds aren't equal.
>
> I still don't get what's wrong with that warning.
>

Gotcha, yes, understood.

Ross

--001a11c3057e0592e40509f11eb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2014 at 12:44, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":37m" clas=
s=3D"a3s" style=3D"overflow:hidden">gst-plugins-bad-meta depends on gst-plu=
gins-bad-rtmp when built after<br>
world (rtmp is detected) and doesn&#39;t depend on gst-plugins-bad-rtmp whe=
n<br>
built in minimal TMPDIR.<br>
<br>
test-dependencies.sh is showing this warning when the dependencies<br>
between &quot;maximal&quot; and &quot;minimal&quot; builds aren&#39;t equal=
.<br>
<br>
I still don&#39;t get what&#39;s wrong with that warning.</div></blockquote=
><div><br></div><div>Gotcha, yes, understood.</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a11c3057e0592e40509f11eb6--
