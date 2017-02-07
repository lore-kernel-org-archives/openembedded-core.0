Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 95A756010B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 09:54:09 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id 11so82554702qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kTbiEYM5j5wSkZMSszZmBqG8pficJAH3xVsWmSEok8c=;
	b=T8i/T80mu5MJf1/aMZQWb5mTsnGDaysTEhDscTcNofIJNoorzzp49OIKu2ulDLfnb3
	phpytngXCXLuCRbjmyZtZskByvHMoW19YVCXZRnNJm85UH7bS6UE4iAX+Euh/7OpEz9U
	VznC61sKiZDslJ2EP/dtV1vw5B7BHJiINQM1sdYPo4z2fkyHlFvPWrPcyGLywZtgzZrk
	0Ef7lPlAn7ALCaTRNsw8uSB+rNLN0TqpDzCVpfh2k7VR0RraSbXjztK78kn5+nvFRPWy
	28cHHbxE4+GRI+qPOOhEgkDHiUJK5NCWwS1f8RvOaaHhpp3btz+Atawidk2YRgdocPU8
	RgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kTbiEYM5j5wSkZMSszZmBqG8pficJAH3xVsWmSEok8c=;
	b=jR/qq/dkwLJsx3YroH0gZjypThoQFD3hz5MWiCN1icFQWcKW8OnVSI6iLT2vAAtvgy
	e2r2LcPyZUpVMsEfvesr55crr4iOBs0Kg9/paS/QQj143DB7wPNfdE/5X4FYbbUlRH7X
	iWmenVuIDYHo1voqGZj6+9IUUTh4FdwIl2BkPHN58NDHuRxbTeYNWc56IbfJPvwyno/b
	WJ4FHf1rFQ8GWc4V9Rq5QSjiFG/WOB/v+OihjX/7M85Zqzb0ibzMQI8151YS9kjUYlXV
	3c37sDHjOb3MRv+5Y8hzQanPvOkxEFHPbHX6Z+5NeQw1IhootoM30UPvPUeFwJmquHJu
	hqNQ==
X-Gm-Message-State: AMke39lKc2JZ8QkRh5P0GFDC4MdoOb/IgpQYnbEkfEnOxugytbDtzgAJP8WsEqy+uOQKshw7xiQ9Nb6Wgbuyq0y6
X-Received: by 10.55.3.67 with SMTP id 64mr4844228qkd.244.1486461250204; Tue,
	07 Feb 2017 01:54:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 7 Feb 2017 01:53:49 -0800 (PST)
In-Reply-To: <CALbNGRRikJJR9HDiT+py43+=45PUtPFaJRuOWAoZbSKoCa-zpQ@mail.gmail.com>
References: <1486423594-13790-1-git-send-email-ross.burton@intel.com>
	<CALbNGRRikJJR9HDiT+py43+=45PUtPFaJRuOWAoZbSKoCa-zpQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 09:53:49 +0000
Message-ID: <CAJTo0Lb9rbRkTCQbYMDR8kU0TpJFqEGjysOzXhfvMTUjBFd0YA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 07 Feb 2017 09:54:10 -0000
Content-Type: multipart/alternative; boundary=001a114c81caca8a580547edba27

--001a114c81caca8a580547edba27
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 February 2017 at 07:40, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> Wow that was fast :))
>

It has Meson support so I wanted to give that a go too.  Good news: it
works.

Ross

--001a114c81caca8a580547edba27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 February 2017 at 07:40, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":20m" class=3D"a3s aXjCH m15a1784a3f83a4f2">Wow that was fast :))<b=
r></div></blockquote><div><br></div><div>It has Meson support so I wanted t=
o give that a go too.=C2=A0 Good news: it works.</div><div><br></div><div>R=
oss=C2=A0</div></div><br></div></div>

--001a114c81caca8a580547edba27--
