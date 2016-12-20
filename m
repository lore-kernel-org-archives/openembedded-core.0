Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D3D6677338
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:17:13 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so179391702qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y8/HbSDM2/nR9+QqKAmk9+mt18/bb8/eMkW9VVsWjRE=;
	b=EzLPYsoViu3euB7HlkuQl9v/bENEGSxw2Y0mnWE4gzRIBTPBqgP+WRpzb2yq037uSh
	w9dicvx1c5k3BYFhnmJZ3um1gIuRvvmN6u+zienuTNGKaflsnTbwfYg6veIePjE0NR7a
	FkfkRBsuwl5g8dv9+jTxk/Sys8R7ikF+4kK9D6eEEywhhovVsKMMA+eJmOdAlMP6XDjZ
	wM/e6IkuXAPr/0Vas0Ytuk/AXhvB2LO+TtMTv0Xdx/qIvKafQ262a7YtJ9U1xSL4ThFf
	LL8ie/NbrFLXGszBLIlnvjsOfJZ5mKBR7wtx/MzrKZVQVsFLGWaDq83n0QJJVqNyXGYL
	hOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y8/HbSDM2/nR9+QqKAmk9+mt18/bb8/eMkW9VVsWjRE=;
	b=Pkw85eCAMT/2b4MMSBU4LKcVAeGr9TRlBo2pRh1Uw/Ai6skO03Asef71+h5oNFP92u
	wKki1WEYErrd+Hx1ohUZOpn3WQs62Z7FnZN8jcQOPy61X7DVQct1pIW8rMiTaTRhoavu
	so0TzRUa5rqd0SBsZ3Kde3ipSFqOxBtCCseXKKRtxlRWQFh8+6vNwFbLMi18w3qvjHLZ
	A+YPCK4zmsaXsEqE3+FYUCW5+Jo2HcdyuxEohBisNZ1BgTih6K3VQI6vg9kd9JlvhnHY
	FkAfGfFU5IfrnOq23hGPu3+IRx4D/rdWQa8m6U3eHuV+n2mrthUdC35abD0H2l5a0gHv
	4A7Q==
X-Gm-Message-State: AIkVDXIvWp7H2HPkVSwta6VnC5V+1e8bRzBEidDxv+RWaYvWTymWVEgLdhXaZ438SZU9wb85GkEAcOZr+IAGXke2
X-Received: by 10.237.34.46 with SMTP id n43mr23232744qtc.105.1482247034720;
	Tue, 20 Dec 2016 07:17:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 07:16:54 -0800 (PST)
In-Reply-To: <20161220151401.GB11748@openSUSE-i7.site>
References: <CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
	<CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
	<CAJTo0LbZYcPK-9E=+pw9ZB-H9Yb7gNxeQMxLQsoRsZ1CWU4pgQ@mail.gmail.com>
	<20161220145554.GA11748@openSUSE-i7.site>
	<CAJTo0LajFQ85DckLMqS7Tbza4NJNNc4A6QMuACa4XDb6PiHJnQ@mail.gmail.com>
	<CAJTo0LYzEZpgspkijcDOUUwPSRBaiWsYbts02NkBy4FJW28jOg@mail.gmail.com>
	<20161220151401.GB11748@openSUSE-i7.site>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 15:16:54 +0000
Message-ID: <CAJTo0LY1_qFxKqnQC4hggAL=g4iqf6a_iXfUXgv7-SdCX5b+yQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Tue, 20 Dec 2016 15:17:14 -0000
Content-Type: multipart/alternative; boundary=001a11377e18f9824b054418870e

--001a11377e18f9824b054418870e
Content-Type: text/plain; charset=UTF-8

On 20 December 2016 at 15:14, Trevor Woerner <twoerner@gmail.com> wrote:

> So I only have the version 5 -config scripts, but my host has version 5 and
> version 6 -config scripts. I'm guessing we need a dummy ncurses{w}6-config
> script in the sysroot too (?)
>

Yeah, that seems like a good diagnosis.  Can you knock up a patch as you
can replicate?

Ross

--001a11377e18f9824b054418870e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2016 at 15:14, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4m7" class=3D"=
a3s aXjCH m1591ccc2d265360f">So I only have the version 5 -config scripts, =
but my host has version 5 and<br>
version 6 -config scripts. I&#39;m guessing we need a dummy ncurses{w}6-con=
fig<br>
script in the sysroot too (?)</div></blockquote><div><br></div><div>Yeah, t=
hat seems like a good diagnosis.=C2=A0 Can you knock up a patch as you can =
replicate?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a11377e18f9824b054418870e--
