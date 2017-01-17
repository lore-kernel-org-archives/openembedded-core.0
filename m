Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5CC601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 13:25:47 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id k15so156888554qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 05:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c2yj7HMhqFQyc4DTsb2O0gJT4XQ7VeJDC1Ov2GSuf9M=;
	b=Uqod3UOQTWqkGutEKDeZG39ALs7S6YvC/0yNuVR3p8u3XRSiXxw4wElmPeFECNOCEm
	fn4KW6bF/KGwugfSdrniXH/GkPMzV15bEKbPxYSRfxwBIKIwUiyyyJo0s0FAhYgo+OhD
	kd6vH74NEXX64f+3Keo2NFkaH//Dr7xdy7TjxWUQS61Gome3MxMye9YSEOqus/8SSMuq
	+8LSeAH1sdEepMR2iUeT1xymDVQVxeB/dWS2q+SbRs2ELQw+ax+Z+at4s96hhvf7eixg
	I9yveZdCohXIXLupp6Wd5hHnekjh5o6ci0ibuHmeMzan5UuiGwQbogLJfF9wqkVt3rVu
	CPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c2yj7HMhqFQyc4DTsb2O0gJT4XQ7VeJDC1Ov2GSuf9M=;
	b=WFtKhPYlvHTthMNrD3bIzMMn1bGSco0FOwdJbKL3qSyPsErz9XONB43bhBTdljmQwz
	I8KAv0EF6m2D5KN0vn7oxjNqvOJYdMI329vOCT/gMOWN6QSbACNTFne5KKhUTR4WpdM5
	nTaGtxZMnu0ilCkjXZRFNsTB6lSgIzFuVy/NPHPPdFAHUVxDrdLeBmbA8/lS0lI2lrBJ
	qgn3C4xbqlepxr7a9dnffsUsprgB5G0s8SyRRSJp63O8GZBZECrHXiePoyGmj3/VIqUR
	pvGNMXaDMopsdiEqRh2jZR5tDjc7BngULa9Lmy484UepPfE/xhN/IExzD9a0zUUCsdeV
	sKsA==
X-Gm-Message-State: AIkVDXLfD9i7AUFuyP4CoBsFdzO5EqasLcJl50mqHKHI0nwt2CMFuWb3DS4IwZUJH0vT2BDtxjp702sIqFS7Ixq3
X-Received: by 10.237.36.208 with SMTP id u16mr36251986qtc.105.1484659547720; 
	Tue, 17 Jan 2017 05:25:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 05:25:27 -0800 (PST)
In-Reply-To: <1484657977.10018.78.camel@pbcl.net>
References: <1461230647-19298-1-git-send-email-maxin.john@intel.com>
	<1484657977.10018.78.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 13:25:27 +0000
Message-ID: <CAJTo0LYU5Nkn3kFHz6uScaVEykPZRsW=F7dW5aU2vNw6aSFZzw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: update flock behavior to match upstream
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
X-List-Received-Date: Tue, 17 Jan 2017 13:25:48 -0000
Content-Type: multipart/alternative; boundary=001a114104cef4683605464a3c64

--001a114104cef4683605464a3c64
Content-Type: text/plain; charset=UTF-8

On 17 January 2017 at 12:59, Phil Blundell <pb@pbcl.net> wrote:

> before and after.  Please revert this patch until and unless it can be
> fixed.
>

Reverted locally.  Maxin, can you have a look at this?

Ross

--001a114104cef4683605464a3c64
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2017 at 12:59, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":11b" class=3D"a3s aXjCH m159ac8=
3bff544190">before and after.=C2=A0 Please revert this patch until and unle=
ss it can be<br>
fixed.</div></blockquote></div><br>Reverted locally.=C2=A0 Maxin, can you h=
ave a look at this?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a114104cef4683605464a3c64--
