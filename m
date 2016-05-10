Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 93BA46011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 21:43:10 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id d62so32581599iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v7gQsY4PXO0xVlOsGkAJwzX8n/xS2NtOIuXnDUTHrVw=;
	b=vNkX+LFiXSDwXfH0nOcexrY0tKUnca3cszAhyqVU38Bl7Qrm+aRmCvI3pllzbyhyie
	gs1xauCOfQQS+zPgA83ggjIUo2ueU38D3IYKnxC8pB3mImCpklJxaeke0RTXoSLGtZGh
	wMUtxg5UIiTGu2LcpsgDqYqgFsimWxPwAHVgiXNjlvoPPwrCLivaQfP+IGYQT4fus9qB
	zEYkf5a0O/WoDgXLz0F0azdAOotF+NKiMmsbjYyPemCzY7nAcKbfXucFyKRBMz4Dt32N
	Ep9NVB+EEbJdlsOjVav0Xd56l7xzJAYG0kkfzR3B93Lg0raIJEdcR03qeH5miubC6KGM
	6/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v7gQsY4PXO0xVlOsGkAJwzX8n/xS2NtOIuXnDUTHrVw=;
	b=mh96pWZwq1sI1nfTqC1Aewg+P/Ut69+xV/1D+BPjsFKTQoXtBV1Gj7mCYV7bLZoxHK
	1rXS2YYuHZWXV4Asd85uHf4rAoFGJEyGK+XuTiwBGGQj2pJecoPZE9D8CWUXNMDuvcMP
	G97xujklrmEqsmWtD4dkNSOm6ATGoSQXCqxQ4WI0/WpyeIFylGaTs7Q/9rprkNU8/Yit
	T1yuuLc8etFYpfWW5R13bRjP8Vy6UkglD7N0H8pPeW/Faql9C4ciGkdXFnQ9fWup7Awy
	fB1eFE6Fu+6P27XEwIRhESUPfiJ+GcxMf7Hqy1HM0Uk9z2hYJEVIU1CkOomf78/0QaAH
	XpTQ==
X-Gm-Message-State: AOPr4FVODOZUR5Zv88SldAEHuHBH6PezjgOAcdSA41XNPaCJTJdi8+I/SmtmUh6OKTDqyYqVSL63UJAbNC2kDtTL
X-Received: by 10.107.135.211 with SMTP id r80mr346583ioi.133.1462916590997;
	Tue, 10 May 2016 14:43:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 10 May 2016 14:42:51 -0700 (PDT)
In-Reply-To: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
References: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 May 2016 22:42:51 +0100
Message-ID: <CAJTo0LY9C+-hkUxT5yTQkfMF5kggDByFabzxP-PEC=WzC9=_6A@mail.gmail.com>
To: Neena Busireddy <neenareddy.busireddy@nxp.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal: replace GLUT with FreeGLUT
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
X-List-Received-Date: Tue, 10 May 2016 21:43:11 -0000
Content-Type: multipart/alternative; boundary=001a113ed20abe3991053283cfd3

--001a113ed20abe3991053283cfd3
Content-Type: text/plain; charset=UTF-8

On 10 May 2016 at 19:12, Neena Busireddy <neenareddy.busireddy@nxp.com>
wrote:

> GLUT is dead upstream for almost three years now (
> https://cgit.freedesktop.org/mesa/glut/  ) and it makes sense to replace
> GLUT with FreeGLUT .
>
> Some of the reasons to replace with FreeGLUT are listed here :
>
> http://freeglut.sourceforge.net/
>
>
>
> Also, current mesa-glut recipe does not generate GLUT library. I tested
> this when I enabled GLUT in mesa-demos.
>
>
>
> I discussed this issue with Otavio and he suggested to replace GLUT with
> FreeGLUT and upgrade mesa-demos to 8.3.
>

You might want to CC oe-devel too, as mesa-glut is part of meta-oe.

I'm surprised that mesa-glut doesn't build the glut library, but I have no
interest in glut so you can do whatever you want in my opinion. :)

Ross

--001a113ed20abe3991053283cfd3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 May 2016 at 19:12, Neena Busireddy <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:neenareddy.busireddy@nxp.com" target=3D"_blank">neenareddy.busireddy@=
nxp.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D=
"MsoNormal">GLUT is dead upstream for almost three years now ( <a href=3D"h=
ttps://cgit.freedesktop.org/mesa/glut/" target=3D"_blank">
https://cgit.freedesktop.org/mesa/glut/</a>=C2=A0 ) and it makes sense to r=
eplace GLUT with FreeGLUT .<u></u><u></u></p>
<p class=3D"MsoNormal">Some of the reasons to replace with FreeGLUT are lis=
ted here :<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"http://freeglut.sourceforge.net/" target=
=3D"_blank">http://freeglut.sourceforge.net/</a>
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Also, current mesa-glut recipe does not generate GLU=
T library. I tested this when I enabled GLUT in mesa-demos.<u></u><u></u></=
p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I discussed this issue with Otavio and he suggested =
to replace GLUT with FreeGLUT and upgrade mesa-demos to 8.3.</p></blockquot=
e></div><br>You might want to CC oe-devel too, as mesa-glut is part of meta=
-oe.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I=
&#39;m surprised that mesa-glut doesn&#39;t build the glut library, but I h=
ave no interest in glut so you can do whatever you want in my opinion. :)</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a113ed20abe3991053283cfd3--
