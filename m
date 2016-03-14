Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 60BA26FF30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:41:38 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id z76so237615092iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d2Kr0hD2e5iqsDdbdz+jI6U42QEIOP/6eoiG1V0gcx0=;
	b=dtJZfKjFfUXLd1M8+nrkan8VV2nQ5H1ERBB5vJFf3XHFtKNWHF83sFoCa1z4oo85i3
	0Dp0clyaqAzVxSZVxlRl717jrZj8pen5gTLT5TxlpZABTbg4HcEgHieGuuDA2KN9p0WL
	EL1O3idNc9BnMKuaJZStS2iFgRd0xWYVB/Fp6k5vbSAi6+czNBrjjwXf15HZobYoelTo
	qQdwNDeKHTVANhNcl3o/IlwH7tOBWoX5khTzvSdnwpp1V/wrzjFk1Ew3oPJYJXf96ejE
	cLzXzD4BkHEUyxalYLosxva2S7nT2vBYSYY5SQVujGpQ0JUqBfTn+b7Aivy2nH8TL0SE
	NbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d2Kr0hD2e5iqsDdbdz+jI6U42QEIOP/6eoiG1V0gcx0=;
	b=YBufUG2EfhvO1hXxHte/M65YSk+YcV288pEgzYdzImh6pUjIG2PQMXkVsgnUIJ9hQG
	NAbAwv/BT6ylVT/dIvhj/pJp0gTOH5j3juegs2Q1FKOyZY2l1D40KA5k5bZNAChibpn/
	/UASuIeiJlaN0OTBtlXt9k9oU6pNIALgXB75V1ug5jvsJyo0aKRFcH6HfgNLepGQQVVx
	Th2sd6N3U8fK83Y1iFpXWSg+AVi5/xUqytV+zZKauhrHZrmV46RGKdv1iBgg+flE8qrL
	t3eELvyZ0sKoiIJFGPvQ9LkoHzc05f0BqpaSMIqHvHBGBT2+eYJLOw7MfIafm+LrfsR/
	lnUQ==
X-Gm-Message-State: AD7BkJLwVD1JhG6j0reYzytXBLx+MzJvB4FGx3FyU7oem2pv/jOm0HWyCJwgQTyJCDqvzDZje4xWMa8LhgBYvybQ
X-Received: by 10.107.6.32 with SMTP id 32mr24495281iog.99.1457988099812; Mon,
	14 Mar 2016 13:41:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 13:41:20 -0700 (PDT)
In-Reply-To: <CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 20:41:20 +0000
Message-ID: <CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:41:39 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5cc6d93a052e084e37

--001a113fbf5cc6d93a052e084e37
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 20:38, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> This makes nativesdk and native feature set to differ. I don't think
> it is a good move
>

It's exactly the right move - nativesdk and native are different.  You want
nativesdk to match target, but native is unrelated to the distro you've
built (to be honest I'd prefer it if the required distro features logic
didn't execute on native recipes).

Ross

--001a113fbf5cc6d93a052e084e37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 20:38, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1q5" class=3D"a3s" style=3D"overflow:hidden">This makes nativesd=
k and native feature set to differ. I don&#39;t think<br>
it is a good move<br></div></blockquote><div><br></div><div>It&#39;s exactl=
y the right move - nativesdk and native are different.=C2=A0 You want nativ=
esdk to match target, but native is unrelated to the distro you&#39;ve buil=
t (to be honest I&#39;d prefer it if the required distro features logic did=
n&#39;t execute on native recipes).</div><div><br></div><div>Ross</div></di=
v></div></div>

--001a113fbf5cc6d93a052e084e37--
