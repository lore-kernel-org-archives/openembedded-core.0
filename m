Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 082C273243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 20:52:39 +0000 (UTC)
Received: by qgt47 with SMTP id 47so4481810qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CFK5gMadpHQH1q0+Fz7zD4bySw4UDZABIiE6qUZAaJ8=;
	b=mIR0oHV1JAGaXjrHy8v7pY1bE4zPu+wCuIbP4/0yZG5y/+xefF3Sdv4dI0mXZclCxg
	UHH7j5z+uwTdcCPyDfsdtP+UMp4HEVG7unEhzZKNafndUcDYQV8xasRgXg5cl6X/esKA
	EJsAgGISEdoC/orN1w4/79q+TFKSAfvr6+SzOrF6KmYKsI46WMt82wDmUk1x86qA1ujm
	rVoOUYrp+fIOr8b0DFwm2mxynrb94oyTrKqcvLmx2lOzy5Jf4Zi+WLBGPVD7pFVpEYgI
	OaKuRC5d/1X/JxQasonkK6y+tM3pV45+DYWT1+TXU6s8jldf5WtC5f6vOMmOl3xCFuYu
	bAwg==
X-Gm-Message-State: ALoCoQldjKz36kyVeTX72i3dmmKfeOm6REXX+vWeI2if+hoMfD0kJU/xNuKlk7djs50ONQ1KMpmB
X-Received: by 10.140.109.74 with SMTP id k68mr15933084qgf.77.1442955159057;
	Tue, 22 Sep 2015 13:52:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 22 Sep 2015 13:52:19 -0700 (PDT)
In-Reply-To: <20150922173040.GC2388@jama>
References: <1442931113-25056-1-git-send-email-ross.burton@intel.com>
	<20150922173040.GC2388@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Sep 2015 21:52:19 +0100
Message-ID: <CAJTo0LbXsG0TzgWeN5xsuTWdxO8P=8kF5uqtpW+ZizKuo-srGQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Tue, 22 Sep 2015 20:52:41 -0000
Content-Type: multipart/alternative; boundary=001a1139af24aef03705205c2d4e

--001a1139af24aef03705205c2d4e
Content-Type: text/plain; charset=UTF-8

On 22 September 2015 at 18:30, Martin Jansa <martin.jansa@gmail.com> wrote:

> No error in first 126 iterations of:
> for i in `seq -w 1 1000`; do bitbake -c cleansstate perf; bitbake -c build
> -f perf 2>&1 | tee log.perf.$i; done
>
> so it's good improvement, thanks!
>
> Please get this merged in fido and dizzy as well.
>

Just found a problem in it so I'll be sending a v2, but thanks for the
testing.

Ross

--001a1139af24aef03705205c2d4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2015 at 18:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1sc" c=
lass=3D"a3s" style=3D"overflow:hidden">No error in first 126 iterations of:=
<br>
for i in `seq -w 1 1000`; do bitbake -c cleansstate perf; bitbake -c build =
-f perf 2&gt;&amp;1 | tee log.perf.$i; done<br>
<br>
so it&#39;s good improvement, thanks!<br>
<br>
Please get this merged in fido and dizzy as well.</div></blockquote></div><=
br>Just found a problem in it so I&#39;ll be sending a v2, but thanks for t=
he testing.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1139af24aef03705205c2d4e--
