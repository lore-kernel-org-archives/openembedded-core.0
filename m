Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 25B86615E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 21:45:44 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id p14so6677701vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lBbNGDSi61GMU+tF6AurzNEbG+UvugSUNoz0dqs+cQg=;
	b=OTGEMRcz7r2a5AxMYjZ5qlw84SPbimO7PFeBZ8rnnlf3neNmzPdA1T/Gu05ncLNJ/p
	wU5I1w1phsOefo446HX9yHNt2I5YeHgSCY+w8tpF01EG0ihx/KjjffkOi0pLB0acomsO
	PDYHW8obNgVBJ/ugpu0yildQwJkM7TGIxJFOS4+xo488qh54wM2wGpSfGPDXza96VqUC
	zCOOeg8Q8niRKx9qdYhB+GCJhfbmISYO7fPExzbcdogAE4HCAVgFmichkHbO0YmoNEui
	zHNHxIGd8RfsugS2+KtIMLr0afKygUWaML13ZH9AmPt+efuZXp7wK4hwI2Tm+KQn8yWL
	pS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lBbNGDSi61GMU+tF6AurzNEbG+UvugSUNoz0dqs+cQg=;
	b=c9elysvWL303cXzWeTwieWPyL7e5boTCwViOafSQckksaCaIMbO2iLbvGXjnvb5Ihl
	ciJRp/eRoauNoKm+hsq+oz4VV7/lg7cf4nucbs2EO6mL0qbTAEJNIf47xE74oOvOdosU
	19XjGrlEG21gIErVmCXebgAwyEsYw2tK2x6K8FpCuZ6Bua5oddsgnuY4QybRasQFxUaD
	EoSKSywwzTfR7shVWbfcAWUcleJMQ00iXT03I/JZfXlBGVO8tBp1wtQL2rpQ1EW6wZmX
	J9/Edg9ysvQUlrAWvyeI4nU4HptLEZalUV/rC0+DsYF3jfDiiOQcRfubsA1XCzSIbxhy
	nLfA==
X-Gm-Message-State: APjAAAWC2yPpCydTQ0gycKOrw9jiSMU5Gv16CGPGA2BLQBbFS0obZI/K
	9cH7SYpnxG8WP/3fQP9aHR0tupjq2xzAWHQpoDTSPd1n
X-Google-Smtp-Source: APXvYqwSukVekYxdkqqGcX+W+kSnxAYr0J0c/tDb0raGDtXE154IV5bNfuzYAvgd4O4Xg+9vT6k3ZnDbGXfRVI+Lhsk=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr27924867vsa.25.1582580745127; 
	Mon, 24 Feb 2020 13:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost> <20200224140801.GC27036@localhost>
In-Reply-To: <20200224140801.GC27036@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Feb 2020 22:45:33 +0100
Message-ID: <CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Mon, 24 Feb 2020 21:45:45 -0000
Content-Type: multipart/alternative; boundary="000000000000245093059f594b61"

--000000000000245093059f594b61
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Feb 2020 at 15:08, Adrian Bunk <bunk@stusta.de> wrote:

>
> Alexander, wayland support in webkitgtk requires mesa built with x11
> support (otherwise gl.pc is not available).
>

I had a look; I'm not sure I understood the options correctly, but the
issue is due to this:

                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl
opengl', '' ,d)} \

The above works if both opengl and x11 are enabled as DISTRO_FEATURES, but
if x11 is not enabled, then it should be "webgl gles2". Can you try that?

Alex

--000000000000245093059f594b61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 24 Feb 2020 at 15:08, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Alexander, wayland support in webkitgtk requires mesa built with x11 <br>
support (otherwise gl.pc is not available).<br></blockquote><div><br></div>=
<div>I had a look; I&#39;m not sure I understood the options correctly, but=
 the issue is due to this:</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;webgl opengl&#39;, &#39;&#39; ,=
d)} \</div><div><br></div><div>The above works if both opengl and x11 are e=
nabled as DISTRO_FEATURES, but if x11 is not enabled, then it should be &qu=
ot;webgl gles2&quot;. Can you try that?<br></div><div><br></div><div>Alex<b=
r> </div></div></div>

--000000000000245093059f594b61--
