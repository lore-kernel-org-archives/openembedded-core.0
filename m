Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id E276565D3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 23:26:20 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id v10so1165896qac.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 16:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6VTLlPwHssLOOEixwqDAZ48pj7ITqohEbIrKh0CDm9I=;
	b=TNxoAQPflMfUAF9ZTZ5J6nxHiwdivL+FlJnSH4s+6H6iqLONKOZQN/5UmEhWj9Bq4x
	z/ElNUFgq1IpYeH0zxj+XA5urwKENV8bgtzeKbQ1DD9GU89o2xmi27IEWApKsRUYciAG
	/PtJ6lQzK4pw7KQXFCcfZI5cPh5gsrFe83XuS5hPlYvkGvXbkWCgqC70W1CZeaQGRQDk
	j2cWnCwXodczqEOTKn8VSesWqSUZu/KlSQ9t2V0RMvnuE1RBU5kNHaU+2P03hvseAOMx
	PW2koVVhu0Ks4n4q8o/IQ0AJJYWYkCKo5ObJDSjOjpARUJ5db+tnRdnREhBkD/DIMBJZ
	CPyA==
X-Gm-Message-State: ALoCoQldTTldUuKcjBYEAfBbvQ1HEzjR20snQoFlYVGQSYpEHo5wn0A/s7Z6TdP96VjgZPV8L+X8
X-Received: by 10.224.103.200 with SMTP id l8mr2165065qao.52.1414020381438;
	Wed, 22 Oct 2014 16:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 16:26:01 -0700 (PDT)
In-Reply-To: <1413746147-7120-1-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Oct 2014 00:26:01 +0100
Message-ID: <CAJTo0LaYpbN7VuyErJGj9e8mbY+uUZCGePgsMeMq=Eq+Op8aCQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Add basic fitImage support
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
X-List-Received-Date: Wed, 22 Oct 2014 23:26:22 -0000
Content-Type: multipart/alternative; boundary=001a1132e9d28a870805060b4627

--001a1132e9d28a870805060b4627
Content-Type: text/plain; charset=UTF-8

On 19 October 2014 20:15, Marek Vasut <marex@denx.de> wrote:

> This series cleans up the code in kernel.bbclass and
> separates out the uImage generation. The last patch
> in this series then adds support for generation of the
> advanced successor of the uImage, the fitImage.
>
> This series adds only very rudimentary support for
> generation of fitImage. The advanced features might
> be added in subsequent patches.
>
> I would also like to thank Richard for explaining to
> me how to properly do the implementation and I hope
> this series is at least close to that.
>

For what it's worth I pulled these patches for initial testing and I got
build failures with the fsl-ppc kernel:

| "mkimage" command not found - U-Boot images will not be built
https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc-lsb/builds/77/steps/BuildImages/logs/stdio

These patches were not the only ones pulled into that branch, but they're
the only relevant change that I can see.  It looks like a native dependency
disappeared somewhere, can you have a look at this?

Ross

--001a1132e9d28a870805060b4627
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2014 20:15, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mail=
to:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":3u3" class=3D"" style=3D"overflow:hidden">This=
 series cleans up the code in kernel.bbclass and<br>
separates out the <span class=3D"">uImage</span> generation. The last patch=
<br>
in this series then adds support for generation of the<br>
advanced successor of the <span class=3D"">uImage</span>, the fitImage.<br>
<br>
This series adds only very rudimentary support for<br>
generation of fitImage. The advanced features might<br>
be added in subsequent patches.<br>
<br>
I would also like to thank Richard for explaining to<br>
me how to properly do the implementation and I hope<br>
this series is at least close to that.</div></blockquote></div><br>For what=
 it&#39;s worth I pulled these patches for initial testing and I got build =
failures with the fsl-ppc kernel:</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra"><div class=3D"gmail_extra">| &quot;mkimage&quot=
; command not found - U-Boot images will not be built</div><div><a href=3D"=
https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc-lsb/buil=
ds/77/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/ma=
in/builders/nightly-fsl-ppc-lsb/builds/77/steps/BuildImages/logs/stdio</a><=
br></div><div><br></div><div>These patches were not the only ones pulled in=
to that branch, but they&#39;re the only relevant change that I can see.=C2=
=A0 It looks like a native dependency disappeared somewhere, can you have a=
 look at this?</div><div><br></div><div>Ross</div></div></div>

--001a1132e9d28a870805060b4627--
