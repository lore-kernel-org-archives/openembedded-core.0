Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id CDA1C721D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 11:26:58 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id x12so6205698qac.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 03:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nSL5XLgNQAhsr6IB9MrxXZ5Hk37Qu0jv13Fbw0UswKY=;
	b=QRqQYHbfgdeL82+tTJVDhnINvz3IeilJl23/yGuFswfoCkiykLn8FhPo+6wMsmnQv6
	N1cG/xMQBiWOwr3ov2zYaBACTLUZ4hJeVVJJYQZpk9jrzTwRS1XF4mHFlJJ3bWfaXCRe
	dj/sLKfVc3oJWDfiF20riRqFKX9rhyfiSNg7ke4YlStz3egTCuCVcPizO4yny50u/T5s
	PEa6+r6Mkt8zC22nc5fJp7qjvfNjLMd687DA2ZTQk9hO17pDBAoCuKIVj+pLYBgm2Hjj
	DcBi2qjLBtL4SEox/MEH+/+xa+qcCjOvCJQmpiq52KDMzm4QIm8cxaJ1UqIdWu5a/qCy
	W17Q==
X-Gm-Message-State: ALoCoQmX6MX8z0vloI//PkDeB+nhyyYPrZflnB1sgi8l4Er1OgEJBBXoHKt1S2SmUlQmJovSbc15
X-Received: by 10.224.25.146 with SMTP id z18mr20376631qab.17.1416828418078;
	Mon, 24 Nov 2014 03:26:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 24 Nov 2014 03:26:37 -0800 (PST)
In-Reply-To: <5472BFFE.4090600@windriver.com>
References: <cover.1416295260.git.Chong.Lu@windriver.com>
	<6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
	<CAJTo0Lb48t-x82qYKAmOY5TmvbWmNvSHV2tSkT+JqyLXcDjxtw@mail.gmail.com>
	<5472BFFE.4090600@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Nov 2014 11:26:37 +0000
Message-ID: <CAJTo0LYaXhKUPNm8U6o9LJ+kP863M9Q548sjoyQTkMoz0hSyYg@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bison: update to 3.0.2
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
X-List-Received-Date: Mon, 24 Nov 2014 11:27:05 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac091519405089912e8

--047d7bdc8ac091519405089912e8
Content-Type: text/plain; charset=UTF-8

On 24 November 2014 at 05:19, Chong Lu <Chong.Lu@windriver.com> wrote:

> After I upgrade bison, I test world on qemuppc and qemux86, that's ok.
> Can you tell me, which arch will build failure or how to reproduce this
> failure?
> I will try to fix it.
>

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/104/steps/BuildImages/logs/stdio

That's PPC with poky-lsb.  It may be unrelated but the failures involve
bison.  I see that glibc doesn't depend on bison-native so if it is running
the tool at build time there could be problems with bison being replaced
during a build.

Ross

--047d7bdc8ac091519405089912e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 November 2014 at 05:19, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":20x" class=3D"" style=3D"ov=
erflow:hidden">After I upgrade bison, I test world on qemuppc and qemux86, =
that&#39;s ok.<br>
Can you tell me, which arch will build failure or how to reproduce this fai=
lure?<br>
I will try to fix it.</div></blockquote></div><br><a href=3D"https://autobu=
ilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/104/steps/Build=
Images/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/night=
ly-ppc-lsb/builds/104/steps/BuildImages/logs/stdio</a><br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">That&#39;s PPC with p=
oky-lsb.=C2=A0 It may be unrelated but the failures involve bison.=C2=A0 I =
see that glibc doesn&#39;t depend on bison-native so if it is running the t=
ool at build time there could be problems with bison being replaced during =
a build.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--047d7bdc8ac091519405089912e8--
