Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 96FD071F9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:22:09 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id z107so2374555qgd.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UH9rjRzgKdYm42WX/bYyHgIj21LgxsFMO8T4OoUDbPI=;
	b=OIisSw6xF+tHLOzC0Td8ICnQ95V804q++JTWU4PyLpTsis/AEzCg9CDaU/gniIg2zS
	Qb/fELCEeBfq5odSIhl6d1BMs0pwZpYiutAgRsqaWecXvmpSk0or4Qp+4AKjiTFK/Lxd
	uj7D/KswOzqTNa9jhRPaeqhiPUf2cVeIOlu0tNsqhUvq9ZNeKeurCoiZ5lbSmdgBTWoY
	MhgdY2Dcy24woh65h5S2iD5yYTnWswaoxM62uMKme2xLMklEyU9xxdiXBrd3crXGuWm0
	z2sPdnd1T+g5oumvddiSCpftOSQmpKWfl2/aPcE9aOEmtA82tk44uePHqxcsOZ9D6iOF
	/vZA==
X-Gm-Message-State: ALoCoQnTRiaZgEGGhhz+P90lAsGu11ZBlScB/q2vRCAoIM+ixpvnvPuMVZXWfK4C8HsEqK7Ttr6X
X-Received: by 10.224.138.2 with SMTP id y2mr13663688qat.52.1415370129829;
	Fri, 07 Nov 2014 06:22:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 06:21:49 -0800 (PST)
In-Reply-To: <CAP9ODKrDn-FjOh1nT9j5krPBYvK5G4xpEVBfumxHybW2tP5UMQ@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAP9ODKrDn-FjOh1nT9j5krPBYvK5G4xpEVBfumxHybW2tP5UMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 14:21:49 +0000
Message-ID: <CAJTo0LbmuNsdh-D+mzy67+zVJJDJPVT_Nkq3h8HkedqmzTDnJw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 14:22:17 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3d093a705074589ec

--047d7b6709c3d093a705074589ec
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 11:47, Otavio Salvador <otavio@ossystems.com.br> wrote:

> Besides, having it enabled in our autobuilders will also greatly
> improve code quality as LLVM is sometimes more picky than GCC. In
> Debian the exercise of rebuilding the whole archive using LLVM has
> been very useful and has identified several code issues which has been
> (or are in the process of being) fixed. Also to add on that, I think
> the sooner it is done the better so we can solve issues early on the
> release cycle.
>

As a side project I ended up using clang as host gcc.  It was amazing how
often that failed, so don't expect using clang as gcc-cross work straight
away.

Ross

--047d7b6709c3d093a705074589ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 11:47, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1sf" cla=
ss=3D"a3s" style=3D"overflow:hidden">Besides, having it enabled in our auto=
builders will also greatly<br>
improve code quality as LLVM is sometimes more picky than GCC. In<br>
Debian the exercise of rebuilding the whole archive using LLVM has<br>
been very useful and has identified several code issues which has been<br>
(or are in the process of being) fixed. Also to add on that, I think<br>
the sooner it is done the better so we can solve issues early on the<br>
release cycle.</div></blockquote></div><br>As a side project I ended up usi=
ng clang as host gcc.=C2=A0 It was amazing how often that failed, so don&#3=
9;t expect using clang as gcc-cross work straight away.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b6709c3d093a705074589ec--
